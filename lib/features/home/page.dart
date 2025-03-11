import 'package:cnpj_infos/core/utils/functions/format_date.dart';
import 'package:cnpj_infos/core/utils/functions/format_phone.dart';
import 'package:cnpj_infos/data/models/cnpj.dart';
import 'package:cnpj_infos/data/models/qsa.dart';
import 'package:cnpj_infos/data/models/secondary_cnaes.dart';
import 'package:cnpj_infos/data/models/tax_regime.dart';
import 'package:cnpj_infos/features/home/provider.dart';
import 'package:cnpj_infos/features/home/widgets/app_bar.dart';
import 'package:cnpj_infos/features/home/widgets/expand_items.dart';
import 'package:cnpj_infos/features/home/widgets/text_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeProvider provider = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBarWidget(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ValueListenableBuilder(
            valueListenable: provider.cnpj,
            builder: (context, Cnpj cnpj, child) => cnpj.razaoSocial == null
                ? Center(
                    child: Text('Digite e procure por um CNPJ no campo acima'),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                '${cnpj.razaoSocial}',
                                style: TextTheme.of(context).titleMedium,
                              ),
                            ),
                            Text(
                              '${cnpj.cnpj}',
                              style: TextTheme.of(context).labelSmall,
                            ),
                          ],
                        ),
                        TextItemWidget(
                          title: 'Nome fantasia',
                          value: cnpj.nomeFantasia,
                        ),
                        TextItemWidget(
                          title: 'Situação cadastral',
                          value: cnpj.descricaoSituacaoCadastral,
                        ),
                        TextItemWidget(
                          title: 'Natureza jurídica',
                          value: cnpj.naturezaJuridica,
                        ),
                        TextItemWidget(
                          title: 'Início das atividades',
                          value: formatDate(cnpj.dataInicioAtividade),
                        ),
                        TextItemWidget(
                          title: 'Cnae fiscal',
                          value: cnpj.cnaeFiscal.toString(),
                        ),
                        TextItemWidget(
                          title: 'Porte',
                          value: cnpj.porte,
                        ),
                        TextItemWidget(
                          title: 'Bairro',
                          value: cnpj.bairro,
                        ),
                        Row(
                          spacing: 16.0,
                          children: [
                            TextItemWidget(
                              title: 'Logradouro',
                              value: cnpj.logradouro,
                            ),
                            TextItemWidget(
                              title: 'Número',
                              value: cnpj.numero,
                            ),
                          ],
                        ),
                        TextItemWidget(
                          title: 'Municipio',
                          value: cnpj.municipio,
                        ),
                        TextItemWidget(
                          title: 'Email',
                          value: cnpj.email,
                        ),
                        TextItemWidget(
                          title: 'DDD Fax',
                          value: formatPhoneNumber(cnpj.dddFax),
                        ),
                        TextItemWidget(
                          title: 'DDD Telefone 1',
                          value: formatPhoneNumber(cnpj.dddTelefone1),
                        ),
                        TextItemWidget(
                          title: 'DDD Telefone 2',
                          value: formatPhoneNumber(cnpj.dddTelefone2),
                        ),
                        cnpj.cnaesSecundarios == null
                            ? const SizedBox.shrink()
                            : ExpandItemWidget<CnaesSecundario>(
                                list: cnpj.cnaesSecundarios!,
                                title: 'Cnae\'s secundários',
                              ),
                        cnpj.qsa == null
                            ? const SizedBox.shrink()
                            : ExpandItemWidget<Qsa>(
                                list: cnpj.qsa!,
                                title: 'Principais sócios',
                              ),
                        cnpj.qsa == null
                            ? const SizedBox.shrink()
                            : ExpandItemWidget<RegimeTributario>(
                                list: cnpj.regimeTributario!,
                                title: 'Regime tributário',
                              ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
