import 'package:crud_ponta/app/core/notifier/default_listener_notifier.dart';
import 'package:crud_ponta/app/modules/farms/farm_create_controller.dart';
import 'package:crud_ponta/app/modules/farms/widgets/farm_text_field.dart';
import 'package:validatorless/validatorless.dart';
import 'package:flutter/material.dart';

class FarmCreatePage extends StatefulWidget {
  final FarmCreateController _controller;

  FarmCreatePage({Key? key, required FarmCreateController controller})
      : _controller = controller,
        super(key: key);

  @override
  State<FarmCreatePage> createState() => _FarmCreatePageState();
}

class _FarmCreatePageState extends State<FarmCreatePage> {
  final _nameEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    DefaultListenerNotifier(changeNotifier: widget._controller).listener(
        context: context,
        sucessCallback: (notifier, listenerInstace) {
          listenerInstace.dispose();
          Navigator.pop(context);
        });
  }

  @override
  void dispose() {
    _nameEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Fazenda'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final formValid = _formKey.currentState?.validate() ?? false;
          print('Ta liberado? $formValid');
          if (formValid) {
            widget._controller.save(_nameEC.text);
          }
        },
        label: Text(
          'Salvar fazenda',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _formKey,
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
                controller: _nameEC,
                validator: Validatorless.required('Nome é requerido'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
