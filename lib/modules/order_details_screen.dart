import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:store_app/layout/cubit/cubit.dart';
import 'package:store_app/layout/cubit/states.dart';
import 'package:store_app/modules/Login_screen/cubit/cubit.dart';
import 'package:store_app/modules/product_details.dart';
import 'package:store_app/shared/components/components.dart';
import 'package:store_app/shared/constants/constant.dart';
import 'package:store_app/styles/colors/colors.dart';
import 'package:uuid/uuid.dart';

class OrderDetailsScreen extends StatelessWidget {
  final String productId;
  final String id;
  final double price;
  final double subTotal;
  final int quantity;
  final String title;
  final String imageUrl;
   OrderDetailsScreen(
      {@required this.id,
        @required this.productId,
        @required this.price,
        @required this.quantity,
        @required this.subTotal,
        @required this.title,
        @required this.imageUrl});
  var uuid = Uuid();
  var formKey = GlobalKey<FormState>();
  var anotherPhoneController=TextEditingController();
  var addressDetailsController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreAppCubit, StoreAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var productAttr = StoreAppCubit.get(context).findById(productId);
        double total= subTotal+10;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.tealAccent,
            elevation: 0,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.tealAccent,
                    Colors.green[100],
                  ],
                ),
              ),
            ),
            actions: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 13),
                child: Text(
                  'تفاصيل الطلب',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10),
                        child: Text(
                          'تفاصيل التواصل',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.end,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      myDivider(),
                      Container(
                        color: Colors.white,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${LoginCubit.get(context).name}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.end,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(fontSize: 15),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                '${LoginCubit.get(context).address}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.end,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .copyWith(fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${LoginCubit.get(context).phone}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.end,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .copyWith(fontSize: 15),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                      myDivider(),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        color: Colors.white,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'ج.م',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        Text(
                                          '${productAttr.price.toStringAsFixed(0)}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Text(
                                      'السعر',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width: 46,
                                        ),
                                        Text(
                                          '${quantity}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Text(
                                      'الكميه',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'ج.م',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        Text(
                                          '${subTotal.toStringAsFixed(0)}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Text(
                                      'الاجمالي',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'ج.م',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        Text(
                                          '10',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Text(
                                      'الشحن',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'ج.م',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        Text(
                                          '${total.toStringAsFixed(0)}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Text(
                                      ' السعر الكلي ',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      myDivider(),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        color: Colors.white,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              defaultFormField(
                                  type: TextInputType.text,
                                  controller: addressDetailsController,
                                  onSubmit: () {},
                                  prefix: Icons.location_on,
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'العنوان الذي ادخلته غير صالح';
                                    }
                                    return null;
                                  },
                                  context: context,
                                  labelText: 'تفاصيل اكثر عن العنوان '
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              defaultFormField(
                                  type: TextInputType.phone,
                                  controller: anotherPhoneController,
                                  onSubmit: () {},
                                  prefix: Icons.call,
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'رثم الهاتف الذي ادخلته غير صالح';
                                    }
                                    return null;
                                  },
                                  context: context,
                                  labelText: 'رقم هاتف اخر للتواصل'
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                      myDivider(),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: RaisedButton(
                      onPressed: () async {
                        final orderId=uuid.v4();
                        if (formKey.currentState.validate()) {
                          await FirebaseFirestore.instance
                              .collection('orders')
                              .doc(orderId)
                              .set({
                            'orderId': orderId.toString(),
                            'productId': productId.toString(),
                            'userId': LoginCubit.get(context).uId.toString(),
                            'title': title,
                            'price': price,
                            'subTotal': subTotal,
                            'total':total,
                            'userPhone': LoginCubit
                                .get(context)
                                .phone,
                            'username': LoginCubit
                                .get(context)
                                .name,
                            'quantity': quantity,
                            'userAddress': LoginCubit
                                .get(context)
                                .address,
                            'addressDetails': addressDetailsController.text,
                            'anotherNumber': anotherPhoneController.text,
                            'imageUrl': imageUrl,
                          });
                          LoginCubit.get(context).getOrders();
                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(color: Colors.redAccent),
                      ),
                      color: Colors.redAccent,
                      child: Text(
                        'تاكيد الطلب',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).textSelectionColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: RaisedButton(
                      onPressed: ()  {

                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(color: Colors.redAccent),
                      ),
                      color: Colors.redAccent,
                      child: Text(
                        'الاتصال للطلب',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).textSelectionColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}