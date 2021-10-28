import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController password = TextEditingController();
  bool wrongPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        color: Colors.grey,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(25.0),
            ),
            color: Colors.black.withOpacity(0.7),
          ),
          height: 280.0,
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
          child: Column(
            children: [
              //const SizedBox(height: 250.0),
              Text(
                "MEDHANIT",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 15.0),
              TextField(
                controller: password,
                obscureText: true,
                style: TextStyle(
                  color: Colors.grey[200],
                ),
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 0.0),
                  ),
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey[500]),
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  if (password.text.toString().trim() == "IRainYou!") {
                    Navigator.pushReplacementNamed(context, "onOrOfflinePage");
                  } else {
                    wrongPassword = true;
                    setState(() {});
                  }
                },
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(160.0, 35.0))),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              wrongPassword == true
                  ? Text(
                      "⚠  Wrong Password",
                      style: TextStyle(
                        color: Colors.grey[200],
                      ),
                    )
                  : const Text(""),
            ],
          ),
        ),
      ),
    );
  }
}
