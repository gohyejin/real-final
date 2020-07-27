package com.example.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.mapper.Photo_PackageMapper;
import com.example.service.Photo_PackageService;

@Controller
public class Photo_PakageController {
	@Resource(name = "uploadPath") /* 파일 업로드를 위해 필요 */
	private String path;
	
	@Autowired
	Photo_PackageMapper mapper;
	
	@Autowired
	Photo_PackageService service;
	
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
		System.out.println("g");
		model.addAttribute("list", mapper.list());
		
	}
	
	
/*	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insertPost(Photo_PackageVO vo, MultipartHttpServletRequest multi) throws Exception {
		//대표이미지 파일 업로드
		MultipartFile file = multi.getFile("file"); //input type이 파일인 것
		if(!file.isEmpty()) { //이미지 파일이 있을때 이미지 업로드
			String image=System.currentTimeMillis() + file.getOriginalFilename(); //파일이름 중복을 피하기위해 오리지날 이름에 밀리세컨을 붙여 중복을 막음
			file.transferTo(new File(path+File.separator+image)); //경로에 새로운 파일을 만들어서 이미지를 업로드함(실제로는 카피임)
			vo.setPhoto_package_image(image);
		}
		//첨부파일 업로드
		List<MultipartFile> files = multi.getFiles("files");
		ArrayList<String> images=new ArrayList<String>();
		for(MultipartFile addFile:files) {
			if(!addFile.isEmpty()) { //이미지 파일이 있을때 이미지 업로드
				String image=System.currentTimeMillis() + addFile.getOriginalFilename(); //파일이름 중복을 피하기위해 오리지날 이름에 밀리세컨을 붙여 중복을 막음
				addFile.transferTo(new File(path+File.separator+image)); //경로에 새로운 파일을 만들어서 이미지를 업로드함(실제로는 카피임)
				images.add(image);
			}
		}
		vo.setImages(images);
		System.out.println(vo.toString());
		service.insert(vo);
		return "redirect:list";
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	   public String updatePost(Photo_PackageVO vo, MultipartHttpServletRequest multi)throws Exception{
	      MultipartFile file=multi.getFile("file");
	      //대표 이미지 파일업로드
	      if(!file.isEmpty()){
	         //예전이미지가 있으면 삭제
	         String oldImage=vo.getPhoto_package_image();
	         if(!oldImage.equals("")){
	            new File(path + File.separator + oldImage).delete();
	         }
	         
	         String image=System.currentTimeMillis() + file.getOriginalFilename();
	         file.transferTo(new File(path + File.separator + image));
	         vo.setPhoto_package_image(image);
	      }
	      
	      //첨부파일 업로드
	      List<MultipartFile> files=multi.getFiles("files");
	      ArrayList<String> images=new ArrayList<String>();
	      //기존 첨부파일이 있는 경우 첨부파일삭제
	      if(!files.get(0).isEmpty()){
	         List<String> oldImages=mapper.getAttach(vo.getPhoto_package_code());
	         for(String oldImage:oldImages){
	            new File(path + File.separator + oldImage).delete();
	         }
	      }
	      //새로운 첨부파일 업로드
	      for(MultipartFile attFile:files){
	         if(!attFile.isEmpty()){
	            String image=System.currentTimeMillis() + attFile.getOriginalFilename();
	            attFile.transferTo(new File(path + File.separator + image));
	            images.add(image);
	         }
	      }
	      vo.setImages(images);
	      service.update(vo);
	      return "redirect:list";
	   }

	
	@RequestMapping(value="delete", method=RequestMethod.POST)
	public String deletePost(Photo_PackageVO vo) throws Exception {
		//파일삭제
		String oldImage=vo.getPhoto_package_image();
		if(!oldImage.equals("")) {
			new File(path + File.separator+oldImage).delete();
		}
		//첨부파일 삭제
		List<String> images=mapper.getAttach(vo.getPhoto_package_code());
		for(String image:images) {
			if(!image.equals("")) {
				new File(path + File.separator+image).delete();
			}
		}
		service.delete(vo.getPhoto_package_code());
		return "redirect:list";
	}
	*/
}
