part of 'widget.dart';

class FoodListItem extends StatelessWidget {
  final Food food;
  final double itemWidth;

  FoodListItem({required this.food, required this.itemWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: '2b2b31'.toColor(),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(blurRadius: 2, spreadRadius: 2, color: Colors.black12)
          ]),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            margin: EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: NetworkImage(food.picturePath), fit: BoxFit.cover)),
          ),
          SizedBox(
            width: itemWidth - 192, //(60-12-110)
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food.name,
                  style: blackTextStyle2.copyWith(color: Colors.white),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
                Text(
                  NumberFormat.currency(
                          symbol: 'IDR ', decimalDigits: 0, locale: 'id_ID')
                      .format(food.price),
                  style: greyText.copyWith(
                      fontSize: 13, color: '8fff00'.toColor()),
                )
              ],
            ),
          ),
          RatingStars(food.rate)
        ],
      ),
    );
  }
}
