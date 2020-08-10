package com.example.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.domain.Photo_PackageVO;
import com.example.mapper.Photo_PackageMapper;

@Controller
public class Photo_PakageController {
   @Resource(name = "uploadPath") /* 파일 업로드를 위해 필요 */
   private String path;
   
   @Autowired
   Photo_PackageMapper mapper;
   
   @RequestMapping("insert")
   public void insert() {
   }
   
   @RequestMapping("/packageRead")
   public void read(String photo_package_code, Model model)throws Exception {
      model.addAttribute("vo", mapper.read(photo_package_code));
      model.addAttribute("list", mapper.getAttach(photo_package_code));
   }
   
   @RequestMapping("list")
   public void list(Model model)throws Exception {
      model.addAttribute("list", mapper.list());
      
   }
   
   @RequestMapping(value="/update", method=RequestMethod.POST)
   public String updatePost(Photo_PackageVO vo, MultipartHttpServletRequest multi)throws Exception{
      // 추가이미지 업로드
      List<MultipartFile> files=multi.getFiles("files");
      // 기존 추가이미지가 있으면 삭제
      if(!files.get(0).isEmpty()){
         List<String> oldImages=mapper.getAttach(vo.getPhoto_package_code());
         for(String oldImage:oldImages){
            new File(path + File.separator + oldImage).delete();
         }
      }
      // 새로운 추가이미지 업로드
      ArrayList<String> images=new ArrayList<String>();
      for(MultipartFile attFile:files){
         if(!attFile.isEmpty()){
            String image=System.currentTimeMillis() + attFile.getOriginalFilename();
            attFile.transferTo(new File(path + File.separator + image));
            images.add(image);
         }
      }
      vo.setImages(images);
      
      List<String> Images=vo.getImages();
      if(Images.size()>0){
         mapper.delAttach(vo.getPhoto_package_code());
         for(String image:Images){
            mapper.addAttach(image, vo.getPhoto_package_code());
         }
      }
      return "redirect:/packageRead?photo_package_code="+vo.getPhoto_package_code();
   }
}