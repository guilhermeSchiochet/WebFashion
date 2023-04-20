import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:web_fashion/domain/model/nav_items_model.dart';
import 'package:web_fashion/presentation/widgets/text_form_field_builder.dart';

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
          SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade200,
              height: 50,
              child: const Center(child: Text('Olá, eu sou Jack!')),
            )
          ),
          Padding(
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
          ),
          const SizedBox(
            height: 5,
          ),
          SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade200,
              height: 50,
              child: const Center(child: Text('Olá, eu sou Jack!')),
            )
          )
        ],
      ),
    );
  }

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

  Widget _buildNavItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _navItems.map((item) => _buildNavItem(item)).toList(),
    );
  }

  Widget _buildNavItem(NavItemsModel item) {
    return InkWell(
      borderRadius: BorderRadius.circular(7),
      onTap: () {
        // Adicione a ação de clique aqui
      },
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

  List<NavItemsModel> get _navItems => [
    NavItemsModel(title: 'Lançamentos'),
    NavItemsModel(title: 'Ofertas'),
    NavItemsModel(title: 'Feminino'),
    NavItemsModel(title: 'Masculino'),
    NavItemsModel(title: 'Infantil'),
    NavItemsModel(title: 'KSDL'),
  ];

  Widget _buildSearchAndIcon() {
    return SizedBox(
      width: 250,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: _buildSearchField()),
          const SizedBox(
            width: 20,
          ),
          _buildShoppingIcon(),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return TextFormFieldBuilder(
      hintText: 'Buscar',
      filled: true,
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

  Widget _buildShoppingIcon() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(FontAwesomeIcons.bagShopping),
      iconSize: 28,
    );
  }
}
