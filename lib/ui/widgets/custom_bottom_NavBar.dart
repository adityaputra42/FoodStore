part of 'widget.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;

  CustomBottomNavBar({this.selectedIndex, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          color: '2b2b31'.toColor(),
          boxShadow: [
            BoxShadow(spreadRadius: 5, blurRadius: 15, color: Colors.black12)
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(0);
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 22,
                    width: 22,
                    child: (selectedIndex == 0)
                        ? Icon(
                            Icons.home,
                            color: mainColor,
                            size: 22,
                          )
                        : Icon(
                            Icons.home_outlined,
                            color: greyColor,
                            size: 20,
                          )),
                Container(
                    margin: EdgeInsets.only(top: 3),
                    child: Text(
                      "Home",
                      style: greyText.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: (selectedIndex == 0 ? mainColor : greyColor),
                      ),
                    ))
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(1);
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 22,
                    width: 22,
                    margin: EdgeInsets.symmetric(horizontal: 88),
                    child: (selectedIndex == 1)
                        ? Icon(
                            Icons.shopping_bag,
                            color: mainColor,
                            size: 22,
                          )
                        : Icon(
                            Icons.shopping_bag_outlined,
                            color: greyColor,
                            size: 20,
                          )),
                Container(
                  margin: EdgeInsets.only(top: 3, left: 88, right: 88),
                  child: Text(
                    "Orders",
                    style: greyText.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: (selectedIndex == 1) ? mainColor : greyColor),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(2);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 22,
                    width: 22,
                    child: (selectedIndex == 2)
                        ? Icon(
                            Icons.person,
                            color: mainColor,
                            size: 22,
                          )
                        : Icon(
                            Icons.person_outline,
                            color: greyColor,
                            size: 20,
                          )),
                Container(
                  margin: EdgeInsets.only(top: 3),
                  child: Text(
                    "Profile",
                    style: greyText.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: (selectedIndex == 2) ? mainColor : greyColor),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );

    // Container(
    //   height: 60,
    //   width: double.infinity,
    //   color: Colors.white,
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       GestureDetector(
    //         onTap: () {
    //           if (onTap != null) {
    //             onTap(0);
    //           }
    //         },
    //         child: Container(
    //           width: 32,
    //           height: 32,
    //           decoration: BoxDecoration(
    //               image: DecorationImage(
    //                   image: AssetImage(
    //                     'assets/ic_home' +
    //                         ((selectedIndex == 0) ? '.png' : '_normal.png'),
    //                   ),
    //                   fit: BoxFit.contain)),
    //         ),
    //       ),
    //       GestureDetector(
    //         onTap: () {
    //           if (onTap != null) {
    //             onTap(1);
    //           }
    //         },
    //         child: Container(
    //           width: 32,
    //           height: 32,
    //           margin: EdgeInsets.symmetric(horizontal: 83),
    //           decoration: BoxDecoration(
    //               image: DecorationImage(
    //                   image: AssetImage(
    //                     'assets/ic_order' +
    //                         ((selectedIndex == 1) ? '.png' : '_normal.png'),
    //                   ),
    //                   fit: BoxFit.contain)),
    //         ),
    //       ),
    //       GestureDetector(
    //         onTap: () {
    //           if (onTap != null) {
    //             onTap(2);
    //           }
    //         },
    //         child: Container(
    //           width: 32,
    //           height: 32,
    //           decoration: BoxDecoration(
    //               image: DecorationImage(
    //                   image: AssetImage(
    //                     'assets/ic_profile' +
    //                         ((selectedIndex == 2) ? '.png' : '_normal.png'),
    //                   ),
    //                   fit: BoxFit.contain)),
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
