import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:web_fashion/domain/model/nav_items_model.dart';
import 'package:web_fashion/presentation/widgets/icon_button_shopping.dart';
import 'package:web_fashion/presentation/widgets/text_form_field_builder.dart';

/// Classe MyAppBar que herda de StatelessWidget e implementa PreferredSizeWidget.
/// Responsável por construir a AppBar customizada da aplicação.
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 3);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: Column(
        children: [
          _buildUpperArea(context),
          _buildMainArea(context),
          _buildLowerArea(context),
        ],
      ),
    );
  }

  /// Constrói a área superior da AppBar, onde são exibidos ícones e opções de menu.
  Widget _buildUpperArea(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.centerLeft,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey.shade200,
        height: 50,
        child: _areaEmCima(),
      ),
    );
  }

  /// Constrói a área principal da AppBar, onde são exibidos o logotipo, itens de navegação e campo de pesquisa.
  Widget _buildMainArea(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildImage(),
            const Spacer(),
            _buildNavItems(),
            const Spacer(),
            _buildSearchAndIcon(),
          ],
        ),
      ),
    );
  }

  /// Constrói a área inferior da AppBar, onde é exibida uma mensagem de boas-vindas.
  Widget _buildLowerArea(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.grey.shade200,
        height: 50,
        child: const Center(child: Text('Olá, eu sou Jack!')),
      ),
    );
  }

  /// Constrói a área de ícones e opções de menu na área superior da AppBar.
  Widget _areaEmCima() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildContainerStarkzhx,
          _buildContainerUser
        ],
      ),
    );
  }

  /// Cria a area Starkzhx
  Widget get _buildContainerStarkzhx {
    return Row(
      children: const [
        Icon(FontAwesomeIcons.googleWallet),
        SizedBox(
          width: 20,
        ),
        Text(
          'STARKZHX',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 17
          ),
        ),
      ],
    );
  }

  /// Cria a area com os helps e conta de usuario
  Widget get _buildContainerUser {
    return Row(
      children: const [
        Text('Ajuda'),
        SizedBox(
          height: 9,
          child: VerticalDivider(),
        ),
        Text('Junte-se a nós'),
        SizedBox(
          height: 9,
          child: VerticalDivider(),
        ),
        Text('Entrar'),
      ],
    );
  }

  /// Constrói a imagem do logotipo na área principal da AppBar.
  Widget _buildImage() {
    return SizedBox(
      width: 250,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Image.asset(
          'assets/png/logotipo.png',
          width: 60,
          height: 60,
        ),
      ),
    );
  }

  /// Constrói os itens de navegação na área principal da AppBar.
  Widget _buildNavItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _navItems.map((item) => _buildNavItem(item)).toList(),
    );
  }

  Widget _buildNavItem(NavItemsModel item) {
    return InkWell(
      borderRadius: BorderRadius.circular(7),
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Text(
          item.title,
          style: const TextStyle(
            fontSize: 18
          ),
        ),
      ),
    );
  }

  /// Junta o campo de pesquisa e o ícone de carrinho na área principal da AppBar.
  Widget _buildSearchAndIcon() {
    return SizedBox(
      width: 280,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: _buildSearchField()
          ),
          const SizedBox(
            width: 20,
          ),
          _buildShoppingIcon,
        ],
      ),
    );
  }

  /// Constrói o campo de pesquisa na área principal da AppBar.
  Widget _buildSearchField() {
    return TextFormFieldBuilder(
      filled: true,
      hintText: 'Buscar',
      contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
      hintStyle: const TextStyle(fontSize: 15),
      fillColor: Colors.grey.shade100,
      prefix: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(Icons.search, color: Colors.grey),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.grey),
      ),
    );
  }

  // Constrói o ícone de carrinho na área principal da AppBar
  Widget get _buildShoppingIcon => const IconButtonShopping();

  /// Realiza mapeamento dos NavItems
  List<NavItemsModel> get _navItems => [
    NavItemsModel(title: 'Lançamentos'),
    NavItemsModel(title: 'Ofertas'),
    NavItemsModel(title: 'Feminino'),
    NavItemsModel(title: 'Masculino'),
    NavItemsModel(title: 'Infantil'),
    NavItemsModel(title: 'KSDL'),
  ];

}
