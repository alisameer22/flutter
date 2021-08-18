import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:form_field_validator/form_field_validator.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final requiredValidator =
      RequiredValidator(errorText: 'this field is required');
  /*final EmailValidator = MultiValidator([
    RequiredValidator(errorText: 'email is required'),
    MinLengthValidator(12, errorText: 'That Not Valid Email'),
    PatternValidator ('@',
        errorText: 'That Not Valid Email' ),
    PatternValidator ('.com',errorText: 'That Not Valid Email' ),
    
        
  ]);*/
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    MaxLengthValidator(32, errorText: 'password must be at least 32 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);
  late String password;
  late String email;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(25.0),
          child: Center(
              child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,onChanged: (val) => email = val,
                    validator: EmailValidator(errorText: 'This Email is not valid'),
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: TextFormField(                    
                    autovalidateMode: AutovalidateMode.onUserInteraction, onChanged: (val) => password = val,
                    validator: passwordValidator,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    onPressed: () => {},
                    child: Text('Login'),
                  ),
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
