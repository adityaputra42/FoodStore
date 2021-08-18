part of 'shared.dart';

Color mainColor = "FFC700".toColor();
Color greyColor = "8D92A3".toColor();
Color whiteColor = "F5F7F9".toColor();

Widget loadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: mainColor,
);

TextStyle greyText = GoogleFonts.poppins().copyWith(color: greyColor);
TextStyle blackTextStyle1 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500);
TextStyle blackTextStyle2 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);
TextStyle blackTextStyle3 = GoogleFonts.poppins().copyWith(color: Colors.black);

const double defaultMargin = 24;
