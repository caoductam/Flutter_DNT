import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 9),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
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
    return Flexible(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              iconUrl,
              width: 24,
              height: 24,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.circle, size: 24, color: Colors.grey),
            ),
            const SizedBox(height: 7),
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 11,
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
