import 'package:baitap_laptrinhtbdd/baitap_tuan_3/bai_1/intro.dart';
import 'package:baitap_laptrinhtbdd/baitap_tuan_3/bai_2/onb_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnbScreen extends StatefulWidget {
  const OnbScreen({super.key});

  @override
  State<OnbScreen> createState() => _OnbScreenState();
}

class _OnbScreenState extends State<OnbScreen> {
  PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onbData.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return buildOnbItem(onbData[index]);
              },
            ),
          ),
          _buildNavigationButtons(screenWidth),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget buildOnbItem(OnbModel onbModel) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200, // Giới hạn chiều cao hình ảnh
            child: SvgPicture.asset(onbModel.image),
          ),
          const SizedBox(height: 20),
          Text(
            onbModel.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              onbModel.description,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationButtons(double screenWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: _currentIndex > 0
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          // Nút Back (xuất hiện khi index > 0)
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _currentIndex > 0
                ? screenWidth * 0.2
                : 0, // 30% màn hình khi có, 0 khi ẩn
            height: 50,
            child: _currentIndex > 0
                ? ElevatedButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor: Colors.blue,
                    ),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  )
                : null,
          ),

          // Nút Next / Get Started với hiệu ứng thay đổi kích thước
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _currentIndex == 0
                ? screenWidth * 0.85
                : screenWidth *
                    0.65, // Lớn ở index đầu tiên, nhỏ ở trang tiếp theo
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                if (_currentIndex == onbData.length - 1) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const IntroScreen()),
                    (route) => false,
                  );
                  print("Go to Home Screen");
                } else {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: Colors.blue,
              ),
              child: Text(
                _currentIndex == onbData.length - 1 ? "Get Started" : "Next",
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
