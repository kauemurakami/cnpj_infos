class Qsa {
  dynamic pais;
  String? nomeSocio;
  dynamic codigoPais;
  String? faixaEtaria;
  String? cnpjCpfDoSocio;
  String? qualificacaoSocio;
  int? codigoFaixaEtaria;
  DateTime? dataEntradaSociedade;
  int? identificadorDeSocio;
  String? cpfRepresentanteLegal;
  String? nomeRepresentanteLegal;
  int? codigoQualificacaoSocio;
  String? qualificacaoRepresentanteLegal;
  int? codigoQualificacaoRepresentanteLegal;

  Qsa({
    this.pais,
    this.nomeSocio,
    this.codigoPais,
    this.faixaEtaria,
    this.cnpjCpfDoSocio,
    this.qualificacaoSocio,
    this.codigoFaixaEtaria,
    this.dataEntradaSociedade,
    this.identificadorDeSocio,
    this.cpfRepresentanteLegal,
    this.nomeRepresentanteLegal,
    this.codigoQualificacaoSocio,
    this.qualificacaoRepresentanteLegal,
    this.codigoQualificacaoRepresentanteLegal,
  });

  factory Qsa.fromJson(Map<String, dynamic> json) => Qsa(
    pais: json["pais"],
    nomeSocio: json["nome_socio"],
    codigoPais: json["codigo_pais"],
    faixaEtaria: json["faixa_etaria"],
    cnpjCpfDoSocio: json["cnpj_cpf_do_socio"],
    qualificacaoSocio: json["qualificacao_socio"],
    codigoFaixaEtaria: json["codigo_faixa_etaria"],
    dataEntradaSociedade: DateTime.parse(json["data_entrada_sociedade"]),
    identificadorDeSocio: json["identificador_de_socio"],
    cpfRepresentanteLegal: json["cpf_representante_legal"],
    nomeRepresentanteLegal: json["nome_representante_legal"],
    codigoQualificacaoSocio: json["codigo_qualifica?cao_socio"],
    qualificacaoRepresentanteLegal: json["qualificacao_representante_legal"],
    codigoQualificacaoRepresentanteLegal: json["codigo_qualificacao_representante_legal"],
  );

  Map<String, dynamic> toJson() => {
    "pais": pais,
    "nome_socio": nomeSocio,
    "codigo_pais": codigoPais,
    "faixa_etaria": faixaEtaria,
    "cnpj_cpf_do_socio": cnpjCpfDoSocio,
    "qualificacao_socio": qualificacaoSocio,
    "codigo_faixa_etaria": codigoFaixaEtaria,
    "data_entrada_sociedade":
        "${dataEntradaSociedade?.year.toString().padLeft(4, '0')}-${dataEntradaSociedade?.month.toString().padLeft(2, '0')}-${dataEntradaSociedade?.day.toString().padLeft(2, '0')}",
    "identificador_de_socio": identificadorDeSocio,
    "cpf_representante_legal": cpfRepresentanteLegal,
    "nome_representante_legal": nomeRepresentanteLegal,
    "codigo_qualificacao_socio": codigoQualificacaoSocio,
    "qualificacao_representante_legal": qualificacaoRepresentanteLegal,
    "codigo_qualificacao_representante_legal": codigoQualificacaoRepresentanteLegal,
  };
}
