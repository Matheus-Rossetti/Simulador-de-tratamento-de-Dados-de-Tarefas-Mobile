import 'tarefa.dart';
import 'dados.dart';
import 'relatorio.dart';

void printarPorStatus(List<Tarefa> tarefas, String status) {
  tarefas
      .where((e) => e.status == status)
      .forEach((e) => print("-- ${e.titulo}"));
}

void main() {
  final tarefas = dadosTarefas.map((e) => Tarefa.fromMap(e)).toList();

  print("\nTarefas:");
  for (var tarefa in tarefas) {
    print(tarefa);
  }

  print("\nTarefas Concluidas:");
  printarPorStatus(tarefas, "concluida");

  print("\nTarefas Pendentes:");
  printarPorStatus(tarefas, "pendente");

  print("\nTarefas Em Andamento:");
  printarPorStatus(tarefas, "em andamento");

  print("\nTarefas Canceladas:");
  printarPorStatus(tarefas, "cancelada");

  final total = tarefas
      .where((e) => e.status == 'concluida')
      .map((e) => e.valor)
      .reduce((value, element) => value + element);
  print("\nTotal de tarefas concluidas: R\$ $total");
  // final relatorio = Relatorio.fromTarefas(tarefas);
  // relatorio.printarTarefas();
  // relatorio.printarPorStatus();
  // relatorio.printarValorTarefasConcluidas();
  // relatorio.printarMediaValorTarefasPendentes();
}
