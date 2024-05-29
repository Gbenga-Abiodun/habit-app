import 'package:get/get.dart';

class ValidationController extends GetxController{
  var allowSignIn = false.obs;
  var allowEmailAndPricing = false.obs;



  void checkAllowSignIn(){
    allowSignIn.value = !allowSignIn.value;
  }
  void checkAllowEmailAndPricing(){
    allowEmailAndPricing.value = !allowEmailAndPricing.value;
  }
}