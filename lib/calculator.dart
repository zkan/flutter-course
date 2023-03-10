class Calculator {
  String value = "0";
  String operator = "";
  String oldValue = "";

  void allClear() {
    value = "0";
    operator = "";
    oldValue = "";
  }

  void onTabOperand(String operand) {
    if (operator.isNotEmpty) oldValue = value;
    value = operand;

    print({"value": value, "operator": operator, "oldValue": oldValue});
  }

  void onTabOperator(String operator) {
    this.operator = operator;
  }

  void calculate() {
    value =
        ((int.tryParse(oldValue) ?? 0) * (int.tryParse(value) ?? 0)).toString();
  }
}
