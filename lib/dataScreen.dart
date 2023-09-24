import 'package:flutter/material.dart';

class DataScreen extends StatelessWidget {
  final String? userName;
  final String? password;
  const DataScreen({Key? key, this.userName, this.password}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: const Text("Data Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(userName!),
            const SizedBox(height: 30,),
            Text(password!),
          ],
        ),
      ),
    );
  }
}
