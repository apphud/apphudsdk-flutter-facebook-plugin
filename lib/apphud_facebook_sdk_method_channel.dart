import 'package:apphud_facebook_sdk/apphud_facebook_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'apphud_facebook_sdk_platform_interface.dart';

/// An implementation of [ApphudFacebookSdkPlatform] that uses method channels.
class MethodChannelApphudFacebookSdk extends ApphudFacebookSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('com.apphud/apphud_facebook_sdk');

  @override
  Future<ApphudFacebookData?> getFacebookData() async {
    final map = await methodChannel.invokeMethod<Map>('getFacebookData');
    if (map == null) return null;
    final extInfo = map['ext_info'] as String?;
    final anonId = map['anon_id'] as String?;
    return ApphudFacebookData(
      extInfo: extInfo,
      anonId: anonId,
    );
  }
}
