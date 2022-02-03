import 'dart:io';

import 'package:scoped_model/scoped_model.dart';
import 'package:WillowCareApp/Models/DataModel.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid_type/uuid_type.dart';

class AppModel extends Model {
  String startUrl = "http://demo.website.com/mt";
  String accountToken = "";

  SharedPreferences? prefs;

  RegisterResult registerResult = RegisterResult(
      accountStatus: AccountStatus.uninitialized,
      msg: "not configured",
      phone: "+1");

  bool isDataLoaded = false;

  List<Appointment> appointments = [];

  initAppModel() async {
    prefs = await SharedPreferences.getInstance();

    Uuid? accountId;

    accountToken = prefs!.getString('accountToken') ?? '';

    if (accountToken != '') {
      accountId = Uuid.parse(prefs!.getString('accountId') ?? '');

      registerResult = registerResult.copyWith(accountID: accountId);
      checkAccount(accountToken);
      fillAppointments();
    } else {
      registerResult = RegisterResult(
          accountStatus: AccountStatus.signinRequired,
          msg: "not configured",
          phone: "+1");
    }
  }

  static AppModel of(BuildContext context) =>
      ScopedModel.of<AppModel>(context, rebuildOnChange: true);

  Future<bool> checkAccount(String token) async {
    registerResult = registerResult.copyWith(
        accountStatus: AccountStatus.ready, msg: '', success: true);
    notifyListeners();
    return true;
  }

  Future<bool> signup(SignupModel signupModel) async {
    registerResult = registerResult.copyWith(
        accountStatus: AccountStatus.ready,
        msg: '',
        accountID: RandomUuidGenerator().generate(),
        displayName: 'Jak andrson',
        success: true);

    accountToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiMTAwMTAwMTAiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImU1M2RmMjQyLTNmNzEtNDBlMS05YTE5LWM1ODUwOWYyNjVmYiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6Ik4iLCJleHAiOjE2MzAxNTMzMzIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTAwMCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTAwMCJ9._NN8djcZovlZ85ud5M5PV9D8Kwnex-WPG7Wp2aM1FA4';
    prefs!.setString('accountToken', accountToken);

    var refreshToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiMTAwMTAwMTAiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImU1M2RmMjQyLTNmNzEtNDBlMS05YTE5LWM1ODUwOWYyNjVmYiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6Ik4iLCJleHAiOjE2MzAxNTMzMzIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTAwMCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTAwMCJ9._NN8djcZovlZ85ud5M5PV9D8Kwnex-WPG7Wp2aM1FA4';
    prefs!.setString('RefreshToken', refreshToken);

    setAccountId(registerResult.accountID.toString());
    return true;
  }

  Future<bool> login(LoginModel loginModel) async {
    registerResult = registerResult.copyWith(
        accountStatus: AccountStatus.ready,
        msg: '',
        accountID: RandomUuidGenerator().generate(),
        displayName: 'Jak andrson',
        success: true);
    accountToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiMTAwMTAwMTAiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImU1M2RmMjQyLTNmNzEtNDBlMS05YTE5LWM1ODUwOWYyNjVmYiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6Ik4iLCJleHAiOjE2MzAxNTMzMzIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTAwMCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTAwMCJ9._NN8djcZovlZ85ud5M5PV9D8Kwnex-WPG7Wp2aM1FA4';
    prefs!.setString('accountToken', accountToken);

    var refreshToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiMTAwMTAwMTAiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImU1M2RmMjQyLTNmNzEtNDBlMS05YTE5LWM1ODUwOWYyNjVmYiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6Ik4iLCJleHAiOjE2MzAxNTMzMzIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTAwMCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTAwMCJ9._NN8djcZovlZ85ud5M5PV9D8Kwnex-WPG7Wp2aM1FA4';
    prefs!.setString('RefreshToken', refreshToken);

    setAccountId(registerResult.accountID.toString());

    fillAppointments();
    return true;
  }

  Future<bool> logout() async {
    prefs!.setString('accountToken', '');

    prefs!.setString('RefreshToken', '');

    prefs!.setString('accountId', '');
    prefs!.setString('accountCode', '');

    registerResult = RegisterResult(
        accountStatus: AccountStatus.signinRequired,
        msg: "not configured",
        phone: "+1");
    notifyListeners();
    return true;
  }

  fillAppointments() async {
    appointments.clear();
    appointments.add(Appointment(
        name: 'Eva Reid',
        service: 'Online Consultation',
        appDate: 'November 17, 12:30 PM',
        state: true,
        img: 'v4.png'));
    appointments.add(Appointment(
        name: 'Eva Reid',
        service: 'Online Consultation',
        appDate: 'November 17, 12:30 PM',
        state: true,
        img: 'v2.png'));
  }

  setAccountId(String newAccountCode) {
    prefs!.setString('accountId', newAccountCode.toString());
  }

  bool checkInternetConnaction() {
    try {
      InternetAddress.lookup('google.com').then((value) {
        if (value.isNotEmpty && value[0].rawAddress.isNotEmpty) {
          print('network connected');
          return true;
        } else {
          print('no data');
          return false;
        }
      });
    } on SocketException catch (_) {
      print('network not connected');
      return false;
    }
    return false;
  }

  notify() {
    notifyListeners();
  }
}
