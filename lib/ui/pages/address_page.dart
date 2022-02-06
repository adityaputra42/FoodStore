part of 'pages.dart';

class AddressPage extends StatefulWidget {
  final User user;
  final String password;
  final File pictureFile;

  AddressPage(this.user, this.password, this.pictureFile);
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController housenoController = TextEditingController();
  bool isLoading = false;

  late List<String> cities;
  late String selectedCity;

  @override
  void initState() {
    super.initState();

    cities = ['Jakarta', 'Bandung', 'Semarang', 'Jogjakarta', 'Surabaya'];
    selectedCity = cities[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: '22222B'.toColor()),
          SafeArea(
              child: Container(
            color: '22222B'.toColor(),
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
                                "Address Page",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Make sure it's void",
                                style: GoogleFonts.poppins(
                                    color: greyColor,
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
                          color: '2B2B31'.toColor(),
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
                                defaultMargin, 24, defaultMargin, 6),
                            child: Text(
                              'Phone No',
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
                              controller: phoneController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: greyTextStyle,
                                  hintText: 'Type your phone number'),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.fromLTRB(
                                defaultMargin, 20, defaultMargin, 6),
                            child: Text(
                              'Address',
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
                              controller: addressController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: greyTextStyle,
                                  hintText: 'Type your address'),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.fromLTRB(
                                defaultMargin, 20, defaultMargin, 6),
                            child: Text(
                              'House No',
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
                              controller: housenoController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: greyTextStyle,
                                  hintText: 'Type your house number'),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.fromLTRB(
                                defaultMargin, 20, defaultMargin, 6),
                            child: Text(
                              'City',
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
                            child: DropdownButton(
                              isExpanded: true,
                              underline: SizedBox(),
                              dropdownColor: inputTextColor,
                              value: selectedCity,
                              items: cities
                                  .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(
                                        e,
                                        style: whiteTextStyle,
                                      )))
                                  .toList(),
                              onChanged: (item) {
                                setState(() {
                                  selectedCity = item.toString();
                                });
                              },
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 30, bottom: 40),
                            height: 45,
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: (isLoading == true)
                                ? Center(
                                    child: loadingIndicator,
                                  )
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
                                                    BorderRadius.circular(
                                                        12)))),
                                    onPressed: () async {
                                      User user = widget.user.copyWith(
                                          phoneNumber: phoneController.text,
                                          address: addressController.text,
                                          houseNumber: housenoController.text,
                                          city: selectedCity);

                                      setState(() {
                                        isLoading = true;
                                      });
                                      await context.read<UserCubit>().signUp(
                                          user, widget.password,
                                          pictureFile: widget.pictureFile);
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
                                            backgroundColor: "D9435E".toColor(),
                                            icon: Icon(
                                              Icons
                                                  .replay_circle_filled_outlined,
                                              color: Colors.white,
                                            ),
                                            titleText: Text(
                                              "Sign up Failed",
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
                                    child: Text('Sign Up Now',
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

// class City {
//   String city;
//   City(this.city);
// }
