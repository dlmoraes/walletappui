import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:walletappui/pages/add_bank_account_page.dart';
import 'package:walletappui/pages/send_page.dart';
import 'package:walletappui/util/my_bottom_menu_item.dart';
import 'package:walletappui/util/my_button.dart';
import 'package:walletappui/util/my_card.dart';
import 'package:walletappui/util/my_floating_action_button.dart';
import 'package:walletappui/util/my_list_tile.dart';
import 'package:walletappui/util/my_transition_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const double heigthSize = 25;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFAFCFF),
        floatingActionButton: const MyFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: SizedBox(
          height: 60,
          child: BottomAppBar(
            elevation: 0,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                MyBottomMenuItem(
                  icon: Icons.home_filled,
                  title: 'Home',
                  isActive: true,
                ),
                MyBottomMenuItem(
                  icon: Icons.settings,
                  title: 'Settings',
                ),
              ],
            ),
          ),
        ),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: ListView(
            children: [
              // appbar
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Text(
                          'My',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ' Cards',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),

                    // plus button
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MyTransitionNavigation()
                            .createRoute(page: const AddBankAccountPage()));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFE7EEFC),
                        ),
                        child: const Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: heigthSize),

              // cards
              SizedBox(
                height: 200,
                child: ListView(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  children: [
                    const MyCard(
                      balance: 5250.20,
                      cardNumber: 12345678,
                      expiryMonth: 10,
                      expiryYear: 24,
                      color: Color(0xFF5f54f2),
                    ),
                    const MyCard(
                      balance: 342.23,
                      cardNumber: 91112131,
                      expiryMonth: 11,
                      expiryYear: 23,
                      color: Color(0xFF8dbfd3),
                    ),
                    MyCard(
                      balance: 420.42,
                      cardNumber: 14151617,
                      expiryMonth: 8,
                      expiryYear: 22,
                      color: Colors.green[300],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: heigthSize * .75),

              Center(
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                      activeDotColor: Colors.grey.shade700,
                      dotHeight: 6,
                      expansionFactor: 1.8),
                ),
              ),

              const SizedBox(height: heigthSize),

              // 3 buttons -> send + pay + bills
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // send button
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MyTransitionNavigation()
                            .createRoute(page: const SendPage()));
                      },
                      child: const MyButton(
                        buttonText: 'Send',
                        iconImagePath: 'lib/icons/send-money.png',
                      ),
                    ),

                    // pay button
                    const MyButton(
                      buttonText: 'Pay',
                      iconImagePath: 'lib/icons/credit-card.png',
                    ),

                    // bills button
                    const MyButton(
                      buttonText: 'Bills',
                      iconImagePath: 'lib/icons/bill.png',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              // column -> stats + transactions
              Container(
                height: size.height * .4,
                padding: const EdgeInsets.all(25),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: const [
                      MyListTile(
                        iconImagePath: 'lib/icons/estatisticas.png',
                        tileTitle: 'Statistics',
                        tileSubTitle: 'Payments and Icome',
                      ),
                      MyListTile(
                        iconImagePath: 'lib/icons/transaction.png',
                        tileTitle: 'Transactions',
                        tileSubTitle: 'Transaction History',
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
