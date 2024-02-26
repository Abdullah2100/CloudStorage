import 'package:cloudapp/Controller/clsCategoryController.dart';
import 'package:cloudapp/Controller/clsContactContoller.dart';
import 'package:cloudapp/Controller/clsContactTypController.dart';
import 'package:cloudapp/Helper/clsColors.dart';
import 'package:cloudapp/Helper/clsCustomMessage.dart';
import 'package:cloudapp/Helper/clsDeviceSize.dart';
import 'package:cloudapp/Helper/clsFontStyle.dart';
import 'package:cloudapp/Helper/clsImages.dart';
import 'package:cloudapp/Modle/clsContactModle.dart';
import 'package:cloudapp/Modle/clsContactTypModle.dart';
import 'package:cloudapp/View/GenralComponent/clsTextReqiured.dart';
import 'package:cloudapp/View/Pages/Category/NumberAndPhone/clsNumberAndPhoneScrean.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloudapp/generated/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class clsAddOrUpdateNumbersScrean extends StatefulWidget {
  clsContactModle? contact ;
  int categoryId;

  clsAddOrUpdateNumbersScrean({super.key, this.contact, required this.categoryId});

  @override
  State<clsAddOrUpdateNumbersScrean> createState() =>
      _clsAddOrUpdateNumbersScreanState();
}

