class Cliente{
  late int? idCliente;
  late String nome;
  late String cpf;
  late String rg;
  late String endereco;
  late String dataNasc;
  late String contato;
  late String email;

  Cliente(){
    idCliente = null;
    nome = "";
    cpf = "";
    rg = ""; 
    endereco = "";
    dataNasc = "";
    contato = "";
    email = "";
  }

  Cliente.fromJson(Map json){
    idCliente = json['idCliente'];
    nome = json['nome'];
    cpf = json['cpf'];
    rg = json["rg"];
    endereco = json['endereco'];
    dataNasc = json['dataNasc'];
    contato = json['contato'];
    email = json['email'];
  }

  Map<String, dynamic> toJson(){
    return{
      if(idCliente != null) 'idCliente' : idCliente,
      'nome': nome,
      'cpf': cpf,
      'rg': rg,
      'endereco': endereco,
      'dataNasc': dataNasc,
      'contato': contato,
      'email': email
    };
  }
}

class Clientes {
  List<Cliente>? clientes;

  Clientes({this.clientes});

  Clientes.fromJson(Map<String, dynamic> json) {
    if (json['Clientes'] != null) {
      clientes = <Cliente>[];
      json['Clientes'].forEach((v) {
        clientes!.add(Cliente.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (clientes != null) {
      data['Clientes'] = clientes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}