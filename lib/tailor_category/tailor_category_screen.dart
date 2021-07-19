import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizary/instance_helper/instances.dart';
import 'package:sizary/tailor_category/upload_image/model.dart';
import 'package:sizary/tailor_category/upload_image/provider.dart';
import 'package:sizary/utils/colors.dart';
import 'package:sizary/utils/page_route/navigator.dart';
import 'package:sizary/widget/text_field_editing_widget.dart';
import 'package:sizary/widget/text_view_widget.dart';

import 'category_model/model.dart';
import 'category_model/provider.dart';


class TailorCategory extends StatefulWidget {
  const TailorCategory({Key key}) : super(key: key);

  @override
  _TailorCategoryState createState() => _TailorCategoryState();
}

class _TailorCategoryState extends State<TailorCategory> {

  TailorCategoryProvider tailorCategoryProvider;
  CategoryModel categoryModel;
  var img;
  bool iconBarTraditionalWears = false;
  bool iconBarEnglishWears = false;
  bool iconButton = false;
  UploadImageProvider uploadImageProvider;
  List imageType = ['Camera','Gallery'];
  File imageFile;
  File picture;
  var imageString;
  String token,loginToken,image;
  TextEditingController categoryNameController = TextEditingController();

  Future getImage(BuildContext context, bool isCamera) async {
    if (isCamera) {
      var picture = await ImagePicker.pickImage(source: ImageSource.camera);
      if (picture != null && picture.path.isNotEmpty && picture.path != null) {
        setState(() {
          imageFile = File(picture.path);
          imageString = imageFile.path.split("/").last;
        });
          uploadImage();
      }
    } else {
      var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
      if (picture != null && picture.path.isNotEmpty && picture.path != null) {
        setState(() {
          imageFile = File(picture.path);
          imageString = imageFile.path.split("/").last;
        });

        uploadImage();
      }
    }
  }
  Future addImage(BuildContext context, bool isCamera) async {
    if (isCamera) {
      var picture = await ImagePicker.pickImage(source: ImageSource.camera);
      if (picture != null && picture.path.isNotEmpty && picture.path != null) {
        setState(() {
          imageFile = File(picture.path);
          imageString = imageFile.path.split("/").last;
        });
          // uploadImage();
      }
    } else {
      var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
      if (picture != null && picture.path.isNotEmpty && picture.path != null) {
        setState(() {
          imageFile = File(picture.path);
          imageString = imageFile.path.split("/").last;
        });

        // uploadImage();
      }
    }
  }

