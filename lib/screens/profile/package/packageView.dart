
import 'package:Lover369/widgets/button.dart';
import 'package:Lover369/widgets/dropdown.dart';
import 'package:Lover369/widgets/inputs.dart';
import 'package:Lover369/widgets/loading.dart';
import 'package:Lover369/widgets/package_Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../../../utils/theme/colors.dart';
import '../../../utils/theme/theme.dart';
import '../../../utils/translations.dart';
import '../../../widgets/appBar.dart';
import '../../../widgets/label.dart';
import '../../../widgets/packageItem.dart';
import 'interfaces/packageViewInterface.dart';
import 'packageController.dart';

class PackageView extends GetView<PackageController> implements PackageViewInterface {
  const PackageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
        body:Obx(() => controller.loading.value?circularLoading():body(context)),
    );
  }
  AppBar appbar() {
    return AppBar(
      title: Obx(() => Text(MyText.packages.value)),
    );
  }
  @override
  appBar() {
    return Obx(() => defaultAppBar(title: MyText.packages.value, actions: null,showLeading: true));
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
        child:SingleChildScrollView(
      child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        title(),
        description(),
        packages()
      ],
      )));
  }

  @override
  Widget title() {
    return Container(
      child: Text("increase your wallet".toUpperCase(),style: TextStyle(color: primaryColor,fontSize: 24,fontWeight: FontWeight.bold),),
    ).paddingAll(16);
  }

  @override
  Widget description() {
    return Container(
      child: Text("Increase your wallet by choosing one of these packages ",style:TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.normal),textAlign: TextAlign.center),
    ).paddingAll(8);
  }

  @override
  Widget packages() {
    return Obx(() => Column(
      children: controller.packages.map((element){return PackageItem(element,handleClick);}).toList() ),
    );
  }

  void handleClick(element,context){


   controller.updatePackagePrice(element.price.toString());
    controller.updatePackageId(element.id.toString());

    List<DropdownMenuItem<String>> menuItems = controller!.gateways!.value!.map<DropdownMenuItem<String>>((element) => DropdownMenuItem(child: Text(element.name!),value:element.id.toString()! )).toList() as List<DropdownMenuItem<String>> ;

    showDialog<void>(

      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content:Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 15,horizontal: 5),
            child:SingleChildScrollView(
              child:   Column(
                children: <Widget>[
                  Center(child: Text("Review Summary",style: TextStyle(fontWeight: FontWeight.bold),),),
                  packageItem(element.price!,element.tokens!),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Amount",style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("\$ ${element.price.toString()}",style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total",style: TextStyle(fontWeight: FontWeight.bold)),
                      Obx(()=> Text("\$ ${controller.package_price.value}",style: TextStyle(fontWeight: FontWeight.bold)))

                    ],
                  ),
                  SizedBox(height: 25,),
                  Row(
                    children: [
                      Text("Discount Code",style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                  inputDiscount(context),
                  SizedBox(height: 25,),
                  Row(
                    children: [
                      Text("Payment Method",style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                  dropdown(menuItems,controller.onChangedGateway,controller.gateway.value!=""?controller.gateway.value: menuItems[0].value,leftPadding: 8),

                  SizedBox(height: 20,),
                  Divider(height: 10,color: Color(0xffeeeeee)),
                  SizedBox(height: 20,),
                  submitButton()


                ],
              ),
            )


          ),
        );

      },
    );
  }
  Widget submitButton() {
    return Obx(() => Button(
      onPressed: () {
        controller.buyPay();
      },
      text:"Pay",
      loading: controller.loadingPay.value,
    ));
  }
  Widget inputDiscount(context) {
    return Obx(() => inputBox(context, controller.discountController,
        suffixIconClick:GestureDetector(onTap: (){
          controller.checkCode();
        },
        child: Icon( Icons.refresh),
        ),suffixLoading: controller.loadingDiscountCode.value?Transform.scale(
          scale: 0.5,
          child: CircularProgressIndicator(),
        ):null, hint: "enter your discount code ",hasError: controller.discountHasError.value,errorMessage: controller.errorMessage.value));
  }

}
