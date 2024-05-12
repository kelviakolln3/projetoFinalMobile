import '../Models/Fornecedor.dart';
import '../Provider/FornecedorProvider.dart';

class FornecedorUIRepository{
  FornecedorProvider fornecedorProvider = FornecedorProvider();

  Future<List<Fornecedor>> buscarFornecedores(){
    return fornecedorProvider.buscarFornecedores();
  }

  Future<bool> cadastrarFornecedor(Fornecedor fornecedor){
    return fornecedorProvider.cadastrarFornecedor(fornecedor);
  }

  Future<bool> editarFornecedor(int id, Fornecedor fornecedor){
    return fornecedorProvider.editarFornecedor(id, fornecedor);
  }

  Future<bool> deletarFornecedor(int id){
    return fornecedorProvider.deletarFornecedor(id);
  }
}