  Future<void> _showUploadImageDialog(BuildContext parentContext) {
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

  Future<void> _showCategoryDialog(BuildContext parentContext) {
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
                        text: 'Upload Image',
                        color: AppColor.black,
                        textSize: 18,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      _showUploadImageDialog(parentContext);
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 8, 8, 0),
                      child: TextViewWidget(
                        text: 'Add Category',
                        color: AppColor.black,
                        textSize: 18,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      _showAddCategoryDialog(parentContext);
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 8, 8, 0),
                      child: TextViewWidget(
                        text: 'Customers Screen',
                        color: AppColor.black,
                        textSize: 18,
                      ),
                    ),
                    onTap: ()=>
                        PageRouter.gotoNamed(
                            Routes.TAILOR_DASHBOARD_SCREEN, context),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> _showAddCategoryDialog(BuildContext parentContext) {
    return showDialog(
        context: parentContext,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  EditTextWidget(
                      controller: categoryNameController,
                      textInputType: TextInputType.text,
                      err: 'please enter category name',
                      label: 'Category Name',),
                  Center(
                    child: dropDownContainer(),
                  ),
                  SizedBox(height: 20,),
                  Center(
                    child: ElevatedButton(
                      onPressed: (){},
                      style: TextButton
                          .styleFrom(
                        backgroundColor:
                        AppColor.purple,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextViewWidget(
                          text: 'Add',
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
          );
        });
  }

  dropDownContainer()=>Container(
    margin: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColor.black)
    ),
    child: DropdownButton(
        isExpanded: true,
        hint: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextViewWidget(
            text: 'Image',
            color: AppColor.textColor,textSize: 14,
            fontWeight: FontWeight.w500,),
        ),
        value: image,
        onChanged: (value){
          setState(() {
            image = value;
          });
        },
        items: imageType.map((value) {
          return DropdownMenuItem(
            onTap: (){
              // ignore: unrelated_type_equality_checks
              imageType == ['Camera']?
              addImage(context, true):addImage(context,false);
            },
            value: value,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextViewWidget(
                text: value,color: AppColor.black,),
            ),
          );
        }).toList()),
  );

  void uploadImage()async{
    var map = await UploadImageModel.uploadImageToMap(image: imageFile);
    uploadImageProvider.uploadImage(
        imageData: map,
        token: loginToken);
  }

  @override
  void initState() {
    uploadImageProvider = Provider.of<UploadImageProvider>(context,listen:false);
    uploadImageProvider.init(context);
    tailorCategoryProvider = Provider.of<TailorCategoryProvider>(context,listen:false);
    tailorCategoryProvider.init(context);

    init();
    super.initState();
  }

  init() async {
    // token = await preferencesHelper.getStringValues(key: 'token');
    loginToken = await preferencesHelper.getStringValues(key: 'login_token');
    tailorCategoryProvider.tailorCategoryP(token: loginToken);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading: IconButton(
          color:AppColor.textColor,
          icon: Icon(Icons.storage),
          onPressed: ()=>
              PageRouter.gotoNamed(Routes.TAILOR_DASHBOARD_SCREEN, context),
      ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:8.0,right:8.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            TextViewWidget(
                text: 'Tailor Category',
                textSize: 25,
                color: AppColor.black,
                fontWeight: FontWeight.w600,),
            SizedBox(height: 20),
            categoryItem(),
          ],
        ),
      ),
    );
  }

  Widget imageContainer()=>SizedBox(
    height: 350,
    child: Consumer<TailorCategoryProvider>(builder:(_,_provider,__){
      if (_provider.categoryModel == null) {
        return Center(
            child: TextViewWidget(text: 'No Image', color: AppColor.black));
      }else{
        return Container(
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(top: 10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              crossAxisCount: 3,
              mainAxisSpacing: 15,
              mainAxisExtent: 100,),
            itemBuilder: (_, index) {
              var tailorLog = _provider.categoryModel[index];
              for(int i = 0;i < tailorLog.image.length;i++){
                setState(() {
                  img = i;
                });
              }
              // return tailorLog?.image != null && tailorLog.image.isNotEmpty
              //     ? CachedNetworkImage(
              //   imageUrl: img,
              //   fit: BoxFit.cover,
              //      placeholder: (context, index) => Container(
              //       child: Center(
              //         child: SizedBox(
              //             width: 50,
              //             height: 50,
              //             child: CircularProgressIndicator())),
              //   ),
              //   errorWidget: (context, url, error) => new Icon(Icons.error),
              // )
              //     : null;
                return Image.asset('${img??null}',fit: BoxFit.cover,);
              },
            itemCount: _provider.categoryModel.length,
          ),
        );
      }
    }
    ),
  );

  Widget categoryItem() {
    return Container(
      child: Consumer<TailorCategoryProvider>(builder: (_, _provider, __)
    {
      if (_provider.categoryModel == null) {
        return Center(
            child: TextViewWidget(text: 'No Category', color: AppColor.black));
      } else {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: _provider.categoryModel.length,
          itemBuilder: (context, index) {
            var tailorLog = _provider.categoryModel[index];
            return Column(
              children: [
                SizedBox(height: 13,),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: AppColor.purple
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10,bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextViewWidget(
                          text: '${tailorLog?.categoryName??''}',
                          fontWeight: FontWeight.w400,
                          textSize: 18,
                          color: AppColor.white,),
                        iconButton == false ? IconButton(
                          icon: Icon(Icons.add, color: AppColor.white,),
                          onPressed: () =>
                              setState(() {
                                iconButton = true;
                                print('printing image: $img');
                              }),) : IconButton(
                          icon: Icon(
                            Icons.minimize_outlined, color: AppColor.white,),
                          onPressed: () =>
                              setState(() {
                                iconButton = false;
                              }),)

                      ],
                    ),
                  ),
                ),
                iconButton==false?Container():imageContainer()
              ],
            );
          },
        );
      }
    }));
  }
}
