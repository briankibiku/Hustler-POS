import 'package:flutter/material.dart';
import 'package:hustlerpos/features/customers/manage_customer.dart';
import 'package:hustlerpos/features/homepage/homepage.dart';
import 'package:hustlerpos/features/login/login.dart';
import 'package:hustlerpos/features/products/add_product.dart';
import 'package:hustlerpos/features/products/edit_product.dart';
import 'package:hustlerpos/features/products/manage_products.dart';
import 'package:hustlerpos/features/sales/make_sale.dart';
import 'package:hustlerpos/features/sales/sale_payment.dart';
import 'package:hustlerpos/features/sales/sale_summary.dart';
import 'package:hustlerpos/features/signup/signup.dart';
import 'package:hustlerpos/features/stock/add_stock.dart';
import 'package:hustlerpos/features/stock/veiw_stock.dart';
import 'package:hustlerpos/features/suppliers/add_supplier.dart';
import 'package:hustlerpos/features/suppliers/manage_suppliers.dart';
import 'package:hustlerpos/routes.dart';
import 'package:hustlerpos/shared/coming_soon.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case Routes.makeSale:
        return MaterialPageRoute(builder: (_) => MakeSalePage());
      case Routes.saleSummary:
        return MaterialPageRoute(builder: (_) => SaleSummaryPage());
      case Routes.salePayment:
        return MaterialPageRoute(builder: (_) => SalePaymentPage());
      case Routes.addStock:
        return MaterialPageRoute(builder: (_) => AddStockPage());
      case Routes.viewStock:
        return MaterialPageRoute(builder: (_) => ViewStockPage());
      case Routes.manageSuppliersPage:
        return MaterialPageRoute(builder: (_) => ManageSuppliersPage());
      case Routes.manageCustomersPage:
        return MaterialPageRoute(builder: (_) => ManageCustomersPage());
      case Routes.manageProductsPage:
        return MaterialPageRoute(builder: (_) => ManageProductsPage()); 
      case Routes.addProductPage:
        return MaterialPageRoute(builder: (_) => AddProductPage());  
      case Routes.editProductPage:
        return MaterialPageRoute(builder: (_) => EditProductPage());  
      case Routes.addSupplierPage:
        return MaterialPageRoute(builder: (_) => AddSupplierPage());  
      case Routes.comingSoonPage:
        return MaterialPageRoute(builder: (_) => ComingSoonPage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
