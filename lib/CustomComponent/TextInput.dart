import 'package:WillowCareApp/Theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// textfromfield custom class
class textField extends StatelessWidget {
  bool password;
  String placeholder;
  IconData icon;
  TextInputType inputType;
  bool requiredField;
  final TextEditingController inputController;
  Function validator = (value) {
    return null;
  };

  textField(
      {required this.placeholder,
      required this.icon,
      required this.inputType,
      this.password = false,
      required this.inputController,
      this.requiredField = false,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        //height: 60.0,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            border: Border.all(color: requiredField ? ErrorColor : hardColor),
            borderRadius: BorderRadius.circular(34.0),
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 10.0, color: Colors.black12)]),
        padding:
            EdgeInsets.only(left: 20.0, right: 30.0, top: 0.0, bottom: 0.0),
        child: Theme(
          data: ThemeData(
            hintColor: Colors.transparent,
          ),
          child: TextFormField(
            obscureText: password,
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: placeholder,
                icon: Icon(
                  icon,
                  color: Colors.black38,
                ),
                labelStyle: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Sans',
                    letterSpacing: 0.3,
                    color: Colors.black38,
                    fontWeight: FontWeight.w600)),
            keyboardType: inputType,
            minLines: 1,
            maxLines: password ? 1 : 4,
            controller: inputController,
            inputFormatters: [
              new FilteringTextInputFormatter.deny(new RegExp('[\\"]')),
            ],
          ),
        ),
      ),
    );
  }
}
