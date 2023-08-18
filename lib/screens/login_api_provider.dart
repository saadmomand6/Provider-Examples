import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/login_auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obsecure = false;
  @override
  Widget build(BuildContext context) {
    final loginauthprovider = Provider.of<LoginAuth>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login With Api and Provider'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: email,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: password,
              obscureText: loginauthprovider.obs,
              decoration: InputDecoration(
                  hintText: 'Password',
                  suffix: Consumer<LoginAuth>(
                    builder: (context, value, child) {
                      return IconButton(
                          onPressed: () {
                            obsecure = !obsecure;
                            loginauthprovider.setobsecure(obsecure);
                          },
                          icon: Icon(value.obs ? Icons.password : Icons.lock));
                    },
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  loginauthprovider.Login(
                      email.text.toString(), password.text.toString());
                },
                child: loginauthprovider.loading
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text('Login'))
          ],
        ),
      ),
    );
  }
}
