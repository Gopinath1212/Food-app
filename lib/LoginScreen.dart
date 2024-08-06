import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'RegiterScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _showPassword = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.topLeft,
              colors: [
                Colors.deepPurple,
                Color(0xFF818cf8),
              ],
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Fast Food',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xffede9fe),
                  Colors.grey.shade700,
                ]),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.zero,
                bottomRight: Radius.circular(30.0),
                bottomLeft: Radius.zero),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
//----------------------------------------------------CompanyLogo-------------------------------------------------------
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Image.asset(
                        "assets/fastfoodlogo.jpg",
                        height: 100,
                        width: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Sign In",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
//------------------------------------------------------LoginTextField--------------------------------------------------------
                    TextFormField(
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Mada",
                          fontSize: 15.0),
                      onChanged: (String value) {
                        // usedeob.changeEmail(value);
                      },
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(255, 255, 255, 0.5),
                            width: 2.0,
                          ),
                        ),
                        prefixIcon: Padding(
                          padding:
                          EdgeInsets.only(top: 12.0, left: 2.0, bottom: 12.0),
                          child: Icon(
                            Icons.email,
                            color: Color(0xFF1f2937),
                            size: 20,
                          ),
                        ),
                        hintText: "Enter your email",
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: "Muli",
                            fontSize: 15.0),
                        errorStyle: TextStyle(color: Colors.red, fontSize: 15.0),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 2.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30.0,
                    ),

//------------------------------------------------------PasswordTextField----------------------------------------------------
                    TextFormField(
                      obscureText: _showPassword,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Mada",
                          fontSize: 15.0),
                      onChanged: (String value) {

                        // usedeob.changePass(value);
                      },
                      controller: password,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: this._showPassword
                              ? Icon(
                            Icons.visibility_off,
                            color: Color(0xFF1f2937),
                          )
                              : Icon(
                            Icons.visibility,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(
                                    () => this._showPassword = !this._showPassword);
                          },
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(255, 255, 255, 0.5),
                            width: 2.0,
                          ),
                        ),
                        prefixIcon: Padding(
                          padding:
                          EdgeInsets.only(top: 12.0, left: 2.0, bottom: 12.0),
                          child: Icon(
                            Icons.lock,
                            color: Color(0xFF1f2937),
                            size: 20,
                          ),
                        ),
                        hintText: "Enter your password",
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: "Muli",
                            fontSize: 15.0),
                        errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 2.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Password.';
                        }else if(value.length < 6){
                          return 'Password must be grater than 5 digit.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
//-----------------------------------------------------SignInButton----------------------------------------------------------
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      elevation: 5.0,
                      minWidth: MediaQuery.of(context).size.width,
                      height: 50.0,
                      color: Color(0xFF818cf8),
                      onPressed: (){
                        if (!_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          print('There is some error, please check fields');
                        } else {
                          print('All Well.');
                        }
                      },
                      child: Text('Sign In', style: TextStyle(color: Color(0xFF181632)),),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
//-----------------------------------------------------ForgotPassword-------------------------------------------------------

                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontFamily: "Mada",
                              fontSize: 14,
                              color: Colors.white),
                        ),
                      ),
                      onTap: () {
                      },
                    ),
                    Container(
                      color: Colors.white,
                      height: 1.0,
                      width: 200,
                    ),
//-----------------------------------------------------SignUpButton---------------------------------------------------------
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "New here ?",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),

                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      elevation: 5.0,
                      minWidth: MediaQuery.of(context).size.width,
                      height: 50.0,
                      color: Color(0xffede9fe),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return SignUpScreen();
                        }));
                      },
                      child: Text('Sign Up', style: TextStyle(color: Color(0xFF181632)),),
                    ),
//----------------------------------------------------Terms&ConditionText--------------------------------------------------
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "By using our services you are agreeing to our Terms and Privacy Statement",
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}