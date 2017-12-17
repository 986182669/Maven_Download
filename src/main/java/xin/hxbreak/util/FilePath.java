package xin.hxbreak.util;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

public class FilePath {
    public static String getFilePath(HttpServletRequest request){
        return request.getSession().getServletContext().getRealPath("../upload");
    }
    public static String replaceFilePath(String filePath){
        return filePath.replace("\\","/");
    }
}
