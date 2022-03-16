import 'package:get/get.dart';

void getSnackBar({required String title, required String body}) {
  Get.snackbar(
    title,
    body,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 3),
  );
}
