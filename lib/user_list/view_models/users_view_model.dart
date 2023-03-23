import 'package:flutter/material.dart';

import '../models/user_error.dart';
import '../models/users_list_model.dart';
import '../repo/api_status.dart';
import '../repo/user_services.dart';

class UsersViewModel extends ChangeNotifier {
  //
  bool _loading = false;
  List<UserModel> _userListModel = [];
  UserError _userError = UserError();

  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;
  UserError get userError => _userError;

  UsersViewModel() {
    getUsers();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel) {
    _userListModel = userListModel;
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  getUsers() async {
    setLoading(true);
    var response = await UserServices.getUsers();
    if (response is Success) {
      setUserListModel(response.response as List<UserModel>);
    }
    if (response is Failure) {
      UserError userError = UserError(
        code: response.code,
        message: response.errorResponse.toString(),
      );
      setUserError(userError);
    }
    setLoading(false);
  }
}
