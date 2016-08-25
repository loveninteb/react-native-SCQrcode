package cn.reactnaive.nativetcscan;

import android.content.Intent;

import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import cn.reactnaive.nativetcscan.activity.CaptureActivity;

/**
 * Created by tx36326 on 2016/7/26.
 */
public class TcScan extends ReactContextBaseJavaModule {
	private ReactApplicationContext context;
	public static Callback callback_result;
	public TcScan(ReactApplicationContext reactContext) {
		super(reactContext);
		context = reactContext;
	}

	@Override
	public String getName() {
		return "TcScan";
	}

	@ReactMethod
	public void scan(Callback callback){
		Intent intent = new Intent(context, CaptureActivity.class);
		intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		context.startActivity(intent);
		callback_result = callback;
	}
}
