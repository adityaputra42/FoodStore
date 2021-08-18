part of 'pages.dart';

class SuccesOrdePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: '22222b'.toColor(),
      body: IllustrationPage(
        title: "You've Made Order",
        subtitle: "Just stay at home while we are\npreparing your best foods",
        picturePath: 'assets/bike.png',
        buttonTitle1: "Order Other Foods",
        buttonOnTap1: () {
          Get.offAll(MainPage());
        },
        buttonOnTap2: () {
          Get.to(MainPage(
            initialPage: 1,
          ));
        },
        buttonTitle2: "View My Order",
      ),
    );
  }
}
