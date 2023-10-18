import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var senhaController = TextEditingController();

  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      flex: 4,
                      child: Image.network(
                          "https://hermes.digitalinnovation.one/assets/diome/logo.png"),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Já tem cadastro?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Faça seu login e make the change_",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: emailController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(top: 20),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 116, 36, 255)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 116, 36, 255))),
                        hintText: "Email",
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 116, 36, 255)),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color.fromARGB(255, 116, 36, 255),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                      controller: senhaController,
                      obscureText: isObscureText,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 20),
                        hintText: "Senha",
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 116, 36, 255)),
                        prefixIcon: const Icon(Icons.lock,
                            color: Color.fromARGB(255, 116, 36, 255)),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                          child: Icon(
                              isObscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: const Color.fromARGB(255, 116, 36, 255)),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 116, 36, 255))),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 116, 36, 255)),
                        ),
                      ),
                    )),
                const SizedBox(height: 40),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () {
                          if (emailController.text.trim() ==
                                  "email@email.com" &&
                              senhaController.text.trim() == "123") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainPage()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Senha ou usuário incorretos!")));
                          }
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor: const MaterialStatePropertyAll(
                                Color.fromARGB(255, 116, 36, 255))),
                        child: const Text(
                          "ENTRAR",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(child: Container()),
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: const Text("Esqueci minha senha",
                      style: TextStyle(
                          color: Color.fromARGB(255, 105, 98, 38),
                          fontWeight: FontWeight.w400)),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: const Text("Criar conta",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.w400)),
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
