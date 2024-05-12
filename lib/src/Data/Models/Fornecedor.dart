class Fornecedor{
  late int? idFornecedor;
  late String atividade;
  late String empresa;
  late String contato;
  late String endereco;
  late String email;

  Fornecedor(){
    idFornecedor = null;
    atividade = "";
    empresa = "";
    contato = "";
    endereco = "";
    email = "";
  }

  Fornecedor.fromJson(Map json){
    idFornecedor = json['idFornecedor'];
    atividade = json['atividade'];
    empresa = json['empresa'];
    contato = json['contato'];
    endereco = json['endereco'];
    email = json['email'];
  }

  Map<String, dynamic> toJson(){
    return{
      if(idFornecedor != null) 'idFornecedor': idFornecedor,
      'atividade': atividade,
      'empresa': empresa,
      'contato': contato,
      'endereco': endereco,
      'email': email
    };
  }
}

class Fornecedores {
  List<Fornecedor>? fornecedores;

  Fornecedores({this.fornecedores});

  Fornecedores.fromJson(Map<String, dynamic> json) {
    if (json['Fornecedores'] != null) {
      fornecedores = <Fornecedor>[];
      json['Fornecedores'].forEach((v) {
        fornecedores!.add(Fornecedor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (fornecedores != null) {
      data['Fornecedores'] = fornecedores!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}