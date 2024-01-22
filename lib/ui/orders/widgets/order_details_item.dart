import 'package:flutter/material.dart';

class OrderDetailsItem extends StatelessWidget {
  const OrderDetailsItem({super.key, required this.option, required this.data});
  final String option;
  final String data;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: [
          Text(
            option,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 210,
            child: Text(
              data,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 18,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
