import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hustlerpos/constants/colors.dart';
import 'package:hustlerpos/constants/sizing.dart';
import 'package:hustlerpos/constants/strings.dart';
import 'package:hustlerpos/routes.dart';

class HomePageActionCard extends StatelessWidget {
  final String routeName;
  final String actionName;
  final String actionIconURL;
  const HomePageActionCard(
      {required this.routeName,
      required this.actionName,
      required this.actionIconURL});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        height: 130,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: fadedPrimaryColor),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  actionIconURL,
                  height: 30,
                  width: 30,
                ),
                smallVerticalSizedBox,
                Text(actionName, textAlign: TextAlign.center)
              ]),
        ),
      ),
    );
  }
}

List<HomePageActions> homePageActions = [
  HomePageActions(
      actionName: makeSaleString,
      actionIconURL: makeSaleSVGString,
      actionRoute: Routes.makeSale),
  HomePageActions(
      actionName: viewSaleString,
      actionIconURL: salesSVGString,
      actionRoute: Routes.homePage),
  HomePageActions(
      actionName: addStockString,
      actionIconURL: addStockSVGString,
      actionRoute: Routes.homePage),
  HomePageActions(
      actionName: viewStockString,
      actionIconURL: addStockSVGString,
      actionRoute: Routes.homePage),
  HomePageActions(
      actionName: addExpenseString,
      actionIconURL: expenseSVGString,
      actionRoute: Routes.homePage),
  HomePageActions(
      actionName: viewExpenseString,
      actionIconURL: expenseSVGString,
      actionRoute: Routes.homePage),
  HomePageActions(
      actionName: manageSuppliersString,
      actionIconURL: manageSuppliersSVGString,
      actionRoute: Routes.homePage),
  HomePageActions(
      actionName: customersString,
      actionIconURL: customerSVGString,
      actionRoute: Routes.homePage),
  HomePageActions(
      actionName: saleByProductString,
      actionIconURL: reportSVGString,
      actionRoute: Routes.homePage),
  HomePageActions(
      actionName: pandLString,
      actionIconURL: reportSVGString,
      actionRoute: Routes.homePage),
  HomePageActions(
      actionName: addProductDescription,
      actionIconURL: desriptionSVGString,
      actionRoute: Routes.homePage)
];

class HomePageActions {
  HomePageActions(
      {required this.actionName,
      required this.actionIconURL,
      required this.actionRoute});
  String actionName;
  String actionIconURL;
  String actionRoute;
}
