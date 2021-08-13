import 'package:flutter/material.dart';
import 'package:validation/validation.dart';
import 'package:validation_kit_example/src/textfiled.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // form key
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  // controller and nodes
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _zipcodeController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _zipcodeFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Validation Demofsdfsdfsdfsdf'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: _formkey,
          autovalidateMode: AutovalidateMode.always,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _usernameTextField(),
                _emailTextField(),
                _passwordTextField(),
                _phoneTextField(),
                _zipCodeTextField(),
                _button(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameTextField() {
    return CustomTextField(
      controller: _usernamecontroller,
      focusNode: _usernameFocus,
      hintText: 'Username',
      keyBoardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
      onSubmitted: (value) {
        FocusScope.of(context).requestFocus(_emailFocus);
      },
      validator: (value) {
        if (!Validator.usernameValidation(value).isValidate) {
          return Validator.usernameValidation(value).message;
        } else
          return null;
      },
      onChanged: (value) {},
      margin: EdgeInsets.only(left: 50, right: 50, top: 30),
    );
  }

  Widget _emailTextField() {
    return CustomTextField(
      controller: _emailController,
      focusNode: _emailFocus,
      hintText: 'Email',
      keyBoardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
      onSubmitted: (value) {
        FocusScope.of(context).requestFocus(_passwordFocus);
      },
      validator: (value) {
        if (!Validator.emailValidation(value).isValidate) {
          return Validator.emailValidation(value).message;
        } else
          return null;
      },
      onChanged: (value) {},
      margin: EdgeInsets.only(left: 50, right: 50, top: 30),
    );
  }

  Widget _passwordTextField() {
    return CustomTextField(
      controller: _passwordController,
      focusNode: _passwordFocus,
      hintText: 'Password',
      keyBoardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
      onSubmitted: (value) {
        FocusScope.of(context).requestFocus(_phoneFocus);
      },
      validator: (value) {
        if (!Validator.passwordValidation(value).isValidate) {
          return Validator.passwordValidation(value).message;
        } else
          return null;
      },
      onChanged: (value) {},
      margin: EdgeInsets.only(left: 50, right: 50, top: 30),
    );
  }

  Widget _phoneTextField() {
    return CustomTextField(
      controller: _phoneController,
      focusNode: _phoneFocus,
      hintText: 'Phone Number',
      keyBoardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
      onSubmitted: (value) {
        FocusScope.of(context).requestFocus(_zipcodeFocus);
      },
      validator: (value) {
        if (!Validator.phoneValidation(value).isValidate) {
          return Validator.phoneValidation(value).message;
        } else
          return null;
      },
      onChanged: (value) {},
      margin: EdgeInsets.only(left: 50, right: 50, top: 30),
    );
  }

  Widget _zipCodeTextField() {
    return CustomTextField(
      controller: _zipcodeController,
      focusNode: _zipcodeFocus,
      hintText: 'Zip code',
      keyBoardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      onSubmitted: (value) {
        FocusScope.of(context).unfocus();
      },
      validator: (value) {
        if (!Validator.postalcodeValidation(value).isValidate) {
          return Validator.postalcodeValidation(value).message;
        } else
          return null;
      },
      onChanged: (value) {},
      margin: EdgeInsets.only(left: 50, right: 50, top: 30),
    );
  }

  Widget _button() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: () => checkValidation(),
        child: Text('Check Validation'),
      ),
    );
  }

  void checkValidation() {
    if (_formkey.currentState.validate()) {
      print('All Good!!');
    } else {
      print('Check the errors');
    }
  }
}
