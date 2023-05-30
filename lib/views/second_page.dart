import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final _name = TextEditingController();
  final _price = TextEditingController();
  final _key = GlobalKey<FormState>();

  void addProduct() async {
    if (_key.currentState!.validate()) {
      //api call
      //ios, postman = localhost
      //android = 10.0.2.2
      String endPoint = "http://10.0.2.2:8080/api/product";

      final data = {
        "name": _name.text,
        "price": _price.text,
      };

      final res = await Dio().post(
        endPoint,
        data: data,
      );

      if (res.statusCode == 200) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Product added"),
            ),
          );
        }
        if (context.mounted) Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product Form"),
      ),
      body: Form(
        key: _key,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _name,
                decoration: const InputDecoration(
                  hintText: "Product name",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Product name should not be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _price,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Product price in RM",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Product price should not be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: addProduct,
                child: const Text("Add Product"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
