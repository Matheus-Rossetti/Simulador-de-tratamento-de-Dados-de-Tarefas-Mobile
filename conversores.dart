String? filtrarTexto(String? texto) {
  if (texto == null) return null;

  return texto.trim();
}

double? converterValor(String? valor) {
  if (valor == null) return null;

  return double.tryParse(
    valor.replaceAll(RegExp(r'[^\d,.]'), "").replaceAll(",", "."),
  );
}

int? converterHoras(String? horas) {
  if (horas == null) return null;

  return int.tryParse(horas);
}
