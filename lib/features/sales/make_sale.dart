import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hustlerpos/constants/colors.dart';
import 'package:hustlerpos/constants/numbers.dart';
import 'package:hustlerpos/constants/sizing.dart';
import 'package:hustlerpos/routes.dart';
import 'package:hustlerpos/shared/input_widgets/custom_text_form_field.dart';
import 'package:hustlerpos/shared/labels/custom_input_label.dart';
import 'package:rxdart/rxdart.dart';

class MakeSalePage extends StatefulWidget {
  @override
  _MakeSalePageState createState() => _MakeSalePageState();
}

class _MakeSalePageState extends State<MakeSalePage> {
  TextEditingController? productNameController;
  TextEditingController? customerNameController;
  TextEditingController? customerContactController;
  String? _selectedProduct = 'Select Product';
  String? _selectedQuantity = '1';

  final LinkedHashSet<dynamic> prasedProductsList = LinkedHashSet<dynamic>();
final BehaviorSubject<List<dynamic>> saleProducts =
      BehaviorSubject<List<dynamic>>();
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> productsFromDatabaseStream =
        FirebaseFirestore.instance.collection('productsList').snapshots();
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Make Sale'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              CustomInputLabel(
                labelString: 'Product Name *',
              ),
              smallVerticalSizedBox,
              StreamBuilder<QuerySnapshot>(
                  stream: productsFromDatabaseStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text("Something went wrong");
                    }

                    if (!snapshot.hasData) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircularProgressIndicator(),
                          smallVerticalSizedBox,
                          CustomInputLabel(labelString: 'Loading...')
                        ],
                      );
                    }
                    if (!snapshot.hasData) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircularProgressIndicator(),
                          smallVerticalSizedBox,
                          CustomInputLabel(labelString: 'No data found...')
                        ],
                      );
                    }

                    final data = snapshot.requireData;
                    if (data.size == 0) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/no_results.svg',
                              height: 260, width: 260),
                          smallVerticalSizedBox,
                          CustomInputLabel(labelString: 'No data found...'),
                          smallVerticalSizedBox,
                          CustomInputLabel(
                              labelString:
                                  'Use the Add Product button to add products.')
                        ],
                      );
                    }

                    return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          // final List<String> productsList =
                          //     data.docs[index]['productName'];
                          // final Map<String, String> unsortedProductList = data.docs[index]['productName'];
                          // data.docs.forEach((element) { });

                          return Container(
                            height: 45,
                            width: double.infinity,
                            color: fadedPrimaryColor,
                            padding: EdgeInsets.all(10),
                            child: DropdownButton<String>(
                              value: _selectedProduct,
                              icon: const Icon(Icons.arrow_drop_down),
                              iconSize: 24,
                              elevation: 16,
                              underline: SizedBox(
                                height: 0,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedProduct = newValue!;
                                });
                              },
                              items: productsList.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          );
                        });
                  }),
              mediumVerticalSizedBox,
              CustomInputLabel(
                labelString: 'Quantity *',
              ),
              smallVerticalSizedBox,
              Container(
                height: 45,
                width: double.infinity,
                color: fadedPrimaryColor,
                padding: EdgeInsets.all(10),
                child: DropdownButton<String>(
                  value: _selectedQuantity,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  underline: SizedBox(
                    height: 0,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedQuantity = newValue!;
                    });
                  },
                  items: quantityList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              mediumVerticalSizedBox,
              CustomInputLabel(
                labelString: 'Customer Name',
              ),
              smallVerticalSizedBox,
              CustomTextFormField(
                customController: customerNameController,
              ),
              mediumVerticalSizedBox,
              CustomInputLabel(
                labelString: 'Customer Contact',
              ),
              smallVerticalSizedBox,
              CustomTextFormField(
                customController: customerContactController,
              ),
              mediumVerticalSizedBox,
              mediumVerticalSizedBox,
              Bold15InputLabel(
                labelString: 'Unit Price 2400',
              ),
              smallVerticalSizedBox,
              Bold17InputLabel(
                labelString: 'Total Cost 2400',
              ),
              mediumVerticalSizedBox,
              MaterialButton(
                height: number56,
                minWidth: double.infinity,
                color: primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                onPressed: () {
                  saleProducts.add([{
                    'productName': 'Farvet S&W 50KG',
                    'quantity': '2',
                    'unitPrice': '1200'
                  }]);
                  Navigator.pushNamed(context, Routes.saleSummary);
                },
                child: Text(
                  'SAVE',
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

List<String> productsList = <String>[
  'Select Product',
  'Bidco S&W',
  'FC S&W 50KG',
  'Jubilee S&W 70KG',
  'Farvet S&W 50KG',
  'Farvet S&W 70KG'
];

List<String> quantityList = <String>[
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12',
  '13',
  '14',
  '15'
];
