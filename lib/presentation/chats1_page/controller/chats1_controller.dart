import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/chats1_page/models/chats1_model.dart';

/// A controller class for the Chats1Page.
///
/// This class manages the state of the Chats1Page, including the
/// current chats1ModelObj
class Chats1Controller extends GetxController {
  Chats1Controller(this.chats1ModelObj);

  Rx<Chats1Model> chats1ModelObj;
}
