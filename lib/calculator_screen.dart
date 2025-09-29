import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _display = '0';
  String _operation = '';
  double _firstNumber = 0;
  bool _isNewNumber = true;

  void _onNumberPressed(String number) {
    setState(() {
      if (_isNewNumber) {
        _display = number;
        _isNewNumber = false;
      } else {
        if (_display == '0') {
          _display = number;
        } else {
          _display += number;
        }
      }
    });
  }

  void _onOperationPressed(String operation) {
    setState(() {
      _firstNumber = double.parse(_display);
      _operation = operation;
      _isNewNumber = true;
    });
  }

  void _onEqualsPressed() {
    if (_operation.isNotEmpty) {
      setState(() {
        double secondNumber = double.parse(_display);
        double result = 0;

        switch (_operation) {
          case '+':
            result = _firstNumber + secondNumber;
            break;
          case '-':
            result = _firstNumber - secondNumber;
            break;
          case '×':
            result = _firstNumber * secondNumber;
            break;
          case '÷':
            if (secondNumber != 0) {
              result = _firstNumber / secondNumber;
            } else {
              _display = 'Hata';
              _isNewNumber = true;
              return;
            }
            break;
        }

        _display = result.toString();
        if (_display.endsWith('.0')) {
          _display = _display.substring(0, _display.length - 2);
        }
        _operation = '';
        _isNewNumber = true;
      });
    }
  }

  void _onClearPressed() {
    setState(() {
      _display = '0';
      _operation = '';
      _firstNumber = 0;
      _isNewNumber = true;
    });
  }

  void _onDecimalPressed() {
    setState(() {
      if (!_display.contains('.')) {
        _display += '.';
        _isNewNumber = false;
      }
    });
  }

  void _onPercentPressed() {
    setState(() {
      if (_display == 'Hata') {
        return;
      }
      double value = double.tryParse(_display) ?? 0;
      double result = value / 100;
      _display = result.toString();
      if (_display.endsWith('.0')) {
        _display = _display.substring(0, _display.length - 2);
      }
      _isNewNumber = true;
    });
  }

  void _onToggleSignPressed() {
    setState(() {
      if (_display == 'Hata') {
        return;
      }
      if (_display == '0') {
        return;
      }
      if (_display.startsWith('-')) {
        _display = _display.substring(1);
      } else {
        _display = '-$_display';
      }
    });
  }

  String _fmtDoubleSimple(double value) {
    String s = value.toString();
    if (s.endsWith('.0')) {
      s = s.substring(0, s.length - 2);
    }
    return s;
  }

  Widget _buildButton(String text, {Color? color, VoidCallback? onPressed}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.grey[700],
            foregroundColor: color != null ? Colors.white : Colors.white,
            padding: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: null,
      body: Column(
        children: [
          // Üst boşluk - her şeyi aşağı yaslar
          const Spacer(),
          
          // Display
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey[600]!),
            ),
            child: Text(
              _operation.isNotEmpty
                  ? '${_fmtDoubleSimple(_firstNumber)} $_operation${_isNewNumber ? '' : ' $_display'}'
                  : _display,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          
          // Buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // First row
                Row(
                  children: [
                    _buildButton('C', color: Colors.red, onPressed: _onClearPressed),
                    _buildButton('±', onPressed: _onToggleSignPressed),
                    _buildButton('%', onPressed: _onPercentPressed),
                    _buildButton('÷', color: Colors.orange, onPressed: () => _onOperationPressed('÷')),
                  ],
                ),
                
                // Second row
                Row(
                  children: [
                    _buildButton('7', onPressed: () => _onNumberPressed('7')),
                    _buildButton('8', onPressed: () => _onNumberPressed('8')),
                    _buildButton('9', onPressed: () => _onNumberPressed('9')),
                    _buildButton('×', color: Colors.orange, onPressed: () => _onOperationPressed('×')),
                  ],
                ),
                
                // Third row
                Row(
                  children: [
                    _buildButton('4', onPressed: () => _onNumberPressed('4')),
                    _buildButton('5', onPressed: () => _onNumberPressed('5')),
                    _buildButton('6', onPressed: () => _onNumberPressed('6')),
                    _buildButton('-', color: Colors.orange, onPressed: () => _onOperationPressed('-')),
                  ],
                ),
                
                // Fourth row
                Row(
                  children: [
                    _buildButton('1', onPressed: () => _onNumberPressed('1')),
                    _buildButton('2', onPressed: () => _onNumberPressed('2')),
                    _buildButton('3', onPressed: () => _onNumberPressed('3')),
                    _buildButton('+', color: Colors.orange, onPressed: () => _onOperationPressed('+')),
                  ],
                ),
                
                // Fifth row
                Row(
                  children: [
                    // Sıfır butonu - iki birim genişlik (1 ve 2 tuşlarının toplamı)
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ElevatedButton(
                          onPressed: () => _onNumberPressed('0'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[700],
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            '0',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    _buildButton('.', onPressed: _onDecimalPressed),
                    _buildButton('=', color: Colors.orange, onPressed: _onEqualsPressed),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
