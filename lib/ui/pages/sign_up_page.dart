// ignore_for_file: deprecated_member_use

part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  User? user;
  File? pitureFile;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: "22222B".toColor()),
          SafeArea(
              child: Container(
            color: "22222B".toColor(),
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
                          GestureDetector(
                            onTap: () {
                              Get.back();
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
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Sign Up",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Register and eat",
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
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(
                          defaultMargin, 12, defaultMargin, 60),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: "2B2B31".toColor(),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 3,
                                spreadRadius: 2,
                                color: Colors.black12)
                          ]),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              PickedFile? pickedFile = await ImagePicker()
                                  .getImage(source: ImageSource.gallery);
                              if (pickedFile != null) {
                                pitureFile = File(pickedFile.path);
                                setState(() {});
                              }
                            },
                            child: Container(
                              width: 90,
                              height: 90,
                              margin: EdgeInsets.only(top: 24),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/photo_border.png'))),
                              child: (pitureFile != null)
                                  ? Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: FileImage(pitureFile!),
                                              fit: BoxFit.cover)),
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/photo_dark.png'),
                                              fit: BoxFit.cover)),
                                    ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.fromLTRB(
                                defaultMargin, 20, defaultMargin, 6),
                            child: Text(
                              'Full Name',
                              style: whiteTextStyle.copyWith(fontSize: 16),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: '3C3C43'.toColor()),
                            child: TextField(
                              style: whiteTextStyle,
                              controller: nameController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: greyTextStyle,
                                  hintText: 'Type your full name'),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.fromLTRB(
                                defaultMargin, 20, defaultMargin, 6),
                            child: Text(
                              'Email Address',
                              style: whiteTextStyle.copyWith(fontSize: 16),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: inputTextColor),
                            child: TextField(
                              style: whiteTextStyle,
                              controller: emailController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle:
                                      greyTextStyle.copyWith(fontSize: 14),
                                  hintText: 'Type your email address'),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.fromLTRB(
                                defaultMargin, 20, defaultMargin, 6),
                            child: Text(
                              'Password',
                              style: whiteTextStyle.copyWith(fontSize: 16),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: inputTextColor),
                            child: TextField(
                              style: whiteTextStyle,
                              obscureText: true,
                              controller: passwordController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: greyTextStyle,
                                  hintText: 'Type your password'),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 30, bottom: 40),
                            height: 45,
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    backgroundColor:
                                        MaterialStateProperty.all(mainColor),
                                    elevation: MaterialStateProperty.all(0),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)))),
                                onPressed: () {
                                  Get.to(AddressPage(
                                      User(
                                          name: nameController.text,
                                          email: emailController.text),
                                      passwordController.text,
                                      pitureFile!));
                                },
                                child: Text('Continue',
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500))),
                          ),
                        ],
                      ),
                    ),
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
