import 'package:flutter/material.dart';
import 'package:flutter_with_mvvm_n_provider/components/app_error.dart';
import 'package:flutter_with_mvvm_n_provider/components/app_loading.dart';
import 'package:flutter_with_mvvm_n_provider/components/user_list_row.dart';
import 'package:flutter_with_mvvm_n_provider/user_list/models/users_list_model.dart';
import 'package:flutter_with_mvvm_n_provider/user_list/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Users'),
        actions: [
          IconButton(
            onPressed: () async {
              usersViewModel.getUsers();
            },
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _ui(usersViewModel),
          ],
        ),
      ),
    );
  }

  _ui(UsersViewModel usersViewModel) {
    if (usersViewModel.loading) {
      return AppLoading();
    }
    if (usersViewModel.userError.code != null) {
      return AppError(
        errorText: usersViewModel.userError.message.toString(),
      );
    }
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          UserModel userModel = usersViewModel.userListModel[index];
          return UserListRow(
            userModel: userModel,
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: usersViewModel.userListModel.length,
      ),
    );
  }
}
