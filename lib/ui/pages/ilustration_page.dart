part of 'pages.dart';

class IllustrationPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String picturePath;
  final String buttonTitle1;
  final String? buttonTitle2;
  final Function() buttonOnTap1;
  final Function()? buttonOnTap2;

  const IllustrationPage(
      {required this.title,
      required this.subtitle,
      required this.picturePath,
      required this.buttonTitle1,
      this.buttonTitle2,
      required this.buttonOnTap1,
      this.buttonOnTap2});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.only(bottom: 50),
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(picturePath))),
          ),
          Text(
            title,
            style: whiteTextStyle.copyWith(fontSize: 20),
          ),
          Text(
            subtitle,
            style: greyTextStyle.copyWith(fontWeight: light),
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 12),
            width: 200,
            height: 45,
            child: ElevatedButton(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(mainColor),
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)))),
              child: Text(buttonTitle1,
                  style: GoogleFonts.poppins(
                      color: Colors.black, fontWeight: FontWeight.w500)),
              onPressed: buttonOnTap1,
            ),
          ),
          if (buttonOnTap2 == null)
            SizedBox()
          else
            SizedBox(
              width: 200,
              height: 45,
              child: ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all('484A52'.toColor()),
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)))),
                child: Text(buttonTitle2 ?? 'title',
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontWeight: FontWeight.w500)),
                onPressed: buttonOnTap2,
              ),
            )
        ],
      ),
    );
  }
}
