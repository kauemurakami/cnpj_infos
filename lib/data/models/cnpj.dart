import 'dart:convert';

import 'package:cnpj_infos/data/models/qsa.dart';
import 'package:cnpj_infos/data/models/secondary_cnaes.dart';
import 'package:cnpj_infos/data/models/tax_regime.dart';

Cnpj cnpjFromJson(String str) => Cnpj.fromJson(json.decode(str));

String cnpjToJson(Cnpj data) => json.encode(data.toJson());

class Cnpj {
  String? uf;
  String? cep;
  List<Qsa>? qsa;
  String? cnpj;
  dynamic pais;
  dynamic email;
  String? porte;
  String? bairro;
  String? numero;
  String? dddFax;
  String? municipio;
  String? logradouro;
  int? cnaeFiscal;
  dynamic codigoPais;
  String? complemento;
  int? codigoPorte;
  String? razaoSocial;
  String? nomeFantasia;
  int? capitalSocial;
  String? dddTelefone1;
  String? dddTelefone2;
  dynamic opcaoPeloMei;
  String? descricaoPorte;
  int? codigoMunicipio;
  List<CnaesSecundario>? cnaesSecundarios;
  String? naturezaJuridica;
  List<RegimeTributario>? regimeTributario;
  String? situacaoEspecial;
  dynamic opcaoPeloSimples;
  int? situacaoCadastral;
  dynamic dataOpcaoPeloMei;
  dynamic dataExclusaoDoMei;
  String? cnaeFiscalDescricao;
  int? codigoMunicipioIbge;
  DateTime? dataInicioAtividade;
  dynamic dataSituacaoEspecial;
  dynamic dataOpcaoPeloSimples;
  DateTime? dataSituacaoCadastral;
  String? nomeCidadeNoExterior;
  int? codigoNaturezaJuridica;
  dynamic dataExclusaoDoSimples;
  int? motivoSituacaoCadastral;
  String? enteFederativoResponsavel;
  int? identificadorMatrizFilial;
  int? qualificacaoDoResponsavel;
  String? descricaoSituacaoCadastral;
  String? descricaoTipoDeLogradouro;
  String? descricaoMotivoSituacaoCadastral;
  String? descricaoIdentificadorMatrizFilial;

  Cnpj({
    this.uf,
    this.cep,
    this.qsa,
    this.cnpj,
    this.pais,
    this.email,
    this.porte,
    this.bairro,
    this.numero,
    this.dddFax,
    this.municipio,
    this.logradouro,
    this.cnaeFiscal,
    this.codigoPais,
    this.complemento,
    this.codigoPorte,
    this.razaoSocial,
    this.nomeFantasia,
    this.capitalSocial,
    this.dddTelefone1,
    this.dddTelefone2,
    this.opcaoPeloMei,
    this.descricaoPorte,
    this.codigoMunicipio,
    this.cnaesSecundarios,
    this.naturezaJuridica,
    this.regimeTributario,
    this.situacaoEspecial,
    this.opcaoPeloSimples,
    this.situacaoCadastral,
    this.dataOpcaoPeloMei,
    this.dataExclusaoDoMei,
    this.cnaeFiscalDescricao,
    this.codigoMunicipioIbge,
    this.dataInicioAtividade,
    this.dataSituacaoEspecial,
    this.dataOpcaoPeloSimples,
    this.dataSituacaoCadastral,
    this.nomeCidadeNoExterior,
    this.codigoNaturezaJuridica,
    this.dataExclusaoDoSimples,
    this.motivoSituacaoCadastral,
    this.enteFederativoResponsavel,
    this.identificadorMatrizFilial,
    this.qualificacaoDoResponsavel,
    this.descricaoSituacaoCadastral,
    this.descricaoTipoDeLogradouro,
    this.descricaoMotivoSituacaoCadastral,
    this.descricaoIdentificadorMatrizFilial,
  });

