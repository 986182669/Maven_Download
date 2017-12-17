package xin.hxbreak.util;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class FileDownLoadImpl implements FileDownLoad{
    private List list = new ArrayList();
    /**
     *
     * @param uploadPath
     * @param fileNmae
     */
    public File upload(String uploadPath, String fileNmae) {
        File file = new File(uploadPath,fileNmae);
        if(!file.exists()){
            file.mkdirs();
        }
        return file;
    }

    public ResponseEntity<byte[]> downLoad(File file,String fileName) throws IOException {
        HttpHeaders httpHeaders = new HttpHeaders();
        ResponseEntity<byte[]> entity = null;
        httpHeaders.setContentDispositionFormData("attachment", fileName);
        httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        entity = new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(
                file),
                httpHeaders, HttpStatus.CREATED);
        httpHeaders.setContentDispositionFormData("attachment", fileName);
        httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return entity;
    }

    public List getFileList(String path) {
        File file = new File(path);
        String[] fileNames = file.list();
        for(int i = 0;i<fileNames.length;i++){
           /* int index = fileNames[i].indexOf("@");*/
            /*list.add(fileNames[i].substring(index+1,fileNames[i].length()));*/
            list.add(fileNames[i]);
        }
        return list;
    }
}
