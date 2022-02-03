import 'package:uuid_type/uuid_type.dart';

class SignupModel {
  String? userName;
  String? displayName;
  String? phoneNumber;
  String? password;

  SignupModel(
      {required this.userName,
      required this.displayName,
      required this.phoneNumber,
      required this.password});

  SignupModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    displayName = json['displayName'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['displayName'] = this.displayName;
    data['phoneNumber'] = this.phoneNumber;
    data['password'] = this.password;
    return data;
  }
}

class LoginModel {
  String? userName;
  String? password;

  LoginModel({required this.userName, required this.password});

  LoginModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['password'] = this.password;
    return data;
  }
}

class RegisterResult {
  Uuid? accountID;

  String? displayName;
  String phone;

  bool? success;
  String msg;
  AccountStatus? accountStatus;

  RegisterResult(
      {this.accountID,
      this.displayName,
      this.success,
      required this.msg,
      required this.phone,
      this.accountStatus});

  RegisterResult copyWith({
    Uuid? accountID,
    Uuid? accountCode,
    String? displayName,
    bool? success,
    String? msg,
    String? phone,
    AccountStatus? accountStatus,
  }) {
    return RegisterResult(
        accountID: accountID ?? this.accountID,
        displayName: displayName ?? this.displayName,
        success: success ?? this.success,
        accountStatus: accountStatus ?? this.accountStatus,
        msg: msg ?? this.msg,
        phone: phone ?? this.phone);
  }
}

enum AccountStatus {
  uninitialized,
  signinRequired,
  verifyRequired,
  ready,
  serverConnError,
  workOffline
}

class Response {
  final bool status;
  final String message;

  Response({required this.status, required this.message});
}

class Appointment {
  String name;
  String service;
  String appDate;
  bool state;
  String img;
  Appointment({
    required this.name,
    required this.service,
    required this.appDate,
    required this.state,
    required this.img,
  });
}
