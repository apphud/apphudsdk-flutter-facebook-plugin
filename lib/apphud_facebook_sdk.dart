import 'package:apphud_facebook_sdk/apphud_facebook_data.dart';

import 'apphud_facebook_sdk_platform_interface.dart';

class ApphudFacebookSdk {
  Future<ApphudFacebookData?> getFacebookData() {
    return ApphudFacebookSdkPlatform.instance.getFacebookData();
  }
}
