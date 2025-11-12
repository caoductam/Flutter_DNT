import 'package:flutter/material.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  // Tách phần logo thành widget riêng
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

  // Tách phần button thành widget riêng
  Widget _buildGetStartedButton(
    BuildContext context,
    double width,
    double height,
    double fontSize,
  ) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3009B5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
        ),
        onPressed: () {
          // Sự kiện khi nhấn nút: điều hướng sang LoginScreen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        },
        child: Text(
          'Bắt đầu',
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
            fontFamily: 'Baloo',
          ),
        ),
      ),
    );
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
    double welcomeFontSize = isMobile ? 26 : (isTablet ? 28 : 26);
    double subtitleFontSize = isMobile ? 20 : (isTablet ? 20 : 20);
    double descriptionFontSize = isMobile ? 16 : (isTablet ? 16 : 16);
    double buttonFontSize = isMobile ? 22 : (isTablet ? 22 : 22);

    // Button dimensions
    double buttonWidth = isMobile ? 200 : (isTablet ? 220 : 257);
    double buttonHeight = isMobile ? 55 : (isTablet ? 60 : 70);

    return Scaffold(
      backgroundColor: Colors.white, // Đặt nền trắng cho toàn màn hình
      body: Center(
        child: Container(
          // width: size.width, // BỎ width để Container tự động full màn hình
          height: containerHeight,
          margin: EdgeInsets.all(isMobile ? 16 : 20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95),
            borderRadius: BorderRadius.circular(isMobile ? 12 : 20),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 40 : 60,
                horizontal: isMobile ? 16 : 32,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  _buildLogo(logoWidth, logoHeight),
                  const SizedBox(height: 140),
                  Text(
                    'Chào mừng đến với Ryder English',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF3009B5),
                      fontSize: welcomeFontSize,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Baloo',
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Mở khóa tiếng Anh. Mở khóa cơ hội',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: subtitleFontSize,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Baloo',
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'Tiếng Anh Dễ Dàng. Thành Công Gần Hơn',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: descriptionFontSize,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: isMobile ? 180 : 180),
                  _buildGetStartedButton(
                    context,
                    buttonWidth,
                    buttonHeight,
                    buttonFontSize,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
