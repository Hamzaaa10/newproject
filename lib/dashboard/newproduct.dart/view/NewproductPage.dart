import 'dart:io';

import 'package:auth/widget/cusstomtextfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/newproduct_cubit.dart';

class NewproductPage extends StatelessWidget {
  const NewproductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewproductCubit(),
      child: BlocBuilder<NewproductCubit, NewproductState>(
        builder: (context, state) {
          final NewproductCubit control = context.read<NewproductCubit>();
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "please write new product",
                style: TextStyle(fontSize: 25),
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("write product name", style: TextStyle(fontSize: 18)),
                      const SizedBox(height: 10),
                      customtextfiald(hintText: 'name', Controller: control.nameController),
                      const SizedBox(height: 10),
                      const Text("write product description", style: TextStyle(fontSize: 18)),
                      const SizedBox(height: 10),
                      customtextfiald(hintText: 'description', Controller: control.descController),
                      const SizedBox(height: 10),
                      const Text("write product available count", style: TextStyle(fontSize: 18)),
                      const SizedBox(height: 10),
                      customtextfiald(
                        hintText: 'available count',
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          IconButton(
                            onPressed: control.pickProductImage,
                            icon: const Icon(CupertinoIcons.photo, color: Color.fromARGB(255, 0, 156, 254)),
                          ),
                          IconButton(
                            onPressed: control.takeProductImage,
                            icon: const Icon(CupertinoIcons.camera, color: Color.fromARGB(255, 6, 122, 255)),
                          ),
                        ],
                      ),
                      if (control.image != null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.file(
                            File(control.image!.path),
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      const SizedBox(height: 20),
                      
                      Center(
                        child: MaterialButton(color: Colors.blue,
                        
                          onPressed: () => control.addProduct(context),
                          child: const    Text("add product" ,style: TextStyle(fontSize: 18) ,),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}