import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:hustlerpos/constants/colors.dart';
import 'package:hustlerpos/constants/sizing.dart';
import 'package:hustlerpos/constants/strings.dart';
import 'package:hustlerpos/routes.dart';
import 'package:hustlerpos/shared/action_widgets/home_page_action_card.dart';
import 'package:hustlerpos/shared/out_of_stock_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: fadedPrimaryColor,
              hoverColor: fadedPrimaryColor,
              gap: 8,
              activeColor: primaryColor,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.grey[800]!,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ), 
                GButton(
                  icon: Icons.logout,
                  text: 'Logout',
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.signUp);
                  },
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          mediumVerticalSizedBox,
          mediumVerticalSizedBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Hustler POS',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 24)),
                SvgPicture.asset(
                  investmentImageString,
                  height: 35,
                  width: 35,
                )
              ],
            ),
          ),
          mediumVerticalSizedBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Out of stock goods (4)',
              style: TextStyle(
                  fontWeight: FontWeight.w800, color: Colors.red, fontSize: 16),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: primaryColor,
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: outOfStockProductsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final productName =
                        outOfStockProductsList[index]['productName'];
                    final remainingQunatity =
                        outOfStockProductsList[index]['remainingQunatity'];
                    return Row(
                      children: [
                        OutOfStockCard(
                            productName: productName,
                            remainingQuantity: remainingQunatity),
                        smallHorizontalSizedBox,
                      ],
                    );
                  }),
            ),
          ),
          mediumVerticalSizedBox, 
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.white,
              child: GridView.count(
                padding: EdgeInsets.all(20),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 3,
                children: homePageActions.map((homePageActionsList) {
                  return HomePageActionCard(
                    routeName: homePageActionsList.actionRoute,
                    actionName: homePageActionsList.actionName,
                    actionIconURL: homePageActionsList.actionIconURL,
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<Map> outOfStockProductsList = [
  {'productName': 'Bidco S&W', 'remainingQunatity': '0'},
  {'productName': 'FC S&W', 'remainingQunatity': '0'},
  {'productName': 'Unga S&W', 'remainingQunatity': '1'},
  {'productName': 'Jubilee S&W', 'remainingQunatity': '2'}
];
