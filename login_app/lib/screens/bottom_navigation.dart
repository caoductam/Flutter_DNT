import 'package:flutter/material.dart';

// Hàm scale kích thước theo màn hình
double responsiveSize(BuildContext context, double size) {
  double width = MediaQuery.of(context).size.width;
  if (width < 400) return size * 0.85;
  if (width > 800) return size * 1.2;
  return size;
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double paddingH = responsiveSize(context, 25);
    double paddingV = responsiveSize(context, 9);

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _NavItem(
            iconUrl:
                'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/4c12790703bc6e16752b7ab508695168292315a1?placeholderIfAbsent=true',
            label: 'Trang chủ',
            onTap: () {
              // TODO: Xử lý chuyển tab
            },
          ),
          _NavItem(
            iconUrl:
                'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/d7e1cf6ff45858cd8fb45f7e5ce8415ec062ec1a?placeholderIfAbsent=true',
            label: 'Danh mục',
            onTap: () {
              // TODO: Xử lý chuyển tab
            },
          ),
          _NavItem(
            iconUrl:
                'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/f00920dca8f0d64f01b556cc28d6cc250113f9c2?placeholderIfAbsent=true',
            label: 'Tài liệu',
            onTap: () {
              // TODO: Xử lý chuyển tab
            },
          ),
          _NavItem(
            iconUrl:
                'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/19342db3f0032440a8f3e03de60ee179a3d72f5e?placeholderIfAbsent=true',
            label: 'Tài khoản',
            onTap: () {
              // TODO: Xử lý chuyển tab
            },
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String iconUrl;
  final String label;
  final VoidCallback? onTap;

  const _NavItem({required this.iconUrl, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    double iconSize = responsiveSize(context, 24);
    double fontSize = responsiveSize(context, 11);

    return Flexible(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              iconUrl,
              width: iconSize,
              height: iconSize,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.circle, size: iconSize, color: Colors.grey),
            ),
            SizedBox(height: responsiveSize(context, 7)),
            Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontSize: fontSize,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
