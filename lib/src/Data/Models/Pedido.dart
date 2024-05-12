class Pedido{
  late int? idPedido;
  late int idCliente;
  late int idUsuario;
  late String dataCriacao;
  late String condicaoPagamento;
  late String formaPagamento;
  late double total;
  late List<ItemPedidoBeans>? itemPedidoBeans;

  Pedido(){
    idPedido = null;
    idCliente = 0;
    idUsuario = 0;
    dataCriacao = "";
    condicaoPagamento = "";
    formaPagamento = "";
    total = 0.0;
    itemPedidoBeans = [];
  }

  Pedido.fromJson(Map<String, dynamic> json) {
    idPedido = json['idPedido'];
    idCliente = json['idCliente'];
    idUsuario = json['idUsuario'];
    dataCriacao = json['dataCriacao'];
    condicaoPagamento = json['condicaoPagamento'];
    formaPagamento = json['formaPagamento'];
    total = json['total'];
    if (json['itemPedidoBeans'] != null) {
      itemPedidoBeans = <ItemPedidoBeans>[];
      json['itemPedidoBeans'].forEach((v) {
        itemPedidoBeans!.add(ItemPedidoBeans.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(idPedido != null) data['idPedido'] = idPedido;
    data['idCliente'] = idCliente;
    data['idUsuario'] = idUsuario;
    data['dataCriacao'] = dataCriacao;
    data['condicaoPagamento'] = condicaoPagamento;
    data['formaPagamento'] = formaPagamento;
    data['total'] = total;
    if (itemPedidoBeans != null) {
      data['itemPedidoBeans'] = itemPedidoBeans!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItemPedidoBeans {
  late int? idItemPedido;
  late int idProduto;
  late double quantidade;
  late double valorUnitario;

  ItemPedidoBeans(){
    idItemPedido = null;
    idProduto = 0;
    quantidade = 0.0;
    valorUnitario = 0.0;
  }

  ItemPedidoBeans.fromJson(Map<String, dynamic> json) {
    idItemPedido = json['idItemPedido'];
    idProduto = json['idProduto'];
    quantidade = json['quantidade'];
    valorUnitario = json['valorUnitario'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(idItemPedido != null) data['idItemPedido'] = idItemPedido;
    data['idProduto'] = idProduto;
    data['quantidade'] = quantidade;
    data['valorUnitario'] = valorUnitario;
    return data;
  }
}