import 'package:flutter/material.dart';

PreferredSizeWidget getAppBarWidget({
  @required String title,
}) {
  return AppBar(
    elevation: 16,
    shadowColor: Colors.black,
    centerTitle: true,
    title: Text(title),
  );
}
