import 'package:flutter/material.dart';
import 'package:walletappui/util/my_button.dart';
import 'package:walletappui/util/my_list_tile.dart';
import 'package:walletappui/util/my_title_section.dart';

class AddBankAccountPage extends StatefulWidget {
  const AddBankAccountPage({Key? key}) : super(key: key);

  @override
  State<AddBankAccountPage> createState() => _AddBankAccountPageState();
}

class _AddBankAccountPageState extends State<AddBankAccountPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const double heigthSize = 25;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFAFCFF),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Image.asset(
                'lib/icons/menu.png',
                height: 30,
                width: 30,
              ),
            ),
          ],
        ),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 8, 25, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Send',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                ' Money',
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            'Add your bank account',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: heigthSize),

                // Info
                MyInfoAddBankAccount(size: size),

                const SizedBox(height: heigthSize),

                // 3 buttons -> send + pay + bills
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      // send button
                      MyButton(
                        buttonText: 'Citi\nBank',
                        iconImagePath: 'lib/icons/money.png',
                        centerText: true,
                        breakLine: true,
                        dense: false,
                      ),

                      // pay button
                      MyButton(
                        buttonText: 'PNC\nBank',
                        iconImagePath: 'lib/icons/pnc-bank-logo.png',
                        centerText: true,
                        breakLine: true,
                        dense: false,
                      ),

                      // bills button
                      MyButton(
                        buttonText: 'Bank of\nAmerica',
                        iconImagePath: 'lib/icons/hsbc.png',
                        centerText: true,
                        breakLine: true,
                        dense: false,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: heigthSize),

                // Banks selects
                const MyTitleSection(
                  title: 'Select your Bank',
                ),

                Container(
                  height: size.height * .4,
                  padding: const EdgeInsets.all(25),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: const [
                        MyListTile(
                          iconImagePath: 'lib/icons/money.png',
                          tileTitle: 'Citi bank',
                          tileSubTitle: '**** 2345',
                        ),
                        MyListTile(
                          iconImagePath: 'lib/icons/hsbc.png',
                          tileTitle: 'HSBC Bank',
                          tileSubTitle: '**** 4564',
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyInfoAddBankAccount extends StatelessWidget {
  const MyInfoAddBankAccount({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      width: size.width,
      height: 140,
      decoration: const BoxDecoration(
        color: Color(0xFFC6E6FF),
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: ListTile(
        trailing: const Icon(
          Icons.info,
          size: 40,
          color: Colors.grey,
        ),
        title: Wrap(
          children: const [
            Text(
              'Why to add your bank account?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ],
        ),
        contentPadding: const EdgeInsets.all(6),
        subtitle: Wrap(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 8),
              child: const Text(
                'Without adding your bank account, you are not able to send money.',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
