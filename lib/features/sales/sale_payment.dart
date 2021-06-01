import 'package:flutter/material.dart';
import 'package:hustlerpos/constants/colors.dart';
import 'package:hustlerpos/constants/numbers.dart';
import 'package:hustlerpos/constants/sizing.dart';
import 'package:hustlerpos/features/sales/sale_summary.dart';
import 'package:hustlerpos/routes.dart';
import 'package:hustlerpos/shared/labels/custom_input_label.dart';

class SalePaymentPage extends StatefulWidget {
  @override
  _SalePaymentPageState createState() => _SalePaymentPageState();
}

class _SalePaymentPageState extends State<SalePaymentPage> {
  String? _selectedPaymentMethod = 'Cash';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Payment'),
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
                      alignment: Alignment.centerLeft,
                      child: Bold15InputLabel(labelString: 'Payment Method')),
                  smallVerticalSizedBox,
                  Container(
                    height: 45,
                    width: double.infinity,
                    color: fadedPrimaryColor,
                    padding: EdgeInsets.all(10),
                    child: DropdownButton<String>(
                      value: _selectedPaymentMethod,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      underline: SizedBox(
                        height: 0,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedPaymentMethod = newValue!;
                        });
                      },
                      items: paymentMethod
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  smallVerticalSizedBox,
                  Align(
                      alignment: Alignment.centerRight,
                      child:
                          Bold17InputLabel(labelString: 'Total : ' + '12000')),
                ],
              ),
              MaterialButton(
                height: number56,
                minWidth: double.infinity,
                color: primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.saleSummary);
                },
                child: Text(
                  'PRINT & DISPATCH ORDER',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<String> paymentMethod = <String>['Cash', 'M-pesa'];
