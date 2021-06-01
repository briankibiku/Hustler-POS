import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hustlerpos/constants/colors.dart';
import 'package:hustlerpos/constants/sizing.dart';
import 'package:hustlerpos/routes.dart';
import 'package:hustlerpos/shared/labels/custom_input_label.dart';

class ManageProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // CollectionReference products =
    //     FirebaseFirestore.instance.collection('products');
    final Stream<QuerySnapshot> productsFromDatabaseStream =
        FirebaseFirestore.instance.collection('products').snapshots();

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Products'),
        centerTitle: true,
      ),
      body: Scaffold(
        body: Container(
            color: Colors.white,
            child: ListView(
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
                        Navigator.pushNamed(context, Routes.addProductPage);
                      },
                      child: Text(
                        'ADD PRODUCT',
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  ),
                ),
                smallVerticalSizedBox,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      BuyingPriceIndicator(),
                      smallHorizontalSizedBox,
                      Bold15InputLabel(labelString: 'Buying Price'),
                      mediumHorizontalSizedBox,
                      SellingPriceIndicator(),
                      smallHorizontalSizedBox,
                      Bold15InputLabel(labelString: 'Selling Price'),
                    ],
                  ),
                ),
                smallVerticalSizedBox,
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Bold15InputLabel(labelString: 'Product'),
                      Row(
                        children: [
                          BuyingPriceIndicator(),
                          verySmallHorizontalSizedBox,
                          Bold15InputLabel(labelString: 'BP'),
                        ],
                      ),
                      Row(
                        children: [
                          SellingPriceIndicator(),
                          verySmallHorizontalSizedBox,
                          Bold15InputLabel(labelString: 'SP'),
                        ],
                      ),
                      Bold15InputLabel(labelString: 'Edit')
                    ],
                  ),
                ),
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

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: data.size,
                          itemBuilder: (BuildContext context, int index) {
                            final  productName =
                                data.docs[index]['productName'];
                            final String productBuyingPrice =
                                data.docs[index]['buyingPrice'];
                            final String productSellingPrice =
                                data.docs[index]['sellingPrice'];
                            return Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  productName,
                                  overflow: TextOverflow.visible,
                                ),
                                Text(productBuyingPrice),
                                Text(productSellingPrice),
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, Routes.editProductPage);
                                  },
                                )
                              ],
                            );
                          }),
                    );
                  },
                ),
              ],
            )),
      ),
    );
  }
}

class SellingPriceIndicator extends StatelessWidget {
  const SellingPriceIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 14, width: 14, color: Colors.green);
  }
}

class BuyingPriceIndicator extends StatelessWidget {
  const BuyingPriceIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 14, width: 14, color: Colors.red);
  }
}

void getProductsList() {

}

List<Map> productsList = [
  {
    'productName': 'Jubilee S&W 70KG',
    'buyingPrice': '1200',
    'sellingPrice': '1700'
  },
  {'productName': 'FC S&W 50KG', 'buyingPrice': '1200', 'sellingPrice': '1700'},
  {
    'productName': 'Farvet S&W 50KG',
    'buyingPrice': '1200',
    'sellingPrice': '1700'
  },
  {
    'productName': 'Farvet S&W 70KG',
    'buyingPrice': '2300',
    'sellingPrice': '2500'
  },
];
