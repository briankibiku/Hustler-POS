import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:hustlerpos/constants/colors.dart';
import 'package:hustlerpos/constants/sizing.dart';
import 'package:hustlerpos/constants/strings.dart';
import 'package:hustlerpos/routes.dart';
import 'package:hustlerpos/shared/action_widgets/home_page_action_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  icon: Icons.person,
                  text: 'Likes',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.logout,
                  text: 'Profile',
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
                        color: Color(0xFF478778),
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
          smallVerticalSizedBox,
          Expanded(
            flex: 1,
            child: Container(
              color: primaryColor,
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  OutOfStockCard(),
                  smallHorizontalSizedBox,
                  OutOfStockCard(),
                  smallHorizontalSizedBox,
                  OutOfStockCard(),
                  smallHorizontalSizedBox,
                  OutOfStockCard()
                ],
              ),
            ),
          ),
          mediumVerticalSizedBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Actions',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
            ),
          ),
          Expanded(
            flex: 5,
            child: GridView.count(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
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
        ],
      ),
    );
  }
}

class OutOfStockCard extends StatelessWidget {
  const OutOfStockCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 60,
      width: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Bidco s&w'),
          smallVerticalSizedBox,
          Container(
            height: 20,
            width: 90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
                color: primaryColor),
            child: Text(
              '0 Remaining',
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}