package com.deephow.storage_utility

import android.os.StatFs

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** StorageUtilityPlugin */
class StorageUtilityPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(
            flutterPluginBinding.binaryMessenger,
            "plugins.deephow.com/storage_utility"
        )
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        // Get path from arguments
        val path = call.argument<String>("path")
        path ?: run {
            result.error("invalid_path", "Missing required path argument", null)
            return
        }

        // Retrieve overall information about the space on a filesystem.
        val stat = StatFs(path)

        when (call.method) {
            "getFreeBytes" -> {
                result.success(stat.availableBytes)
            }
            "getTotalBytes" -> {
                result.success(stat.totalBytes)
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
