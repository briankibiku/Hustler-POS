import 'package:flutter/material.dart';
import 'package:hustlerpos/constants/colors.dart';
import 'package:hustlerpos/constants/numbers.dart';
import 'package:hustlerpos/constants/sizing.dart';
import 'package:hustlerpos/routes.dart';
import 'package:hustlerpos/shared/labels/custom_input_label.dart';
import 'package:rxdart/rxdart.dart';

class SaleSummaryPage extends StatefulWidget {
  @override
  _SaleSummaryPageState createState() => _SaleSummaryPageState();
}

class _SaleSummaryPageState extends State<SaleSummaryPage> {
final BehaviorSubject<List<dynamic>> saleProducts =
      BehaviorSubject<List<dynamic>>();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Sale Summary'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: saleSummaryList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final String productName =
                        saleSummaryList[index]['productName'];
                    final String unitPrice =
                        saleSummaryList[index]['unitPrice'];
                    final String quantity = saleSummaryList[index]['quantity'];
                    // final String totalPrice =
                    //     saleSummaryList[index]['totalPrice'];
                    final String standardMeasure =
                        saleSummaryList[index]['standardMeasure'];
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Bold15InputLabel(
                                  labelString: productName,
                                ),
                                CustomInputLabel(labelString: standardMeasure),
                                Text('Unit Price : ' + unitPrice)
                              ],
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border:
                                            Border.all(color: primaryColor)),
                                    child: Center(child: Icon(Icons.remove)),
                                  ),
                                ),
                                smallHorizontalSizedBox,
                                Text(quantity),
                                smallHorizontalSizedBox,
                                GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border:
                                            Border.all(color: primaryColor)),
                                    child: Center(child: Icon(Icons.add)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        smallVerticalSizedBox
                      ],
                    );
                  }),
              Column(
                children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child:
                          Bold17InputLabel(labelString: 'Total : ' + '12000')),
                  smallVerticalSizedBox,
                  MaterialButton(
                    height: number56,
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: primaryColor, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.saleSummary);
                    },
                    child: Text(
                      'ADD SALE ITEM',
                      style: TextStyle(color: primaryColor),
                    ),
                  ),
                  smallVerticalSizedBox,
                  MaterialButton(
                    height: number56,
                    minWidth: double.infinity,
                    color: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    onPressed: () {
                      // List<dynamic> mapList = saleProducts.Value;
                      // print(mapList);
                      Navigator.pushNamed(context, Routes.salePayment);
                    },
                    child: Text(
                      'PROCEED TO PAYMENT',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<Map> saleSummaryList = [
  {
    'productName': 'Bidco S&W',
    'unitPrice': '2500',
    'quantity': '4',
    'totalPrice': '10000',
    'standardMeasure': '50 KG'
  },
  {
    'productName': 'Unga S&W',
    'unitPrice': '2000',
    'quantity': '4',
    'totalPrice': '10000',
    'standardMeasure': '50 KG'
  },
  {
    'productName': 'FC S&W',
    'unitPrice': '1500',
    'quantity': '4',
    'totalPrice': '10000',
    'standardMeasure': '50 KG'
  },
  {
    'productName': 'ProSoya S&W',
    'unitPrice': '1500',
    'quantity': '4',
    'totalPrice': '10000',
    'standardMeasure': '50 KG'
  },
];
