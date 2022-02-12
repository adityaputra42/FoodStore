part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  final Transaction? transaction;

  PaymentPage({this.transaction});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Payment',
      subtitle: 'You deserve better meal',
      onBackButtonPressed: () {},
      // backColor: "FAFAFC".toColor(),
      child: Column(
        children: [
          //// Bagian Atas
          Container(
            margin: EdgeInsets.only(bottom: defaultMargin, left: 12, right: 12),
            padding:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
            decoration: BoxDecoration(
                color: '2b2b31'.toColor(),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2, blurRadius: 2, color: Colors.black12)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Item Ordered',
                  style: whiteTextStyle,
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          margin: EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      widget.transaction!.food!.picturePath),
                                  fit: BoxFit.cover)),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 222,
                              child: Text(
                                widget.transaction!.food!.name,
                                style: whiteTextStyle.copyWith(fontSize: 16),
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            Text(
                              NumberFormat.currency(
                                      locale: 'id-ID',
                                      symbol: 'IDR ',
                                      decimalDigits: 0)
                                  .format(widget.transaction!.food!.price),
                              style: greenTextStyle.copyWith(
                                fontSize: 13,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Text(
                      '${widget.transaction!.quantity} items',
                      style: greyTextStyle.copyWith(fontSize: 13),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  height: 1,
                  width: double.infinity,
                  color: greyColor,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4, bottom: 8),
                  child: Text(
                    'Details Transaction',
                    style: whiteTextStyle,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          17,
                      child: Text(
                        'Cherry Healthy',
                        style: greyTextStyle,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          17,
                      child: Text(
                        NumberFormat.currency(
                                locale: 'id-ID',
                                symbol: 'IDR ',
                                decimalDigits: 0)
                            .format(widget.transaction!.total),
                        style: whiteTextStyle,
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          17,
                      child: Text(
                        'Driver',
                        style: greyTextStyle,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          17,
                      child: Text(
                        NumberFormat.currency(
                                locale: 'id-ID',
                                symbol: 'IDR ',
                                decimalDigits: 0)
                            .format(20000),
                        style: whiteTextStyle,
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          17,
                      child: Text(
                        'Tax 10%',
                        style: greyTextStyle,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          17,
                      child: Text(
                        NumberFormat.currency(
                                locale: 'id-ID',
                                symbol: 'IDR ',
                                decimalDigits: 0)
                            .format(widget.transaction!.total! * 0.1),
                        style: whiteTextStyle,
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          17,
                      child: Text(
                        'Total Price',
                        style: greyTextStyle,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          17,
                      child: Text(
                        NumberFormat.currency(
                                locale: 'id-ID',
                                symbol: 'IDR ',
                                decimalDigits: 0)
                            .format(widget.transaction!.total! * 1.1 + 20000),
                        style: greenTextStyle.copyWith(fontWeight: medium),
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(bottom: defaultMargin, left: 12, right: 12),
            padding:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
            decoration: BoxDecoration(
                color: secondBgColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2, blurRadius: 2, color: Colors.black12)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deliver To:',
                  style: whiteTextStyle,
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          17,
                      child: Text(
                        'Name',
                        style: greyTextStyle,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          17,
                      child: Text(
                        widget.transaction!.user!.name!,
                        style: whiteTextStyle,
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          17,
                      child: Text(
                        'Phone No.',
                        style: greyTextStyle,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          17,
                      child: Text(
                        widget.transaction!.user!.phoneNumber!,
                        style: whiteTextStyle,
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          17,
                      child: Text(
                        'Address',
                        style: greyTextStyle,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          17,
                      child: Text(
                        widget.transaction!.user!.address!,
                        style: whiteTextStyle,
                        maxLines: 2,
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          17,
                      child: Text(
                        'House No.',
                        style: greyTextStyle,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          17,
                      child: Text(
                        widget.transaction!.user!.houseNumber!,
                        style: whiteTextStyle,
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          17,
                      child: Text(
                        'City',
                        style: greyTextStyle,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          17,
                      child: Text(
                        widget.transaction!.user!.city!,
                        style: whiteTextStyle,
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          if (isLoading)
            Center(
              child: loadingIndicator,
            )
          else
            Container(
              height: 45,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 40),
              child: ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(mainColor),
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)))),
                child: Text("CheckOut Now",
                    style: GoogleFonts.poppins(
                        color: Colors.black, fontWeight: FontWeight.w500)),
                onPressed: () async {
                  this.setState(() {
                    isLoading = true;
                  });
                  // metode masih error
                  String paymentUrl = context
                      .read<TransactionCubit>()
                      .submitTransaction(widget.transaction!.copyWith(
                          dateTime: DateTime.now(),
                          total: (widget.transaction!.total! * 1.1).toInt() +
                              20000))
                      .toString();

                  // ignore: unnecessary_null_comparison
                  if (paymentUrl != null) {
                    Get.to(PaymentMethodPage(paymentUrl));
                  } else {
                    this.setState(() {
                      isLoading = false;
                    });
                    Get.snackbar("", "",
                        backgroundColor: "D9435E".toColor(),
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        titleText: Text(
                          "Transaction Failed",
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                        messageText: Text(
                          "Please try again letter",
                          style: GoogleFonts.poppins(color: Colors.white),
                        ));
                  }
                },
              ),
            )
        ],
      ),
    );
  }
}
