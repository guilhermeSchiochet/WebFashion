import 'package:flutter/material.dart';
import 'package:web_fashion/presentation/widgets/text_form_field_builder.dart';

class SettingsProducts extends StatefulWidget {
  const SettingsProducts({super.key});

  @override
  State<SettingsProducts> createState() => _SettingsProductsState();
}

class _SettingsProductsState extends State<SettingsProducts> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _body,
      ),
    );
  }

  Widget get _body {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10)
        ),
        height: 400,
        width: 400,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchField('Name'),
              const SizedBox(
                height: 3,
              ),
              _buildSearchField('product Value'),
              const SizedBox(
                height: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Constrói o campo de pesquisa na área principal da AppBar.
  Widget _buildSearchField(String title) {
    return TextFormFieldBuilder(
      filled: true,
      title: title,
      fillColor: Colors.grey.shade100,
      hintStyle: const TextStyle(fontSize: 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      contentPadding: const EdgeInsets.only(
        left: 7.0,
        top: 15.0,
        bottom: 15.0,
      ),
    );
  }
}