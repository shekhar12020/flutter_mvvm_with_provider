import 'package:flutter/material.dart';
import 'package:flutter_with_mvvm_n_provider/user_list/models/users_list_model.dart';

class UserListRow extends StatelessWidget {
  final UserModel? userModel;

  UserListRow({this.userModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          userModel!.name.toString(),
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        Text(
          userModel!.email.toString(),
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
