part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  final User user;

  ProfilePage({this.user});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: '22222b'.toColor(),
          ),
          SafeArea(
              child: Container(
            color: '22222b'.toColor(),
          )),
          SafeArea(
              child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin, vertical: defaultMargin),
                // margin: EdgeInsets.only(bottom: 16),
                child: Column(
                  children: [
                    Container(
                      width: 110,
                      height: 110,
                      margin: EdgeInsets.only(top: 26, bottom: 16),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/photo_border.png'))),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                  (context.read<UserCubit>().state
                                          as UserLoaded)
                                      .user
                                      .picturePath,
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Text(
                      (context.read<UserCubit>().state as UserLoaded).user.name,
                      style: blackTextStyle2.copyWith(
                          fontSize: 18, color: Colors.white),
                    ),
                    Text(
                      (context.read<UserCubit>().state as UserLoaded)
                          .user
                          .email,
                      style: greyText.copyWith(fontSize: 14),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTabbar(
                      titles: ["Account", "FoodMarket"],
                      selectedIndex: selectedIndex,
                      onTap: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              (selectedIndex == 0)
                                  ? 'Edit Profile'
                                  : "Rate App",
                              style: greyText),
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/right_arrow.png"))),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            (selectedIndex == 0)
                                ? 'Home Address'
                                : "Help Center",
                            style: greyText,
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/right_arrow.png"))),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            (selectedIndex == 0)
                                ? 'Security'
                                : "Privacy & Policy",
                            style: greyText,
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/right_arrow.png"))),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            (selectedIndex == 0)
                                ? 'Payment'
                                : "Terms & Conditions",
                            style: greyText,
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/right_arrow.png"))),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 45,
                margin: EdgeInsets.fromLTRB(48, 50, 48, 80),
              )
            ],
          ))
        ],
      ),
    );
  }
}
