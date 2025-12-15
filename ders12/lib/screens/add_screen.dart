import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hafta12/bloc/app_state.dart';
import '../bloc/app_bloc.dart';
import '../bloc/app_event.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  bool _isAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yeni Ekle")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Ürün Adı"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ürün adı boş olamaz";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Ürün Fiyatı"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ürün fiyatı boş olamaz";
                  }
                  return null;
                },
              ),
              SwitchListTile(
                value: _isAvailable,
                onChanged: (val) {
                  setState(() {
                    _isAvailable = val;
                  });
                },
              ),
              const SizedBox(height: 20),

              // ElevatedButton(
              //   onPressed: () {
              //     if (_formKey.currentState!.validate()) {
              //       // TODO: Bloc'a event gönder
              //       // context.read<AppBloc>().add(AddItemEvent(...));

              //       Navigator.pop(context);
              //     }
              //   },
              //   child: const Text("Kaydet"),
              // ),
              BlocListener<AppBloc, AppState>(
                listener: (context, state) {
                  if (state is AppSuccess) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Ürün başarıyla eklendi"),
                      ),
                    );
                  }
                },
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final newProductMap = {
                          "name": _nameController.text,
                          "price": _priceController.text,
                          "isAvailable": _isAvailable,
                        };
                        context.read<AppBloc>().add(
                          CreateProductEvent(newProductMap),
                        );
                      }
                    },
                    child: const Text("Kaydet"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
