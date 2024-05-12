import 'package:get/get.dart';
import '../Data/Models/Fornecedor.dart';
import '../Data/Repository/FornecedorUIRepository.dart';
import '../UI/CadastroFornecedorUI.dart';
import 'CadastroFornecedorUIController.dart';

class FornecedorUIController extends GetxController{
  FornecedorUIRepository fornecedorUIRepository = FornecedorUIRepository();
  RxList<Fornecedor> fornecedorList = <Fornecedor>[].obs;

  final cadastroFornecedorUIController = Get.put(CadastroFornecedorUIController());

  @override
  void onInit() {
    buscarFornecedores();
    super.onInit();
  }
  
  buscarFornecedores() async{
    fornecedorList.value = await fornecedorUIRepository.buscarFornecedores();
  }

  btnInserir() async{
    bool ret = await Get.to(CadastroFornecedorUI());
    if(ret){
      await buscarFornecedores();
    }
  }

  btnDelete(int id) async{
    bool ret = await fornecedorUIRepository.deletarFornecedor(id);
    if(ret){
      await buscarFornecedores();
    }
  }

  btnEdit(Fornecedor fornecedor) async{
    cadastroFornecedorUIController.atividadeTextController.text = fornecedor.atividade;
    cadastroFornecedorUIController.empresaTextController.text = fornecedor.empresa;
    cadastroFornecedorUIController.contatoTextController.text = fornecedor.contato;
    cadastroFornecedorUIController.enderecoTextController.text = fornecedor.endereco;
    cadastroFornecedorUIController.emailTextController.text = fornecedor.email;
    cadastroFornecedorUIController.idFornecedor.value = fornecedor.idFornecedor!;
    cadastroFornecedorUIController.edicao.value = true;
    
    bool ret = await Get.to(CadastroFornecedorUI());
    if(ret){
      await buscarFornecedores();
    }
  }
}