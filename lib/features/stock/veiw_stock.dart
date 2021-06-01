import 'package:flutter/material.dart';
import 'package:hustlerpos/constants/colors.dart';
import 'package:hustlerpos/constants/sizing.dart';
import 'package:hustlerpos/shared/labels/custom_input_label.dart';

class ViewStockPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('View Stock'),
        centerTitle: true,
      ),
      body: Scaffold(
        body: Container(
            color: Colors.white,
            child: Column(
              children: [
                smallVerticalSizedBox,
                Container(
                  width: double.infinity,
                  height: 30,
                  padding: EdgeInsets.only(left: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Bold15InputLabel(
                        labelString: 'S&W',
                        textColor: Colors.white,
                      )),
                  color: primaryColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Bold15InputLabel(labelString: 'Product'),
                      Bold15InputLabel(labelString: 'Quantity')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Flexible(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: sawAndWeanerList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final String productName =
                              sawAndWeanerList[index]['productName'];
                          final String quantity =
                              sawAndWeanerList[index]['quantity'];
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(productName),
                                  Text(quantity),
                                ],
                              ),
                              smallVerticalSizedBox
                            ],
                          );
                        }),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 30,
                  padding: EdgeInsets.only(left: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Bold15InputLabel(
                        labelString: 'Grower',
                        textColor: Colors.white,
                      )),
                  color: primaryColor,
                ),
                mediumVerticalSizedBox,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Flexible(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: growersList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final String productName =
                              growersList[index]['productName'];
                          final String quantity =
                              growersList[index]['quantity'];
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(productName),
                                  Text(quantity),
                                ],
                              ),
                              smallVerticalSizedBox
                            ],
                          );
                        }),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

List<Map> sawAndWeanerList = [
  {'productName': 'Bidco S&W', 'quantity': '2'},
  {'productName': 'Farcmers Choice S&W', 'quantity': '2'},
  {'productName': 'Jubilee S&W', 'quantity': '2'},
  {'productName': 'Farvet S&W 50KG', 'quantity': '2'}
];

List<Map> growersList = [
  {'productName': 'Bidco Grower', 'quantity': '1'},
  {'productName': 'Farcmers Choice Grower', 'quantity': '7'},
  {'productName': 'Jubilee Grower', 'quantity': '8'},
  {'productName': 'Farvet Grower 50KG', 'quantity': '3'}];