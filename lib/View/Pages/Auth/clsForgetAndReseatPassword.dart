import 'dart:async';
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
          Provider.of<clsAuthController>(context, listen: false)
              .changeLoadingState(false);
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
          Provider.of<clsAuthController>(context, listen: false)
              .changeLoadingState(false);

          clsCustomMessage.Message("$message", false, context);
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    var pvAuthController = Provider.of<clsAuthController>(context);
    return Scaffold(
        body: SingleChildScrollView(
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
                      ? "نسيت كلمة المرور"
                      : (widget.state == enscreansState.forgetPassword
                          ? "التحقق"
                          : "تغيير كلمة السر"),
                  style: clsFontStyle.bloodStyle
                      .copyWith(fontSize: 20, color: clsColors.onbardingColor),
                ),
                Text(
                  widget.state == enscreansState.forgetPassword
                      ? "يتوجب عليك ادخال بريدك الإلكتروني أ رقم هاتفك للمواصلة"
                      : (widget.state == enscreansState.detectInfo
                          ? (!isEmail
                              ? "أدخل الرقم الذي تم ارساله إلى رقم هاتفك للمواصلة"
                              : "أدخل الرقم الذي تم ارساله إلى رقم بريدك الإلكتروني للمواصلة")
                          : "أدخل الرقم الذي تم ارساله إلى رقم بريدك الإلكتروني للمواصلة"),
                  style: clsFontStyle.regularStyle
                      .copyWith(fontSize: 12, color: clsColors.gray),
                )
              ],
            ),
            Row(
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
                        "البريد الاكتروني",
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
                      child: Text("رقم الهاتف",
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
                value: "البريد الاكتروني"),
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
                          "أدخال بريدك الاكتروني ",
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
                value: "رقم الهاتف"),
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
                          "ادخل رقم الهاتف",
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
                textStyle:clsFontStyle.bloodStyle.copyWith(
                    fontSize: 16,
                    color: clsColors.primary,
                    fontWeight: FontWeight.w600
                ),
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
                        "أعادة ارسال رمز التاكيد",
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
              value: "كلمة السر الجديدة"),
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
              value: "تاكيد كلمة السر"),
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
                        ? "تغيير كلمة السر"
                        : (widget.state == enscreansState.detectInfo
                            ? "متابعه"
                            : "تغيير كلمة السر"),
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
                            "رجوع للخلف",
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
