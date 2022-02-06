part of 'widget.dart';

class OrderListItem extends StatelessWidget {
  final Transaction transaction;
  final double itemWidth;

  OrderListItem({required this.transaction, required this.itemWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: secondBgColor,
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
                    image: NetworkImage(transaction.food!.picturePath),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            width: itemWidth - 182, //(60-12-110)
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.food!.name,
                  style: whiteTextStyle.copyWith(fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
                Text(
                  "${transaction.quantity} items - " +
                      NumberFormat.currency(
                              symbol: 'IDR ', decimalDigits: 0, locale: 'id_ID')
                          .format(transaction.total),
                  style: greyTextStyle.copyWith(fontSize: 13),
                )
              ],
            ),
          ),
          SizedBox(
            width: 95,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  convertDateTime(transaction.dateTime!),
                  style: greyTextStyle.copyWith(fontSize: 12),
                ),
                (transaction.status == TransactionStatus.cancelled)
                    ? Text(
                        "Cancelled",
                        style:
                            GoogleFonts.poppins(color: redColor, fontSize: 10),
                      )
                    : (transaction.status == TransactionStatus.pending)
                        ? Text(
                            "Pending",
                            style: GoogleFonts.poppins(
                                color: redColor, fontSize: 10),
                          )
                        : (transaction.status == TransactionStatus.on_delivry)
                            ? Text(
                                "On Delivery",
                                style: GoogleFonts.poppins(
                                    color: greenColor, fontSize: 10),
                              )
                            : SizedBox()
              ],
            ),
          )
        ],
      ),
    );
  }

  String convertDateTime(DateTime dateTime) {
    String month;

    switch (dateTime.month) {
      case 1:
        month = 'Jan';
        break;
      case 2:
        month = 'Feb';
        break;
      case 3:
        month = 'Mar';
        break;
      case 4:
        month = 'Apr';
        break;
      case 5:
        month = 'May';
        break;
      case 6:
        month = 'Jun';
        break;
      case 7:
        month = 'Jul';
        break;
      case 8:
        month = 'Aug';
        break;
      case 9:
        month = 'Sep';
        break;
      case 10:
        month = 'Oct';
        break;
      case 11:
        month = 'Nov';
        break;

      default:
        month = 'Des';
    }

    return month + ' ${dateTime.day}, ${dateTime.hour}:${dateTime.minute}';
  }
}
