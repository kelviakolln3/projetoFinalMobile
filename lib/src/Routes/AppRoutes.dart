import 'package:get/get.dart';
import 'package:projeto/src/Bindings/CadastroPedidoUIBinding.dart';
import 'package:projeto/src/UI/CadastroFornecedorUI.dart';

import '../Bindings/ClienteUIBinding.dart';
import '../Bindings/FornecedorUIBinding.dart';
import '../Bindings/ProdutoUIBinding.dart';
import '../Bindings/PedidoUIBinding.dart';
import '../UI/CadastroClienteUI.dart';
import '../UI/CadastroPedidoUI.dart';
import '../UI/CadastroProdutoUI.dart';
import '../UI/ClineteUI.dart';
import '../UI/FornecedorUI.dart';
import '../UI/LoginUI.dart';
import '../UI/PrincipalUI.dart';
import '../UI/ProdutoUI.dart';
import '../UI/PedidoUI.dart';

class AppRoutes {
  static const String login = '/';
  static const String principalUI = '/PrincipalUI';
  static const String clienteUI = '/ClienteUI'; 
  static const String cadastroClienteUI = '/CadastroClienteUI';
  static const String produtoUI = '/ProdutoUI'; 
  static const String cadastroProdutoUI = '/CadastroProdutoUI';
  static const String fornecedorUI = '/FornecedorUI';
  static const String cadastroForncecedorUI = '/CadastroFornecedorUI';
  static const String pedidoUI = '/PedidoUI';
  static const String cadastroPedidoUI = '/CadastroPedidoUI';

  static final List<GetPage> routes = [
    GetPage(name: login, page: () => const LoginUI()),
    GetPage(name: principalUI, page: () => const PrincipalUI()),
    GetPage(name: clienteUI, page: () => const ClienteUI(), binding: ClienteUIBinding()),
    GetPage(name: cadastroClienteUI, page: () => CadastroClienteUI()),
    GetPage(name: produtoUI, page: () => const ProdutoUI(), binding: ProdutoUIBinding()),
    GetPage(name: cadastroProdutoUI, page: () => const CadastroProdutoUI()),
    GetPage(name: fornecedorUI, page: () => const FornecedorUI(), binding: FornecedorUIBinding()),
    GetPage(name: cadastroForncecedorUI, page: () => CadastroFornecedorUI()),
    GetPage(name: pedidoUI, page: () => const PedidoUI(), binding: PedidoUIBinding()),
    GetPage(name: cadastroPedidoUI, page: () => CadastroPedidoUI(), binding: CadastroPedidoUIBinding()),
  ];
}