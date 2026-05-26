import 'conversores.dart';

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
      this.titulo = filtrarTexto(map["titulo"]) ?? "Sem título",
      this.responsavel = filtrarTexto(map["responsavel"]) ?? "Não informado",
      this.status = filtrarTexto(map["status"]) ?? "sem status",
      this.prioridade = filtrarTexto(map["prioridade"]) ?? "sem prioridade",
      this.valor = converterValor(map["valor"]) ?? 0.0,
      this.horas = converterHoras(map["horas"]) ?? 0;

  @override
  String toString() {
    return '''
    ID: ${this.id},
    Título: ${this.titulo},
    Responsável: ${this.responsavel},
    Status: ${this.status},
    Prioridade: ${this.prioridade},
    Valor: R\$ ${this.valor},
    Horas: ${this.horas}
    ''';
  }
}
