import 'tarefa.dart';
import 'dados.dart';
import 'relatorio.dart';

void printarPorStatus(List<Tarefa> tarefas, String status) => tarefas
    .where((e) => e.status == status)
    .forEach((e) => print("-- ${e.titulo}"));

double calcularMedia(List<Tarefa> tarefasPendentes) =>
    tarefasPendentes
        .map((e) => e.valor)
        .reduce((value, element) => value + element) /
    tarefasPendentes.length;

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
      .where((e) => e.status == "concluida")
      .map((e) => e.valor)
      .reduce((value, element) => value + element);
  print("\nTotal de tarefas concluidas: R\$ $total");

  final tarefasPendentes = tarefas
      .where((e) => e.status == "pendente")
      .toList();

  tarefasPendentes.isEmpty
      ? print("Não existem tarefas pendentes para calcular a média.")
      : print(
          "\nMédia de valor das tarefas pendentes: R\$ ${calcularMedia(tarefasPendentes)}",
        );

  final horasPorStatus = tarefas.fold(<String, int>{}, (map, tarefa) {
    map[tarefa.status] = map[tarefa.status]! + tarefa.horas;
    return map;
  });

  print("Horas por status:");
  horasPorStatus.forEach((status, horas) => print("$status: $horas"));

  // final relatorio = Relatorio.fromTarefas(tarefas);
  // relatorio.printarTarefas();
  // relatorio.printarPorStatus();
  // relatorio.printarValorTarefasConcluidas();
  // relatorio.printarMediaValorTarefasPendentes();
}
