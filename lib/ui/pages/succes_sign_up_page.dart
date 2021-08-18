part of 'pages.dart';

class SuccesSignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: '22222b'.toColor(),
      body: IllustrationPage(
          title: "Yeay! Completed",
          subtitle: "Now you are able to order\nsome foods as a self-reward",
          picturePath: "assets/food_wishes.png",
          buttonTitle1: 'Find Foods',
          buttonOnTap1: () {}),
    );
  }
}
