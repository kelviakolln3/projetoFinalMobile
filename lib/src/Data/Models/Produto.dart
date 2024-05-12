class Produto{
  late int? idProduto;
  late String nome;
  late String codigoBarras;
  late double estoque;
  late String grupo;
  late String marca;

  Produto(){
    idProduto = null;
    nome = "";
    codigoBarras = "";
    estoque = 0;
    grupo = "";
    marca = "";
  }

  Produto.fromJson(Map json){
    idProduto = json['idProduto'];
    nome = json['nome'];
    codigoBarras = json['codigoBarras'];
    estoque = json["estoque"];
    grupo = json['grupo'];
    marca = json["marca"];
  }

  Map<String, dynamic> toJson(){
    return{
      if(idProduto != null) 'idProduto': idProduto,
      'nome': nome,
      'codigoBarras': codigoBarras,
      'estoque': estoque,
      'grupo': grupo,
      'marca': marca
    };
  }
}

class Produtos {
  List<Produto>? produtos;

  Produtos({this.produtos});

  Produtos.fromJson(Map<String, dynamic> json) {
    if (json['Produtos'] != null) {
      produtos = <Produto>[];
      json['Produtos'].forEach((v) {
        produtos!.add(Produto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (produtos != null) {
      data['Produtos'] = produtos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}