  factory Cnpj.fromJson(Map<String, dynamic> json) => Cnpj(
    uf: json["uf"],
    cep: json["cep"],
    qsa: List<Qsa>.from(json["qsa"].map((x) => Qsa.fromJson(x))),
    cnpj: json["cnpj"],
    pais: json["pais"],
    email: json["email"],
    porte: json["porte"],
    bairro: json["bairro"],
    numero: json["numero"],
    dddFax: json["ddd_fax"],
    municipio: json["municipio"],
    logradouro: json["logradouro"],
    cnaeFiscal: json["cnae_fiscal"],
    codigoPais: json["codigo_pais"],
    complemento: json["complemento"],
    codigoPorte: json["codigo_porte"],
    razaoSocial: json["razao_social"],
    nomeFantasia: json["nome_fantasia"],
    capitalSocial: json["capital_social"],
    dddTelefone1: json["ddd_telefone_1"],
    dddTelefone2: json["ddd_telefone_2"],
    opcaoPeloMei: json["opcao_pelo_mei"],
    descricaoPorte: json["descricao_porte"],
    codigoMunicipio: json["codigo_municipio"],
    cnaesSecundarios: List<CnaesSecundario>.from(json["cnaes_secundarios"].map((x) => CnaesSecundario.fromJson(x))),
    naturezaJuridica: json["natureza_juridica"],
    regimeTributario: List<RegimeTributario>.from(json["regime_tributario"].map((x) => RegimeTributario.fromJson(x))),
    situacaoEspecial: json["situacao_especial"],
    opcaoPeloSimples: json["opcao_pelo_simples"],
    situacaoCadastral: json["situacao_cadastral"],
    dataOpcaoPeloMei: json["data_opcao_pelo_mei"],
    dataExclusaoDoMei: json["data_exclusao_do_mei"],
    cnaeFiscalDescricao: json["cnae_fiscal_descricao"],
    codigoMunicipioIbge: json["codigo_municipio_ibge"],
    dataInicioAtividade: DateTime.parse(json["data_inicio_atividade"]),
    dataSituacaoEspecial: json["data_situacao_especial"],
    dataOpcaoPeloSimples: json["data_opcao_pelo_simples"],
    dataSituacaoCadastral: DateTime.parse(json["data_situacao_cadastral"]),
    nomeCidadeNoExterior: json["nome_cidade_no_exterior"],
    codigoNaturezaJuridica: json["codigo_natureza_juridica"],
    dataExclusaoDoSimples: json["data_exclusao_do_simples"],
    motivoSituacaoCadastral: json["motivo_situacao_cadastral"],
    enteFederativoResponsavel: json["ente_federativo_responsavel"],
    identificadorMatrizFilial: json["identificador_matriz_filial"],
    qualificacaoDoResponsavel: json["qualificacao_do_responsavel"],
    descricaoSituacaoCadastral: json["descricao_situacao_cadastral"],
    descricaoTipoDeLogradouro: json["descricao_tipo_de_logradouro"],
    descricaoMotivoSituacaoCadastral: json["descricao_motivo_situacao_cadastral"],
    descricaoIdentificadorMatrizFilial: json["descricao_identificador_matriz_filial"],
  );

  Map<String, dynamic> toJson() => {
    "uf": uf,
    "cep": cep,
    "qsa": List<dynamic>.from(qsa!.map((x) => x.toJson())),
    "cnpj": cnpj,
    "pais": pais,
    "email": email,
    "porte": porte,
    "bairro": bairro,
    "numero": numero,
    "ddd_fax": dddFax,
    "municipio": municipio,
    "logradouro": logradouro,
    "cnae_fiscal": cnaeFiscal,
    "codigo_pais": codigoPais,
    "complemento": complemento,
    "codigo_porte": codigoPorte,
    "razao_social": razaoSocial,
    "nome_fantasia": nomeFantasia,
    "capital_social": capitalSocial,
    "ddd_telefone_1": dddTelefone1,
    "ddd_telefone_2": dddTelefone2,
    "opcao_pelo_mei": opcaoPeloMei,
    "descricao_porte": descricaoPorte,
    "codigo_municipio": codigoMunicipio,
    "cnaes_secundarios": List<dynamic>.from(cnaesSecundarios!.map((x) => x.toJson())),
    "natureza_juridica": naturezaJuridica,
    "regime_tributario": List<dynamic>.from(regimeTributario!.map((x) => x.toJson())),
    "situacao_especial": situacaoEspecial,
    "opcao_pelo_simples": opcaoPeloSimples,
    "situacao_cadastral": situacaoCadastral,
    "data_opcao_pelo_mei": dataOpcaoPeloMei,
    "data_exclusao_do_mei": dataExclusaoDoMei,
    "cnae_fiscal_descricao": cnaeFiscalDescricao,
    "codigo_municipio_ibge": codigoMunicipioIbge,
    "data_inicio_atividade":
        "${dataInicioAtividade?.year.toString().padLeft(4, '0')}-${dataInicioAtividade?.month.toString().padLeft(2, '0')}-${dataInicioAtividade?.day.toString().padLeft(2, '0')}",
    "data_situacao_especial": dataSituacaoEspecial,
    "data_opcao_pelo_simples": dataOpcaoPeloSimples,
    "data_situacao_cadastral":
        "${dataSituacaoCadastral?.year.toString().padLeft(4, '0')}-${dataSituacaoCadastral?.month.toString().padLeft(2, '0')}-${dataSituacaoCadastral?.day.toString().padLeft(2, '0')}",
    "nome_cidade_no_exterior": nomeCidadeNoExterior,
    "codigo_natureza_juridica": codigoNaturezaJuridica,
    "data_exclusao_do_simples": dataExclusaoDoSimples,
    "motivo_situacao_cadastral": motivoSituacaoCadastral,
    "ente_federativo_responsavel": enteFederativoResponsavel,
    "identificador_matriz_filial": identificadorMatrizFilial,
    "qualificacao_do_responsavel": qualificacaoDoResponsavel,
    "descricao_situacao_cadastral": descricaoSituacaoCadastral,
    "descricao_tipo_de_logradouro": descricaoTipoDeLogradouro,
    "descricao_motivo_situacao_cadastral": descricaoMotivoSituacaoCadastral,
    "descricao_identificador_matriz_filial": descricaoIdentificadorMatrizFilial,
  };
}
