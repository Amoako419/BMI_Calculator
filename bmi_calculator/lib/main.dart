import 'package:flutter/material.dart';
void main() {
  runApp(const MaterialApp(
    title: 'BMI Calculator',
    home: BMICalculator(),
  ));
}
class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BMICalculatorState createState() => _BMICalculatorState();
}
class _BMICalculatorState extends State<BMICalculator> {
  final TextEditingController _heightController =
TextEditingController();
  final TextEditingController _weightController =
TextEditingController();
  double _bmiResult = 0.0;
  String _resultCategory = '';

void _calculateBMI() {
double height = double.parse(_heightController.text); double weight = double.parse(_weightController.text); double bmi = weight / (height * height);
setState(() {
    _bmiResult = bmi;
    if (_bmiResult < 18.5) {
      _resultCategory = 'Underweight';
    } else if (_bmiResult >= 18.5 && _bmiResult < 25) {
      _resultCategory = 'Normal';
    } else if (_bmiResult >= 25 && _bmiResult < 30) {
      _resultCategory = 'Overweight';
} else {
      _resultCategory = 'Obese';
} });
}
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('BMI Calculator'),
      centerTitle: true,
    ),
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Enter your height in meters',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
),
keyboardType: TextInputType.number, controller: _heightController,
), ),
Padding(
  padding: const EdgeInsets.all(16.0),
  child: TextField(
    decoration: InputDecoration(
      labelText: 'Enter your weight in kg',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
),
    keyboardType: TextInputType.number,    controller: _weightController,
  ),
), Padding(
  padding: const EdgeInsets.all(16.0),
  child: ElevatedButton(
onPressed: _calculateBMI, style: ElevatedButton.styleFrom(
backgroundColor: Colors.pink,
textStyle: const TextStyle(color: Colors.white), padding: const EdgeInsets.symmetric(horizontal:
40, vertical: 15),
                ), child: const Text('CALCULATE'),
),
), Text(
              'Your BMI is: ${_bmiResult.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 24.0,
fontWeight: FontWeight.bold, ),
), Text(
              _resultCategory,
              style: TextStyle(
                fontSize: 24.0,
fontWeight: FontWeight.bold, color: _resultCategory == 'Normal'
? Colors.green
: Colors.red, ),
), ],
),
), );
} }
