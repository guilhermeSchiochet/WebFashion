import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Rodape extends StatelessWidget {
  const Rodape({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 60.0),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sobre a Nossa Loja',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Sobre Nós\nA [Nome da Loja] é o seu destino definitivo...',
                style: TextStyle(fontSize: 14.0),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contato',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                '- Endereço: [Endereço da Loja]\n- Telefone: [Número de Telefone]\n- Email: [Email de Contato]\n- Horário de Funcionamento: Seg-Sex, 9h às 18h | Sáb, 10h às 15h',
                style: TextStyle(fontSize: 14.0),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Redes Sociais',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Icon(FontAwesomeIcons.facebook, size: 20.0),
                  SizedBox(width: 10.0),
                  Text(
                    'Facebook',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(FontAwesomeIcons.instagram, size: 20.0),
                  SizedBox(width: 10.0),
                  Text(
                    'Instagram',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(FontAwesomeIcons.twitter, size: 20.0),
                  SizedBox(width: 10.0),
                  Text(
                    'Twitter',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}