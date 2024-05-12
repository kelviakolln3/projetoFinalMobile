import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:projeto/src/Controllers/CadastroClienteUIController.dart';
import 'package:projeto/src/Data/Models/Cliente.dart';
import 'package:projeto/src/Data/Repository/ClienteUIRepository.dart';
import 'package:projeto/src/UI/CadastroClienteUI.dart';

class ClienteUIController extends GetxController{
  ClienteUIRepository clienteUIRepository = ClienteUIRepository();
  RxList<Cliente> clienteList = <Cliente>[].obs;

  final cadastroClienteUIController = Get.put(CadastroClienteUIController());

  @override
  void onInit() {
    buscarClientes();
    super.onInit();
  }
  
  buscarClientes() async{
    clienteList.value = await clienteUIRepository.buscarClientes();
  }

  btnInserir() async{
    bool ret = await Get.to(CadastroClienteUI());
    if(ret){
      await buscarClientes();
    }
  }

  btnDelete(int id) async{
    bool ret = await clienteUIRepository.deletarCliente(id);
    if(ret){
      await buscarClientes();
    }
  }

  btnEdit(Cliente cliente) async{
    cadastroClienteUIController.nomeTextController.text = cliente.nome;
    cadastroClienteUIController.emailTextController.text = cliente.email;
    cadastroClienteUIController.cpfTextController.text = cliente.cpf;
    cadastroClienteUIController.rgTextController.text = cliente.rg;
    cadastroClienteUIController.dataNascTextController.text = DateFormat('dd/MM/yyyy').format(DateTime.parse(cliente.dataNasc));
    cadastroClienteUIController.contatoTextController.text = cliente.contato;
    cadastroClienteUIController.enderecoTextController.text = cliente.endereco;
    cadastroClienteUIController.idCliente.value = cliente.idCliente!;
    cadastroClienteUIController.edicao.value = true;
    
    bool ret = await Get.to(CadastroClienteUI());
    if(ret){
      await buscarClientes();
    }
  }
}