import 'tarefa.dart';
import 'dados.dart';

class Relatorio {
  final List<Tarefa> _tarefas;
  final Map<String, List<String>> _status;
  final double _totalTarefasConcluidas;

  Relatorio._interno({
    required this._tarefas,
    required this._status,
    required this._totalTarefasConcluidas,
  });

  factory Relatorio() {
    final tarefas = dadosTarefas.map((e) => Tarefa.fromMap(e)).toList();

    final Map<String, List<String>> status = {
      "concluida": [],
      "em andamento": [],
      "pendente": [],
      "cancelada": [],
      "sem status": [],
    };

    double totalTarefasConcluidas = 0;

    for (var tarefa in tarefas) {
      status[tarefa.status]!.add(tarefa.titulo);

      if (tarefa.status == "concluida") {
        totalTarefasConcluidas += tarefa.valor;
      }
    }

    return Relatorio._interno(
      tarefas: tarefas,
      status: status,
      totalTarefasConcluidas: totalTarefasConcluidas,
    );
  }

  void printarTarefas() {
    for (var tarefa in _tarefas) {
      print(tarefa);
    }
  }

  void printarPorStatus() {
    print("\nTarefas concluídas");
    _status["concluida"]!.forEach((e) => print("-- $e"));

    print("\nTarefas em andamento");
    _status["em andamento"]!.forEach((e) => print("-- $e"));

    print("\nTarefas pendentes");
    _status["pendente"]!.forEach((e) => print("-- $e"));

    print("\nTarefas canceladas");
    _status["cancelada"]!.forEach((e) => print("-- $e"));

    print("\nTarefas sem status");
    _status["sem status"]!.forEach((e) => print("-- $e"));
  }

  void printarValorTarefasConcluidas() {
    print(
      "\nTotal de tarefas concluídas R\$ ${_totalTarefasConcluidas.toString().replaceAll(".", ",")}",
    );
  }
}
