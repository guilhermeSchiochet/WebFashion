import 'package:collection/collection.dart';
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
      child: Ink(
        height: 50,
        color: Colors.grey.shade200,
        width: MediaQuery.of(context).size.width,
        child: _areaEmCima(context),
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
  Widget _areaEmCima(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildContainerStarkzhx(context),
          _buildContainerUser
        ],
      ),
    );
  }

  /// Cria a area Starkzhx
  Widget _buildContainerStarkzhx(BuildContext context) {
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
      children: _navItems.map((item) => _buildNavItem(item, fontSize: 18)).toList(),
    );
  }

  /// Cria um widget de navegação com base no [item] fornecido.
  ///
  /// O [item] é um objeto do tipo `ModelItems` contendo informações
  /// sobre o item de navegação, como o título.
  Widget _buildNavItem(ModelItems item, {double? fontSize}) {
    return InkWell(
      borderRadius: BorderRadius.circular(7),
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Text(
          item.title,
          style: TextStyle(
            fontSize: fontSize
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
      fillColor: Colors.grey.shade100,
      hintStyle: const TextStyle(fontSize: 15),
      prefix: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(Icons.search, color: Colors.grey),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
    );
  }

  // Constrói o ícone de carrinho na área principal da AppBar
  Widget get _buildShoppingIcon => const IconButtonShopping();

  /// Realiza mapeamento dos NavItems
  List<ModelItems> get _navItems => [
    ModelItems(title: 'Lançamentos'),
    ModelItems(title: 'Ofertas'),
    ModelItems(title: 'Feminino'),
    ModelItems(title: 'Masculino'),
    ModelItems(title: 'Infantil'),
  ];

  /// Cria a área com os itens de ajuda e conta de usuário.
  ///
  /// Itera sobre a lista `_helps` e utiliza a função `_buildNavItem`
  /// para criar os itens de navegação. O último item não inclui um
  /// `VerticalDivider` após ele.
  Widget get _buildContainerUser {
    return Row(
      children: _infCont.mapIndexed((index, help) => _buildNavItemWithDivider(help, index)).expand((item) => item).toList(),
    );
  }

  /// Cria um widget de navegação seguido por um widget VerticalDivider,
  /// exceto para o último item.
  ///
  /// [item] é o objeto do tipo `ModelItems` contendo informações
  /// sobre o item de navegação, como o título.
  /// [index] é o índice atual do item na lista.
  List<Widget> _buildNavItemWithDivider(ModelItems item, int index) {
    List<Widget> widgets = [_buildNavItem(item)];
    if (index < _infCont.length - 1) {
      widgets.add(
        const SizedBox(
          height: 9,
          child: VerticalDivider(),
        )
      );
    }
    return widgets;
  }

  List<ModelItems> get _infCont => [
    ModelItems(title: 'Ajuda'),
    ModelItems(title: 'Junte-se a nós'),
    ModelItems(title: 'Entrar'),
  ];
}


