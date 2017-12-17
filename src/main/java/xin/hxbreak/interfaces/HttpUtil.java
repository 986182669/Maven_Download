package xin.hxbreak.interfaces;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

public class HttpUtil{
    String getHttpParameter(HttpServletRequest request,String pram){
        return request.getParameter(pram);
    }
}
