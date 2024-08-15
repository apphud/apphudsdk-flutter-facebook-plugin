import 'package:apphud_facebook_sdk/apphud_facebook_data.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'apphud_facebook_sdk_method_channel.dart';

abstract class ApphudFacebookSdkPlatform extends PlatformInterface {
  /// Constructs a ApphudFacebookSdkPlatform.
  ApphudFacebookSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static ApphudFacebookSdkPlatform _instance = MethodChannelApphudFacebookSdk();

  /// The default instance of [ApphudFacebookSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelApphudFacebookSdk].
  static ApphudFacebookSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ApphudFacebookSdkPlatform] when
  /// they register themselves.
  static set instance(ApphudFacebookSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<ApphudFacebookData?> getFacebookData() {
    throw UnimplementedError('getFacebookData() has not been implemented.');
  }
}
