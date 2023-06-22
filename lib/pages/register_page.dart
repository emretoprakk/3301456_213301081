import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/components/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';


class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key,required this.onTap});


  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    super.dispose();
  }


  //sign user up method
  void signUserUp () async {
    //show dialog circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    //make sure passwords match
    if (passwordController.text != confirmPasswordController.text) {
      //pop loading circle
      Navigator.pop(context);
      //show error to user
      showErrorMessage("Passwords don't match");
      return;
    }
    //try creating the user
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
      );
      //add user details
      addUserDetails(
        _firstNameController.text.trim(),
        _lastNameController.text.trim(),
        emailController.text.trim(),
        int.parse(_ageController.text.trim()),
      );
      Navigator.pop(context);

      //pop loading circle
      if(context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop loading circle
      Navigator.pop(context);
      //show error to user
      showErrorMessage(e.code);
    }
  }
  Future addUserDetails(String firstName, String lastName, String email, int age) async {
    await FirebaseFirestore.instance.collection("users").add({
      "first name": firstName,
      "last name": lastName ,
      "age": age,
      "email": email,
    });
  }
  // error message to user
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const SizedBox(height: 5,),

                //"Let's create an account for you!",
                Text(
                  "Let's create an account for you!",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25,),

                //first name textfield
                MyTextField(
                  controller: _firstNameController,
                  hinText: "First Name",
                  obscureText: false,
                ),

                const SizedBox(height: 10,),

                //last name textfield
                MyTextField(
                  controller: _lastNameController,
                  hinText: "Last Name",
                  obscureText: false,
                ),

                const SizedBox(height: 10,),

                //age textfield
                MyTextField(
                  controller: _ageController,
                  hinText: "Age",
                  obscureText: false,
                ),

                const SizedBox(height: 10,),

                //email textfield
                MyTextField(
                  controller: emailController,
                  hinText: "Email",
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

                //Confirm password textfield
                MyTextField(
                  controller: confirmPasswordController,
                  hinText: "Confirm Password",
                  obscureText: true,
                ),


                const SizedBox(height: 15,),

                //sign in button
                MyButton(
                  text: "Sign Up",
                  onTap: signUserUp,
                ),

                const SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4,),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Login now",
                        style: TextStyle(
                            color: Colors.blue,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
