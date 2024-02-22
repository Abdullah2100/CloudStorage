import 'package:cloudapp/Controller/clsLocalizationContoller.dart';
import 'package:cloudapp/Helper/clsColors.dart';
import 'package:cloudapp/Helper/clsDeviceSize.dart';
import 'package:cloudapp/Helper/clsFontStyle.dart';
import 'package:cloudapp/Helper/clsImages.dart';
import 'package:cloudapp/View/GenralComponent/clsTextReqiured.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class clsPasswordAndAccountScrean extends StatefulWidget {
  const clsPasswordAndAccountScrean({super.key});

  @override
  State<clsPasswordAndAccountScrean> createState() =>
      _clsPasswordAndAccountScreanState();
}

class _clsPasswordAndAccountScreanState
    extends State<clsPasswordAndAccountScrean> {
  TextEditingController _accounttype = TextEditingController();
  TextEditingController _accountName = TextEditingController();
  TextEditingController _password = TextEditingController();
  FocusNode _accounttypeFocuse = FocusNode();
  FocusNode _accountFocuse = FocusNode();
  FocusNode _passwordFocuse = FocusNode();
  FocusNode _btnFocuse = FocusNode();

  void _showGreatingMassege() async {
    Locale? _current =
        Provider.of<clsLocalizationContoller>(context, listen: false).local;
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
              backgroundColor: clsColors.white,
              content: StatefulBuilder(
                builder: (context, setState) {
                  return Container(
                    height: 299,
                    width: 358,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                clsImages.copy,
                                height: 24,
                                width: 24,
                                color: clsColors.gray,
                              ),
                              Text(
                                _accounttype.text.length > 25
                                    ? _accounttype.text.substring(0, 25)
                                    : _accounttype.text,
                                style: clsFontStyle.mediamStyle.copyWith(
                                    fontSize: 16, color: clsColors.black),
                              ),
                              Text(""),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            clsTextReqiured(
                                isShownStar: false,
                                style: clsFontStyle.mediamStyle.copyWith(
                                    fontSize: 14, color: Colors.black),
                                value: "نوع الحساب"),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: clsColors.grayLow,
                                ),
                                width: clsDeviceSize.getDeviceWidth(context),
                                child: TextField(
                                  onChanged: (value) {
                                    if (value.length > 25) {
                                      return;
                                    }
                                  },
                                  controller: _accounttype,
                                  focusNode: _accounttypeFocuse,
                                  style: clsFontStyle.mediamStyle.copyWith(
                                    fontSize: 18,
                                    color: clsColors.gray,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                      left: _current == Locale('en') ? 20 : 0,
                                      right: _current == Locale('ar') ? 20 : 0,
                                    ),
                                    floatingLabelAlignment:
                                        FloatingLabelAlignment.start,
                                    label: Text(
                                      "اسم الحساب ...",
                                      textAlign: TextAlign.center,
                                      style: clsFontStyle.mediamStyle.copyWith(
                                          fontSize: 14, color: clsColors.gray),
                                    ),
                                    border: InputBorder.none,
                                    fillColor: clsColors.gray,
                                  ),
                                )),
                          ],
                        ),
                        Column(
                          children: [
                            clsTextReqiured(
                                isShownStar: false,
                                style: clsFontStyle.mediamStyle.copyWith(
                                    fontSize: 14, color: Colors.black),
                                value: "اسم المستخدم"),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: clsColors.grayLow,
                                ),
                                width: clsDeviceSize.getDeviceWidth(context),
                                child: TextField(
                                  onChanged: (value) {
                                    if (value.length > 25) {
                                      return;
                                    }
                                  },
                                  controller: _accounttype,
                                  focusNode: _accounttypeFocuse,
                                  style: clsFontStyle.mediamStyle.copyWith(
                                    fontSize: 18,
                                    color: clsColors.gray,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                      left: _current == Locale('en') ? 20 : 0,
                                      right: _current == Locale('ar') ? 20 : 0,
                                    ),
                                    floatingLabelAlignment:
                                        FloatingLabelAlignment.start,
                                    label: Text(
                                      "اسم الحساب ...",
                                      textAlign: TextAlign.center,
                                      style: clsFontStyle.mediamStyle.copyWith(
                                          fontSize: 14, color: clsColors.gray),
                                    ),
                                    border: InputBorder.none,
                                    fillColor: clsColors.gray,
                                  ),
                                )),
                          ],
                        ),
                        Column(
                          children: [
                            clsTextReqiured(
                                isShownStar: false,
                                style: clsFontStyle.mediamStyle.copyWith(
                                    fontSize: 14, color: Colors.black),
                                value: "كلمة المرور"),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: clsColors.grayLow,
                                ),
                                width: clsDeviceSize.getDeviceWidth(context),
                                child: Row(
                                  children: [
                                    TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                "اظهار",
                                                style: clsFontStyle.regularStyle
                                                    .copyWith(
                                                      color: clsColors.black
                                                    ),
                                              ))
                                          ,
                                          SizedBox(width: 4,),
                                    SizedBox(
                                    width: clsDeviceSize.getDeviceWidth(context)*0.8,
                                      child: TextField(
                                        onChanged: (value) {
                                          if (value.length > 25) {
                                            return;
                                          }
                                        },
                                        controller: _accounttype,
                                        focusNode: _accounttypeFocuse,
                                        style: clsFontStyle.mediamStyle.copyWith(
                                          fontSize: 18,
                                          color: clsColors.gray,
                                        ),
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                              left: _current == Locale('en') ? 20 : 0,
                                              right:
                                                  _current == Locale('ar') ? 20 : 0,
                                            ),
                                            floatingLabelAlignment:
                                                FloatingLabelAlignment.start,
                                            label: Text(
                                              "اسم الحساب ...",
                                              textAlign: TextAlign.center,
                                              style: clsFontStyle.mediamStyle
                                                  .copyWith(
                                                      fontSize: 14,
                                                      color: clsColors.gray),
                                            ),
                                            border: InputBorder.none,
                                            fillColor: clsColors.gray,
                                                 ),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clsColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: clsColors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              color: clsColors.black,
              size: 24,
            ),
          )
        ],
        leading: Image.asset(
          clsImages.setting,
          color: clsColors.black,
        ),
        title: Text(
          "اسم المستخدم وكلمة المرور",
          style: clsFontStyle.bloodStyle
              .copyWith(color: Colors.black, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: clsDeviceSize.getDeviceHeight(context),
          width: clsDeviceSize.getDeviceWidth(context),
          // color: Colors.green,
          margin: EdgeInsets.only(right: 15, left: 15, top: 20),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(clsImages.phonse),
                    Theme(
                      data: Theme.of(context).copyWith(
                          primaryColor: clsColors.white,
                          cardColor: clsColors.white),
                      child: InkWell(
                        radius: 8,
                        onTap: () {
                          _showGreatingMassege();
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: clsColors.primary),
                            width: 141,
                            height: 32,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_box,
                                  size: 16,
                                  color: clsColors.white,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "إضافة حساب جديد",
                                  style: clsFontStyle.regularStyle.copyWith(
                                      fontSize: 12, color: clsColors.white),
                                )
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
