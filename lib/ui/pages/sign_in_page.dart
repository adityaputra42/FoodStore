part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: "22222B".toColor(),
          ),
          SafeArea(
              child: Container(
            color: "22222B".toColor(),
          )),
          SafeArea(
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      margin: EdgeInsets.only(top: 80, left: 30),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/logo_toko.png"),
                              fit: BoxFit.contain)),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30, top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "FoodStore",
                            style: whiteTextStyle.copyWith(fontSize: 22),
                          ),
                          Text(
                            "Find Your Best Every Meal",
                            style: greyTextStyle,
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(
                          defaultMargin, 30, defaultMargin, 60),
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
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.fromLTRB(
                                defaultMargin, 35, defaultMargin, 6),
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
                                color: '3C3C43'.toColor()),
                            child: TextField(
                              style: whiteTextStyle,
                              controller: emailController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle:
                                      greyTextStyle.copyWith(fontSize: 13),
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
                                color: '3C3C43'.toColor()),
                            child: TextField(
                              style: whiteTextStyle,
                              obscureText: true,
                              controller: passwordController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: greyTextStyle.copyWith(fontSize: 13),
                                hintText: 'Type your password',
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 30, bottom: 40),
                            height: 45,
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: isLoading
                                ? loadingIndicator
                                : ElevatedButton(
                                    style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                mainColor),
                                        elevation: MaterialStateProperty.all(0),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)))),
                                    onPressed: () async {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      await context.read<UserCubit>().signIn(
                                          emailController.text,
                                          passwordController.text);
                                      UserState state =
                                          context.read<UserCubit>().state;

                                      if (state is UserLoaded) {
                                        context.read<FoodCubit>().getFoods();
                                        context
                                            .read<TransactionCubit>()
                                            .getTransactions();
                                        Get.to(MainPage());
                                      } else {
                                        Get.snackbar("", "",
                                            backgroundColor: redColor,
                                            icon: Icon(
                                              Icons.close,
                                              color: Colors.white,
                                            ),
                                            titleText: Text(
                                              "Sign In Failed",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            messageText: Text(
                                              (state as UserLoadingFail)
                                                  .message,
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white),
                                            ));
                                        setState(() {
                                          isLoading = false;
                                        });
                                      }
                                    },
                                    child: Text('Sign in',
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500))),
                          ),
                        ],
                      ),
                    ),
                    Center(
                        child: GestureDetector(
                      onTap: () {
                        Get.to(SignUpPage());
                      },
                      child: Text('Create New Account',
                          style: GoogleFonts.poppins(
                              color: greyColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                    )),
                    SizedBox(
                      height: 70,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
