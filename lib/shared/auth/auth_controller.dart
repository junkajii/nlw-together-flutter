import 'package:flutter/material.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModel? _user;

  UserModel get user => _user!;

  void setUser(BuildContext context, UserModel? user) {
    if (user == null) {
      Navigator.pushReplacementNamed(
        context,
        '/home',
      );
      return;
    }
    saveUser(user);
    _user = user;
    Navigator.pushReplacementNamed(
      context,
      '/login',
    );
  }

  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString('user', user.toJson());
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();

    await Future.delayed(Duration(seconds: 2));

    if (!instance.containsKey('user')) {
      setUser(context, null);
      return;
    }
    final json = instance.get('user') as String;
    setUser(context, UserModel.fromJson(json));
  }
}
