import 'dados.dart';
import 'tarefa.dart';

void main() {
  final tarefa = Tarefa.fromMap(dadosTarefas[0]);

  print(tarefa);
}
