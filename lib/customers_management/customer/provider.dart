import 'package:flutter/cupertino.dart';
import 'package:sizary/customers_management/customer/repo.dart';
import 'package:sizary/instance_helper/instances.dart';
import 'package:sizary/widget/progress.dart';

import 'model.dart';

CustomerRepo customerRepo = CustomerRepo();

class CustomersProvider extends ChangeNotifier {
  BuildContext _context;
  CustomProgressIndicator _progressIndicator;
  String queryToken;
  List<Customers> customersModel;

  void init(BuildContext context) {
    this._context = context;
    this._progressIndicator = CustomProgressIndicator(this._context);
  }

  void customersProvider({@required String token}) async {
    try {
      _progressIndicator.show();
      customersModel = await customerRepo.customersRepo(queryToken: token);
      await _progressIndicator.dismiss();
      // showToast(this._context, message: 'Successfully added a Category');
      notifyListeners();
    } catch (e) {
      await _progressIndicator.dismiss();
      showToast(this._context, message: 'Failed.. Please try again');
      notifyListeners();
    }
  }
}