import 'package:flutter/cupertino.dart';
import 'package:productos_app/models/models.dart';

class ProductFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey();

  Products product;
  ProductFormProvider(this.product);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  updateAvailibility(bool value) async {
    product.available = value;
    // notifyListeners();
  }
}
