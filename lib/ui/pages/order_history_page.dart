part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (_, state) {
        if (state is TransactionLoaded) {
          if (state.transactions.length == 0) {
            return IllustrationPage(
                title: 'Ouch! Hungry',
                subtitle: 'Seems you like have not\nordered any food yet',
                picturePath: 'assets/love_burger.png',
                buttonTitle1: 'Find Foods',
                buttonOnTap1: () {});
          } else {
            double listItemWidth =
                MediaQuery.of(context).size.width - 2 * defaultMargin;
            return RefreshIndicator(
              onRefresh: () async {
                await context.read<TransactionCubit>().getTransactions();
              },
              child: GeneralPage(
                  title: "Your Orders",
                  subtitle: "Wait for the best meal",
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        CustomTabbar(
                          titles: ["In Orders", "Past Orders"],
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
                        Builder(builder: (_) {
                          List<Transaction> transactions = (selectedIndex == 0)
                              ? state.transactions
                                  .where((element) =>
                                      element.status ==
                                          TransactionStatus.on_delivry ||
                                      element.status ==
                                          TransactionStatus.pending)
                                  .toList()
                              : state.transactions
                                  .where((element) =>
                                      element.status ==
                                          TransactionStatus.delivered ||
                                      element.status ==
                                          TransactionStatus.cancelled)
                                  .toList();
                          return Column(
                            children: transactions
                                .map((e) => Padding(
                                      padding: EdgeInsets.only(
                                          right: defaultMargin,
                                          left: defaultMargin,
                                          bottom: 16),
                                      child: GestureDetector(
                                        onTap: () async {
                                          if (e.status ==
                                              TransactionStatus.pending) {
                                            await launchUrl(
                                                Uri.parse(e.paymentUrl!));
                                          }
                                        },
                                        child: OrderListItem(
                                            transaction: e,
                                            itemWidth: listItemWidth),
                                      ),
                                    ))
                                .toList(),
                          );
                        }),
                        SizedBox(
                          height: 65,
                        )
                      ],
                    ),
                  )),
            );
          }
        } else {
          return Center(
            child: loadingIndicator,
          );
        }
      },
    );
  }
}
