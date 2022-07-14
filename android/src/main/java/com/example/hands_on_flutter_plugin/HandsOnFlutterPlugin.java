package com.example.hands_on_flutter_plugin;

import static android.content.Context.SENSOR_SERVICE;

import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;

import androidx.annotation.NonNull;

import java.util.List;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** HandsOnFlutterPlugin */
public class  HandsOnFlutterPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private SensorManager sensorManager;
  private FlutterPluginBinding flutterPluginBinding;
  private float[] barometerReading;

  SensorEventListener sensorEventListener = new SensorEventListener(){
    public void onAccuracyChanged(Sensor sensor, int accuracy) {}
    public void onSensorChanged(SensorEvent event) {
       barometerReading = event.values;
    }
  };

  boolean initializeBarometer(){
    sensorManager =  (SensorManager)flutterPluginBinding.getApplicationContext().getSystemService(SENSOR_SERVICE);
    sensorManager.getDefaultSensor(Sensor.TYPE_PRESSURE);
    List list = sensorManager.getSensorList(Sensor.TYPE_ACCELEROMETER);
    sensorManager.registerListener(sensorEventListener, (Sensor) list.get(0), SensorManager.SENSOR_DELAY_NORMAL);
    return  true;
  }

  double getBarometer(){
    return barometerReading[0];
  }

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "hands_on_flutter_plugin");
    channel.setMethodCallHandler(this);
    this.flutterPluginBinding = flutterPluginBinding;
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    }
    else if(call.method.equals("getBarometer")){
      result.success(getBarometer());
    }
    else if(call.method.equals("initializeBarometer")){
      result.success(initializeBarometer());
    }
    else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
