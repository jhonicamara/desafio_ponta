import 'package:crud_ponta/app/modules/farms/farm_create_controller.dart';
import 'package:crud_ponta/app/modules/farms/widgets/farm_text_field.dart';
import 'package:flutter/material.dart';

class FarmCreatePage extends StatelessWidget {
  FarmCreateController _controller;

  FarmCreatePage({Key? key, required FarmCreateController controller})
      : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Fazenda'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text(
          'Salvar fazenda',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Criar Fazenda',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FarmTextField(
                label: 'Nome',
              )
            ],
          ),
        ),
      ),
    );
  }
}
