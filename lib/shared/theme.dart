part of 'shared.dart';

Color mainColor = Color(0xffFFA51D);
Color greyColor = Color(0xff8D92A3);
Color whiteColor = Color(0xffFfffff);
Color blackColor = Color(0xff020202);
Color backgroundColor = Color(0xff22222b);
Color secondBgColor = Color(0xff2b2b31);
Color inputTextColor = Color(0xff3c3c43);
Color redColor = Color(0xffE61313);
Color greenColor = Color(0xff80e613);

Widget loadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: mainColor,
);

// TextStyle Pallete
TextStyle blacTextStyle = GoogleFonts.poppins(color: blackColor);

TextStyle whiteTextStyle = GoogleFonts.poppins(color: whiteColor);

TextStyle greyTextStyle = GoogleFonts.poppins(color: greyColor);

TextStyle greenTextStyle = GoogleFonts.poppins(color: greenColor);

// TextStyle redTextStyle = GoogleFonts.poppins(color: redColor);

TextStyle yellowTextStyle = GoogleFonts.poppins(color: mainColor);

double defaultMargin = 24;
double defaultRadius = 16.0;

//  FontWeight Palllete
FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
