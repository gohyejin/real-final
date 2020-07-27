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
	@Resource(name = "uploadPath") /* ���� ���ε带 ���� �ʿ� */
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
		//��ǥ�̹��� ���� ���ε�
		MultipartFile file = multi.getFile("file"); //input type�� ������ ��
		if(!file.isEmpty()) { //�̹��� ������ ������ �̹��� ���ε�
			String image=System.currentTimeMillis() + file.getOriginalFilename(); //�����̸� �ߺ��� ���ϱ����� �������� �̸��� �и������� �ٿ� �ߺ��� ����
			file.transferTo(new File(path+File.separator+image)); //��ο� ���ο� ������ ���� �̹����� ���ε���(�����δ� ī����)
			vo.setPhoto_package_image(image);
		}
		//÷������ ���ε�
		List<MultipartFile> files = multi.getFiles("files");
		ArrayList<String> images=new ArrayList<String>();
		for(MultipartFile addFile:files) {
			if(!addFile.isEmpty()) { //�̹��� ������ ������ �̹��� ���ε�
				String image=System.currentTimeMillis() + addFile.getOriginalFilename(); //�����̸� �ߺ��� ���ϱ����� �������� �̸��� �и������� �ٿ� �ߺ��� ����
				addFile.transferTo(new File(path+File.separator+image)); //��ο� ���ο� ������ ���� �̹����� ���ε���(�����δ� ī����)
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
	      //��ǥ �̹��� ���Ͼ��ε�
	      if(!file.isEmpty()){
	         //�����̹����� ������ ����
	         String oldImage=vo.getPhoto_package_image();
	         if(!oldImage.equals("")){
	            new File(path + File.separator + oldImage).delete();
	         }
	         
	         String image=System.currentTimeMillis() + file.getOriginalFilename();
	         file.transferTo(new File(path + File.separator + image));
	         vo.setPhoto_package_image(image);
	      }
	      
	      //÷������ ���ε�
	      List<MultipartFile> files=multi.getFiles("files");
	      ArrayList<String> images=new ArrayList<String>();
	      //���� ÷�������� �ִ� ��� ÷�����ϻ���
	      if(!files.get(0).isEmpty()){
	         List<String> oldImages=mapper.getAttach(vo.getPhoto_package_code());
	         for(String oldImage:oldImages){
	            new File(path + File.separator + oldImage).delete();
	         }
	      }
	      //���ο� ÷������ ���ε�
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
		//���ϻ���
		String oldImage=vo.getPhoto_package_image();
		if(!oldImage.equals("")) {
			new File(path + File.separator+oldImage).delete();
		}
		//÷������ ����
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
