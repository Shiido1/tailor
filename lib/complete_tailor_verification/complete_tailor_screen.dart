import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizary/complete_tailor_verification/provider.dart';
import 'package:sizary/complete_tailor_verification/repo.dart';
import 'package:sizary/instance_helper/instances.dart';
import 'package:sizary/utils/colors.dart';
import 'package:sizary/widget/text_field_editing_widget.dart';
import 'package:sizary/widget/text_view_widget.dart';

import 'model.dart';

class CompleteTailorScreen extends StatefulWidget {
  const CompleteTailorScreen({Key key}) : super(key: key);

  @override
  _CompleteTailorScreenState createState() => _CompleteTailorScreenState();
}

class _CompleteTailorScreenState extends State<CompleteTailorScreen> {
  CompleteTailorAccountProvider completeTailorAccountProvider;
  CompleteTailorRepo completeTailorRepo;

  TextEditingController shopNameController = TextEditingController();
  TextEditingController contactAddressController = TextEditingController();
  TextEditingController shopAddressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController tagController = TextEditingController();
  TextEditingController fabricController = TextEditingController();

  TextEditingController tag2 = TextEditingController();
  TextEditingController tag1 = TextEditingController();
  String token;

  File imageFile;
  File picture;
  var imageString;

  bool _isShopName = false;
  bool _isContactAddress = false;
  bool _isShopAddress = false;

  bool _isPhone = false;
  bool _isState = false;
  bool _isAddress = false;
  bool _isTag = false;
  bool _isFabric = false;

  bool _validateInputs() {
    if (shopNameController.text.isEmpty) {
      setState(() => _isShopName = true);
      return false;
    }
    if (contactAddressController.text.isEmpty) {
      setState(() => _isContactAddress = true);
      return false;
    }

    if (shopAddressController.text.isEmpty) {
      setState(() => _isShopAddress = true);
      return false;
    }

    if (phoneController.text.isEmpty) {
      setState(() => _isPhone = true);
      return false;
    }

    if (stateController.text.isEmpty) {
      setState(() => _isState = true);
      return false;
    }

    if (tagController.text.isEmpty) {
      setState(() => _isTag = true);
      return false;
    }

    if (fabricController.text.isEmpty) {
      setState(() => _isFabric = true);
      return false;
    }

    if (stateController.text.isEmpty) {
      setState(() => _isState = true);
      return false;
    }

    if (addressController.text.isEmpty) {
      setState(() => _isAddress = true);
      return false;
    }
    return true;
  }

  @override
  void initState() {
    completeTailorAccountProvider =
        Provider.of<CompleteTailorAccountProvider>(context, listen: false);
    completeTailorAccountProvider.init(context);
    init();
    super.initState();
  }

  init() async {
    token = await preferencesHelper.getStringValues(key: 'token');
  }

  void completeAccount()async{
    FocusScope.of(context).unfocus();
    if (_validateInputs()){
      var map = await CompleteTailorModel.completeToTailorMap(
          shopName: shopNameController.text,
          cac: contactAddressController.text,
          shopAddress: shopAddressController.text,
          phone: phoneController.text,
          state: stateController.text,
          tags:  '["${tagController.text}","${tagController.text}"]',
          address: addressController.text,
          fabrics: fabricController.text,
          logo: imageFile,);
      completeTailorAccountProvider.verifyTailorAccount(
        map: map,
        token: token
      );
    }

    setState(() {});
  }

  @override
  void dispose() {
    shopNameController.dispose();
    contactAddressController.dispose();
    shopAddressController.dispose();
    phoneController.dispose();
    stateController.dispose();
    addressController.dispose();
    tagController.dispose();
    fabricController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            TextViewWidget(
              text: 'Complete Tailor Account',
              textSize: 30,
              color: AppColor.black,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 30),
            EditTextWidget(
              err: 'please enter shop name',
              label: 'Shop Name',
              textInputType: TextInputType.text,
              controller: shopNameController,
              isValidationError: _isShopName,
              textCallBack: (_) => setState(() => _isShopName = false),
            ),
            EditTextWidget(
              err: 'please enter contact address',
              label: 'Contact Address',
              textInputType: TextInputType.text,
              controller: contactAddressController,
              isValidationError: _isContactAddress,
              textCallBack: (_) => setState(() => _isContactAddress = false),
            ),
            EditTextWidget(
              err: 'please enter shop address',
              label: 'Shop Address',
              textInputType: TextInputType.text,
              controller: shopAddressController,
              isValidationError: _isShopAddress,
              textCallBack: (_) => setState(() => _isShopAddress = false),
            ),
            EditTextWidget(
              err: 'please enter phone number',
              label: 'Phone Number',
              textInputType: TextInputType.number,
              controller: phoneController,
              isValidationError: _isPhone,
              textCallBack: (_) => setState(() => _isPhone = false),
            ),
            EditTextWidget(
              err: 'please enter state',
              label: 'State',
              textInputType: TextInputType.text,
              controller: stateController,
              isValidationError: _isState,
              textCallBack: (_) => setState(() => _isState = false),
            ),
            EditTextWidget(
              err: 'please enter tag',
              label: 'Tags',
              textInputType: TextInputType.text,
              controller: tagController,
              isValidationError: _isTag,
              textCallBack: (_) => setState(() => _isTag = false),
            ),
            EditTextWidget(
              err: 'please enter Address',
              label: 'Address',
              textInputType: TextInputType.text,
              controller: addressController,
              isValidationError: _isAddress,
              textCallBack: (_) => setState(() => _isAddress = false),
            ),
            EditTextWidget(
              err: 'please enter fabric',
              label: 'Fabrics',
              textInputType: TextInputType.text,
              controller: fabricController,
              isValidationError: _isFabric,
              textCallBack: (_) => setState(() => _isFabric = false),
            ),
            Padding(
              padding: EdgeInsets.only(left: 26, right: 16, top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () async {
                      await _showDialog(context);
                    },
                    child: TextViewWidget(
                      text: 'logo',
                      fontWeight: FontWeight.w500,
                      color: AppColor.black,
                      textSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                      child: TextViewWidget(
                    text: imageString == null ? "" : '$imageString',
                    color: AppColor.black,
                    fontWeight: FontWeight.w400,
                    textSize: 18,
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  print('you press meee');
                  completeAccount();
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColor.purple,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextViewWidget(
                    text: 'Complete Account',
                    color: AppColor.white,
                    textSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Future getImage(BuildContext context, bool isCamera) async {
    if (isCamera) {
      var picture = await ImagePicker().getImage(source: ImageSource.camera);
      if (picture != null && picture.path.isNotEmpty && picture.path != null) {
        setState(() {
          imageFile = File(picture.path);
          imageString = imageFile.path.split("/").last;
        });
      }
    } else {
      var picture = await ImagePicker().getImage(source: ImageSource.gallery);
      if (picture != null && picture.path.isNotEmpty && picture.path != null) {
        setState(() {
          imageFile = File(picture.path);
          imageString = imageFile.path.split("/").last;
        });
      }
    }
  }

  Future<void> _showDialog(BuildContext parentContext) {
    return showDialog(
        context: parentContext,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 8, 8),
                      child: TextViewWidget(
                        text: 'Camera',
                        color: AppColor.black,
                        textSize: 18,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      getImage(parentContext, true);
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 8, 8, 0),
                      child: TextViewWidget(
                        text: 'Gallery',
                        color: AppColor.black,
                        textSize: 18,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      getImage(parentContext, false);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
