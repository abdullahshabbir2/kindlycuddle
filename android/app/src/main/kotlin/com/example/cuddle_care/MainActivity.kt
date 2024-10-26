package com.example.cuddle_care
//
import io.flutter.embedding.android.FlutterActivity
//
class MainActivity: FlutterActivity() {

}
//
//import io.flutter.embedding.android.FlutterActivity
//import io.flutter.embedding.engine.FlutterEngine
//import io.flutter.plugins.GeneratedPluginRegistrant
//
//class MainActivity : FlutterActivity() {
//    fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine?) {
//        GeneratedPluginRegistrant.registerWith(flutterEngine)
//    }
//
//    fun onRequestPermissionsResult(
//        requestCode: Int,
//        @NonNull permissions: Array<String?>?,
//        @NonNull grantResults: IntArray?
//    ) {
//        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
//        // Add this line to forward the permission result to Flutter plugins
//        val engine: FlutterEngine = getFlutterEngine()
//        if (engine != null) {
//            engine.getActivityControlSurface()
//                .onRequestPermissionsResult(requestCode, permissions, grantResults)
//        }
//    }
//}