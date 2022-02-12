part of 'widget.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int? selectedIndex;
  final Function(int index)? onTap;

  CustomBottomNavBar({this.selectedIndex, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          color: secondBgColor,
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
                onTap!(0);
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 22,
                    width: 22,
                    child: Icon(
                      Icons.home,
                      color: (selectedIndex == 0) ? mainColor : greyColor,
                      size: 22,
                    )),
                Container(
                    margin: EdgeInsets.only(top: 3),
                    child: Text(
                      "Home",
                      style: greyTextStyle.copyWith(
                        fontSize: 12,
                        color: (selectedIndex == 0 ? mainColor : greyColor),
                      ),
                    ))
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!(1);
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
                    child: Icon(
                      Icons.shopping_bag,
                      color: (selectedIndex == 1) ? mainColor : greyColor,
                      size: 22,
                    )),
                Container(
                  margin: EdgeInsets.only(top: 3, left: 88, right: 88),
                  child: Text(
                    "Orders",
                    style: greyTextStyle.copyWith(
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
                onTap!(2);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 22,
                    width: 22,
                    child: Icon(
                      Icons.person,
                      color: (selectedIndex == 2) ? mainColor : greyColor,
                      size: 22,
                    )),
                Container(
                  margin: EdgeInsets.only(top: 3),
                  child: Text(
                    "Profile",
                    style: greyTextStyle.copyWith(
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
  }
}
