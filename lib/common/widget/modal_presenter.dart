import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum DialogOption {
  positive,
  negative,
}

class ModalPresenter {
  static Future presentAlert({
    required String title,
    required String content,
    String confirmText = "確認",
    bool barrierDismissible = false,
  }) async {
    return Get.dialog(
      WillPopScope(
          onWillPop: () async => barrierDismissible,
          child: Dialog(
              backgroundColor: Colors.white,
              insetPadding: const EdgeInsets.all(20),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6.0))),
              child: Padding(
                padding: const EdgeInsets.only(top: 24, left: 20, right: 20, bottom: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: const TextStyle(fontSize: 17)),
                      const SizedBox(height: 5),
                      Container(
                        constraints: const BoxConstraints(minHeight: 40.0),
                        child: Text(content, style: const TextStyle(fontSize: 15)),
                      ),
                      const SizedBox(height: 15),
                      GestureDetector(
                          onTap: Get.back,
                          child: Container(
                            height: 44,
                            color: Colors.grey,
                            width: double.infinity,
                            child: Center(child: Text(confirmText)),
                          ))
                    ],
                  ),
                ),
              ))),
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<DialogOption?> presentDialog({
    required String title,
    required String content,
    String negativeText = "取消",
    String positiveText = "確認",
    bool barrierDismissible = false,
    BuildContext? context,
  }) async {
    DialogOption? option;
    return Get.dialog(
      WillPopScope(
          onWillPop: () async => barrierDismissible,
          child: Dialog(
            backgroundColor: Colors.white,
            insetPadding: const EdgeInsets.all(20),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6.0))),
            child: Padding(
              padding: const EdgeInsets.only(top: 24, left: 20, right: 20, bottom: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title, style: const TextStyle(fontSize: 17)),
                  const SizedBox(height: 5),
                  Container(
                    constraints: const BoxConstraints(minHeight: 40.0),
                    child: Text(content, style: const TextStyle(fontSize: 15)),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                            onTap: () {
                              option = DialogOption.negative;
                              Get.back();
                            },
                            child: Container(
                              height: 44,
                              color: const Color(0xFFF0F0F0),
                              child: Center(child: Text(negativeText)),
                            )),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                            onTap: () {
                              option = DialogOption.positive;
                              Get.back();
                            },
                            child: Container(
                              height: 44,
                              color: Colors.grey,
                              child: Center(child: Text(positiveText)),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
      barrierDismissible: barrierDismissible,
    ).then((_) => option);
  }

  ModalPresenter._();
}
