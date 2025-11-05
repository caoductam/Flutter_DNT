import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'register_screen.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();

  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    try {
      await _authService.signInWithEmailPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login successful!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _handleGoogleSignIn() async {
    setState(() => _isLoading = true);
    try {
      await _authService.signInWithGoogle();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Google login successful!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _handleFacebookSignIn() async {
    setState(() => _isLoading = true);
    try {
      await _authService.signInWithFacebook();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Facebook login successful!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _handleGitHubSignIn() async {
    setState(() => _isLoading = true);
    // TODO: Thêm logic đăng nhập GitHub nếu cần
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 640;
    final isMobile = size.width <= 640;

    // Responsive values
    double containerHeight = size.height < 892 ? size.height : 892;

    // Logo dimensions
    double logoWidth = isMobile ? 240 : (isTablet ? 240 : 227);
    double logoHeight = isMobile ? 90 : (isTablet ? 90 : 91);

    // Font sizes
    double welcomeFontSize = isMobile ? 22 : (isTablet ? 24 : 26);
    double subtitleFontSize = isMobile ? 16 : (isTablet ? 18 : 20);
    double descriptionFontSize = isMobile ? 12 : (isTablet ? 13 : 14);
    double buttonFontSize = isMobile ? 18 : (isTablet ? 20 : 22);

    // Button dimensions
    double buttonWidth = isMobile ? 200 : (isTablet ? 220 : 257);
    double buttonHeight = isMobile ? 55 : (isTablet ? 60 : 70);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildLogo(logoWidth, logoHeight),
                  const SizedBox(height: 32),
                  Text(
                    'Login',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Welcome back!',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  _buildEmailField(),
                  const SizedBox(height: 16),
                  _buildPasswordField(),
                  const SizedBox(height: 24),
                  _buildLoginButton(),
                  const SizedBox(height: 16),
                  _RegisterLink(),
                  _ForgotPasswordLink(),
                  const SizedBox(height: 24),
                  _DividerText(text: 'HOẶC'),
                  const SizedBox(height: 24),
                  SocialButton(
                    label: 'Sign in with Google',
                    asset: 'assets/google.png',
                    color: Colors.red,
                    textColor: Colors.white,
                    onPressed: _isLoading ? null : _handleGoogleSignIn,
                  ),
                  const SizedBox(height: 12),
                  SocialButton(
                    label: 'Sign in with Facebook',
                    asset: 'assets/facebook.png',
                    color: const Color(0xFF1877F2),
                    textColor: Colors.white,
                    onPressed: _isLoading ? null : _handleFacebookSignIn,
                  ),
                  const SizedBox(height: 12),
                  SocialButton(
                    label: 'Sign in with GitHub',
                    asset: 'assets/github.png',
                    color: Colors.black,
                    textColor: Colors.white,
                    onPressed: _isLoading ? null : _handleGitHubSignIn,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(double width, double height) {
    return Image.asset(
      'assets/logo/app_logo.png', // Đường dẫn tới file logo của bạn
      width: width,
      height: height,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.image, color: Colors.grey[600], size: width * 0.3),
        );
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'example@email.com',
        prefixIcon: const Icon(Icons.email_outlined),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter email';
        }
        if (!value.contains('@')) {
          return 'Invalid email';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: '••••••••',
        prefixIcon: const Icon(Icons.lock_outlined),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
          ),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter password';
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: _isLoading ? null : _handleLogin,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: _isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : const Text('Login', style: TextStyle(fontSize: 16)),
    );
  }
}

// Widget chia nhỏ cho các thành phần phụ

class SocialButton extends StatelessWidget {
  final String label;
  final String asset;
  final Color color;
  final Color textColor;
  final VoidCallback? onPressed;

  const SocialButton({
    super.key,
    required this.label,
    required this.asset,
    required this.color,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Image.asset(
        asset,
        height: 24,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.g_mobiledata, size: 24);
        },
      ),
      label: Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: textColor,
        padding: const EdgeInsets.symmetric(vertical: 14),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

class _DividerText extends StatelessWidget {
  final String text;
  const _DividerText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey[300])),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(child: Divider(color: Colors.grey[300])),
      ],
    );
  }
}

class _RegisterLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Do not have an account?'),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RegisterScreen()),
            );
          },
          child: const Text('Register now'),
        ),
      ],
    );
  }
}

class _ForgotPasswordLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
        );
      },
      child: const Text('Forgot password?'),
    );
  }
}
