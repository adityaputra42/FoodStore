part of 'pages.dart';

class PaymentMethodPage extends StatelessWidget {
  final String paymentUrl;

  PaymentMethodPage(this.paymentUrl);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: '22222b'.toColor(),
      body: IllustrationPage(
        title: "Finish Your Payment",
        subtitle: "Please select your favorite\npayment method",
        picturePath: 'assets/Payment.png',
        buttonTitle1: "Payment Method",
        buttonOnTap1: () async {
          await launchUrl(Uri.parse(paymentUrl));
        },
        buttonOnTap2: () {
          Get.to(SuccesOrdePage());
        },
        buttonTitle2: "Continue",
      ),
    );
  }
}
