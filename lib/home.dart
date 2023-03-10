import 'package:calculator/full_name.dart';
import 'package:flutter/material.dart';

import 'calculator.dart';

class HomePage extends StatefulWidget {
  String name;
  HomePage({required this.name, super.key}) {
    print("constructor: $name");
  }

  @override
  State<HomePage> createState() {
    print("createState on HomePage");
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  late String fullName;

  final calculator = Calculator();

  // @override
  // void initState() {
  //   // เราจะเรียก API แล้วก็เซตค่าต่าง ๆ ที่ initState นี้ เราจะทำก่อน super
  //   print("initState on HomePage");

  //   fullName = "Kan 1";
  //   Future.delayed(Duration(seconds: 2), () {
  //     setState(() {
  //       print("setState on HomePage");
  //       fullName = "Kan 2";
  //     });
  //   });

  //   Future.delayed(Duration(seconds: 10), () {
  //     setState(() {
  //       print("setState on HomePage again");
  //       fullName = "";
  //     });
  //   });

  //   super.initState();

  //   // ถ้าเป็นของที่ต้องเขียนหน้าจอ จะต้องมาเขียนหลัง super เพราะต้องรอให้ render UI ออกมาก่อน
  // }

  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies

  //   // จะใช้ listen เรื่องต่าง ๆ เช่น รอ user scrolls หน้าจอ
  //   var s = ScrollController();
  //   s.addListener(() {});

  //   print("didChangeDependencies on HomePage");

  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    // Flutter ใช้ render UI

    print("mounted: ${this.mounted}");
    print("build on HomePage");

    return Scaffold(
      backgroundColor: Colors.black,
      // body: fullName.isEmpty ? Container() : FullNameWidget(fullName: fullName),
      // body: FullNameWidget(fullName: fullName),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  calculator.value,
                  style: const TextStyle(
                    fontSize: 54,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CalculatorButton(
                      label: "AC",
                      labelColor: Colors.white,
                      bgColor: Colors.grey,
                      onPressed: allClear,
                    ),
                    CalculatorButton(
                      label: "=",
                      labelColor: Colors.white,
                      bgColor: Colors.grey.shade800,
                      onPressed: calcualte,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CalculatorButton(
                      label: "7",
                      labelColor: Colors.white,
                      bgColor: Colors.grey.shade800,
                      onPressed: () => onTabOperand("7"),
                    ),
                    CalculatorButton(
                      label: "8",
                      labelColor: Colors.white,
                      bgColor: Colors.grey.shade800,
                      onPressed: () => onTabOperand("8"),
                    ),
                    CalculatorButton(
                      label: "9",
                      labelColor: Colors.white,
                      bgColor: Colors.grey.shade800,
                      onPressed: () => onTabOperand("9"),
                    ),
                    CalculatorButton(
                      label: "x",
                      labelColor: Colors.white,
                      bgColor: Colors.amber.shade800,
                      onPressed: () => onTabOperator("x"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void allClear() {
    setState(() {
      calculator.allClear();
    });
  }

  void onTabOperand(String operand) {
    setState(() {
      calculator.onTabOperand(operand);
    });
  }

  void onTabOperator(String operator) {
    setState(() {
      calculator.onTabOperator(operator);
    });
  }

  void calcualte() {
    setState(() {
      calculator.calculate();
    });
  }
}

class CalculatorButton extends StatelessWidget {
  final String label;
  final Color labelColor;
  final Color bgColor;
  final void Function()? onPressed;

  const CalculatorButton({
    super.key,
    required this.label,
    required this.labelColor,
    required this.bgColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: Key("button-$label"),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: bgColor,
        fixedSize: Size(
          MediaQuery.of(context).size.width * 0.2,
          MediaQuery.of(context).size.height * 0.2,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: labelColor,
          fontSize: 24,
        ),
      ),
    );
  }
}
