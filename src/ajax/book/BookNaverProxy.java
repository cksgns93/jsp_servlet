package ajax.book;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

public class BookNaverProxy {
	public String getData(String keyword) {
		String clientId = ""; //���ø����̼� Ŭ���̾�Ʈ ���̵�"
        String clientSecret = ""; //���ø����̼� Ŭ���̾�Ʈ ��ũ����"

        String text = null;
        try {
            text = URLEncoder.encode(keyword, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("�˻��� ���ڵ� ����",e);
        }
        System.out.println(text);
        String apiURL = "https://openapi.naver.com/v1/search/book.json?query=" + text;    // json ���
        //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml ���

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL,requestHeaders);

        System.out.println(responseBody);
        return responseBody;
	}
	public String getData(String keyword,String start, String display, String sort) {
		String clientId = "c_Nbf6SWmo2Z5f5q88cC"; //���ø����̼� Ŭ���̾�Ʈ ���̵�"
        String clientSecret = "1Gm0Ylzdgi"; //���ø����̼� Ŭ���̾�Ʈ ��ũ����"

        String text = null;
        try {
            text = URLEncoder.encode(keyword, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("�˻��� ���ڵ� ����",e);
        }
        String queryStr="query="+text+"&start="+start+"&display="+display+"&sort="+sort;
        String apiURL = "https://openapi.naver.com/v1/search/book.json?"+queryStr;    // json ���
        //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml ���

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL,requestHeaders);

        System.out.println(responseBody);
        return responseBody;
	}
	private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // ���� ȣ��
                return readBody(con.getInputStream());
            } else { // ���� �߻�
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API ��û�� ���� ����", e);
        } finally {
            con.disconnect();
        }
    }
    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL�� �߸��Ǿ����ϴ�. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("������ �����߽��ϴ�. : " + apiUrl, e);
        }
    }

    private static String readBody(InputStream body){
        try {
	    	InputStreamReader streamReader = new InputStreamReader(body,"UTF-8");
	        BufferedReader lineReader = new BufferedReader(streamReader);
            StringBuilder responseBody = new StringBuilder();
            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }
            lineReader.close();
            streamReader.close();
            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API ������ �дµ� �����߽��ϴ�.", e);
        }
    }
}

