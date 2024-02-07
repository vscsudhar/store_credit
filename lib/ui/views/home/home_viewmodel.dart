import 'package:flutter/material.dart';
import 'package:store_credit/app/app.bottomsheets.dart';
import 'package:store_credit/app/app.dialogs.dart';
import 'package:store_credit/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  List<String> names = ['item1', 'item2', 'item13', 'item4'];
  List<String> names1 = ['name1', 'name2', 'name3', 'name4'];
  List<String> names2 = ['Test', 'test1', 'missing products', 'new'];
  String selectedName = 'item1';
  String selectedName1 = 'name1';
  String selectedName2 = 'Test';

  DateTime? _fromDate;
  DateTime? get fromDate => _fromDate ?? DateTime.now();

  void onChangeItem(newValue) {
   
      notifyListeners();
      selectedName = newValue;
    
  }

  void onChangeIncharge(newValue) {
    notifyListeners();
    selectedName1 = newValue;
  }

  void onChangeResonForCredit(newValue) {
    notifyListeners();
    selectedName2 = newValue;
  }

  Future<void> selectFromDate(BuildContext context) async {
    final DateTime? fromDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );

    if (fromDate != null) {
      _fromDate = fromDate;
      notifyListeners();
    }
    // _sharedPreference.setString('fromdate', fDate ?? '');
  }

  void showErrDialog(String message) {
    _dialogService.showCustomDialog(variant: DialogType.error, title: "Message", description: message);
  }
}
