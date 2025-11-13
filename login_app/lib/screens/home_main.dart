// import 'package:flutter/material.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;
// import 'category_card.dart';
// import 'document_card.dart';
// import 'bottom_navigation.dart';

// // Hàm scale kích thước theo màn hình
// double responsiveSize(BuildContext context, double size) {
//   double width = MediaQuery.of(context).size.width;
//   if (width < 400) return size * 0.85;
//   if (width > 800) return size * 1.2;
//   return size;
// }

// class HomeMain extends StatelessWidget {
//   const HomeMain({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       resizeToAvoidBottomInset: true,
//       bottomNavigationBar: const BottomNavigation(),
//       body: SafeArea(
//         child: LayoutBuilder(
//           builder: (context, constraints) {
//             double width = constraints.maxWidth;
//             double containerWidth = width < 600 ? width : 480;
//             return Align(
//               alignment: Alignment.topCenter,
//               child: Container(
//                 width: containerWidth,
//                 color: Colors.white,
//                 child: ListView(
//                   padding: EdgeInsets.zero,
//                   children: const [
//                     _HeaderSection(),
//                     _SliderSection(),
//                     _MainContentSection(),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// // Header Section
// class _HeaderSection extends StatelessWidget {
//   const _HeaderSection();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.fromLTRB(
//         responsiveSize(context, 30),
//         responsiveSize(context, 31),
//         responsiveSize(context, 30),
//         responsiveSize(context, 12),
//       ),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: const BorderRadius.vertical(top: Radius.circular(0)),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.06),
//             blurRadius: 2,
//             offset: const Offset(0, 0),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           // Logo and Profile
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Image.network(
//                 'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/2644223e3a00c86066dce80c33d9184162abd48e?placeholderIfAbsent=true',
//                 width: responsiveSize(context, 133),
//                 height: responsiveSize(context, 133) / 2.51,
//                 fit: BoxFit.contain,
//               ),
//               ClipOval(
//                 child: Image.network(
//                   'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/e9518c4400dc485baa7791d781c8a9f6eee16154?placeholderIfAbsent=true',
//                   width: responsiveSize(context, 32),
//                   height: responsiveSize(context, 32),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: responsiveSize(context, 8)),
//           const _SearchBar(),
//         ],
//       ),
//     );
//   }
// }

// // Search Bar (TextField + Voice)
// class _SearchBar extends StatefulWidget {
//   const _SearchBar();

//   @override
//   State<_SearchBar> createState() => _SearchBarState();
// }

// class _SearchBarState extends State<_SearchBar> {
//   final TextEditingController _controller = TextEditingController();
//   late stt.SpeechToText _speech;
//   bool _isListening = false;

//   @override
//   void initState() {
//     super.initState();
//     _speech = stt.SpeechToText();
//   }

//   Future<void> _listen() async {
//     if (!_isListening) {
//       bool available = await _speech.initialize(
//         onStatus: (val) {
//           if (val == 'done' || val == 'notListening') {
//             setState(() => _isListening = false);
//           }
//         },
//         onError: (val) {
//           setState(() => _isListening = false);
//         },
//       );
//       if (available) {
//         setState(() => _isListening = true);
//         _speech.listen(
//           onResult: (val) {
//             setState(() {
//               _controller.text = val.recognizedWords;
//               _controller.selection = TextSelection.fromPosition(
//                 TextPosition(offset: _controller.text.length),
//               );
//             });
//           },
//           localeId: 'vi_VN',
//         );
//       }
//     } else {
//       setState(() => _isListening = false);
//       _speech.stop();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(0),
//         color: Colors.white,
//         border: Border.all(color: const Color(0xFFD9D9D9), width: 2),
//       ),
//       padding: EdgeInsets.symmetric(
//         horizontal: responsiveSize(context, 12),
//         vertical: responsiveSize(context, 4),
//       ),
//       child: Row(
//         children: [
//           Image.network(
//             'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/2fdc6880957a2d7e9e4f1d584ecf5ed9f9b524a2?placeholderIfAbsent=true',
//             width: responsiveSize(context, 26),
//             height: responsiveSize(context, 26),
//             fit: BoxFit.contain,
//           ),
//           SizedBox(width: responsiveSize(context, 8)),
//           Expanded(
//             child: TextField(
//               controller: _controller,
//               decoration: InputDecoration(
//                 hintText: 'Tìm kiếm',
//                 hintStyle: TextStyle(
//                   color: const Color(0xFFB1B1B1),
//                   fontSize: responsiveSize(context, 14),
//                   fontFamily: 'Inter',
//                   fontWeight: FontWeight.w400,
//                 ),
//                 border: InputBorder.none,
//                 isDense: true,
//                 contentPadding: EdgeInsets.symmetric(vertical: 8),
//               ),
//               style: TextStyle(
//                 fontSize: responsiveSize(context, 14),
//                 fontFamily: 'Inter',
//               ),
//               onSubmitted: (value) {
//                 // TODO: Xử lý tìm kiếm
//                 print('Tìm kiếm: $value');
//               },
//             ),
//           ),
//           SizedBox(width: responsiveSize(context, 8)),
//           GestureDetector(
//             onTap: _listen,
//             child: Icon(
//               _isListening ? Icons.mic : Icons.mic_none,
//               color: _isListening ? Colors.red : Colors.grey,
//               size: responsiveSize(context, 26),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Slider Section
// class _SliderSection extends StatelessWidget {
//   const _SliderSection();

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double sliderHeight = width < 600 ? 180 : 300;
//     return Container(
//       margin: const EdgeInsets.only(top: 4),
//       decoration: const BoxDecoration(
//         border: Border(
//           top: BorderSide(color: Color(0xFFD9D9D9), width: 1),
//           bottom: BorderSide(color: Color(0xFFD9D9D9), width: 1),
//         ),
//       ),
//       child: Image.network(
//         'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/aa04d6bdccd57a9cdafc98efba4e6b7140207916?placeholderIfAbsent=true',
//         width: double.infinity,
//         height: sliderHeight,
//         fit: BoxFit.cover,
//       ),
//     );
//   }
// }

// // Main Content Section (ĐÃ SỬA)
// class _MainContentSection extends StatelessWidget {
//   const _MainContentSection();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.fromLTRB(
//         responsiveSize(context, 15),
//         responsiveSize(context, 14),
//         responsiveSize(context, 15),
//         responsiveSize(context, 53),
//       ),
//       child: ListView(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         children: [
//           Text(
//             'Bạn muốn học gì hôm nay ?',
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: responsiveSize(context, 14),
//               fontFamily: 'Baloo',
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           SizedBox(height: responsiveSize(context, 27)),
//           _CategoryGrid(),
//           SizedBox(height: responsiveSize(context, 37)),
//           _FeaturedDocumentsHeader(),
//           SizedBox(height: responsiveSize(context, 15)),
//           DocumentCard(
//             title: 'Tài liệu ngữ pháp tiếng Anh 1',
//             downloadCount: '1000',
//             fileType: 'Word',
//             fileSize: '2.407 MB',
//           ),
//           SizedBox(height: responsiveSize(context, 21)),
//           DocumentCard(
//             title: 'Tài liệu từ vựng tiếng Anh 1',
//             downloadCount: '1000',
//             fileType: 'Word',
//             fileSize: '2.407 MB',
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Category Grid Responsive
// class _CategoryGrid extends StatelessWidget {
//   final List<Map<String, dynamic>> categories = [
//     {
//       'imageUrl':
//           'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/374482892ccf829baf51e69eb3f62c141d108c8e?placeholderIfAbsent=true',
//       'title': 'Grammar',
//       'padding': EdgeInsets.fromLTRB(24, 5, 24, 11),
//     },
//     {
//       'imageUrl':
//           'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/8c0e6ba61317040ea059d68463d70838570b1aab?placeholderIfAbsent=true',
//       'title': 'Vocabulary',
//       'padding': EdgeInsets.fromLTRB(24, 7, 24, 7),
//     },
//     {
//       'imageUrl':
//           'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/3682fae96f5b60062c17615c9d6546861e2f24c0?placeholderIfAbsent=true',
//       'title': 'Reading',
//       'padding': EdgeInsets.fromLTRB(24, 7, 24, 7),
//     },
//     {
//       'imageUrl':
//           'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/8da000ab6105faf40b1ce8014cce645f7aa20bd6?placeholderIfAbsent=true',
//       'title': 'Listening',
//       'padding': EdgeInsets.fromLTRB(24, 7, 24, 7),
//     },
//     {
//       'imageUrl':
//           'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/824658e851a613665780ce8aa64cd7447eaa476d?placeholderIfAbsent=true',
//       'title': 'Writing',
//       'padding': EdgeInsets.fromLTRB(24, 7, 24, 7),
//     },
//     {
//       'imageUrl':
//           'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/422c553291cb516533f6e30d894252fa848f7e34?placeholderIfAbsent=true',
//       'title': 'Speaking',
//       'padding': EdgeInsets.fromLTRB(24, 7, 24, 7),
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     int crossAxisCount = width < 600 ? 3 : 6;

//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: categories.length,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: crossAxisCount,
//         mainAxisSpacing: responsiveSize(context, 14),
//         crossAxisSpacing: responsiveSize(context, 14),
//         childAspectRatio: 1,
//       ),
//       itemBuilder: (context, index) {
//         final cat = categories[index];
//         return CategoryCard(
//           imageUrl: cat['imageUrl'],
//           title: cat['title'],
//           padding: cat['padding'],
//         );
//       },
//     );
//   }
// }

// // Featured Documents Header
// class _FeaturedDocumentsHeader extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text(
//           'Tài liệu nổi bật',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: responsiveSize(context, 14),
//             fontFamily: 'Baloo',
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//         const Spacer(),
//         TextButton(
//           onPressed: () {
//             // TODO: Xử lý sự kiện "Thêm"
//           },
//           child: Text(
//             'Thêm >',
//             style: TextStyle(
//               color: const Color(0xFFB1B1B1),
//               fontSize: responsiveSize(context, 14),
//               fontFamily: 'Inter',
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'category_card.dart';
import 'document_card.dart';
import 'bottom_navigation.dart';

// Hàm scale kích thước theo màn hình
double responsiveSize(BuildContext context, double size) {
  double width = MediaQuery.of(context).size.width;
  if (width < 400) return size * 0.85;
  if (width > 800) return size * 1.2;
  return size;
}

class HomeMain extends StatelessWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: const BottomNavigation(),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double width = constraints.maxWidth;
            double containerWidth = width < 600 ? width : 480;
            return Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: containerWidth,
                color: Colors.white,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: const [
                    _HeaderSection(),
                    _SliderSection(),
                    _MainContentSection(),
                  ],
                ),
              ),
            );
          },
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
      padding: EdgeInsets.fromLTRB(
        responsiveSize(context, 30),
        responsiveSize(context, 31),
        responsiveSize(context, 30),
        responsiveSize(context, 12),
      ),
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
                width: responsiveSize(context, 133),
                height: responsiveSize(context, 133) / 2.51,
                fit: BoxFit.contain,
              ),
              ClipOval(
                child: Image.network(
                  'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/e9518c4400dc485baa7791d781c8a9f6eee16154?placeholderIfAbsent=true',
                  width: responsiveSize(context, 32),
                  height: responsiveSize(context, 32),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(height: responsiveSize(context, 8)),
          const _SearchBar(),
        ],
      ),
    );
  }
}

