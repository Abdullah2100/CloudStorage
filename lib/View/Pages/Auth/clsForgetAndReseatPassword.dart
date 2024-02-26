import 'dart:async';
import 'package:cloudapp/Controller/clsLocalizationContoller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloudapp/Animation/clsRithSlideAnimation.dart';
import 'package:cloudapp/Controller/clsAuthController.dart';
import 'package:cloudapp/Helper/clsColors.dart';
import 'package:cloudapp/Helper/clsCustomMessage.dart';
import 'package:cloudapp/Helper/clsDeviceSize.dart';
import 'package:cloudapp/Helper/clsFontStyle.dart';
import 'package:cloudapp/Helper/clsImages.dart';
import 'package:cloudapp/View/GenralComponent/clsTextReqiured.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:cloudapp/generated/l10n.dart';


enum enscreansState { forgetPassword, detectInfo, Reseat }

class clsForgetAndReseatPassword extends StatefulWidget {
  enscreansState state;

  clsForgetAndReseatPassword(
      {super.key, this.state = enscreansState.forgetPassword});

  @override
  State<clsForgetAndReseatPassword> createState() =>
      _clsForgetAndReseatPasswordState();
}

class _clsForgetAndReseatPasswordState
    extends State<clsForgetAndReseatPassword> {
  void _jumbToPreviuseFoucseNode() {
    FocusScope.of(context).previousFocus();
  }

  bool isEmail = true;
  bool isShownPass = true;
  TextEditingController _email = TextEditingController(text: "");
  TextEditingController _phoe = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _passwordCheck = TextEditingController();
  FocusNode _emailNode = FocusNode();
  FocusNode _passwordNode = FocusNode();
  FocusNode _passwordChecNode = FocusNode();
  FocusNode _phoneNode = FocusNode();
  int timerCounter = 50;

  void _timeCounter() async {
    timerCounter = 50;
    for (int i = timerCounter; timerCounter > 0; i--) {
      await Future.delayed(
          Duration(seconds: 1),
          () => {
                setState(() {
                  timerCounter -= 1;
                })
              });
    }
  }

  void _resultAction(String message, isComplate) {
    switch (isComplate) {
      case true:
        {
          // switch(widget.isRigister){
          //   case true:{
          //     clsCustomMessage.Message("تم انشاء حساب المستخدم بنجاح", true, context);
          //   }
          //   default:{
          //     clsCustomMessage.Message("", true, context);
          //
          //   }
          // }
        }
      default:
        {
          clsCustomMessage.Message("$message", false, context);
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    var pvAuthController = Provider.of<clsAuthController>(context);
    var pvLocalizationController = Provider.of<clsLocalizationContoller>(context);

    return Scaffold(
        body: pvLocalizationController.isChagneLoanguage
            ? Container(
            height: clsDeviceSize.getDeviceHeight(context),
            width: clsDeviceSize.getDeviceWidth(context),
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              color: clsColors.secondary,
            ))
            :  SingleChildScrollView(
            child: Container(
      margin: const EdgeInsets.only(right: 15, left: 15, top: 79),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.state == enscreansState.forgetPassword
                      ? S.of(context).forgetPassword.substring(0, 20)
                      : (widget.state == enscreansState.forgetPassword
                          ?S.of(context).detect
                          : S.of(context).changePassword),
                  style: clsFontStyle.bloodStyle
                      .copyWith(fontSize: 20, color: clsColors.onbardingColor),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.state == enscreansState.forgetPassword
                      ? S.of(context).mustEnterEmail
                      : (widget.state == enscreansState.detectInfo
                          ? (!isEmail
                              ?S.of(context).enterPhonOtp
                              : S.of(context).enterEmailOtp)
                          : isEmail?S.of(context).enterEmailOtp:S.of(context).enterPhonOtp),
                  style: clsFontStyle.regularStyle
                      .copyWith(fontSize: 12, color: clsColors.gray),
                )
              ],
            ),
            InkWell(
              onTap: (){

                pvLocalizationController.updateLocalization();
              },
              child: Row(
                children: [
                  Text(
                    S.of(context).lang,
                    style: clsFontStyle.regularStyle
                        .copyWith(fontSize: 12, color: clsColors.secondary),
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
        if (widget.state != enscreansState.Reseat) ...[
          Container(
            decoration: BoxDecoration(
                color: clsColors.grayLow,
                borderRadius: BorderRadius.circular(12)),
            padding: EdgeInsets.all(5),
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
                        color: isEmail ? Colors.white : Colors.transparent,
                      ),
                      width: (clsDeviceSize.getDeviceWidth(context) / 2) - 20,
                      child: Text(
                        S.of(context).email,
                        style: clsFontStyle.mediamStyle.copyWith(
                            color: clsColors.onbardingColor, fontSize: 14),
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
                        color: isEmail ? Colors.transparent : Colors.white,
                      ),
                      width: (clsDeviceSize.getDeviceWidth(context) / 2) - 20,
                      child: Text(S.of(context).phone,
                          style: clsFontStyle.mediamStyle.copyWith(
                              color: clsColors.onbardingColor, fontSize: 14)),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
        if (widget.state == enscreansState.forgetPassword) ...[
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
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z@.]")),
                  ],
                  keyboardType: TextInputType.emailAddress,
                  controller: _email,
                  focusNode: _emailNode,
                  onSubmitted: (value) {
                    FocusScope.of(context).requestFocus(_passwordNode);
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
                          style: clsFontStyle.mediamStyle
                              .copyWith(fontSize: 14, color: clsColors.gray),
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
                value:S.of(context).phone),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: clsColors.grayLow,
                ),
                width: clsDeviceSize.getDeviceWidth(context),
                child: TextField(
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                  ],
                  keyboardType: TextInputType.phone,
                  focusNode: _phoneNode,
                  controller: _phoe,
                  onSubmitted: (value) {
                    FocusScope.of(context).requestFocus(_passwordNode);
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
                          style: clsFontStyle.mediamStyle
                              .copyWith(fontSize: 14, color: clsColors.gray),
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
        ],
        if (widget.state == enscreansState.detectInfo) ...[
          Pinput(
            length: 6,
            defaultPinTheme: PinTheme(
                width: 44,
                height: 50,
                textStyle: clsFontStyle.bloodStyle.copyWith(
                    fontSize: 16,
                    color: clsColors.primary,
                    fontWeight: FontWeight.w600),
                decoration: BoxDecoration(
                  border: Border.all(color: clsColors.secondary),
                  borderRadius: BorderRadius.circular(12),
                )),

            validator: (s) {
              return s == '2222' ? null : 'Pin is incorrect';
            },
            //  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            showCursor: true,
            onCompleted: (pin) => print(pin),
          ),
          /*
          PinCodeTextField(
            length: 6,

            pinTheme: PinTheme(
                fieldHeight: 50,
                fieldWidth: 44,
                inactiveColor:clsColors.secondary ,

                // decoration: BoxDecoration(
                    //border: Border.all(color: clsColors.secondary),
                    borderRadius: BorderRadius.circular(12)
        // )
    ),
            validator: (s) {
            },
            showCursor: true,
            onCompleted: (pin) => print(pin), appContext: context,
          ),
        */

          Container(
            margin: EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    _timeCounter();
                  },
                  child: Row(
                    children: [
                      Text(
                        S.of(context).resendOtp,
                        style: clsFontStyle.regularStyle
                            .copyWith(fontSize: 12, color: clsColors.secondary),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.rotate_right,
                        color: clsColors.secondary,
                        size: 16,
                      ),
                    ],
                  ),
                ),
                Text(
                  timerCounter.toString(),
                  style: clsFontStyle.regularStyle
                      .copyWith(color: clsColors.black, fontSize: 16),
                )
              ],
            ),
          )
        ],
        const SizedBox(
          height: 20,
        ),
        if (widget.state == enscreansState.Reseat) ...[
          clsTextReqiured(
              style: clsFontStyle.mediamStyle
                  .copyWith(fontSize: 14, color: Colors.black),
              value:S.of(context).newPassword),
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
                        style: clsFontStyle.mediamStyle
                            .copyWith(fontSize: 14, color: clsColors.gray),
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
            height: 20,
          ),
          clsTextReqiured(
              style: clsFontStyle.mediamStyle
                  .copyWith(fontSize: 14, color: Colors.black),
              value: S.of(context).confirmPassword),
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
                        style: clsFontStyle.mediamStyle
                            .copyWith(fontSize: 14, color: clsColors.gray),
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
            height: 20,
          ),
        ],
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                fixedSize: Size(clsDeviceSize.getDeviceWidth(context), 50),
                backgroundColor: clsColors.secondary),
            onPressed: () {
              switch (widget.state) {
                case enscreansState.forgetPassword:
                  {
                    Navigator.of(context).push(clsRithSlideAnimation(
                        page: clsForgetAndReseatPassword(
                      state: enscreansState.detectInfo,
                    )));
                  }
                case enscreansState.detectInfo:
                  {
                    Navigator.of(context).push(clsRithSlideAnimation(
                        page: clsForgetAndReseatPassword(
                      state: enscreansState.Reseat,
                    )));
                  }
                default:
                  {
                    // Navigator.of(context).push(clsRithSlideAnimation(page: clsForgetAndReseatPassword(state: enscreansState.detectInfo,)));
                  }
              }
            },
            child: pvAuthController.isStartLoading
                ? CircularProgressIndicator(
                    color: clsColors.white,
                  )
                : Text(
                    widget.state == enscreansState.forgetPassword
                        ?S.of(context).changePassword
                        : (widget.state == enscreansState.detectInfo
                            ?S.of(context).contenue
                            : S.of(context).changePassword),
                    style: clsFontStyle.regularStyle
                        .copyWith(fontSize: 16, color: Colors.white),
                  )),
        const SizedBox(
          height: 20,
        ),
        if (widget.state != enscreansState.Reseat)
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                width: clsDeviceSize.getDeviceWidth(context),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: clsColors.grayLignt),
                ),
                alignment: Alignment.center,
                child: pvAuthController.isStartLoading
                    ? CircularProgressIndicator(
                        color: clsColors.white,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            S.of(context).goBack,
                            style: clsFontStyle.regularStyle.copyWith(
                                fontSize: 16, color: clsColors.secondary),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: clsColors.secondary,
                          ),
                        ],
                      )),
          ),
      ]),
    )));
  }
}
