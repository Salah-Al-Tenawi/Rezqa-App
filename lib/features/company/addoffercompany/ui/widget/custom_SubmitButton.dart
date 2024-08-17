import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:freelanc/features/company/addoffercompany/controller/CombanyAddofferController.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

// ignore: must_be_immutable
class buildSubmitButton extends StatelessWidget {
  CompanyOfferController companyOfferController ;
   buildSubmitButton({
    super.key,
    required this.companyOfferController,
  });
  @override
  Widget build(BuildContext context) {
   return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Obx(
        () {
          if (companyOfferController.isLoading()) {
            return const SpinKitCircle(
              color: Colors.blue,
              size: 50.0,
            );
          } else {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 42, 84, 124),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              onPressed: () {
                companyOfferController.sendData();
              },
              child: const Text(
                'إضافة العرض',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            );
          }
        },
      ),
    );
  }

}