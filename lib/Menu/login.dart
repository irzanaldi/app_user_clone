import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                  width: 200,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50.0)),
                  // child: Image.asset('')
                ),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                style: const TextStyle(color: Colors.red),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    labelStyle: new TextStyle(color: Colors.amberAccent),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white)),
                    hintStyle: new TextStyle(color: Colors.white),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com',
                    focusedBorder: UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white)),
                    focusColor: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white)),
                    labelStyle: new TextStyle(color: Colors.amberAccent),
                    hintStyle: new TextStyle(color: Colors.white),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: const Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 130,
            ),
            const Text(
              'New User? Create Account',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
