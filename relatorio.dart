import 'tarefa.dart';

class RelatorioSimples {
  final int _totalTarefasAnalisadas;
  final int _totalConcluidas;
  final int _totalpendentes;
  final int _totalEmAndamento;
  final int _totalCanceladas;

  RelatorioSimples({
    required this._totalTarefasAnalisadas,
    required this._totalConcluidas,
    required this._totalpendentes,
    required this._totalEmAndamento,
    required this._totalCanceladas,
  });

  void gerar() => print('''
    Total de tarefas analisadas: $_totalTarefasAnalisadas
    Tarefas concluidas: $_totalConcluidas
    Tarefas pendentes: $_totalpendentes
    Tarefas em andamento: $_totalEmAndamento
    Tarefas canceladas: $_totalCanceladas
    ''');
}

final class RelatorioCompleto extends RelatorioSimples {
  final double _valorTotalConcluidas;
  final double _mediaValorPendentes;
  final int _totalHorasConcluidas;
  final Set<String> _statusEncontrados;
  final Map<int, String> _tarefasComDadosIncompletos;

  RelatorioCompleto({
    required int totalTarefasAnalisadas,
    required int totalConcluidas,
    required int totalpendentes,
    required int totalEmAndamento,
    required int totalCanceladas,
    required this._valorTotalConcluidas,
    required this._mediaValorPendentes,
    required this._totalHorasConcluidas,
    required this._statusEncontrados,
    required this._tarefasComDadosIncompletos,
  }) : super(
         totalConcluidas: totalConcluidas,
         totalEmAndamento: totalEmAndamento,
         totalpendentes: totalpendentes,
         totalCanceladas: totalCanceladas,
         totalTarefasAnalisadas: totalTarefasAnalisadas,
       );

  @override
  void gerar() {
    super.gerar();
    print('''

      Valor total das concluídas: R\$ $_valorTotalConcluidas
      Média de valor das pendentes: R\$ $_mediaValorPendentes
      Total de horas concluídas: $_totalHorasConcluidas

      Status encontrados:
      $_statusEncontrados

      Tarefas com dados incompletos:
      $_tarefasComDadosIncompletos
      ''');
  }
}
