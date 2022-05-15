// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:alterra_event_hunter/models/user_model.dart';
import 'package:alterra_event_hunter/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:shared_preferences/shared_preferences.dart';

enum AuthState {
  none,
  loading,
  error,
}

class AuthProvider with ChangeNotifier {
  // note : Start Code Auth State

  AuthState _authState = AuthState.none;
  AuthState get authState => _authState;

  changeState(AuthState authState) {
    _authState = authState;
    notifyListeners();
  }

  // note : End Code Auth State

  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> signUp({
    required String email,
    required String password,
    required String fullName,
    required String role,
    required int phoneNumber,
  }) async {
    changeState(AuthState.loading);
    try {
      UserModel user = await AuthService().signUp(
        email: email,
        password: password,
        fullName: fullName,
        role: role,
        phoneNumber: phoneNumber,
      );

      _user = user;

      // note : SharedPref

      SharedPreferences prefs = await SharedPreferences.getInstance();

      String userSaved = json.encode(_user.toJson());
      prefs.setString('userSaved', userSaved);

      _user = UserModel.fromJson(json.decode(userSaved));

      // note : End

      changeState(AuthState.none);

      return true;
    } catch (e) {
      print(e.toString() + " { disini errornya }");

      changeState(AuthState.error);

      throw e;

      return false;
    }
  }

  Future<bool> updateProfile({
    required String fullName,
    required int phoneNumber,
  }) async {
    changeState(AuthState.loading);
    try {
      UserModel user = await AuthService().updateUser(
        fullName: fullName,
        phoneNumber: phoneNumber,
      );

      _user = user;

      // note : SharedPref

      SharedPreferences prefs = await SharedPreferences.getInstance();

      String userSaved = json.encode(_user.toJson());
      prefs.setString('userSaved', userSaved);

      _user = UserModel.fromJson(json.decode(userSaved));

      // note : End

      changeState(AuthState.none);

      return true;
    } catch (e) {
      print(e.toString() + " { disini errornya }");

      changeState(AuthState.error);

      throw e;

      return false;
    }
  }

  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    changeState(AuthState.loading);
    try {
      UserModel user = await AuthService().signIn(
        email: email,
        password: password,
      );

      _user = user;

      // note : SharedPref

      SharedPreferences prefs = await SharedPreferences.getInstance();

      String userSaved = json.encode(_user.toJson());
      prefs.setString('userSaved', userSaved);

      _user = UserModel.fromJson(json.decode(userSaved));

      // note : End

      changeState(AuthState.none);

      return true;
    } catch (e) {
      print(e.toString() + " { disini errornya }");

      changeState(AuthState.error);

      throw e;

      return false;
    }
  }

  Future<void> getUserActive() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      print(currentUser);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      var user = prefs.getString('userSaved');

      var getUser = UserModel.fromJson(json.decode(user!));

      _user = getUser;

      print('USER ACTIVE NOW');
      print(_user.email);
      print(_user.fullName);
      print(_user.role);
      print(_user.uid);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future<bool> signOut() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('userSaved');
      await AuthService().signOut();
      print('Berhasil Logout');
      return true;
    } catch (e) {
      print(e.toString() + " { disini errornya }");
      return false;
    }
  }
}
