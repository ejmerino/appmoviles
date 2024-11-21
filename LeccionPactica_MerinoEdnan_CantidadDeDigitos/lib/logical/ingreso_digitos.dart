class DigitCounter {
  static String countDigits(String input) {
    if (input.isEmpty) {
      return 'Por favor, ingrese un número';
    }

    int number = int.tryParse(input) ?? -1;

    if (number == -1) {
      return 'Solo se permiten números enteros';
    }

    if (number < 0) {
      return 'El número no puede ser negativo';
    }

    if (input.length > 4) {
      return 'El número no puede tener más de 4 dígitos';
    }

    if (number == 1){
      return 'El número tiene ${input.length} dígito';
    }

    return 'El número tiene ${input.length} dígitos';
  }
}
