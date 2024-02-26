import 'package:cloudapp/Controller/clsLocalizationContoller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:cloudapp/Controller/clsAuthController.dart';
import 'package:cloudapp/Helper/clsColors.dart';
import 'package:cloudapp/Helper/clsCustomMessage.dart';
import 'package:cloudapp/Helper/clsDeviceSize.dart';
import 'package:cloudapp/Helper/clsFontStyle.dart';
import 'package:cloudapp/Helper/clsImages.dart';
import 'package:cloudapp/Modle/clsRigesterModle.dart';
import 'package:cloudapp/Util/clsValidation.dart';
import 'package:cloudapp/View/GenralComponent/clsTextReqiured.dart';
import 'package:provider/provider.dart';
import 'package:cloudapp/View/Pages/Auth/clsForgetAndReseatPassword.dart';
import 'package:cloudapp/View/Pages/Home/clsbuttonSheetPages.dart';

import '../../../Animation/clsRithSlideAnimation.dart';
import '../../../Modle/clsLoginModle.dart';
import 'package:cloudapp/generated/l10n.dart';

class clsRigisterScrean extends StatefulWidget {
  bool isRigister = true;

  clsRigisterScrean({super.key, this.isRigister = true});

  @override
  State<clsRigisterScrean> createState() => _clsRigisterScreanState();
}

class _clsRigisterScreanState extends State<clsRigisterScrean> {
  bool isEmail = true;
  bool isShownPass = true;
  bool isNotAuth = true;
  TextEditingController _userName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phoe = TextEditingController();
  TextEditingController _password = TextEditingController();
  FocusNode _userNode = FocusNode();
  FocusNode _emailNode = FocusNode();
  FocusNode _passwordNode = FocusNode();
  FocusNode _phoneNode = FocusNode();

  void _resultAction(String? message, isComplate) {
    switch (isComplate) {
      case true:
        {
          switch (widget.isRigister) {
            case true:
              {
                clsCustomMessage.Message(message ?? "", true, context);
                Navigator.of(context).pushReplacement(
                    clsRithSlideAnimation(page: clsbuttonSheetPages()));
              }
            default:
              {
                clsCustomMessage.Message(message ?? "", true, context);
                Navigator.of(context).pushReplacement(
                    clsRithSlideAnimation(page: clsbuttonSheetPages()));
              }
          }
        }
      default:
        {
          clsCustomMessage.Message("$message", false, context);
        }
    }
  }

  void _rigisterUser() async {
    if (_userName.text.trim().isEmpty) {
      clsCustomMessage.Message(
          "أسم المستخدم لا يمكن ان يكون فارغ", false, context);
      return;
    }
    if (isEmail && !clsValidation.isEmailValid(_email.text)) {
      clsCustomMessage.Message("لابد من ادخال ايميل صحيح", false, context);
      return;
    }
    if (!isEmail && (_phoe.text.isEmpty)) {
      clsCustomMessage.Message(
          "رقم الهاتف لا يمكن ان يكون فارغ", false, context);
      return;
    }
    if (_password.text.isEmpty) {
      clsCustomMessage.Message(
          "كلمة المرور لا يمكن ان يكون فارغ", false, context);
      return;
    }

    clsRigesterModle rigister = clsRigesterModle(
        _userName.text,
        _email.text.isEmpty ? null : _email.text,
        _password.text,
        _phoe.text.isEmpty ? null : _phoe.text);

    await Provider.of<clsAuthController>(context, listen: false)
        .createNewUser(rigister, _resultAction);
  }

  void _loginUser() async {
    if (isEmail && _email.text.isEmpty) {
      clsCustomMessage.Message("الايميل  لا يمكن ان يكون فارغ", false, context);
      return;
    }
    if (!isEmail && _phoe.text.isEmpty) {
      clsCustomMessage.Message(
          "رقم الهاتف لا يمكن ان يكون فارغ", false, context);
      return;
    }
    if (_password.text.isEmpty) {
      clsCustomMessage.Message(
          "كلمة المرور لا يمكن ان يكون فارغ", false, context);
      return;
    }

    clsLoginModle rigister = clsLoginModle(
        _email.text.isEmpty ? null : _email.text,
        _password.text,
        _phoe.text.isEmpty ? null : _phoe.text);

    Provider.of<clsAuthController>(context, listen: false)
        .loginUser(rigister, _resultAction);
  }

  void _isAllReadyLogin() async {
    await Provider.of<clsAuthController>(context, listen: false)
        .isValideToken().then((value) => {
          if(value==true){
            Navigator.of(context).pushReplacement(clsRithSlideAnimation(page: clsbuttonSheetPages()))
          }
        });
  }

