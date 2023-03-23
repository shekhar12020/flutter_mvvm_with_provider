import 'package:flutter/material.dart';
import 'package:flutter_with_mvvm_n_provider/user_list/view_models/users_view_model.dart';
import 'package:flutter_with_mvvm_n_provider/user_list/views/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsersViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
