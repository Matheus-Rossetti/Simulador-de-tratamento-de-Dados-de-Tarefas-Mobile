class Tarefa {
  int id;
  String titulo;
  String responsavel;
  String status;
  String prioridade;
  double valor;
  int horas;

  Tarefa({
    required this.id,
    required this.titulo,
    required this.responsavel,
    required this.status,
    required this.prioridade,
    required this.valor,
    required this.horas,
  });

  Tarefa.fromMap(Map<String, dynamic> map)
    : this.id = map["id"],
      this.titulo = (map["titulo"] as String?)?.trim() ?? "Sem título",
      this.responsavel =
          (map["responsavel"] as String?)?.trim() ?? "Não informado",
      this.status = (map["status"] as String?)?.trim() ?? "sem status",
      this.prioridade =
          (map["prioridade"] as String?)?.trim() ?? "sem prioridade",
      this.valor =
          double.tryParse(
            map["valor"]
                .replaceAll(RegExp(r'[^\d,.]'), "")
                .replaceAll(",", "."),
          ) ??
          0.0,
      this.horas = int.tryParse(map["horas"]) ?? 0;

  @override
  String toString() {
    return "id: ${this.id}, titulo: ${this.titulo}, responsavel: ${this.responsavel}, status: ${this.status}, prioridade: ${this.prioridade}, valor: ${this.valor}, horas: ${this.horas}";
  }
}
