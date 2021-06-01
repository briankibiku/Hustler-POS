import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hustlerpos/constants/colors.dart';
import 'package:hustlerpos/constants/numbers.dart';
import 'package:hustlerpos/constants/sizing.dart';
import 'package:hustlerpos/constants/strings.dart';
import 'package:hustlerpos/routes.dart';
import 'package:hustlerpos/shared/custom_snackbar.dart';
import 'package:hustlerpos/shared/input_widgets/custom_text_form_field.dart';
import 'package:hustlerpos/shared/labels/custom_input_label.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController? productNameController;
  TextEditingController? customerNameController;
  TextEditingController? customerContactController;
  TextEditingController? buyingPriceController;
  TextEditingController? sellingPriceController;
  late String productName;
  late String buyingPrice;
  late String sellingPrice;
  bool isProductNameFilled = false;
  bool isBuyingPriceFilled = false;
  bool isSellingPriceFilled = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Add Product'),
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
                customController: productNameController,
                onChangeFunc: (productNamevalue) {
                  setState(() {
                    isProductNameFilled = true;
                    productName = productNamevalue;
                  });
                },
              ),
              mediumVerticalSizedBox,
              CustomInputLabel(
                labelString: 'Buying Price *',
              ),
              smallVerticalSizedBox,
              CustomTextFormField(
                customController: buyingPriceController,
                keyBoardType: TextInputType.number,
                onChangeFunc: (buyingPriceValue) {
                  setState(() {
                    isBuyingPriceFilled = true;
                    buyingPrice = buyingPriceValue;
                  });
                },
              ),
              mediumVerticalSizedBox,
              CustomInputLabel(
                labelString: 'Selling Price *',
              ),
              smallVerticalSizedBox,
              CustomTextFormField(
                customController: sellingPriceController,
                keyBoardType: TextInputType.number,
                onChangeFunc: (sellingPriceValue) {
                  setState(() {
                    isSellingPriceFilled = true;
                    sellingPrice = sellingPriceValue;
                  });
                },
              ),
              mediumVerticalSizedBox,
              CustomInputLabel(
                labelString: 'Product Description',
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
                onPressed: () async {
                  if (!isProductNameFilled ||
                      !isBuyingPriceFilled ||
                      !isSellingPriceFilled) {
                    customSnackBar(context, fillAllFieldsWarning);
                  }
                  if (isProductNameFilled &&
                      isBuyingPriceFilled &&
                      isSellingPriceFilled) {
                    // set loading status of loading indicator
                    _showMaterialDialog(context);
                    // save details to firestore
                    await FirebaseFirestore.instance
                        .collection('products')
                        .doc()
                        .set({
                      'productName': productName,
                      'sellingPrice': sellingPrice,
                      'buyingPrice': buyingPrice,
                      'description': 'validProduct'
                    }); 
                    await Navigator.pushNamed(
                        context, Routes.manageProductsPage);
                    // Navigator.pushNamedAndRemoveUntil(context, Routes.manageProductsPage, ModalRoute.withName(Routes.homePage));
                    //   Navigator.pushNamedAndRemoveUntil(
                    //       context,
                    //       Routes.manageProductsPage,
                    //       ModalRoute.withName(Routes.manageProductsPage));
                  }
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

_showMaterialDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (_) => new AlertDialog(
            title: new Text('Saving Product...'),
            content: Container(
                height: 40,
                width: 40,
                child: Center(child: new CircularProgressIndicator())),
          ));
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
