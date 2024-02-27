import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

errorMessage({String message = "Something went wrong", int duration = 1,}) =>
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: duration,
        backgroundColor:Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);