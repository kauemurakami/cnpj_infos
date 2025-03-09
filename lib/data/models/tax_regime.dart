class RegimeTributario {
  int? ano;
  dynamic cnpjDaScp;
  String? formaDeTributacao;
  int? quantidadeDeEscrituracoes;

  RegimeTributario({this.ano, this.cnpjDaScp, this.formaDeTributacao, this.quantidadeDeEscrituracoes});

  factory RegimeTributario.fromJson(Map<String, dynamic> json) => RegimeTributario(
    ano: json["ano"],
    cnpjDaScp: json["cnpj_da_scp"],
    formaDeTributacao: json["forma_de_tributacao"],
    quantidadeDeEscrituracoes: json["quantidade_de_escrituracoes"],
  );

  Map<String, dynamic> toJson() => {
    "ano": ano,
    "cnpj_da_scp": cnpjDaScp,
    "forma_de_tributacao": formaDeTributacao,
    "quantidade_de_escrituracoes": quantidadeDeEscrituracoes,
  };
}
