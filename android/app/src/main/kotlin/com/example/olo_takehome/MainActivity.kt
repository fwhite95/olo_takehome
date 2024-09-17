package com.example.olo_takehome

import android.app.AlertDialog
import android.content.DialogInterface
import android.os.Build
import android.view.View
import android.widget.EditText
import androidx.annotation.RequiresApi
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.olo_takehome/note";

    @RequiresApi(Build.VERSION_CODES.O)
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == "createNote") {
                var note = LinkedHashMap<String, Any>()
                val builder = AlertDialog.Builder(this)

                // set custom layout
                val customLayout: View = layoutInflater.inflate(R.layout.custom_layout, null)
                builder.setView(customLayout)
                    .setPositiveButton("Ok") { dialog: DialogInterface?, which: Int ->
                        val titleText =
                            customLayout.findViewById<EditText>(R.id.titleText).text.toString()
                        val bodyText =
                            customLayout.findViewById<EditText>(R.id.bodyText).text.toString()

                        val formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")
                        val current = LocalDateTime.now().format(formatter)
                        note["title"] = titleText
                        note["body"] = bodyText
                        note["lastModified"] = current

                        result.success(note)
                    }
                    .setNegativeButton("Cancel") { dialog: DialogInterface?, which: Int ->

                    }

                val dialog = builder.create()
                dialog.show()

            } else {
                result.notImplemented()
            }

        }
    }
}


