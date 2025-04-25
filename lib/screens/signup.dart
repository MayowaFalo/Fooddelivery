import 'package:flutter/material.dart';
import 'package:foodapp/widgets/custom_scaffold.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:icons_plus/icons_plus.dart';
import 'signin.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Please Sign Up to get started",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.fromLTRB(30, 50, 30, 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),

              child: SingleChildScrollView(
                child: FormBuilder(
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        name: "Name",
                        decoration: InputDecoration(
                          labelText: "Name",
                          hintText: "Enter Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: Icon(Icons.person_outlined),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: "This field is required",
                          ),
                        ]),
                      ),

                      SizedBox(height: 20),
                      FormBuilderTextField(
                        name: "Email",
                        decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "Enter Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: "This field is required",
                          ),
                          FormBuilderValidators.email(),
                        ]),
                      ),
                      SizedBox(height: 20),
                      FormBuilderTextField(
                        name: "Password",
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Enter Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: Icon(Icons.password_outlined),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: "This field is required",
                          ),
                          FormBuilderValidators.minLength(5),
                        ]),
                      ),
                      SizedBox(height: 20),
                      FormBuilderTextField(
                        name: "Re-type Password",
                        decoration: InputDecoration(
                          labelText: "Re-type Password",
                          hintText: "Re-type Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: Icon(Icons.password_outlined),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: "This field is required",
                          ),
                          FormBuilderValidators.minLength(5),
                        ]),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.orange,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      /// Divider
                      Row(
                        children: const [
                          Expanded(
                            child: Divider(thickness: 0.7, color: Colors.grey),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Sign Up with",
                              style: TextStyle(color: Colors.black45),
                            ),
                          ),
                          Expanded(
                            child: Divider(thickness: 0.7, color: Colors.grey),
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),

                      /// Social Icons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Brand(Brands.facebook),
                          Brand(Brands.twitterx),
                          Brand(Brands.google),
                          Brand(Brands.apple_logo),
                        ],
                      ),

                      const SizedBox(height: 25),

                      /// Sign Up Prompt
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(color: Colors.black45),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Signin(),
                                ),
                              );
                            },
                            child: const Text(
                              " Log In",
                              style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
