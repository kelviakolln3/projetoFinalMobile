import '../Models/Cliente.dart';
import '../Provider/ClienteProvider.dart';

class ClienteUIRepository{
  ClienteProvider clienteProvider = ClienteProvider();

  Future<List<Cliente>> buscarClientes(){
    return clienteProvider.buscarClientes();
  }

  Future<bool> cadastrarCliente(Cliente cliente){
    return clienteProvider.cadastrarCliente(cliente);
  }

  Future<bool> editarCliente(int id, Cliente cliente){
    return clienteProvider.editarCliente(id, cliente);
  }

  Future<bool> deletarCliente(int id){
    return clienteProvider.deletarCliente(id);
  }
}