import 'tarefa.dart';
import 'dados.dart';
import 'relatorio.dart';

void main() {
  final tarefas = dadosTarefas.map((e) => Tarefa.fromMap(e)).toList();

  final relatorio = Relatorio.fromTarefas(tarefas);
  relatorio.printarTarefas();
  relatorio.printarPorStatus();
  relatorio.printarValorTarefasConcluidas();
  relatorio.printarMediaValorTarefasPendentes();
}