  @override
  void initState() {
    _isAllReadyLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var pvAuthController = Provider.of<clsAuthController>(context);
    var pvLocalizationController =
        Provider.of<clsLocalizationContoller>(context);
    // return
    //  FutureBuilder<bool>(
    //   // future: ,
    //   builder: (context, snapshot) {

    //     if(snapshot.data==true){
    //       Navigator.of(context)
    //           .pushReplacement(clsRithSlideAnimation(page: buttonSheetPages()));

    //     }
    return Consumer<clsAuthController>(builder: (context, value, snapshot) {
          if(value.isValideAuth==false){
         return Scaffold(
        body: SingleChildScrollView(
          child: pvLocalizationController.isChagneLoanguage
              ? Container(
                  height: clsDeviceSize.getDeviceHeight(context),
                  width: clsDeviceSize.getDeviceWidth(context),
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    color: clsColors.secondary,
                  ))
              : Container(
                  margin: const EdgeInsets.only(right: 15, left: 15, top: 79),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.isRigister
                                    ? S.of(context).createAnAccount
                                    : S.of(context).signIn,
                                style: clsFontStyle.bloodStyle.copyWith(
                                    fontSize: 20,
                                    color: clsColors.onbardingColor),
                              ),
                              Text(
                                S.of(context).signInToYourCloudStorageAccount,
                                style: clsFontStyle.regularStyle.copyWith(
                                    fontSize: 12, color: clsColors.gray),
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              pvLocalizationController.updateLocalization();
                            },
                            child: Row(
                              children: [
                                Text(
                                  S.of(context).lang,
                                  style: clsFontStyle.regularStyle.copyWith(
                                      fontSize: 12, color: clsColors.secondary),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: clsColors.secondary,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: clsColors.grayLow,
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.all(5),
                        height: 50,
                        child: SizedBox(
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isEmail = true;
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: isEmail
                                        ? Colors.white
                                        : Colors.transparent,
                                  ),
                                  width:
                                      (clsDeviceSize.getDeviceWidth(context) /
                                              2) -
                                          20,
                                  child: Text(
                                    S.of(context).email,
                                    style: clsFontStyle.mediamStyle.copyWith(
                                        color: clsColors.onbardingColor,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isEmail = false;
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: isEmail
                                        ? Colors.transparent
                                        : Colors.white,
                                  ),
                                  width:
                                      (clsDeviceSize.getDeviceWidth(context) /
                                              2) -
                                          20,
                                  child: Text(S.of(context).phone,
                                      style: clsFontStyle.mediamStyle.copyWith(
                                          color: clsColors.onbardingColor,
                                          fontSize: 14)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      if (widget.isRigister) ...[
                        const SizedBox(
                          height: 30,
                        ),
                        clsTextReqiured(
                            style: clsFontStyle.mediamStyle
                                .copyWith(fontSize: 14, color: Colors.black),
                            value: S.of(context).userName),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: clsColors.grayLow,
                            ),
                            width: clsDeviceSize.getDeviceWidth(context),
                            child: TextField(
                              focusNode: _userNode,
                              controller: _userName,
                              onSubmitted: (value) {
                                isEmail
                                    ? FocusScope.of(context)
                                        .requestFocus(_emailNode)
                                    : FocusScope.of(context)
                                        .requestFocus(_phoneNode);
                              },
                              style: clsFontStyle.mediamStyle.copyWith(
                                fontSize: 18,
                                color: clsColors.gray,
                              ),
                              decoration: InputDecoration(
                                  label: Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Text(
                                      S.of(context).enterYourAccountName,
                                      textAlign: TextAlign.center,
                                      style: clsFontStyle.mediamStyle.copyWith(
                                          fontSize: 14, color: clsColors.gray),
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  fillColor: clsColors.gray,
                                  prefixIcon: Image.asset(
                                    clsImages.user,
                                    height: 24,
                                    width: 24,
                                    color: clsColors.gray,
                                  )),
                            )),
                      ],
                      const SizedBox(
                        height: 20,
                      ),
                      if (isEmail) ...[
                        clsTextReqiured(
                            style: clsFontStyle.mediamStyle
                                .copyWith(fontSize: 14, color: Colors.black),
                            value: S.of(context).email),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: clsColors.grayLow,
                            ),
                            width: clsDeviceSize.getDeviceWidth(context),
                            child: TextField(
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp("[a-zA-Z@.]")),
                              ],
                              keyboardType: TextInputType.emailAddress,
                              controller: _email,
                              focusNode: _emailNode,
                              onSubmitted: (value) {
                                FocusScope.of(context)
                                    .requestFocus(_passwordNode);
                              },
                              style: clsFontStyle.mediamStyle.copyWith(
                                fontSize: 18,
                                color: clsColors.gray,
                              ),
                              decoration: InputDecoration(
                                  label: Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Text(
                                      S.of(context).enterEmail,
                                      textAlign: TextAlign.center,
                                      style: clsFontStyle.mediamStyle.copyWith(
                                          fontSize: 14, color: clsColors.gray),
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  fillColor: clsColors.gray,
                                  prefixIcon: Image.asset(
                                    clsImages.user,
                                    height: 24,
                                    width: 24,
                                    color: clsColors.gray,
                                  )),
                            ))
                      ] else ...[
                        clsTextReqiured(
                            style: clsFontStyle.mediamStyle
                                .copyWith(fontSize: 14, color: Colors.black),
                            value: S.of(context).phone),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: clsColors.grayLow,
                            ),
                            width: clsDeviceSize.getDeviceWidth(context),
                            child: TextField(
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp("[0-9]")),
                              ],
                              keyboardType: TextInputType.phone,
                              focusNode: _phoneNode,
                              controller: _phoe,
                              onSubmitted: (value) {
                                FocusScope.of(context)
                                    .requestFocus(_passwordNode);
                              },
                              style: clsFontStyle.mediamStyle.copyWith(
                                fontSize: 18,
                                color: clsColors.gray,
                              ),
                              decoration: InputDecoration(
                                  label: Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Text(
                                      S.of(context).enterPhone,
                                      textAlign: TextAlign.center,
                                      style: clsFontStyle.mediamStyle.copyWith(
                                          fontSize: 14, color: clsColors.gray),
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  fillColor: clsColors.gray,
                                  prefixIcon: Image.asset(
                                    clsImages.arabic,
                                    height: 24,
                                    width: 24,
                                  )),
                            ))
                      ],
                      const SizedBox(
                        height: 20,
                      ),
                      clsTextReqiured(
                          style: clsFontStyle.mediamStyle
                              .copyWith(fontSize: 14, color: Colors.black),
                          value: S.of(context).password),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: clsColors.grayLow,
                          ),
                          width: clsDeviceSize.getDeviceWidth(context),
                          child: TextField(
                            controller: _password,
                            focusNode: _passwordNode,
                            style: clsFontStyle.mediamStyle.copyWith(
                              fontSize: 18,
                              color: clsColors.gray,
                            ),
                            obscureText: isShownPass,
                            decoration: InputDecoration(
                                suffixIcon: isShownPass
                                    ? IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isShownPass = false;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.visibility_off,
                                          color: clsColors.gray,
                                        ))
                                    : IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isShownPass = true;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.visibility,
                                          color: clsColors.gray,
                                        )),
                                label: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Text(
                                    "******",
                                    textAlign: TextAlign.center,
                                    style: clsFontStyle.mediamStyle.copyWith(
                                        fontSize: 14, color: clsColors.gray),
                                  ),
                                ),
                                border: InputBorder.none,
                                fillColor: clsColors.gray,
                                prefixIcon: Image.asset(
                                  clsImages.lock,
                                  height: 24,
                                  width: 24,
                                  color: clsColors.gray,
                                )),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      if (!widget.isRigister) ...[
                        Container(
                          width: clsDeviceSize.getDeviceWidth(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        clsRithSlideAnimation(
                                            page:
                                                clsForgetAndReseatPassword()));
                                  },
                                  child: Text(
                                    S.of(context).forgetPassword,
                                    style: clsFontStyle.bloodStyle.copyWith(
                                        color: clsColors.secondary,
                                        fontSize: 12),
                                  ))
                            ],
                          ),
                        )
                      ],
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              fixedSize: Size(
                                  clsDeviceSize.getDeviceWidth(context), 50),
                              backgroundColor: clsColors.primary),
                          onPressed: () {
                            return widget.isRigister
                                ? _rigisterUser()
                                : _loginUser();
                          },
                          child: pvAuthController.isStartLoading
                              ? CircularProgressIndicator(
                                  color: clsColors.white,
                                )
                              : Text(
                                  S.of(context).rigist,
                                  style: clsFontStyle.regularStyle.copyWith(
                                      fontSize: 16, color: Colors.white),
                                )),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: clsDeviceSize.getDeviceWidth(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              clsImages.secondRigsterConditionLable,
                              width: clsDeviceSize.getDeviceWidth(context) - 30,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 52,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: clsColors.grayLignt)),
                        width: clsDeviceSize.getDeviceWidth(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              clsImages.googleIcon,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              S.of(context).loginByGoogle,
                              textAlign: TextAlign.center,
                              style: clsFontStyle.mediamStyle.copyWith(
                                  fontSize: 14, color: clsColors.black),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      InkWell(
                        onTap: () {
                          switch (widget.isRigister) {
                            case true:
                              {
                                Navigator.of(context)
                                    .push(clsRithSlideAnimation(
                                        page: clsRigisterScrean(
                                  isRigister: false,
                                )));
                              }
                            default:
                              {
                                Navigator.of(context)
                                    .push(clsRithSlideAnimation(
                                        page: clsRigisterScrean(
                                  isRigister: true,
                                )));
                              }
                          }
                        },
                        child: Container(
                          height: 52,
                          width: clsDeviceSize.getDeviceWidth(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                S.of(context).alreadyHavAccount,
                                textAlign: TextAlign.center,
                                style: clsFontStyle.mediamStyle.copyWith(
                                    fontSize: 14, color: clsColors.black),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                widget.isRigister
                                    ? S.of(context).logIn
                                    : S.of(context).createAnAccount,
                                textAlign: TextAlign.center,
                                style: clsFontStyle.mediamStyle.copyWith(
                                    fontSize: 14, color: clsColors.primary),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      );
 
      }
     
        return Scaffold(
          body: Container(
            height: clsDeviceSize.getDeviceHeight(context),
            width: clsDeviceSize.getDeviceWidth(context),
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              color: clsColors.secondary,
            ),
          ),
        );
        });
    //   }
    // );
  }
}
