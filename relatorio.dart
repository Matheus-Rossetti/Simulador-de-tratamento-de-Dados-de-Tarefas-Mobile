import 'tarefa.dart';

class Relatorio {
  final int _totalTarefasAnalisadas;
  final int _totalTarefasConcluidas;
  final int _totalTarefasEmAndamento;
  final int _totalTarefasCanceladas;

  final double _valorTotalConcluidas;
  final double _valorTotalPendentes;
  final int _totalHorasConcluidas;

  final Set<String> statusEncontrados;

  final Map<String, List<String>> _status;
  final double _valorTotalTarefasConcluidas;
  final double _valorTotalTarefasPendentes;

  Relatorio._interno({
    required this._status,
    required this._valorTotalTarefasConcluidas,
    required this._valorTotalTarefasPendentes,
  });

  factory Relatorio.fromTarefas(List<Tarefa> tarefas) {
    final Map<String, List<String>> status = {
      "concluida": [],
      "em andamento": [],
      "pendente": [],
      "cancelada": [],
      "sem status": [],
    };

    double valorTotalTarefasConcluidas = 0;
    double valorTotalTarefasPendentes = 0;

    for (var tarefa in tarefas) {
      status[tarefa.status]!.add(tarefa.titulo);

      if (tarefa.status == "concluida") {
        valorTotalTarefasConcluidas += tarefa.valor;
      }

      if (tarefa.status == "pendente") {
        valorTotalTarefasPendentes += tarefa.valor;
      }
    }

    return Relatorio._interno(
      tarefas: tarefas,
      status: status,
      valorTotalTarefasConcluidas: valorTotalTarefasConcluidas,
      valorTotalTarefasPendentes: valorTotalTarefasPendentes,
    );
  }

  void printarValorTarefasConcluidas() {
    print(
      "\nTotal de tarefas concluídas: R\$ ${_valorTotalTarefasConcluidas.toString().replaceAll(".", ",")}",
    );
  }

  void printarMediaValorTarefasPendentes() {
    _status["pendente"]!.isEmpty
        ? print("\nNão existem tarefas pendentes para calcular a média")
        : print(
            "\nMédia de valor das tarefas pendentes: R\$ ${_valorTotalTarefasPendentes / _status["pendente"]!.length}",
          );
  }
}
