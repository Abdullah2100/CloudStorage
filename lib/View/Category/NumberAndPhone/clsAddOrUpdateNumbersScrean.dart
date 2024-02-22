import 'package:cloudapp/Helper/clsColors.dart';
import 'package:cloudapp/Helper/clsDeviceSize.dart';
import 'package:cloudapp/Helper/clsFontStyle.dart';
import 'package:cloudapp/Helper/clsImages.dart';
import 'package:cloudapp/View/GenralComponent/clsTextReqiured.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class clsAddOrUpdateNumbersScrean extends StatefulWidget {
  int indexNumber = 0;

  clsAddOrUpdateNumbersScrean({super.key, this.indexNumber = 0});

  @override
  State<clsAddOrUpdateNumbersScrean> createState() =>
      _clsAddOrUpdateNumbersScreanState();
}

class _clsAddOrUpdateNumbersScreanState
    extends State<clsAddOrUpdateNumbersScrean> {

  TextEditingController _name = TextEditingController();
  TextEditingController _number = TextEditingController();
  FocusNode _nameNode =FocusNode();
  FocusNode _numberNode =FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text(
          "إضافة جهة اتصال",
          style: clsFontStyle.bloodStyle
              .copyWith(color: Colors.black, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          margin: EdgeInsets.only(right: 15,left: 15),
          child: Column(
            children: [
              clsTextReqiured(
                  style: clsFontStyle.mediamStyle
                      .copyWith(fontSize: 14, color: Colors.black),
                  value: "إسم المستخدم"),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: clsColors.grayLow,
                  ),
                  width: clsDeviceSize.getDeviceWidth(context),
                  child: TextField(
                    focusNode: _nameNode,
                    controller: _name,
                    onSubmitted: (value) {
                    },
                    style: clsFontStyle.mediamStyle.copyWith(
                      fontSize: 18,
                      color: clsColors.gray,
                    ),
                    decoration: InputDecoration(
                        label: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            "أدخل اسم حسابك",
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

              const SizedBox(height: 15,),
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
                    focusNode: _numberNode,
                    controller: _number,
                    onSubmitted: (value) {
                   FocusScope.of(context).nextFocus();
                    },
                    style: clsFontStyle.mediamStyle.copyWith(
                      fontSize: 18,
                      color: clsColors.gray,
                    ),
                    decoration: InputDecoration(
                        label: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            "+966 xxx xxx xxx",
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
          ),
        ),
      ),
    );
  }
}
