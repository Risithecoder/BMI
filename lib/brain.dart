import 'dart:math';

class Brain {
  Brain({this.height, this.weight});
  final int height;
  final int weight;
  double _bmi;

  String calculator() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String result() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String review() {
    if (_bmi >= 25) {
      return 'You have higher than normal body weight. Try to exercise more';
    } else if (_bmi > 18.5) {
      return 'CONGRATULATION you have a perfect BMI value , Stay fit';
    } else {
      return 'Eat more friend , Gain more Live more ';
    }
  }
}
