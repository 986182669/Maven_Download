package xin.hxbreak.action;

import net.sf.json.JSONObject;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import xin.hxbreak.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;

@Controller
@RequestMapping("/download")
public class DownloadController {
    public static long time = 0;
    private List<String> list = new ArrayList<String>();
    private List<JSONObject> jsonObj = new ArrayList<JSONObject>();
/*    @RequestMapping("/upLoad")
    public String upLoadFile(@RequestParam(value = "username" ,required = false)String username,
                             @RequestParam(value = "file",required = false)MultipartFile file,HttpServletRequest request,
                             Model model) throws IOException {
        System.out.println("开始上传");
        //文件上传的地址
        System.out.println(username+file.toString());
        String uploadPath = FilePath.getFilePath(request);
        String fileName = file.getOriginalFilename();
            file.transferTo(new FileDownLoadImpl().upload(uploadPath,fileName));
        System.out.println("上传成功");
        return "";
    }*/
    @RequestMapping("/download")
    public ResponseEntity<byte[]> downLoad(@RequestParam(value = "fileName",required = false)String fileName, HttpServletRequest request, Model model) throws IOException {
        String downloadPath = FilePath.getFilePath(request)+"/"+fileName;
        File file = new File(downloadPath);
        ResponseEntity<byte[]> entity = new FileDownLoadImpl().downLoad(file,fileName);
        /*JSONObject json = new JSONObject();
        json.put("username",)*/
       /* JsonFileUtil.inputJsonFile(JsonPath.getJsonFilePath(request),"download.json",);*/
        return entity;
    }

    @RequestMapping("/list")
    public String list(HttpServletRequest request, Model model){
        System.out.println("list-----------------");
        /*String downloadPath = FilePath.getFilePath(request);*/
       /* downloadPath = downloadPath.replace("\\","/");*/
        model.addAttribute("list",new FileDownLoadImpl().getFileList(FilePath.replaceFilePath(FilePath.getFilePath(request))));
        return "list";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam(value = "fileName",required = false)String fileName, HttpServletRequest request,Model model){
        String filePath = FilePath.replaceFilePath(FilePath.getFilePath(request)+"/"+fileName);
        File file = new File(filePath);
        file.delete();
        return "";
    }
    @RequestMapping(value = "/up",method = RequestMethod.POST)
    public void up(@RequestParam(value = "username",required = false)String name,
                     @RequestParam(value = "file",required = false)MultipartFile file, HttpServletRequest request, Model model, HttpServletResponse response) throws IOException {
        String ip = RequestHost.getIpAddr(request);
        //获取上传路径
        String filePath = FilePath.getFilePath(request);
        String jsonPath = JsonPath.getJsonFilePath(request);
        //获取文件名
        String fileName = file.getOriginalFilename();
        JSONObject json = null;
        String msg = "0";
        try {
            long begin,end;
            //获取目录下所有上传的文件
            list = new FileDownLoadImpl().getFileList(filePath);
            //判断是否已经上传过该文件
           if(!list.contains(fileName)){
               begin = System.currentTimeMillis();
               //上传
               file.transferTo(new FileDownLoadImpl().upload(filePath,fileName));
               end = System.currentTimeMillis();
               //将信息保存到json文件中
               json = new JSONObject();
               json.put("username",name);
               json.put("HostIp",ip);
               json.put("fileName",fileName);
               json.put("uploadData", DateFormatUtil.getDateFormat());
               json.put("time",begin-time);
               System.out.println(end-begin);
               JsonFileUtil.inputJsonFile(JsonPath.getJsonFilePath(request),"upload.json",json);
           }else {
               jsonObj = JsonFileUtil.outputJsonFile(JsonPath.getJsonFilePath(request),"upload.json");
               for (JSONObject jsonObject:jsonObj) {
                  /* if (jsonObject.get("username").equals(name)){
                       System.out.println(jsonObject.get("username").equals(name));*/
                       if(jsonObject.get("fileName").equals(fileName)){
                           System.out.println(jsonObject.get("fileName").equals(fileName));
                           Thread.sleep(Long.parseLong(jsonObject.get("time").toString()));
                       }
                  /* }*/
               }
           }
            msg = "1";
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        response.getWriter().write(msg);
    }
}
