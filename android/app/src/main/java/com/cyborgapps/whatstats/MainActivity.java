package com.cyborgapps.whatstats;

import android.content.Intent;
import android.os.Bundle;

import androidx.annotation.NonNull;

import android.net.Uri;

import android.os.Handler;
import android.os.Looper;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

import io.flutter.embedding.android.FlutterActivity;

public class MainActivity extends FlutterActivity {

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);

    Intent intent = getIntent();
    Uri data = intent.getData();

    if (data != null) {
      new Handler(Looper.getMainLooper()).post(() -> {
        FlutterEngine flutterEngine = getFlutterEngine();
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), "zip_channel")
            .invokeMethod("openZipFile", data.toString());
      });
    }
  }
}
