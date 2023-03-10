import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CalculatorButton(
                  label: "AC",
                  bgColor: Colors.grey,
                  labelColor: Colors.black,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CalculatorButton(
                  label: "7",
                  bgColor: Colors.grey.shade800,
                  labelColor: Colors.white,
                  onPressed: () {},
                ),
                CalculatorButton(
                  label: "8",
                  bgColor: Colors.grey.shade800,
                  labelColor: Colors.white,
                  onPressed: () {},
                ),
                CalculatorButton(
                  label: "9",
                  bgColor: Colors.grey.shade800,
                  labelColor: Colors.white,
                  onPressed: () {},
                ),
                CalculatorButton(
                  label: "x",
                  bgColor: Colors.amber.shade700,
                  labelColor: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final Color labelColor;
  final Color bgColor;
  const CalculatorButton({
    super.key,
    required this.label,
    this.onPressed,
    required this.labelColor,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: Key(label),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        shape: const CircleBorder(),
        fixedSize: Size(
          MediaQuery.of(context).size.width * 0.2,
          MediaQuery.of(context).size.width * 0.2,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(color: labelColor),
      ),
    );
  }
}

AppBar appBar() {
  return AppBar(
    title: Text(
      "Calculator",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        height: 1.5,
        color: Colors.lightGreen.shade200, // or Colors.<color>[<shade>]
      ),
      textAlign: TextAlign.right,
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
    ),
    elevation: 0,
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.notifications),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.person),
      ),
    ],
  );
}