// Search Bar (TextField + Voice)
class _SearchBar extends StatefulWidget {
  const _SearchBar();

  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  final TextEditingController _controller = TextEditingController();
  late stt.SpeechToText _speech;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  Future<void> _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) {
          if (val == 'done' || val == 'notListening') {
            setState(() => _isListening = false);
          }
        },
        onError: (val) {
          setState(() => _isListening = false);
        },
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) {
            setState(() {
              _controller.text = val.recognizedWords;
              _controller.selection = TextSelection.fromPosition(
                TextPosition(offset: _controller.text.length),
              );
            });
          },
          localeId: 'vi_VN',
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: Colors.white,
        border: Border.all(color: const Color(0xFFD9D9D9), width: 2),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: responsiveSize(context, 12),
        vertical: responsiveSize(context, 4),
      ),
      child: Row(
        children: [
          Image.network(
            'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/2fdc6880957a2d7e9e4f1d584ecf5ed9f9b524a2?placeholderIfAbsent=true',
            width: responsiveSize(context, 26),
            height: responsiveSize(context, 26),
            fit: BoxFit.contain,
          ),
          SizedBox(width: responsiveSize(context, 8)),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Tìm kiếm',
                hintStyle: TextStyle(
                  color: const Color(0xFFB1B1B1),
                  fontSize: responsiveSize(context, 14),
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 8),
              ),
              style: TextStyle(
                fontSize: responsiveSize(context, 14),
                fontFamily: 'Inter',
              ),
              onSubmitted: (value) {
                // TODO: Xử lý tìm kiếm
                print('Tìm kiếm: $value');
              },
            ),
          ),
          SizedBox(width: responsiveSize(context, 8)),
          GestureDetector(
            onTap: _listen,
            child: Icon(
              _isListening ? Icons.mic : Icons.mic_none,
              color: _isListening ? Colors.red : Colors.grey,
              size: responsiveSize(context, 26),
            ),
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
    double width = MediaQuery.of(context).size.width;
    double sliderHeight = width < 600 ? 180 : 300;
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
        height: sliderHeight,
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
    return Padding(
      padding: EdgeInsets.fromLTRB(
        responsiveSize(context, 15),
        responsiveSize(context, 14),
        responsiveSize(context, 15),
        responsiveSize(context, 53),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Text(
            'Bạn muốn học gì hôm nay ?',
            style: TextStyle(
              color: Colors.black,
              fontSize: responsiveSize(context, 14),
              fontFamily: 'Baloo',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: responsiveSize(context, 27)),
          _CategoryGrid(),
          SizedBox(height: responsiveSize(context, 37)),
          _FeaturedDocumentsHeader(),
          SizedBox(height: responsiveSize(context, 15)),
          DocumentCard(
            title: 'Tài liệu ngữ pháp tiếng Anh 1',
            downloadCount: '1000',
            fileType: 'Word',
            fileSize: '2.407 MB',
          ),
          SizedBox(height: responsiveSize(context, 21)),
          DocumentCard(
            title: 'Tài liệu từ vựng tiếng Anh 1',
            downloadCount: '1000',
            fileType: 'Word',
            fileSize: '2.407 MB',
          ),
        ],
      ),
    );
  }
}

