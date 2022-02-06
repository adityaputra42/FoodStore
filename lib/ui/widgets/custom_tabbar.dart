part of 'widget.dart';

class CustomTabbar extends StatelessWidget {
  final int selectedIndex;
  final List<String> titles;
  final Function(int)? onTap;

  CustomTabbar({required this.titles, required this.selectedIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: 42, right: defaultMargin, left: defaultMargin),
            height: 1,
            color: Color(0xffBFC2CD),
          ),
          Row(
            children: titles
                .map((e) => Padding(
                      padding: EdgeInsets.only(
                          left: (e == titles.first ? defaultMargin : 0),
                          right: 8),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (onTap != null) {
                                onTap!(titles.indexOf(e));
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(2),
                                      bottomLeft: Radius.circular(2),
                                      topLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12)),
                                  color: (titles.indexOf(e) == selectedIndex
                                      ? mainColor
                                      : Colors.transparent),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 2,
                                        spreadRadius: 2,
                                        color:
                                            (titles.indexOf(e) == selectedIndex
                                                ? Colors.black12
                                                : Colors.transparent))
                                  ]),
                              child: Text(
                                e,
                                style: (titles.indexOf(e) == selectedIndex
                                    ? blacTextStyle.copyWith(fontWeight: medium)
                                    : greyTextStyle),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
