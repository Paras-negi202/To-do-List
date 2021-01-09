package io.flutter.plugins;

import androidx.annotation.Keep;
import androidx.annotation.NonNull;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.plugins.shim.ShimPluginRegistry;

/**
 * Generated file. Do not edit.
 * This file is generated by the Flutter tool based on the
 * plugins that support the Android platform.
 */
@Keep
public final class GeneratedPluginRegistrant {
  public static void registerWith(@NonNull FlutterEngine flutterEngine) {
    ShimPluginRegistry shimPluginRegistry = new ShimPluginRegistry(flutterEngine);
      com.ko2ic.imagedownloader.ImageDownloaderPlugin.registerWith(shimPluginRegistry.registrarFor("com.ko2ic.imagedownloader.ImageDownloaderPlugin"));
      com.example.imagegallerysaver.ImageGallerySaverPlugin.registerWith(shimPluginRegistry.registrarFor("com.example.imagegallerysaver.ImageGallerySaverPlugin"));
      io.flutter.plugins.imagepickersaver.ImagePickerSaverPlugin.registerWith(shimPluginRegistry.registrarFor("io.flutter.plugins.imagepickersaver.ImagePickerSaverPlugin"));
    flutterEngine.getPlugins().add(new com.baseflow.permissionhandler.PermissionHandlerPlugin());
  }
}