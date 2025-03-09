class CnaesSecundario {
  int? codigo;
  String? descricao;

  CnaesSecundario({this.codigo, this.descricao});

  factory CnaesSecundario.fromJson(Map<String, dynamic> json) =>
      CnaesSecundario(codigo: json["codigo"], descricao: json["descricao"]);

  Map<String, dynamic> toJson() => {"codigo": codigo, "descricao": descricao};
}
