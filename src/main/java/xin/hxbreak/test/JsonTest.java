package xin.hxbreak.test;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import xin.hxbreak.util.JsonFileUtil;

import java.io.IOException;
import java.net.InetAddress;
import java.util.List;

public class JsonTest {
    public static void main(String[] args) throws IOException {
/*        String path = "C:/json/";
        String jsonFile = "download.json";
        String json = "{'name':'456'}";
        JSONObject jsonObject = JSONObject.fromObject(json);
        JsonFileUtil.inputJsonFile(path,jsonFile,jsonObject);*/
       /* List<JSONObject> list  = JsonFileUtil.outputJsonFile(path,jsonFile);
        for (JSONObject object:list) {
            object.remove("name");
            System.out.println(object.get("name"));
        }*/
        InetAddress inet = InetAddress.getByName("114.67.228.22");
        System.out.println(inet.getHostName());

    }
}
