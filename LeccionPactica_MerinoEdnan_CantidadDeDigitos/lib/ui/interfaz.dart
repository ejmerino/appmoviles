import 'package:flutter/material.dart';
import '../logical/ingreso_digitos.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';
  final FocusNode _focusNode = FocusNode();

  void _calculateDigits() {
    setState(() {
      String input = _controller.text;
      if (input.isEmpty || input.length > 4 || int.tryParse(input) == null) {
        _result = 'Por favor ingrese un número válido (hasta 4 dígitos)';
      } else {
        _result = DigitCounter.countDigits(input);
      }
    });
    _focusNode.unfocus(); // Cierra el teclado al presionar el botón
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador de Dígitos'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Imagen agregada al inicio
              Image.asset('assets/images/contador_icon.png', height: 100),

              // Espaciado extra alrededor del TextField
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    labelText: 'Ingrese un número',
                    border: OutlineInputBorder(),
                    hintText: 'Máximo 4 dígitos',
                    //errorText: _result.isEmpty || _result.startsWith('Por favor') ? null : 'Número inválido',
                  ),
                  maxLength: 4,
                  onChanged: (value) {
                    // Limpiar el mensaje de error cuando el usuario empiece a escribir
                    if (value.isNotEmpty && value.length <= 4) {
                      setState(() {
                        _result = ''; // Limpiar el mensaje de error
                      });
                    }
                  },
                ),
              ),
              SizedBox(height: 20),

              // Botón mejorado con icono y texto más visible
              ElevatedButton.icon(
                onPressed: _calculateDigits,
                icon: Icon(Icons.calculate, size: 20), // Ícono en el botón
                label: Text(
                  'Calcular',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Botón con bordes redondeados
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Estilo del texto de resultado con sombra y tamaño aumentado
              Text(
                _result,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: _result.startsWith('Por favor') ? Colors.red : Colors.teal,
                  shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Colors.black45,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
