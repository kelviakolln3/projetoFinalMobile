import '../Models/Pedido.dart';
import '../Provider/PedidoProvider.dart';

class PedidoRepository{
  PedidoProvider pedidoProvider = PedidoProvider();

  Future<List<Pedido>> buscarPedidos(){
    return pedidoProvider.buscarPedidos();
  }

  Future<bool> cadastrarPedido(Pedido pedido){
    return pedidoProvider.cadastrarPedido(pedido);
  }

  Future<bool> editarPedido(Pedido pedido){
    return pedidoProvider.editarPedido(pedido);
  }

  Future<bool> deletarPedido(int id){
    return pedidoProvider.deletarPedido(id);
  }

  Future<bool> deletarItensPedido(int id){
    return pedidoProvider.deletarItensPedido(id);
  }
}