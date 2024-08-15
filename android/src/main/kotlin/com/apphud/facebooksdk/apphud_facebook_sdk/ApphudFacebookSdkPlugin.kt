package com.apphud.facebooksdk.apphud_facebook_sdk

import android.content.Context
import androidx.annotation.NonNull
import com.facebook.appevents.AppEventsLogger
import com.facebook.internal.Utility

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import org.json.JSONObject

/** ApphudFacebookSdkPlugin */
class ApphudFacebookSdkPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private var context : Context? = null

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    context = flutterPluginBinding.applicationContext
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "com.apphud/apphud_facebook_sdk")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getFacebookData" && context != null) {
      val json = JSONObject()
      Utility.setAppEventExtendedDeviceInfoParameters(json, context!!)
      val extInfo = json.get("extinfo")
      val anonID = AppEventsLogger.getAnonymousAppDeviceGUID(context!!)
      val map = mapOf("anon_id" to anonID, "ext_info" to extInfo)
      result.success(map)
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
    context = null
  }
}
