import 'package:flutter/material.dart';
import 'package:hustlerpos/constants/colors.dart';
import 'package:hustlerpos/constants/numbers.dart';
import 'package:hustlerpos/constants/sizing.dart';
import 'package:hustlerpos/routes.dart';
import 'package:hustlerpos/shared/input_widgets/custom_text_form_field.dart';
import 'package:hustlerpos/shared/labels/custom_input_label.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Make Sale'),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              CustomInputLabel(
                labelString: 'Product Name *',
              ),
              smallVerticalSizedBox,
              Container(
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
                  items: productsList
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
                  Navigator.pushNamed(context, Routes.homePage);
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
  'FC S&W',
  'Jubilee S&W',
  'Farvet S&W'
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
