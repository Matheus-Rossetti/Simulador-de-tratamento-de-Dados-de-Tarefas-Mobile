import 'dados.dart';
import 'tarefa.dart';

void main() {
  final tarefas = dadosTarefas.map((e) => Tarefa.fromMap(e)).toList();

  for (var tarefa in tarefas) {
    print(tarefa);
  }
}
