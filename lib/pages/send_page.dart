import 'package:flutter/material.dart';
import 'package:walletappui/util/my_list_tile.dart';

class SendPage extends StatefulWidget {
  const SendPage({Key? key}) : super(key: key);

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const double heigthSize = 25;
    final contactController = TextEditingController();

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
        body: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
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
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: heigthSize),

                // 2 Buttons
                MyActionsButtons(size: size),

                const SizedBox(height: heigthSize),

                // Input name or Mobile
                Container(
                  width: size.width,
                  height: 170,
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: const Color(0xFF756AF4),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Send to your mobile contact',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: heigthSize),
                      TextField(
                        controller: contactController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter Name or Mobile Number',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                          suffixIcon: Icon(
                            Icons.search_rounded,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: heigthSize),

                SizedBox(
                  height: size.height * .5,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: const [
                        MyListTile(
                          iconImagePath: 'lib/icons/avatar2.png',
                          tileTitle: 'Charlotte',
                          tileSubTitle: '+1 585 438 0264',
                        ),
                        MyListTile(
                          iconImagePath: 'lib/icons/avatar3.png',
                          tileTitle: 'Michael',
                          tileSubTitle: '+1 610 224 8974',
                        ),
                        MyListTile(
                          iconImagePath: 'lib/icons/avatar4.png',
                          tileTitle: 'Laura',
                          tileSubTitle: '+1 585 438 0138',
                        ),
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

class MyActionsButtons extends StatelessWidget {
  const MyActionsButtons({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 180,
          width: size.width / 2.5,
          decoration: BoxDecoration(
            color: const Color(0xFFFFDADB),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Stack(
            children: [
              Align(
                alignment: const Alignment(0, -0.6),
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white.withAlpha(150),
                      borderRadius: BorderRadius.circular(60),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(30),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: const Offset(0, 10),
                        ),
                      ]),
                  child: Image.asset(
                    'lib/icons/down-arrow.png',
                  ),
                ),
              ),
              Container(
                alignment: const Alignment(0, 0.6),
                child: const Text(
                  'To your\nOwn account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 180,
          width: size.width / 2.5,
          decoration: BoxDecoration(
            color: Colors.grey.withAlpha(30),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Stack(
            children: [
              Align(
                alignment: const Alignment(0, -0.6),
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white.withAlpha(150),
                      borderRadius: BorderRadius.circular(60),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(30),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: const Offset(0, 10),
                        ),
                      ]),
                  child: Image.asset(
                    'lib/icons/up-arrow.png',
                  ),
                ),
              ),
              Container(
                alignment: const Alignment(0, 0.6),
                child: const Text(
                  'To other\nBank account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
