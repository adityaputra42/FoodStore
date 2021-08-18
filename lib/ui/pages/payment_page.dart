part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  final Transaction transaction;

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
                  style: blackTextStyle3.copyWith(color: Colors.white),
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
                                      widget.transaction.food.picturePath),
                                  fit: BoxFit.cover)),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 222,
                              child: Text(
                                widget.transaction.food.name,
                                style: blackTextStyle2.copyWith(
                                    color: Colors.white),
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            Text(
                              NumberFormat.currency(
                                      locale: 'id-ID',
                                      symbol: 'IDR ',
                                      decimalDigits: 0)
                                  .format(widget.transaction.food.price),
                              style: greyText.copyWith(
                                  fontSize: 13, color: '8fff00'.toColor()),
                            )
                          ],
                        )
                      ],
                    ),
                    Text(
                      '${widget.transaction.quantity} items',
                      style: greyText.copyWith(fontSize: 13),
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
                    style: blackTextStyle3.copyWith(color: Colors.white),
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
                        style: greyText,
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
                            .format(widget.transaction.total),
                        style: blackTextStyle3.copyWith(color: Colors.white),
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
                        style: greyText,
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
                        style: blackTextStyle3.copyWith(color: Colors.white),
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
                        style: greyText,
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
                            .format(widget.transaction.total * 0.1),
                        style: blackTextStyle3.copyWith(color: Colors.white),
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
                        style: greyText,
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
                            .format(widget.transaction.total * 1.1 + 20000),
                        style: blackTextStyle3.copyWith(
                            color: "8fff00".toColor(),
                            fontWeight: FontWeight.w500),
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
                  'Deliver To:',
                  style: blackTextStyle3.copyWith(color: Colors.white),
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
                        style: greyText,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          17,
                      child: Text(
                        widget.transaction.user.name,
                        style: blackTextStyle3.copyWith(color: Colors.white),
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
                        style: greyText,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          17,
                      child: Text(
                        widget.transaction.user.phoneNumber,
                        style: blackTextStyle3.copyWith(color: Colors.white),
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
                        style: greyText,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          17,
                      child: Text(
                        widget.transaction.user.address,
                        style: blackTextStyle3.copyWith(color: Colors.white),
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
                        style: greyText,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          17,
                      child: Text(
                        widget.transaction.user.houseNumber,
                        style: blackTextStyle3.copyWith(color: Colors.white),
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
                        style: greyText,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          17,
                      child: Text(
                        widget.transaction.user.city,
                        style: blackTextStyle3.copyWith(color: Colors.white),
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          (isLoading)
              ? Center(
                  child: loadingIndicator,
                )
              : Container(
                  height: 45,
                  width: double.infinity,
                  margin:
                      EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 40),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        backgroundColor: MaterialStateProperty.all(mainColor),
                        elevation: MaterialStateProperty.all(0),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)))),
                    child: Text("CheckOut Now",
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontWeight: FontWeight.w500)),
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      // metode masih error
                      String paymentUrl = await context
                          .read<TransactionCubit>()
                          .submitTransaction(widget.transaction.copyWith(
                              dateTime: DateTime.now(),
                              total: (widget.transaction.total * 1.1).toInt() +
                                  20000));

                      if (paymentUrl != null) {
                        Get.to(PaymentMethodPage(paymentUrl));
                      } else {
                        setState(() {
                          isLoading = false;
                        });
                        Get.snackbar("", "",
                            backgroundColor: "D9435E".toColor(),
                            icon: Icon(
                              MdiIcons.closeCircleOutline,
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
