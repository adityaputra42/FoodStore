part of 'pages.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;
    return ListView(
      children: [
        Column(
          children: [
            //// Header
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              height: 106,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Hallo, ',
                              style: whiteTextStyle.copyWith(
                                fontSize: 18,
                              )),
                          Text(
                              (context.read<UserCubit>().state as UserLoaded)
                                  .user
                                  .name!,
                              style: whiteTextStyle.copyWith(
                                fontSize: 18,
                              )),
                        ],
                      ),
                      Text(
                        "Let's get some foods",
                        style: greyTextStyle.copyWith(fontWeight: light),
                      )
                    ],
                  ),
                  Container(
                    width: 55,
                    height: 55,
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: greyColor)),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage((context
                                      .read<UserCubit>()
                                      .state as UserLoaded)
                                  .user
                                  .picturePath!),
                              fit: BoxFit.cover)),
                    ),
                  )
                ],
              ),
            ),

            //// List of Food
            Container(
              height: 258,
              width: double.infinity,
              child: BlocBuilder<FoodCubit, FoodState>(
                  builder: (_, state) => (state is FoodLoaded)
                      ? ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Row(
                              children: state.foods
                                  .map((e) => Padding(
                                        padding: EdgeInsets.only(
                                            left: (e == state.foods.first)
                                                ? defaultMargin
                                                : 16,
                                            right: (e == state.foods.last)
                                                ? defaultMargin
                                                : 0),
                                        child: GestureDetector(
                                            onTap: () {
                                              Get.to(FoodDetailPage(
                                                transaction: Transaction(
                                                    food: e,
                                                    user: (context
                                                            .read<UserCubit>()
                                                            .state as UserLoaded)
                                                        .user),
                                                onBackButtonPressed: () {
                                                  Get.back();
                                                },
                                              ));
                                            },
                                            child: FoodCard(e)),
                                      ))
                                  .toList(),
                            )
                          ],
                        )
                      : Center(child: loadingIndicator)),
            ),
            //// List of Food (Tabs)
            Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomTabbar(
                    titles: ["New Taste", "Popular", "Recommended"],
                    selectedIndex: selectedIndex,
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  BlocBuilder<FoodCubit, FoodState>(builder: (_, state) {
                    if (state is FoodLoaded) {
                      List<Food> foods = state.foods
                          .where((element) =>
                              element.type.contains((selectedIndex == 0)
                                  ? FoodType.new_food
                                  : (selectedIndex == 1)
                                      ? FoodType.popular
                                      : FoodType.recomended))
                          .toList();
                      return Column(
                        children: foods
                            .map((e) => Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      defaultMargin, 0, defaultMargin, 16),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(FoodDetailPage(
                                        transaction: Transaction(
                                            food: e,
                                            user: (context
                                                    .read<UserCubit>()
                                                    .state as UserLoaded)
                                                .user),
                                        onBackButtonPressed: () {
                                          Get.back();
                                        },
                                      ));
                                    },
                                    child: FoodListItem(
                                        food: e, itemWidth: listItemWidth),
                                  ),
                                ))
                            .toList(),
                      );
                    } else {
                      return Center(
                        child: loadingIndicator,
                      );
                    }
                  }),
                ],
              ),
            ),
            SizedBox(
              height: 80,
            )
          ],
        )
      ],
    );
  }
}
