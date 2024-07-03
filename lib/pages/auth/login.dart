import 'package:flutter/material.dart';
import 'package:mobile_siak/pages/home.dart';
import 'package:mobile_siak/pages/auth/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      // Perform login action
      print(
          "Email: ${_emailController.text}, Password: ${_passwordController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFFF),
        body: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              _signUp(context),
              _inputField(context),
              _forgotPassword(context),
            ],
          ),
        ),
      ),
    );
  }

  _header(context) {
    return Column(
      children: [
        Image.asset(
          "images/logo.jpg",
          height: 200,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Welcome back!",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text("Masukkan info login Anda")
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
              hintText: "Email",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: Icon(Icons.person)),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(
              hintText: "Kata sandi",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: Icon(Icons.lock)),
          obscureText: true,
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            // _login();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
          child: Text(
            "Login",
            style: TextStyle(fontSize: 20),
          ),
          style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              padding: EdgeInsets.symmetric(vertical: 16)),
        )
      ],
    );
  }

  _forgotPassword(context) {
    return TextButton(onPressed: () {}, child: Text("Lupa kata sandi"));
  }

  _signUp(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Belum punya akun?"),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUp())
              );
            },
            child: Text("Buat akun"))
      ],
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:mobile_siak/host.dart';
// import 'dart:convert';
// import 'package:mobile_siak/pages/home.dart';
// import 'package:mobile_siak/pages/auth/signup.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   bool _isLoading = false;

//   void _login() async {
//     if (_formKey.currentState?.validate() ?? false) {
//       setState(() {
//         _isLoading = true;
//       });

//       final response = await http.post(
//         Uri.parse('${gate}/api/auth/login-siswa'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode(<String, String>{
//           'email': _usernameController.text,
//           'password': _passwordController.text,
//         }),
//       );

//       setState(() {
//         _isLoading = false;
//       });

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         if (data['message'] == 'Success') {
//           // Navigate to the Home page
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => Home()),
//           );
//         } else {
//           _showErrorDialog('Login failed');
//         }
//       } else {
//         _showErrorDialog('Error: ${response.statusCode}');
//       }
//     }
//   }

//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (ctx) => AlertDialog(
//         title: Text('An Error Occurred!'),
//         content: Text(message),
//         actions: <Widget>[
//           TextButton(
//             child: Text('Okay'),
//             onPressed: () {
//               Navigator.of(ctx).pop();
//             },
//           )
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Color(0xFFFFFFFFF),
//         body: Container(
//           margin: EdgeInsets.all(24),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               _header(context),
//               _signUp(context),
//               _inputField(context),
//               _forgotPassword(context),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   _header(context) {
//     return Column(
//       children: [
//         Image.asset(
//           "images/logo.jpg",
//           height: 200,
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Text(
//           "Welcome back!",
//           style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
//         ),
//         Text("Masukkan info login Anda")
//       ],
//     );
//   }

//   _inputField(context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         TextField(
//           controller: _usernameController,
//           decoration: InputDecoration(
//               hintText: "Username",
//               border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(18),
//                   borderSide: BorderSide.none),
//               fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
//               filled: true,
//               prefixIcon: Icon(Icons.person)),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         TextField(
//           controller: _passwordController,
//           decoration: InputDecoration(
//               hintText: "Kata sandi",
//               border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(18),
//                   borderSide: BorderSide.none),
//               fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
//               filled: true,
//               prefixIcon: Icon(Icons.lock)),
//           obscureText: true,
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         ElevatedButton(
//           onPressed: _isLoading ? null : _login,
//           child: _isLoading
//               ? CircularProgressIndicator()
//               : Text(
//                   "Login",
//                   style: TextStyle(fontSize: 20),
//                 ),
//           style: ElevatedButton.styleFrom(
//               shape: StadiumBorder(),
//               padding: EdgeInsets.symmetric(vertical: 16)),
//         )
//       ],
//     );
//   }

//   _forgotPassword(context) {
//     return TextButton(onPressed: () {}, child: Text("Lupa kata sandi"));
//   }

//   _signUp(context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text("Belum punya akun?"),
//         TextButton(
//             onPressed: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => SignUp()));
//             },
//             child: Text("Buat akun"))
//       ],
//     );
//   }
// }
