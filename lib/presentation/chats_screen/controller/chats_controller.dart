import 'package:uptm_secure_stay/core/app_export.dart';
import 'package:uptm_secure_stay/presentation/chats_screen/models/chats_model.dart';

/// A controller class for the ChatsScreen.
///
/// This class manages the state of the ChatsScreen, including the
/// current chatsModelObj
class ChatsController extends GetxController {
  Rx<ChatsModel> chatsModelObj = ChatsModel().obs;
}
