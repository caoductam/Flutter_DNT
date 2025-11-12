import 'package:flutter/material.dart';

class DocumentCard extends StatelessWidget {
  final String title;
  final String downloadCount;
  final String fileType;
  final String fileSize;
  final VoidCallback? onTap;

  const DocumentCard({
    Key? key,
    required this.title,
    required this.downloadCount,
    required this.fileType,
    required this.fileSize,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _InfoItem(
                    iconUrl:
                        'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/aef526fb9230146311761105d1e804e4a3477248?placeholderIfAbsent=true',
                    text: downloadCount,
                  ),
                  _InfoItem(
                    iconUrl:
                        'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/f2b1695ce245179974ba7e38af6fc1d8298bb192?placeholderIfAbsent=true',
                    text: fileType,
                  ),
                  _InfoItem(
                    iconUrl:
                        'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/851afb2087493e94f86d49bab46524757f710025?placeholderIfAbsent=true',
                    text: fileSize,
                  ),
                  _InfoItem(
                    iconUrl:
                        'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/55328b4fc527703d661f4fc4bda82b05d5c0306e?placeholderIfAbsent=true',
                    text: 'Chia sẻ',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String iconUrl;
  final String text;

  const _InfoItem({required this.iconUrl, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          iconUrl,
          width: 22,
          height: 22,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.insert_drive_file, size: 20, color: Colors.grey),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
