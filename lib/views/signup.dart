import 'package:chat_app/services/auth.dart';
import 'package:chat_app/views/chat_room_screen.dart';
import 'package:chat_app/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class SignUp extends StatefulWidget {
  //SignUp({Key key}) : super(key: key);
  final Function toggle;
  SignUp(this.toggle);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  AuthMethod authMethod = AuthMethod();
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  signMeUp() {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      authMethod
          .signUpWithUserNameAndPassword(emailTextEditingController.text,
              passwordTextEditingController.text)
          .then((value) {
        print(value);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ChatRoom()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: appBarMain(context),
        body: isLoading
            ? //Conditional Operator
            Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height -
                      100.0, //Set the height of container
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize
                          .min, //Required to Reduce the column height else it will take complete height
                      children: [
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: userNameTextEditingController,
                                decoration:
                                    textFieldInputDecoration('user name'),
                                style: simpleTextFieldStyle(),
                                validator: (val) {
                                  if (val.isEmpty)
                                    return 'User Name cannot be empty';
                                  else if (val.length < 2)
                                    return 'Please Provide Proper User Name';
                                  else
                                    return null;
                                },
                              ),
                              TextFormField(
                                controller: emailTextEditingController,
                                decoration: textFieldInputDecoration('email'),
                                style: simpleTextFieldStyle(),
                                validator: (email) {
                                  final bool isValidEmail =
                                      EmailValidator.validate(email);
                                  if (isValidEmail)
                                    return null;
                                  else
                                    return 'Please Eneter Valid Email';
                                },
                              ),
                              TextFormField(
                                controller: passwordTextEditingController,
                                decoration:
                                    textFieldInputDecoration('password'),
                                style: simpleTextFieldStyle(),
                                obscureText: true,
                                validator: (password) {
                                  return password.length >= 6
                                      ? null
                                      : 'Password should have length greater than 6';
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 75.0,
                        ),
                        GestureDetector(
                          onTap: () => signMeUp(),
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                const Color(0xFF007EF4),
                                const Color(0xFF2A75BC),
                              ]),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Text(
                              'Sign Up',
                              style: mediumTextFieldStyle(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Text(
                            'Sign Up using Google',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Do you have an account? ",
                              style: mediumTextFieldStyle(),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: GestureDetector(
                                onTap: widget.toggle(),
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 100.0,
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
