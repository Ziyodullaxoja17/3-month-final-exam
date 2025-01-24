import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutlinedBorderCustom {
  static OutlineInputBorder inputBorder_enabled = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 1.sp, color: Colors.blue));

  static OutlineInputBorder inputBorder_focused = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(width: 1.sp, color: Colors.green),
  );
}
