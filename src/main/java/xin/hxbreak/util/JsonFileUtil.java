package xin.hxbreak.util;

import net.sf.json.JSON;
import net.sf.json.JSONObject;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class JsonFileUtil {
    public static long jsonFileSize = 0;
    public static void inputJsonFile(String jsonFilePath,String jsonFile, JSONObject jsonObject) throws IOException {
        File filePath = new File(jsonFilePath+"/"+jsonFile);
        if(!filePath.exists()){
            filePath.createNewFile();
        }
        String json = jsonObject.toString();
        System.out.println(filePath.toString().length());
        FileWriter fileWriter = new FileWriter(filePath,true);
        fileWriter.write(json+"\n");
        fileWriter.close();
    }
    public static List<JSONObject> outputJsonFile(String jsonFilePath, String jsonFile) throws IOException {
        List jsonList = new ArrayList();
        File filePath = new File(jsonFilePath+"/"+jsonFile);
        FileReader fileReader = new FileReader(filePath);
        BufferedReader bufferedReader = new BufferedReader(fileReader);
        String content=null;
        while ((content = bufferedReader.readLine())!=null){
            System.out.println("content:"+content);
            jsonList.add(JSONObject.fromObject(content));
        }
        bufferedReader.close();
        fileReader.close();
       return jsonList;
    }
}
