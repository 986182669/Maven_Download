package xin.hxbreak.util;

import org.springframework.http.ResponseEntity;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public interface FileDownLoad {
    public List lsit = new ArrayList();

    /**
     *
     * @param uploadPath
     * @param fileNmae
     */
    public File upload(String uploadPath,String fileNmae);

    /**
     *
     */
    public ResponseEntity<byte[]> downLoad(File file,String fileName) throws IOException;

    public List getFileList(String path);
}
