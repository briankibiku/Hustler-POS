import 'package:flutter/material.dart';
import 'package:hustlerpos/constants/colors.dart';
import 'package:hustlerpos/constants/numbers.dart';
import 'package:hustlerpos/constants/sizing.dart';
import 'package:hustlerpos/shared/input_widgets/custom_text_form_field.dart';
import 'package:hustlerpos/shared/labels/custom_input_label.dart';

class AddSupplierPage extends StatefulWidget {
  @override
  _AddSupplierPageState createState() => _AddSupplierPageState();
}

class _AddSupplierPageState extends State<AddSupplierPage> {
  TextEditingController? productNameController;
  TextEditingController? customerNameController;
  TextEditingController? customerContactController;
  String? _selectedProduct = 'Select Product';
  String? _selectedSupplier = 'Select supplier'; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Add Stock'),
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
              CustomTextFormField(
                keyBoardType: TextInputType.number,
                customController: customerContactController,
              ),
              mediumVerticalSizedBox,
              CustomInputLabel(
                labelString: 'Buying Price *',
              ),
              smallVerticalSizedBox,
              CustomTextFormField(
                keyBoardType: TextInputType.number,
                customController: customerContactController,
              ),
              mediumVerticalSizedBox,
              CustomInputLabel(
                labelString: 'Selling Price *',
              ),
              smallVerticalSizedBox,
              CustomTextFormField(
                keyBoardType: TextInputType.number,
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
              CustomInputLabel(
                labelString: 'Supplier Name',
              ),
              smallVerticalSizedBox,
              Container(
                height: 45,
                width: double.infinity,
                color: fadedPrimaryColor,
                padding: EdgeInsets.all(10),
                child: DropdownButton<String>(
                  value: _selectedSupplier,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  underline: SizedBox(
                    height: 0,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedSupplier = newValue!;
                    });
                  },
                  items: suppliersList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
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
