import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:untitled/homescreen.dart';
import 'package:untitled/main.dart';





class login extends StatefulWidget{
  @override

  _loginState createState() => _loginState();
}


class _loginState extends State<login> {
  bool isApiCallProcess = false;
  bool hidePassword=true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? username;
  String? password;

  @override

  Widget build(BuildContext context) {
    return SafeArea(
    child: Scaffold(
        backgroundColor: HexColor("#283871"),
        body: ProgressHUD(
          child: Form(
            key: globalFormKey,
            child: _loginUI(context),
          ),
          inAsyncCall: isApiCallProcess,
          opacity: 0.3,
          key:UniqueKey(),

        ),
      ),

    );
  }
  Widget _loginUI(BuildContext context) {
     return SingleChildScrollView(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
               Container(
                 width: MediaQuery.of(context).size.width,
                 height:MediaQuery.of(context).size.height / 5,
                 decoration: const BoxDecoration(
                   gradient: LinearGradient(
                     begin: Alignment.topCenter,
                     end: Alignment.bottomCenter,
                     colors: [
                       Colors.white,
                       Colors.white,
                     ],
                   ),
                       borderRadius:BorderRadius.only(
                         bottomLeft: Radius.circular(100),
                         bottomRight: Radius.circular(100)
                       )
                 ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: const [
                     Align(
                       alignment: Alignment.center,

                     ),

                   ],
                 ),

               ),
           const Padding(
             padding: EdgeInsets.only(left:20, bottom: 30,top: 50),
             child: Text(
               "Login",
               style:TextStyle(fontWeight: FontWeight.bold,
                   fontSize: 25,
                   color: Colors.white),),
           ),

          FormHelper.inputFieldWidget(
              context,

              "username",
              "UserName",

    (onValidateVal) {
    if(onValidateVal.isEmpty){
    return "username cant be empty";
    }
    return null;

    },


    (onSavedVal){
    username=onSavedVal;
    },
    prefixIconColor: Colors.white,
    borderColor: Colors.white,
    textColor: Colors.white,
    borderFocusColor: Colors.white,
    hintColor: Colors.white.withOpacity(0.7),
    borderRadius: 10,




    ),
           Padding(
             padding: const EdgeInsets.only(top:10),
             child: FormHelper.inputFieldWidget(
               context,
               "password",
               "password",
                   (onValidateVal) {
                 if(onValidateVal.isEmpty){
                   return "password cant be empty";
                 }
                 return null;

               },


                   (onSavedVal){
                 password=onSavedVal;
               },
               prefixIconColor: Colors.white,
               borderColor: Colors.white,
               textColor: Colors.white,
               borderFocusColor: Colors.white,
               hintColor: Colors.white.withOpacity(0.7),
               borderRadius: 10,
               obscureText: hidePassword,
               suffixIcon: IconButton(onPressed: () {
                 setState(() {
                   hidePassword= !!hidePassword;
                 });
               },
                   icon: Icon(
                     hidePassword ? Icons.visibility_off: Icons.visibility,
                   ))




             ),
           ),
           Align(
             alignment: Alignment.bottomRight,
             child: Padding(
               padding: const EdgeInsets.only(right: 25,top: 10),
               child: RichText(
                 text:  TextSpan(
                   style:
                       TextStyle(
                     color:Colors.grey,
                     fontSize:14.0,
                   ),
                   children: <TextSpan>[
                     TextSpan(
                       text: 'forgot password',
                       style: TextStyle(color: Colors.white,
                       decoration: TextDecoration.underline
                       ),
                       recognizer: TapGestureRecognizer()
                         ..onTap = () {
                         print("forgot password");
    },
                     ),
                   ]
                 ),
               ),

             ),
           ),
           SizedBox(height: 20
           ),
           Center(
             child: FormHelper.submitButton(
               "Login",
                 () {},
               btnColor: HexColor("#283871"),
               borderColor: Colors.white,
               txtColor: Colors.white,
               borderRadius: 10,

             ),
           ),
           SizedBox(height: 20),
           Center(
             child: Text(
                 "OR",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,

                  ),

             ),
           ),
           SizedBox(height: 20),
           Align(
             alignment: Alignment.center,
             child: Padding(
               padding: const EdgeInsets.only(right: 25,top: 10),
               child: RichText(
                 text:  TextSpan(
                     style:
                     TextStyle(
                       color:Colors.grey,
                       fontSize:14.0,
                     ),
                     children: <TextSpan>[
                       TextSpan(text: 'Dont Have an Account?'),
                       TextSpan(
                         text: 'signup',
                         style: TextStyle(color: Colors.white,
                             decoration: TextDecoration.underline
                         ),
                         recognizer: TapGestureRecognizer()
                           ..onTap = () {
                            Navigator.pushNamed(context, '/signup');
                           },
                       ),
                     ]
                 ),
               ),

             ),
           ),
         ],

       ),
     );

  }
}
