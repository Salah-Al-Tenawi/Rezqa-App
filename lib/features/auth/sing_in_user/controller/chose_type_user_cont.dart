import 'package:get/get.dart';

abstract class ChoseTypeUserController extends GetxController {
  gotocomapnyinfo();
  gotofreelancerinfo();
  gotocustominfo();
}
class ChoseTypeUserControllerIm extends ChoseTypeUserController{
  @override
  gotocomapnyinfo() {
 
  }

  @override
  gotocustominfo() {
    // TODO: implement gotocustominfo
    throw UnimplementedError();
  }

  @override
  gotofreelancerinfo() {
    // TODO: implement gotofreelancerinfo
    throw UnimplementedError();
  } 

}