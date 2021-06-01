import 'package:flutter/material.dart';
import 'package:hustlerpos/constants/colors.dart';
import 'package:hustlerpos/constants/numbers.dart';
import 'package:hustlerpos/constants/sizing.dart';
import 'package:hustlerpos/shared/input_widgets/custom_text_form_field.dart';
import 'package:hustlerpos/shared/labels/custom_input_label.dart';

class EditProductPage extends StatefulWidget {
  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  TextEditingController? productNameController;
  TextEditingController? customerNameController;
  TextEditingController? customerContactController; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Edit Product'),
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
              CustomTextFormField(
                customController: customerContactController,
              ),
              mediumVerticalSizedBox,
              CustomInputLabel(
                labelString: 'Buying Price *',
              ),
              smallVerticalSizedBox,
              CustomTextFormField(
                customController: customerContactController,
              ),
              mediumVerticalSizedBox,
              CustomInputLabel(
                labelString: 'Selling Price *',
              ),
              smallVerticalSizedBox,
              CustomTextFormField(
                customController: customerContactController,
              ),
              mediumVerticalSizedBox,
              CustomInputLabel(
                labelString: 'Product Description *',
              ),
              smallVerticalSizedBox,
              CustomTextFormField(
                customController: customerContactController,
              ),
              mediumVerticalSizedBox,
              MaterialButton(
                height: number56,
                minWidth: double.infinity,
                color: primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                onPressed: () {
                  // add stock save fucntion
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
  'Farvet S&W 50KG',
  'Farvet S&W 70KG',
  'Jubilee S&W'
];

List<String> suppliersList = [
  'Select supplier',
  'Jubilee Feeds',
  'Preshama Feeds',
  'Farmers Choice',
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
