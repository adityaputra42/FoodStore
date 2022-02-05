part of 'pages.dart';

class GeneralPage extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Function? onBackButtonPressed;
  final Widget? child;
  final Color? backColor;

  const GeneralPage(
      {this.title = "Title",
      this.subtitle = "Subtitle",
      this.onBackButtonPressed,
      this.backColor,
      this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: '22222b'.toColor()),
          SafeArea(
              child: Container(
            color: backColor ?? '22222b'.toColor(),
          )),
          SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        children: [
                          onBackButtonPressed != null
                              ? GestureDetector(
                                  onTap: () {
                                    if (onBackButtonPressed != null) {
                                      onBackButtonPressed!();
                                    }
                                  },
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/back_arrow_white.png"))),
                                    margin: EdgeInsets.only(right: 26),
                                  ),
                                )
                              : SizedBox(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                title!,
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                subtitle!,
                                style: GoogleFonts.poppins(
                                    color: "8D92A3".toColor(),
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: defaultMargin,
                      width: double.infinity,
                    ),
                    child ?? SizedBox()
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
