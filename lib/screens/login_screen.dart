import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _mailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
            alignment: Alignment(100, 0)
          )
        ),

        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),

                  Container(
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/logo.png')
                  ),

                  const SizedBox(height: 80),
          
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "Connectez-vous",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text('Email',
                            style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          style: const TextStyle(color: Colors.white),
                          controller: _mailController,
                          decoration: const InputDecoration(
                            hintText: 'Entrez votre adresse mail',
                            hintStyle: TextStyle(
                              color: Colors.grey
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0),),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0),),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0),),
                              borderSide: BorderSide(color: Colors.white, width: 2),
                            ),
                          ),
                          validator: (String? value) {
                            return (value == null || value == "")
                                ? 'Ce champ est obligatoire'
                                : null;
                          },
                        ),
                        const SizedBox(height: 15),
                        const Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text('Mot de passe',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          style: const TextStyle(color: Colors.white),
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            hintText: 'Entrez votre mot de passe',
                            hintStyle: TextStyle(
                                color: Colors.grey
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0),),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0),),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0),),
                              borderSide: BorderSide(color: Colors.white, width: 2),
                            ),
                          ),
                          validator: (String? value) {
                            return (value == null || value == "")
                                ? 'Ce champ est obligatoire'
                                : null;
                          },
                        ),
                        const SizedBox(height: 35),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()){

                            }
                          
                          }, 
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xffD65A14),
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )
                          ),
                          child: const Text('Connexion'),
                        ),
                      ]
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}