class _clsAddOrUpdateNumbersScreanState
    extends State<clsAddOrUpdateNumbersScrean> {
  TextEditingController _name = TextEditingController();
  TextEditingController _number = TextEditingController();
  TextEditingController _contactType = TextEditingController();
  int? contactIndex;

  FocusNode _nameNode = FocusNode();
  FocusNode _numberNode = FocusNode();

  double _handleDialgoHigh({int size = 0}) {
    switch (size) {
      case 0:
        return 70;
      case 1:
        return 70 + 15;
      case 2:
        return 50 + (50 * (size)).toDouble();
      case 3:
        return 50 + (50 * (size)).toDouble();
      case 4:
        return 50 + (50 * (size)).toDouble();
      case 5:
        return 50 + (50 * (size)).toDouble();
      case 6:
        return 50 + (50 * (size)).toDouble();
      case 7:
        return 50 + (50 * (size)).toDouble();
      case 8:
        return 50 + (50 * (size)).toDouble();
      case 9:
        return 50 + (50 * (size)).toDouble();
      case 10:
        return 50  + (50 * (size)).toDouble();
      case 11:
        return 50 + (50 * (size)).toDouble();
      default:
        return 50 + (50 * (11)).toDouble();
    }
  }

  void _addHandlerResult(BuildContext context, bool? result) async {
    Provider.of<clsContactTypController>(context, listen: false).getTypeNames();

    Future.delayed(Duration(seconds: 2));
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
              backgroundColor: clsColors.white,
              content: StatefulBuilder(
                builder: (context, setState) {
                  return Container(
                    height: 190,
                    child: Column(
                      children: [
                        AnimatedCrossFade(
                            firstChild: result == true
                                ? Container(
                                    decoration: BoxDecoration(
                                        color: clsColors.gray,
                                        shape: BoxShape.circle),
                                    height: 50,
                                    width: 50,
                                    child: Icon(Icons.done),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                        color: clsColors.gray,
                                        shape: BoxShape.circle),
                                    height: 50,
                                    width: 50,
                                    child: Icon(Icons.error_outline)),
                            secondChild: result == true
                                ? Container(
                                    decoration: BoxDecoration(
                                        color: clsColors.grean,
                                        shape: BoxShape.circle),
                                    height: 80,
                                    width: 80,
                                    child: Icon(Icons.done),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                        color: clsColors.red,
                                        shape: BoxShape.circle),
                                    height: 80,
                                    width: 80,
                                    child: Icon(Icons.error_outline)),
                            crossFadeState: result == null
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                            duration: Duration(seconds: 100)),
                        const SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                fixedSize: Size(
                                    clsDeviceSize.getDeviceWidth(context), 50),
                                backgroundColor: clsColors.primary),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              result == true ? "اضيف بنجاح" : "لم تتم الاضافة",
                              style: clsFontStyle.regularStyle
                                  .copyWith(fontSize: 16, color: Colors.white),
                            )),
                      ],
                    ),
                  );
                },
              ));
        });
  }

  void _addNewContactType(BuildContext listContext) async {
    TextEditingController _contactTypNameNew = TextEditingController();
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
              backgroundColor: clsColors.white,
              content: StatefulBuilder(
                builder: (context, setState) {
                  return Container(
                    height: 190,
                    child: Column(
                      children: [
                        clsTextReqiured(
                            isShownStar: false,
                            style: clsFontStyle.mediamStyle
                                .copyWith(fontSize: 14, color: Colors.black),
                            value: "اسم التصنيف"),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: clsColors.grayLow,
                            ),
                            width: clsDeviceSize.getDeviceWidth(context),
                            child: TextField(
                              controller: _contactTypNameNew,
                              onSubmitted: (value) {},
                              style: clsFontStyle.mediamStyle.copyWith(
                                fontSize: 18,
                                color: clsColors.gray,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: clsColors.gray,
                              ),
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                        Consumer<clsContactTypController>(
                            builder: (context, value, childe) {
                          return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  fixedSize: Size(
                                      clsDeviceSize.getDeviceWidth(context),
                                      50),
                                  backgroundColor: clsColors.primary),
                              onPressed: _contactTypNameNew.text.isEmpty
                                  ? null
                                  : () {
                                      Provider.of<clsContactTypController>(
                                              context,
                                              listen: false)
                                          .addnewContactType(
                                              _contactTypNameNew.text)
                                          .then((value) {
                                        Navigator.of(context).pop();
                                        _addHandlerResult(listContext, value);
                                      });
                                    },
                              child: value.isModify
                                  ? CircularProgressIndicator(
                                      color: clsColors.white,
                                    )
                                  : Text(
                                      "حفظ",
                                      style: clsFontStyle.regularStyle.copyWith(
                                          fontSize: 16, color: Colors.white),
                                    ));
                        }),
                      ],
                    ),
                  );
                },
              ));
        });
  }

  void _collectContactType() async {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
              backgroundColor: clsColors.white,
              content: StatefulBuilder(
                builder: (listContext, setState) {
                  return Consumer<clsContactTypController>(
                      builder: (context, value, childe) {
                    return Container(
                      height:
                          _handleDialgoHigh(size: value.contactTypeList.length),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            Container(
                              // color: Colors.green,
                              width: clsDeviceSize.getDeviceWidth(context),
                              height: 50.1 * value.contactTypeList.length,
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                // physics: NeverScrollableScrollPhysics(),

                                itemCount: value.contactTypeList.length,
                                itemBuilder: (context, index) {
                                  clsContactTypModle _contact =
                                      value.contactTypeList[index];
                                  return InkWell(
                                    onTap: () async {
                                      Provider.of<clsContactTypController>(
                                              context,
                                              listen: false)
                                          .selectContactType(index);
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 100,
                                      child: Text(
                                        // "just fack",
                                        _contact.name,
                                        style: clsFontStyle.mediamStyle
                                            .copyWith(
                                                fontSize: 12,
                                                color: clsColors.black),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                _addNewContactType(listContext);
                              },
                              child: Text(
                                "أدخل تصنيف جديد",
                                style: clsFontStyle.mediamStyle.copyWith(
                                    fontSize: 12, color: clsColors.primary),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
                },
              ));
        });
  }

  void _resultAction(String? message, isComplate) {
    switch (isComplate) {
      case true:
        {
          clsCustomMessage.Message("تمت اضافة الرقم بنجاح" ?? "", true, context);
         Provider.of<clsContactController>(context,listen: false).getContacts();
        }

      default:
        {
          clsCustomMessage.Message("$message", false, context);
        }
    }
  }

  void _reseatData(){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var pvContactController =  Provider.of<clsContactTypController>(context, listen: false);
      pvContactController.getTypeNames();
      pvContactController.clearContactTypeIndex();
    });
  }

  void _loadContactData(){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _name.text = widget.contact?.name??"";
        _number.text = widget.contact?.number??"";
      });

      var pvContactController = Provider.of<clsContactTypController>(context,listen: false);

      if(widget.contact?.typeId!=null&&pvContactController.contactTypeList.isNotEmpty){
        var index = pvContactController.contactTypeList.indexWhere((element) => element.id==widget.contact?.typeId);
        pvContactController.selectContactType(
            index
        );

      }

    });

  }


  void _loadData(){

    _reseatData();
    if(widget.contact!=null)
      _loadContactData();
  }
  void _saveContact() async {
    if (_name.text.trim().isEmpty) {
      clsCustomMessage.Message(
          "أسم المستخدم لا يمكن ان يكون فارغ", false, context);
      return;
    }
    if (_number.text.isEmpty) {
      clsCustomMessage.Message(
          "رقم الهاتف لا يمكن ان يكون فارغا", false, context);
      return;
    }

    int categoryId = Provider.of<clsCategoryController>(context, listen: false)
            .cateoryList
            .where((element) => element.name == "number_and_name")
            .toList()
            .first
            .id ??
        1;

    int? contactTypeID =
        Provider.of<clsContactTypController>(context, listen: false)
            .collectIndex;
    clsContactModle _contactModle =  clsContactModle(widget.contact?.id??null, _name.text, _number.text, contactTypeID.toString(), false,null,null);


    switch(widget.contact!=null){
      case false:{
        Provider.of<clsContactController>(context, listen: false)
            .addnewContact(_contactModle, widget.categoryId, _resultAction);

      }
      default:{

        Provider.of<clsContactController>(context, listen: false)
            .updateContact(_contactModle, widget.categoryId, _resultAction);

      }
    }

    }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var pvContactController = Provider.of<clsContactController>(context);
    var pvContactTypeController = Provider.of<clsContactTypController>(context);
    int? contactTypeIndex = pvContactTypeController.collectIndex;
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.only(right: 5, left: 5, bottom: 5),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                fixedSize: Size(clsDeviceSize.getDeviceWidth(context), 50),
                backgroundColor: clsColors.primary),
            onPressed: () {
              _saveContact();
            },
            child: pvContactController.isModify
                ? CircularProgressIndicator(
                    color: clsColors.white,
                  )
                : Text(
                    "حفظ",
                    style: clsFontStyle.regularStyle
                        .copyWith(fontSize: 16, color: Colors.white),
                  )),
      ),
      appBar: AppBar(
        backgroundColor: clsColors.backgroundColor,
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
          margin: EdgeInsets.only(right: 15, left: 15, top: 30),
          child: Column(
            children: [
              clsTextReqiured(
                  style: clsFontStyle.mediamStyle
                      .copyWith(fontSize: 14, color: Colors.black),
                  value: "الاسم"),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: clsColors.grayLow,
                  ),
                  width: clsDeviceSize.getDeviceWidth(context),
                  child: TextField(
                    focusNode: _nameNode,
                    controller: _name,
                    onSubmitted: (value) {},
                    style: clsFontStyle.mediamStyle.copyWith(
                      fontSize: 18,
                      color: clsColors.gray,
                    ),
                    decoration: InputDecoration(
                        label: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            "أدخل اسم",
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
                  )),
              const SizedBox(
                height: 15,
              ),
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
                    maxLength: 15,
                    decoration: InputDecoration(
                        label: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            "+966 xxx xxx xxx",
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
                  )),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  clsTextReqiured(
                    isShownStar: false,
                      style: clsFontStyle.mediamStyle
                          .copyWith(fontSize: 14, color: Colors.black),
                      value: "التصنيف"),
                  Text(
                    " (اختياري)",
                    style: clsFontStyle.regularStyle
                        .copyWith(color: clsColors.gray),
                  )
                ],
              ),
              InkWell(
                onTap: () {
                  _collectContactType();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: clsColors.grayLow,
                      borderRadius: BorderRadius.circular(8)),
                  height: 50,
                  width: clsDeviceSize.getDeviceWidth(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
    "${contactTypeIndex != null ? pvContactTypeController.contactTypeList[contactTypeIndex].name: "أدخل التصنيف"}",
                        style: clsFontStyle.regularStyle
                            .copyWith(color: clsColors.gray, fontSize: 12),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: clsColors.gray,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
