import 'dart:async';
import 'package:flutter/material.dart';
import 'package:web_fashion/presentation/widgets/custom_card.dart';

class BodyScreen extends StatefulWidget {
  const BodyScreen({super.key});

  @override
  State<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startTimerAnuncios;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          buildAnuncios(context),
          buildCards(),
          const SizedBox(
            height: 30,
          ),
          _buildContainerDead,
        ],
      ),
    );
  }

  Widget get _buildContainerDead {
    return Container(
      height: 500,
      color: Colors.grey.shade200,
    );
  }

  void get _startTimerAnuncios {
    Timer.periodic(const Duration(seconds: 10), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % 2;
      });
    });
  }

  Widget buildAnuncios(BuildContext context) {
    List<Widget> anuncios = [
      _buildCreateContainerAnuncios('assets/png/fashion_store.png'),
      _buildCreateContainerAnuncios('assets/png/winter_sale_banner.png'),
    ];

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        transitionBuilder: (child, animation) {
          final slideAnimation = Tween<Offset>(
            begin: const Offset(1, 0),
            end: const Offset(0, 0),
          ).animate(animation);

          return SlideTransition(
            position: slideAnimation,
            child: child,
          );
        },
        key: ValueKey<int>(_currentIndex),
        child: anuncios[_currentIndex],
        
      ),
    );
  }

  Widget _buildCreateContainerAnuncios(String path) {
    return Container(
      key: const ValueKey<int>(1),
      width: MediaQuery.of(context).size.width * 0.90,
      height: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          path,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildCards() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 87.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(20, (index) {
            return const CustomCard(
              price: '999,99',
              title: 'Nike Dunk Low Retro SE Casual',
              pathImage: 'assets/produtos/white_jacket.png',
            );
          }),
        ),
      ),
    );
  }
}
