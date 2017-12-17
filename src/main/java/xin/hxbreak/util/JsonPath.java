package xin.hxbreak.util;

import javax.servlet.http.HttpServletRequest;

public class JsonPath {
    public static String getJsonFilePath(HttpServletRequest request){
        return request.getSession().getServletContext().getRealPath("../json");
    }
    public static String replaceFilePath(String filePath){
        return filePath.replace("\\","/");
    }
}
