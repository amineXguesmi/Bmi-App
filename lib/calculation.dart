import 'dart:math';

class CalculatorBrain {
  final double height;
  final double weight;
  double _bmi = 0;
  CalculatorBrain(this.weight, this.height) {
    this._bmi = weight / pow(height / 100, 2);
  }
  String CalculateBMI() {
    return _bmi.toStringAsFixed(1);
  }

  String GetResult() {
    if (_bmi >= 25) return "Overweight";
    if (_bmi >= 18.5) return "Normal";
    return "Underweight";
  }

  String GetInterpretation() {
    if (_bmi >= 25)
      return "You have a higher than normal body weight. Try to exercice more";
    if (_bmi >= 18.5) return "You have a normal body weight.Good job";
    return "You have a lower than normal body weight . You can get a bit more ";
  }
}
