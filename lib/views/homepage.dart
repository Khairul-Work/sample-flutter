import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sample/models/product.model.dart';
import 'package:sample/views/second_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: FutureBuilder<List<ProductModel>>(
          future: getAllProduct(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active ||
                snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final products = snapshot.data;
            return ListView.builder(
              itemCount: products!.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  child: ListTile(
                    title: Text(product.name),
                    subtitle: Text("RM ${product.price}"),
                  ),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => const SecondPage())),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<List<ProductModel>> getAllProduct() async {
    String endPoint = "http://10.0.2.2:8080/api/product";
    final res = await Dio().get(endPoint);
    List<ProductModel> products =
        List<ProductModel>.from(res.data.map((e) => ProductModel.fromMap(e)))
            .toList();
    return products;
  }
}
