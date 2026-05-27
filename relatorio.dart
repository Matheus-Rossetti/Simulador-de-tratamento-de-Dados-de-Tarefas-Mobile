import 'tarefa.dart';
import 'dados.dart';

class Relatorio {
  final List<Tarefa> _tarefas;
  final Map<String, List<String>> _status;

  Relatorio._interno({required this._tarefas, required this._status});

  factory Relatorio() {
    final tarefas = dadosTarefas.map((e) => Tarefa.fromMap(e)).toList();

    final Map<String, List<String>> status = {
      "concluida": [],
      "em andamento": [],
      "pendente": [],
      "cancelada": [],
      "sem status": [],
    };

    for (var tarefa in tarefas) {
      status[tarefa.status]!.add(tarefa.titulo);
    }

    return Relatorio._interno(tarefas: tarefas, status: status);
  }

  void printarTarefas() {
    for (var tarefa in _tarefas) {
      print(tarefa);
    }
  }

  void printarRelatorio() {
    print("Tarefas concluídas");
    _status["concluida"]!.forEach((e) => print("-- $e"));
  }
}
