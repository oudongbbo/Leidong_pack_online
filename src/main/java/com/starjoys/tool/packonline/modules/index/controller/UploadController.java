package com.starjoys.tool.packonline.modules.index.controller;

import com.starjoys.tool.packonline.common.base.BaseController;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;

/**
 *
 * @author Andy
 * @version 1.0
 * @create 2017/1/5
 */

@Controller
public class UploadController extends BaseController {

    @RequestMapping("/upload")
    public String upload(@RequestParam(value = "file", required = false) MultipartFile file,
                         HttpServletRequest request, Model model) {
        String path = request.getSession().getServletContext().getRealPath("upload");
        String fileName = file.getOriginalFilename();
//        String fileName = new Date().getTime()+".jpg";
        System.out.println(path);
        File targetFile = new File(path, fileName);
        if(!targetFile.exists()){
            targetFile.mkdirs();
        }

        //保存
        try {
            file.transferTo(targetFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
        sendLog(targetFile.getAbsolutePath());
        model.addAttribute("fileUrl", request.getContextPath()+"/upload/"+fileName);
        return "/module/index";
    }

    @RequestMapping("/download")
    public ResponseEntity<byte[]> download(@RequestParam(value = "fileName") String filename, HttpServletRequest request, Model model)
            throws UnsupportedEncodingException {
        String path = request.getSession().getServletContext().getRealPath("upload");
        File file = new File(path, filename);
        String dfileName = new String(file.getName().getBytes("gb2312"), "iso8859-1");
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", dfileName);
        sendLog("66666");
        if (file.exists()) {
            return new ResponseEntity<>(getBytes(file), headers, HttpStatus.CREATED);
        }
        return new ResponseEntity<>(null, null, HttpStatus.NOT_FOUND);
    }

    private byte[] getBytes(File file){
        byte[] buffer = null;
        try {
            FileInputStream fis = new FileInputStream(file);
            ByteArrayOutputStream bos = new ByteArrayOutputStream(1000);
            byte[] b = new byte[1000];
            int n;
            while ((n = fis.read(b)) != -1) {
                bos.write(b, 0, n);
            }
            fis.close();
            bos.close();
            buffer = bos.toByteArray();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return buffer;
    }

}
