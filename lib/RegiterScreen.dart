import 'dart:convert';

import 'package:fast_food_app/ui/home/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
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
                    Image.asset(
                      "assets/fastfoodlogo.jpg",
                      height: 150,
                      width: 150,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),

//-----------------------------------------------------Name TextField---------------------------------------------------

                    TextFormField(
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Mada",
                          fontSize: 15.0),
                      onChanged: (String value) {
                        // usedeob.changeEmail(value);
                      },
                      controller: name,
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
                            Icons.person,
                            color: Color(0xFF1f2937),
                            size: 20,
                          ),
                        ),
                        hintText: "Enter Name",
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: "Muli",
                            fontSize: 15.0),
                        errorStyle: TextStyle(color: Colors.red),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.white, width: 2.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Name.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30.0,
                    ),

//------------------------------------------------------EmailTextField--------------------------------------------------------
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
                        hintText: "Enter Email",
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: "Muli",
                            fontSize: 15.0),
                        errorStyle: TextStyle(color: Colors.red),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.white, width: 2.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Email.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30.0,
                    ),

//------------------------------------------------------MobileTextField--------------------------------------------------------
                    TextFormField(
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Mada",
                          fontSize: 15.0),
                      onChanged: (String value) {
                        // usedeob.changeEmail(value);
                      },
                      controller: phone,
                      keyboardType: TextInputType.number,
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
                            Icons.phone_android,
                            color: Color(0xFF1f2937),
                            size: 20,
                          ),
                        ),
                        hintText: "Enter Mobile Number",
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: "Muli",
                            fontSize: 15.0),
                        errorStyle: TextStyle(color: Colors.red),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.white, width: 2.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Mobile Number.';
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
                        errorStyle: TextStyle(color: Colors.red),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.white, width: 2.0)),
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
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        }
                      },
                      child: Text('Sign Up', style: TextStyle(color: Color(0xFF181632)),),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Have An Account ?",
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>HomePage())
                        );
                        
                        
                      },
                      child: Text('Sign In', style: TextStyle(color: Color(0xFF181632)),),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "By using our services you are agreeing to our Terms and Privacy Statement",
                      style: TextStyle(fontSize: 10.0, color: Colors.white),
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