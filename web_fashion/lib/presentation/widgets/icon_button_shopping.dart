import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconButtonShopping extends StatefulWidget {
  const IconButtonShopping({super.key});

  @override
  State<IconButtonShopping> createState() => _IconButtonShoppingState();
}

class _IconButtonShoppingState extends State<IconButtonShopping> {
  final ValueNotifier<bool> _isHovering = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => _isHovering.value = true,
      onExit: (event) => _isHovering.value = false,
      child: ValueListenableBuilder<bool>(
        valueListenable: _isHovering,
        builder: (context, isHovering, child) {
          return Tooltip(
            message: 'Comprar',
            child: IconButton(
              onPressed: () {},
              icon: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: isHovering ? 32 : 28,
                height: isHovering ? 32 : 28,
                child: Icon(
                  FontAwesomeIcons.bagShopping,
                  color: isHovering ? Colors.blue : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}