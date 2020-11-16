import 'dart:math';
class CalculatorBrain{
  CalculatorBrain({this.height,this.weight});
  final int height;
  final int weight;

  double _bmi;
  String CalculateBMI(){
     _bmi=weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi>=25) return 'OverWeight';
    else if(_bmi>=18.5) return 'Normal';
    else return 'Underweight';
  }

  String getInterpretation(){
    if(_bmi>=25) return 'Your weight is more than it needs to be. Start Exercising';
    else if(_bmi>=18.5) return 'You\'re BMI is perfect.Stay in shape!!';
    else return 'You are underweight. Start eating more';
  }
}