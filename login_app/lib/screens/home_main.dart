import 'package:flutter/material.dart';
import 'category_card.dart';
import 'document_card.dart';
import 'bottom_navigation.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const _HeaderSection(),
                  const _SliderSection(),
                  const Expanded(child: _MainContentSection()),
                  const BottomNavigation(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Header Section
class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 31, 30, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          // Logo and Profile
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/2644223e3a00c86066dce80c33d9184162abd48e?placeholderIfAbsent=true',
                width: 133,
                height: 133 / 2.51,
                fit: BoxFit.contain,
              ),
              ClipOval(
                child: Image.network(
                  'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/e9518c4400dc485baa7791d781c8a9f6eee16154?placeholderIfAbsent=true',
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const _SearchBar(),
        ],
      ),
    );
  }
}

// Search Bar
class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: Colors.white,
        border: Border.all(color: const Color(0xFFD9D9D9), width: 2),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
      child: Row(
        children: [
          Image.network(
            'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/2fdc6880957a2d7e9e4f1d584ecf5ed9f9b524a2?placeholderIfAbsent=true',
            width: 26,
            height: 26,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              'Tìm kiếm',
              style: TextStyle(
                color: Color(0xFFB1B1B1),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Image.network(
            'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/0be76eb6874d408a3ff0df38a98ccb36f46e0f4f?placeholderIfAbsent=true',
            width: 26,
            height: 26,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}

// Slider Section
class _SliderSection extends StatelessWidget {
  const _SliderSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0xFFD9D9D9), width: 1),
          bottom: BorderSide(color: Color(0xFFD9D9D9), width: 1),
        ),
      ),
      child: Image.network(
        'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/aa04d6bdccd57a9cdafc98efba4e6b7140207916?placeholderIfAbsent=true',
        width: double.infinity,
        height: 180,
        fit: BoxFit.cover,
      ),
    );
  }
}

// Main Content Section
class _MainContentSection extends StatelessWidget {
  const _MainContentSection();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(15, 14, 15, 53),
      children: [
        const Text(
          'Bạn muốn học gì hôm nay ?',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Baloo',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 27),
        _CategoryGrid(),
        const SizedBox(height: 37),
        _FeaturedDocumentsHeader(),
        const SizedBox(height: 15),
        const DocumentCard(
          title: 'Tài liệu ngữ pháp tiếng Anh 1',
          downloadCount: '1000',
          fileType: 'Word',
          fileSize: '2.407 MB',
        ),
        const SizedBox(height: 21),
        const DocumentCard(
          title: 'Tài liệu từ vựng tiếng Anh 1',
          downloadCount: '1000',
          fileType: 'Word',
          fileSize: '2.407 MB',
        ),
      ],
    );
  }
}

// Category Grid
class _CategoryGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CategoryCard(
                imageUrl:
                    'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/374482892ccf829baf51e69eb3f62c141d108c8e?placeholderIfAbsent=true',
                title: 'Grammar',
                padding: const EdgeInsets.fromLTRB(24, 5, 24, 11),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: CategoryCard(
                imageUrl:
                    'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/8c0e6ba61317040ea059d68463d70838570b1aab?placeholderIfAbsent=true',
                title: 'Vocabulary',
                padding: const EdgeInsets.fromLTRB(24, 7, 24, 7),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: CategoryCard(
                imageUrl:
                    'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/3682fae96f5b60062c17615c9d6546861e2f24c0?placeholderIfAbsent=true',
                title: 'Reading',
                padding: const EdgeInsets.fromLTRB(24, 7, 24, 7),
              ),
            ),
          ],
        ),
        const SizedBox(height: 22),
        Row(
          children: [
            Expanded(
              child: CategoryCard(
                imageUrl:
                    'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/8da000ab6105faf40b1ce8014cce645f7aa20bd6?placeholderIfAbsent=true',
                title: 'Listening',
                padding: const EdgeInsets.fromLTRB(24, 7, 24, 7),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: CategoryCard(
                imageUrl:
                    'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/824658e851a613665780ce8aa64cd7447eaa476d?placeholderIfAbsent=true',
                title: 'Writing',
                padding: const EdgeInsets.fromLTRB(24, 7, 24, 7),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: CategoryCard(
                imageUrl:
                    'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/422c553291cb516533f6e30d894252fa848f7e34?placeholderIfAbsent=true',
                title: 'Speaking',
                padding: const EdgeInsets.fromLTRB(24, 7, 24, 7),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Featured Documents Header
class _FeaturedDocumentsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Tài liệu nổi bật',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Baloo',
            fontWeight: FontWeight.w400,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            // TODO: Xử lý sự kiện "Thêm"
          },
          child: const Text(
            'Thêm >',
            style: TextStyle(
              color: Color(0xFFB1B1B1),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
