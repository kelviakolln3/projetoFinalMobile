import '../Models/Produto.dart';
import '../Provider/ProdutoProvider.dart';

class ProdutoUIRepository{
  ProdutoProvider produtoProvider = ProdutoProvider();

  Future<List<Produto>> buscarProdutos(){
    return produtoProvider.buscarProdutos();
  }

  Future<bool> cadastrarProduto(Produto produto){
    return produtoProvider.cadastrarProduto(produto);
  }

  Future<bool> editarProduto(int id, Produto produto){
    return produtoProvider.editarProduto(id, produto);
  }

  Future<bool> deletarProduto(int id){
    return produtoProvider.deletarProduto(id);
  }
}