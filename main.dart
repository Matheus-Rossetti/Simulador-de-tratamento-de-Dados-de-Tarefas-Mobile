import 'relatorio.dart';

void main() {
  final relatorio = Relatorio();
  relatorio.printarTarefas();
  relatorio.printarPorStatus();
  relatorio.printarValorTarefasConcluidas();
  relatorio.printarMediaValorTarefasPendentes();
}
