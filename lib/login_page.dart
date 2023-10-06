import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'custom_button.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userC = TextEditingController();
  final TextEditingController _passC = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isLoad = false;
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: const Text(
          "Login Page",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 5, color: Colors.yellow)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Logo",
                      style: TextStyle(
                          color: Colors.purpleAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _userC,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required*";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("User Name"),
                    hintText: "Enter User Name"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passC,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required*";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Password"),
                    hintText: "Enter Password"),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(12),
                  FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z\$@%]")),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                  width: 300,
                  child: CustomButton(
                    isLoading: isLoad,
                    isSuccess: isDone,
                    isHexagonal: true,
                    shapePath: 4,
                    btnElevation: isLoad ? 0 : 15,
                    title: 'Login',
                    // btnShape: BoxShape.circle,
                    onTap: (isLoad || isDone)
                        ? () {}
                        : () {
                            print("=========onTap Custom Button========");
                            isLoad = true;
                            Future.delayed(const Duration(seconds: 3), () {
                              setState(() {
                                isLoad = false;
                              });
                            }).whenComplete(() => isDone = true).whenComplete(
                                () => Future.delayed(const Duration(seconds: 2),
                                        () {
                                      setState(() {
                                        isDone = false;
                                      });
                                    }));
                            setState(() {});
                          },
                    btnColor: isDone == true
                        ? Colors.green
                        : isLoad
                            ? Colors.grey.shade400
                            : null,
                    btnGradColor: (isLoad || isDone) == false
                        ? const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.deepPurple, Colors.deepOrange])
                        : null,

                  )),
            ],
          ),
        ),
      ),
    );
  }
}
