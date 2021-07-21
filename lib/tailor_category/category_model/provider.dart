import 'package:flutter/cupertino.dart';
import 'package:sizary/instance_helper/instances.dart';
import 'package:sizary/tailor_category/category_model/repo.dart';
import 'package:sizary/widget/progress.dart';

import 'model.dart';

TailorCategoryRepo tailorCategory = TailorCategoryRepo();

class TailorCategoryProvider extends ChangeNotifier {
BuildContext _context;
CustomProgressIndicator _progressIndicator;
String queryToken;
List<Category> categoryModel;

void init(BuildContext context) {
  this._context = context;
  this._progressIndicator = CustomProgressIndicator(this._context);
}

void tailorCategoryP({@required String token}) async {
  try {
    _progressIndicator.show();
    categoryModel = await tailorCategory.tailorCategoryRepo(queryToken: token);
    await _progressIndicator.dismiss();
    notifyListeners();
  } catch (e) {
    await _progressIndicator.dismiss();
    showToast(this._context, message: 'Failed.. Please try again');
    notifyListeners();
  }
}
}