import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../components/square_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //login user in method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const SizedBox(height: 50,),
              //logo
              const Icon(
                Icons.lock,
                size: 100,
              ),
              const SizedBox(height: 50,),
              //welcome back, you've been missed!
              Text(
                "Hoş geldiniz, lütfen kayıt olunuz",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,

                ),
              ),
              const SizedBox(height: 25,),
              //username textfield
              MyTextField(
                controller: usernameController,
                hinText: "Username",
                obscureText: false,

              ),

              const SizedBox(height: 10,),

              //password textfield
              MyTextField(
                controller: passwordController,
                hinText: "Password",
                obscureText: true,

              ),

              const SizedBox(height: 10,),

              MyButton(

              ),

              const SizedBox(height: 25,),

              // emre toprak
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 4,
                        color: Colors.grey[400],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Emre Toprak",
                        style: TextStyle(color: Colors.grey[700],fontSize: 17),
                      ),
                    ),

                    Expanded(
                      child: Divider(
                        thickness: 4,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SquareTile(imagePath: "lib/images/coffeelogo.png"),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}