// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mukrata_sau_app/views/about_ui.dart';
import 'package:mukrata_sau_app/views/calculate_pay_bill_ui.dart';
import 'package:mukrata_sau_app/views/menu_shop_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  //ส้รางตัวแปรเก็บหน้าจอ (ui) ที่จะใช้กับ BottomBar
  List<Widget> ShowUI = [
    CalculatePayBillUI(),
    MenuShopUI(),
    AboutUI(),
  ];

  //สร้างตัวแปรกำหนดหน้าจอที่จะแสดงสำหรับ BottomBar
  int _currentShowUI = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'Tech SAU BUFFET',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: ConvexAppBar(
        onTap: (Value) {
          setState(() {
            _currentShowUI = Value;
          });
        },
        initialActiveIndex: _currentShowUI,
        backgroundColor: Colors.deepOrange,
        items: [
          TabItem(
            icon: Icon(
              FontAwesomeIcons.moneyBill1Wave,
              color: Colors.yellowAccent,
            ),
            title: 'คิดเงิน',
          ),
          TabItem(
            icon: Icon(
              FontAwesomeIcons.house,
              color: Colors.yellowAccent,
            ),
            title: 'HOME',
          ),
          TabItem(
            icon: Icon(
              FontAwesomeIcons.star,
              color: Colors.yellowAccent,
            ),
            title: 'เกี่ยวกับ',
          ),
        ],
      ),
      body: ShowUI[_currentShowUI],
    );
  }
}
