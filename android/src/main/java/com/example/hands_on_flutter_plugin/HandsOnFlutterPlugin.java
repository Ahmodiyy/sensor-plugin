package com.example.hands_on_flutter_plugin;

import static android.content.Context.SENSOR_SERVICE;

import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** HandsOnFlutterPlugin */
public class  HandsOnFlutterPlugin implements FlutterPlugin, MethodCallHandler, SensorEventListener {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private SensorManager sensorManager;
  private Sensor sensor;
  private FlutterPluginBinding flutterPluginBinding;
  private double barometerReading;

  HandsOnFlutterPlugin(FlutterPluginBinding flutterPluginBinding){
    this.flutterPluginBinding = flutterPluginBinding;
  }

  boolean initializeBarometer(){
    sensorManager =  (SensorManager)flutterPluginBinding.getApplicationContext().getSystemService(SENSOR_SERVICE);
    sensorManager.getDefaultSensor(Sensor.TYPE_PRESSURE);
    sensorManager.registerListener(this, sensor,SensorManager.SENSOR_DELAY_NORMAL);
    return  true;
  }

  double getBarometerReading(){
    return barometerReading;
  }

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "hands_on_flutter_plugin");
    channel.setMethodCallHandler(new HandsOnFlutterPlugin(flutterPluginBinding));

  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    }
    else if(call.method.equals("getBarometer")){
      result.success(getBarometerReading());
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

  @Override
  public void onSensorChanged(SensorEvent sensorEvent) {

  }

  @Override
  public void onAccuracyChanged(Sensor sensor, int i) {

  }
}
