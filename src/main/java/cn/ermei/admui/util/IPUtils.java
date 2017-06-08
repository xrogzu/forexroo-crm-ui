package cn.ermei.admui.util;

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

public class IPUtils {
	
	private static final String strUrl = "http://api.ip138.com/query/";
	private static final String dataType = "txt";
	private static final String callBack = "find";
	private static final String token = "ed2bdaf593e2a96632ccd7bde7c0158f"; //请在http://user.ip138.com/ip申请
	
	public static String query(String ip) {
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("ip", ip); // 可为空
		params.put("datatype", dataType);
		params.put("callback", callBack); // 可为空
		String result = null;
		
		try {
			URL url = new URL(strUrl);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();

			// 头信息
			HashMap<String, String> header = new HashMap<String, String>();
			header.put("token", token);
			for (String headerName : header.keySet()) {
				connection.addRequestProperty(headerName, header.get(headerName));
			}

			// 设置超时时间
			connection.setConnectTimeout(5 * 1000);
			// 设置允许输入
			connection.setDoInput(true);
			// 设置读取超时：
			connection.setReadTimeout(5 * 1000);
			connection.setRequestMethod("GET");
			// 参数
			byte[] body = encodeParameters(params, "UTF-8");
			if (body != null) {
				connection.setDoOutput(true);
				connection.addRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
				DataOutputStream out = new DataOutputStream(connection.getOutputStream());
				out.write(body);
				out.close();
			}
			int responseCode = connection.getResponseCode();
			if (responseCode == -1) {
				throw new IOException("Could not retrieve response code from HttpUrlConnection.");
			}
			if (responseCode != 200) {
			}

			InputStream inputStream = null;
			try {
				inputStream = connection.getInputStream();
			} catch (IOException ioe) {
				inputStream = connection.getErrorStream();
			}

			ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
			byte[] data = new byte[1024];
			int len = 0;
			if (inputStream != null) {
				try {
					while ((len = inputStream.read(data)) != -1) {
						outputStream.write(data, 0, len);
					}
					result = new String(outputStream.toByteArray(), "UTF-8");
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

		} catch (SocketTimeoutException e) {

		} catch (MalformedURLException e) {

		} catch (IOException e) {

		}
		
		return result;
	}
	
	private static byte[] encodeParameters(Map<String, String> params, String paramsEncoding) {
		if (params == null || params.size() == 0)
			return null;

		StringBuilder encodedParams = new StringBuilder();
		try {
			for (Map.Entry<String, String> entry : params.entrySet()) {
				encodedParams.append(URLEncoder.encode(entry.getKey(), paramsEncoding));
				encodedParams.append('=');
				encodedParams.append(URLEncoder.encode(entry.getValue(), paramsEncoding));
				encodedParams.append('&');
			}
			return encodedParams.toString().getBytes(paramsEncoding);
		} catch (UnsupportedEncodingException uee) {
			throw new RuntimeException("Encoding not supported: " + paramsEncoding, uee);
		}
	}

}
