import 'package:flutter/material.dart';

void main() =>
    runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // lógica
  Color cor = Colors.white;

  int cont = 0;
  String num1 = '';
  var num2 = '';
  var num3 = '';
  var operacao = '';
  void calcular(String digito, String number, var ve) {
    switch (digito) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case '.':
        setState(() {
          num1 += digito;
        });
        break;
      case 'AC':
        setState(() {
          num1 = '';
        });
        break;
      case '+/-':
        setState(() {
          double val = 0;
          val = double.parse(number);
          val *= -1;
          num1 = val.toString();
        });
        break;
      case 'X':
        setState(() {
          num2 = number;
          operacao = digito;
          calcular('AC', number, ve);
          cont += 1;
          operacao = 'X';
        });
        break;
      case '+':
        setState(() {
          num2 = number;
          operacao = digito;
          calcular('AC', number, ve);
          cont += 1;
          operacao = '+';
        });
        break;
      case '-':
        setState(() {
          num2 = number;
          operacao = digito;
          calcular('AC', number, ve);
          cont += 1;
          operacao = '-';
        });
        break;
      case '%':
        setState(() {
          num2 = number;
          operacao = digito;
          calcular('AC', number, ve);
          cont += 1;
          operacao = '%';
        });
        break;
      case '/':
        setState(() {
          num2 = number;
          operacao = digito;
          calcular('AC', number, ve);
          cont += 1;
          operacao = '/';
        });
        break;
      case 'Del':
        setState(() {
          num1 = num1.substring(0, num1.length - 1);
        });
        break;
      case '=':
        if (operacao == 'X') {
          setState(() {
            num3 = number;
            double res = 0;
            res = double.parse(num2) * double.parse(num3);
            num1 = res.toString();
          });
        } else if (operacao == '%') {
          setState(() {
            num3 = number;
            double res = 0;
            res = double.parse(num2) * double.parse(num3) / 100;
            num1 = res.toString();
          });
        } else if (operacao == '/') {
          setState(() {
            num3 = number;
            double res = 0;
            res = double.parse(num2) / double.parse(num3);
            num1 = res.toString();
          });
        } else if (operacao == '-') {
          setState(() {
            num3 = number;
            double res = 0;
            res = double.parse(num2) - double.parse(num3);
            num1 = res.toString();
          });
        } else if (operacao == '+') {
          setState(() {
            num3 = number;
            double res = 0;
            res = double.parse(num2) + double.parse(num3);
            num1 = res.toString();
          });
        } else {
          setState(() {
            num1 = 'Invalido!';
          });
        }
        break;
      default:
        num1 = '';
        break;
    }
  }

  // estilização
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Calculadora' ),
        ),
        body: Container(
          color: Color.fromARGB(255, 36, 30, 30)
          ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Color.fromARGB(136, 177, 163, 163),
                padding: EdgeInsets.all(10),
                child: Row( 
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          num1,
                          style: TextStyle(fontSize: 50,color: cor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row( 
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => calcular('AC', '', ''),
                    child: const Text(
                      'AC',
                      style: TextStyle(
                        fontSize: 45,color: Colors.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => calcular('+/-', num1, ''),
                    child: Text(
                      '+/-',
                      style: TextStyle(fontSize: 45,color: cor),
                    ),
                  ),
                   GestureDetector(
                    onTap: () => calcular('%', num1, ''),
                    child: Text(
                      '%',
                      style: TextStyle(fontSize: 45,color: cor),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => calcular('/', num1, ''),
                    child: Text(
                      '/',
                      style: TextStyle(fontSize: 45,color: cor),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => calcular('7', '', ''),
                    child: Text(
                      '7',
                      style: TextStyle(fontSize: 45,color: cor),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => calcular('8', '', ''),
                    child: Text(
                      '8',
                      style: TextStyle(fontSize: 45,color: cor),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => calcular('9', '', ''),
                    child: Text(
                      '9',
                      style: TextStyle(fontSize: 45,color: cor),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => calcular('X', num1, ''),
                    child: Text(
                      'X',
                      style: TextStyle(fontSize: 45,color: cor),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => calcular('4', '', ''),
                    child: Text(
                      '4',
                      style: TextStyle(fontSize: 45,color: cor),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => calcular('5', '', ''),
                    child: Text(
                      '5',
                      style: TextStyle(fontSize: 45,color: cor),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => calcular('6', '', ''),
                    child: Text(
                      '6',
                      style: TextStyle(fontSize: 45,color: cor),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      calcular('-', num1, '');
                    },
                    child: Text(
                      '-',
                      style: TextStyle(fontSize: 45,color: cor),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => calcular('1', '', ''),
                    child: Text(
                      '1',
                      style: TextStyle(fontSize: 45,color: cor),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => calcular('2', '', ''),
                    child: Text(
                      '2',
                      style: TextStyle(fontSize: 45,color: cor),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => calcular('3', '', ''),
                    child: Text(
                      '3',
                      style: TextStyle(fontSize: 45,color: cor),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => calcular('+', num1, ''),
                    child: Text(
                      '+',
                      style: TextStyle(fontSize: 45,color: cor),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => calcular('0', '', ''),
                    child: Text(
                      '0',
                      style: TextStyle(fontSize: 45,color: cor),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => calcular('.', '', ''),
                    child: Text(
                      ',',
                      style: TextStyle(fontSize: 45,color: cor),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => calcular('Del', '', ''),
                    child: Text(
                      'Del',
                      style: TextStyle(fontSize: 45,color: cor),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => calcular('=', num1, ''),
                    child: Text(
                      '=',
                      style: TextStyle(fontSize: 45,color: cor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}