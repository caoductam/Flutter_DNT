import 'dart:async';
import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final _authService = AuthService();
  bool _isEmailVerified = false;
  bool _canResendEmail = false;
  Timer? _timer;
  Timer? _resendTimer;
  int _resendCountdown = 60;

  @override
  void initState() {
    super.initState();

    // Kiểm tra trạng thái email verification
    _isEmailVerified = _authService.isEmailVerified;

    if (!_isEmailVerified) {
      // Gửi email verification đầu tiên
      _sendVerificationEmail();

      // Kiểm tra email verified mỗi 3 giây
      _timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => _checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _resendTimer?.cancel();
    super.dispose();
  }

  Future<void> _checkEmailVerified() async {
    await _authService.reloadUser();

    setState(() {
      _isEmailVerified = _authService.isEmailVerified;
    });

    if (_isEmailVerified) {
      _timer?.cancel();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email has been verified!'),
            backgroundColor: Colors.green,
          ),
        );

        // Chuyển về màn hình trước
        Navigator.pop(context);
      }
    }
  }

  Future<void> _sendVerificationEmail() async {
    try {
      await _authService.sendEmailVerification();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Verification email has been sent!'),
            backgroundColor: Colors.green,
          ),
        );
      }

      // Đếm ngược 60 giây trước khi cho phép gửi lại
      setState(() {
        _canResendEmail = false;
        _resendCountdown = 60;
      });

      _resendTimer?.cancel();
      _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_resendCountdown > 0) {
          setState(() {
            _resendCountdown--;
          });
        } else {
          setState(() {
            _canResendEmail = true;
          });
          timer.cancel();
        }
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Verification'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon
                Icon(
                  Icons.mark_email_unread,
                  size: 100,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(height: 32),

                // Title
                Text(
                  'Email Verification',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                // Description
                Text(
                  'A verification email has been sent to: ',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),

                Text(
                  _authService.currentUser?.email ?? '',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),

                // Instructions Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Next steps:',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        _buildStep(1, 'Check your inbox'),
                        _buildStep(2, 'Open email from Firebase'),
                        _buildStep(3, 'Click on the verification link'),
                        _buildStep(4, 'Back to this app'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Check Status Button
                ElevatedButton.icon(
                  onPressed: _checkEmailVerified,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Check status'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Resend Email Button
                TextButton.icon(
                  onPressed: _canResendEmail ? _sendVerificationEmail : null,
                  icon: const Icon(Icons.email),
                  label: Text(
                    _canResendEmail
                        ? 'Resend email'
                        : 'Send back after $_resendCountdown giây',
                  ),
                ),
                const SizedBox(height: 24),

                // Note
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: Colors.blue,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Do not see the email? Check your spam folder',
                          style: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Cancel Button
                TextButton(
                  onPressed: () async {
                    await _authService.signOut();
                    if (mounted) {
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Log out'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStep(int number, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$number',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}
