import 'tarefa.dart';
import 'dados.dart';

class Relatorio {
  final List<Tarefa> _tarefas;

  Relatorio._interno(List<Tarefa> tarefas) : _tarefas = tarefas;

  factory Relatorio() {
    final tarefas = dadosTarefas.map((e) => Tarefa.fromMap(e)).toList();

    return Relatorio._interno(tarefas);
  }

  int get quantidadeTotal => _tarefas.length;

  void printarTarefas() {
    for (var tarefa in _tarefas) {
      print(tarefa);
    }
  }
}
