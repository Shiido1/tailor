import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizary/customers_management/customer/provider.dart';
import 'package:sizary/instance_helper/instances.dart';
import 'package:sizary/utils/colors.dart';
import 'package:sizary/utils/page_route/navigator.dart';
import 'package:sizary/utils/page_route/route.dart';
import 'package:sizary/widget/text_view_widget.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({Key key}) : super(key: key);

  @override
  _CustomersScreenState createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {

  CustomersProvider customersProvider;
  String loginToken;
  @override
  void initState() {
    customersProvider = Provider.of<CustomersProvider>(context,listen:false);
    customersProvider.init(context);

    init();
    super.initState();
  }

  init() async {
    loginToken = await preferencesHelper.getStringValues(key: 'login_token');
    customersProvider.customersProvider(token: loginToken);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,

        leading: IconButton(
          color:AppColor.textColor,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: ()=>PageRouter.gotoNamed(Routes.TAILOR_DASHBOARD_SCREEN, context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:8.0,right:8.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            TextViewWidget(
              text: 'Customers',
              textSize: 25,
              color: AppColor.black,
              fontWeight: FontWeight.w600,),
            SizedBox(height: 20),
            customersList(),
          ],
        ),
      ),
    );
  }

  Widget customersList() {
    return Container(
        child: Consumer<CustomersProvider>(builder: (_, _provider, __)
        {
          if (_provider.customersModel == null) {
            return Center(
                child: TextViewWidget(text: 'No Customer', color: AppColor.black));
          } else {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: _provider.customersModel.length,
              itemBuilder: (context, index) {
                var customersLog = _provider.customersModel[index];
                return Column(
                  children: [
                    SizedBox(height: 13,),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: AppColor.purple
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5,bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextViewWidget(
                                      text: '${customersLog?.customerName??''}',
                                      fontWeight: FontWeight.w500,
                                      textSize: 21,
                                      color: AppColor.white,),
                                    SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        TextViewWidget(
                                          text: 'Pending Payment: ',
                                          fontWeight: FontWeight.w400,
                                          textSize: 14,
                                          color: AppColor.white,),
                                        TextViewWidget(
                                          text: '${customersLog?.pendingpayment??''}',
                                          fontWeight: FontWeight.w400,
                                          textSize: 14,
                                          color: AppColor.white,),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(height: 8,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextViewWidget(
                                          text: 'Total Order: ',
                                          fontWeight: FontWeight.w400,
                                          textSize: 14,
                                          color: AppColor.white,),
                                        TextViewWidget(
                                          text: '${customersLog?.totalorder??''}',
                                          fontWeight: FontWeight.w400,
                                          textSize: 14,
                                          color: AppColor.white,),
                                      ],
                                    ),
                                    SizedBox(height: 5,),
                                    Row(
                                      children: [
                                        TextViewWidget(
                                          text: 'Total Payment: ',
                                          fontWeight: FontWeight.w400,
                                          textSize: 14,
                                          color: AppColor.white,),
                                        TextViewWidget(
                                          text: '${customersLog?.totalpayment??''}',
                                          fontWeight: FontWeight.w400,
                                          textSize: 14,
                                          color: AppColor.white,),
                                      ],
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),

                        ],
                      ),
                    ),

                  ],
                );
              },
            );
          }
        }));
  }
}
