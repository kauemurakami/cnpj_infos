import 'package:cnpj_infos/core/utils/functions/format_date.dart';
import 'package:cnpj_infos/data/models/qsa.dart';
import 'package:cnpj_infos/data/models/secondary_cnaes.dart';
import 'package:cnpj_infos/data/models/tax_regime.dart';
import 'package:flutter/material.dart';

class ExpandItemWidget<T> extends StatelessWidget {
  const ExpandItemWidget({super.key, required this.list, required this.title});

  final List<T> list;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: TextStyle(color: Colors.purple),
      ),
      children: _buildChildren(list, context),
    );
  }

  // Método para construir os filhos da lista
  List<Widget> _buildChildren(List<T> list, BuildContext context) {
    if (T == CnaesSecundario) {
      // Se a lista for do tipo CnaesSecundario
      return list.map<Widget>((cnae) {
        return ListTile(
          title: Row(
            spacing: 4.0,
            children: [
              Text(
                '${(cnae as CnaesSecundario).codigo} ',
                style: TextStyle(color: Colors.purple),
              ),
              Flexible(child: Text('${(cnae as CnaesSecundario).descricao}')),
            ],
          ),
        );
      }).toList();
    } else if (T == Qsa) {
      // Se a lista for do tipo Qsa
      return list.map<Widget>((qsa) {
        return ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(child: Text((qsa as Qsa).nomeSocio!)),
                ],
              ),
              Row(
                children: [
                  Text(
                    '${(qsa as Qsa).qualificacaoSocio}',
                    style: TextTheme.of(context).labelMedium,
                  ),
                  Text(
                    ' desde ${formatDate((qsa as Qsa).dataEntradaSociedade)}',
                    style: TextTheme.of(context).labelMedium,
                  ),
                ],
              ),
              Text(
                'Faixa etária ${(qsa as Qsa).faixaEtaria}',
                style: TextTheme.of(context).labelMedium,
              ),
              Text(
                'CNPJ CPF sócio ${(qsa as Qsa).cnpjCpfDoSocio}',
                style: TextTheme.of(context).labelMedium,
              ),
              Text(
                'CPF representante legal ${(qsa as Qsa).cpfRepresentanteLegal}',
                style: TextTheme.of(context).labelMedium,
              ),
              Text(
                'Qaulificação representante legal ${(qsa as Qsa).qualificacaoRepresentanteLegal}',
                style: TextTheme.of(context).labelMedium,
              ),
            ],
          ),
        );
      }).toList();
    } else if (T == RegimeTributario) {
      return list.map<Widget>((regime) {
        return ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ano: ${(regime as RegimeTributario).ano ?? 'Não especificado'}'),
              Text('CNPJ da SCP: ${(regime as RegimeTributario).cnpjDaScp ?? 'Não especificado'}'),
              Text('Forma de Tributação: ${(regime as RegimeTributario).formaDeTributacao ?? 'Não especificada'}'),
              Text(
                  'Quantidade de Escriturações: ${(regime as RegimeTributario).quantidadeDeEscrituracoes ?? 'Não especificada'}'),
            ],
          ),
        );
      }).toList();
    } else {
      // Caso não seja nenhum dos tipos esperados
      return [];
    }
  }
}
