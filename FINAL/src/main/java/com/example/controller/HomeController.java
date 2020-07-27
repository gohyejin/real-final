package com.example.controller;

import java.io.File;
import java.nio.file.Files;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mapper.Lend_CostumeMapper;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	Lend_CostumeMapper lmapper;

	@RequestMapping("/index")
	public void index() {

	}

	/* menu------------------------------------------------------------ */
	/* CART */
	@RequestMapping("/user/cart")
	public void cart() {
		
	}

	/* COSTUME */
	@RequestMapping("/costumeList")
	public void list(Model model) {
		model.addAttribute("list", lmapper.list());
	}

	@RequestMapping("/costumeRead")
	public void costumeRead() {

	}

	/* PACKAGE */
	@RequestMapping("/indexPackageRead")
	public void packageRead() {

	}

	/* user관련페이지------------------------------------------------------ */
	/* 로그인 */
	@RequestMapping("/user/login")
	public void login() {

	}

	/* 이용약관 */
	@RequestMapping("/user/signup")
	public void signup() {

	}

	/* 회원가입 */
	@RequestMapping("/user/realSignup")
	public void realSignup() {

	}

	/* 마이페이지 */
	@RequestMapping("/user/mypage")
	public void mypage() {

	}

	/* 정보수정 */
	@RequestMapping("/user/mypageRead")
	public void mypageRead() {

	}
	/* index에서 read------------------------------------------------------ */
	@RequestMapping("/read/couple")
	public void couple() {

	}

	@RequestMapping("/read/family")
	public void family() {

	}

	@RequestMapping("/read/pet")
	public void pet() {

	}

	@RequestMapping("/read/friend")
	public void friend() {

	}

	@RequestMapping("/read/profile")
	public void profile() {

	}

	/* 소개페이지로 이동 */
	@RequestMapping("/introduce")
	public void introduce() {

	}

	/*-------------------------------------------------------*/
	/* 이미지파일 브라우저에 출력 */
	@Resource(name = "uploadPath") /* 파일 업로드를 위해 필요 */
	private String path;

	@RequestMapping("display")
	@ResponseBody
	public ResponseEntity<byte[]> display(String fileName) throws Exception {
		ResponseEntity<byte[]> result = null;
		// display fileName이 있는 경우
		if (!fileName.equals("")) {
			File file = new File(path + File.separator + fileName);
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		}
		return result;
	}
	
	@RequestMapping("/cal")
	public void callist(){
		
	}
}
