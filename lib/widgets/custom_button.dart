import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function viewResultHandler;

  const CustomButton({
    @required this.buttonText,
    @required this.viewResultHandler,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => viewResultHandler(context),
      splashColor: Colors.white,
      child: Container(
        width: double.infinity,
        height: 56,
        alignment: Alignment.center,
        color: const Color.fromRGBO(235, 21, 85, 1),
        child: Text(
          buttonText,
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
