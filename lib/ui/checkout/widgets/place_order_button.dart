import 'package:flutter/material.dart';

class PlaceOrderButton extends StatelessWidget {
  const PlaceOrderButton({
    super.key,
    this.onPressed,
    required this.textColor,
  });

  final void Function()? onPressed;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 5.0,
      ),
      child: MaterialButton(
        highlightElevation: 0.0,
        onPressed: onPressed,
        color: Colors.blue,
        height: MediaQuery.of(context).size.height * .08,
        minWidth: MediaQuery.of(context).size.width * .5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Text(
          "Place Order",
          style: TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
