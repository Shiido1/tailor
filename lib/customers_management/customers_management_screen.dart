import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizary/utils/colors.dart';
import 'package:sizary/widget/text_field_editing_widget.dart';
import 'package:sizary/widget/text_view_widget.dart';

class CustomersManagement extends StatefulWidget {
  const CustomersManagement({Key key}) : super(key: key);

  @override
  _CustomersManagementState createState() => _CustomersManagementState();
}

class _CustomersManagementState extends State<CustomersManagement> {
  
  TextEditingController customerNameController = TextEditingController();
  TextEditingController customerPhoneNumberController = TextEditingController();
  TextEditingController customerEmailController = TextEditingController();
  TextEditingController customerAddressController = TextEditingController();

  bool browseCatalog = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60,),
            TextViewWidget(
              text: 'Customer Management',
              textSize: 25,
              color: AppColor.black,
              fontWeight: FontWeight.w600,),
            SizedBox(height: 20),
            EditTextWidget(
              err: '', 
              label: 'Customer Name',
              textInputType: TextInputType.text,
              controller: customerNameController),
            EditTextWidget(
              err: '',
              label: 'Phone Number',
              textInputType: TextInputType.number,
              controller: customerPhoneNumberController,),
            EditTextWidget(
              err: '',
              label: 'Email',
              textInputType: TextInputType.name,
              controller: customerEmailController,),
            EditTextWidget(
              err: '',
              label: 'Contact Address',
              textInputType: TextInputType.text,
              controller: customerAddressController,),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/image_mat.png',height: 100,width: 100,),
                  ElevatedButton(
                    onPressed: () {},
                    style: TextButton
                        .styleFrom(
                      backgroundColor:
                      AppColor.topGreen,
                    ),
                    child: TextViewWidget(
                      text: 'Upload Picture',
                      color: AppColor.white,
                      textSize: 18,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                  color: AppColor.purple
              ),
              child: Padding(
                padding: const EdgeInsets.only(left:10,right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextViewWidget(
                      text: 'Browse Catalog',
                      fontWeight: FontWeight.w400,
                      textSize: 18,
                      color: AppColor.white,),
                    browseCatalog==false?IconButton(
                      icon: Icon(Icons.add,color: AppColor.white,),
                      onPressed: ()=>setState((){
                        browseCatalog = true;
                      }),):IconButton(
                      icon: Icon(
                        Icons.minimize_outlined,color: AppColor.white,),
                      onPressed: ()=>setState((){
                        browseCatalog = false;
                      }),)

                  ],
                ),
              ),
            ),
            browseCatalog==false?Container():SizedBox(
              height: 90,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 10,right: 10,top: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 15),
                itemBuilder: (_, index) => Image.asset('assets/image_mat.png'),
                itemCount:8,
              ),
            ),
            SizedBox(height: 25,),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: TextButton
                    .styleFrom(
                  backgroundColor:
                  AppColor.purple,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextViewWidget(
                    text: 'Add Measurement',
                    color: AppColor.white,
                    textSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