// Category Grid Responsive - ĐÃ SỬA ĐỂ TRÁNH OVERFLOW
class _CategoryGrid extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {
      'imageUrl':
          'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/374482892ccf829baf51e69eb3f62c141d108c8e?placeholderIfAbsent=true',
      'title': 'Grammar',
    },
    {
      'imageUrl':
          'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/8c0e6ba61317040ea059d68463d70838570b1aab?placeholderIfAbsent=true',
      'title': 'Vocabulary',
    },
    {
      'imageUrl':
          'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/3682fae96f5b60062c17615c9d6546861e2f24c0?placeholderIfAbsent=true',
      'title': 'Reading',
    },
    {
      'imageUrl':
          'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/8da000ab6105faf40b1ce8014cce645f7aa20bd6?placeholderIfAbsent=true',
      'title': 'Listening',
    },
    {
      'imageUrl':
          'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/824658e851a613665780ce8aa64cd7447eaa476d?placeholderIfAbsent=true',
      'title': 'Writing',
    },
    {
      'imageUrl':
          'https://api.builder.io/api/v1/image/assets/cd1262fbd5fd4c92bd2cf4090cfb7263/422c553291cb516533f6e30d894252fa848f7e34?placeholderIfAbsent=true',
      'title': 'Speaking',
    },
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int crossAxisCount = width < 600 ? 3 : 6;

    // Tăng childAspectRatio để tạo thêm không gian chiều cao
    double aspectRatio = width < 600 ? 0.85 : 1.0;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: responsiveSize(context, 14),
        crossAxisSpacing: responsiveSize(context, 14),
        childAspectRatio: aspectRatio, // Đã điều chỉnh
      ),
      itemBuilder: (context, index) {
        final cat = categories[index];
        return CategoryCard(
          imageUrl: cat['imageUrl'],
          title: cat['title'],
          padding: EdgeInsets.symmetric(
            horizontal: responsiveSize(context, 8),
            vertical: responsiveSize(context, 8),
          ),
        );
      },
    );
  }
}

// Featured Documents Header
class _FeaturedDocumentsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Tài liệu nổi bật',
          style: TextStyle(
            color: Colors.black,
            fontSize: responsiveSize(context, 14),
            fontFamily: 'Baloo',
            fontWeight: FontWeight.w400,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            // TODO: Xử lý sự kiện "Thêm"
          },
          child: Text(
            'Thêm >',
            style: TextStyle(
              color: const Color(0xFFB1B1B1),
              fontSize: responsiveSize(context, 14),
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
