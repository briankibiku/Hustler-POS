import 'package:flutter/material.dart';
import 'package:hustlerpos/constants/colors.dart';
import 'package:hustlerpos/constants/sizing.dart';
import 'package:hustlerpos/routes.dart';
import 'package:hustlerpos/shared/labels/custom_input_label.dart';

class ManageSuppliersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Suppliers'),
        centerTitle: true,
      ),
      body: Scaffold(
        body: Container(
            color: Colors.white,
            child: Column(
              children: [
                mediumVerticalSizedBox,
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: MaterialButton(
                      height: 40,
                      minWidth: 140, 
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: primaryColor, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.addSupplierPage);
                      },
                      child: Text(
                        'ADD SUPPLIER',
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  ),
                ),
                smallVerticalSizedBox,
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Bold15InputLabel(labelString: 'Supplier'),
                      Bold15InputLabel(labelString: 'Contact')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Flexible(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: suppliersList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final String supplierName =
                              suppliersList[index]['supplierName'];
                          final String supplierContact =
                              suppliersList[index]['contact'];
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(supplierName),
                                  Text(supplierContact),
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

List<Map> suppliersList = [
  {'supplierName': 'Jubilee Feeds', 'contact': '+254 712 123 456'},
  {'supplierName': 'Preshama Feeds', 'contact': '+254 712 123 456'},
  {'supplierName': 'Farmers Choice', 'contact': '+254 712 123 456'},
];
