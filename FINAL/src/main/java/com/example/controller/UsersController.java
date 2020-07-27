package com.example.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.example.domain.UsersVO;
import com.example.mapper.UsersMapper;
import com.example.service.UsersService;

@Controller
public class UsersController {
   @Autowired
   UsersMapper umapper;
   
   @RequestMapping(value="/user/login", method=RequestMethod.POST)
   @ResponseBody
   public int loginPost(UsersVO vo, boolean ex_chk, HttpSession session, HttpServletResponse response){
      int result=0;
      String users_id=vo.getUsers_id();
      String users_pass=vo.getUsers_pass();
      UsersVO usersVO=umapper.read(users_id);
      if(usersVO==null){
         result=0;
      }else if(!usersVO.getUsers_pass().equals(users_pass)){
         result=1;
      }else{
         session.setAttribute("users_id", users_id);
         result=2;
         if(ex_chk){
            Cookie cookie=new Cookie("users_id", users_id);
            cookie.setPath("/");
            cookie.setMaxAge(60*60);
            response.addCookie(cookie);
         }
      }
      return result;
   }
   
   @RequestMapping("/user/logout")
   public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response){
      session.invalidate();
      Cookie cookie=WebUtils.getCookie(request, "users_id");
      if(cookie!=null){
         cookie.setPath("/");
         cookie.setMaxAge(0);
         response.addCookie(cookie);
      }
      return "redirect:/index";
   }
   
   @RequestMapping("/user/check")
   @ResponseBody
   public int check(String users_id) {
      int check=1;
      if(umapper.readcnt(users_id)==0){
         check=0;
      }else if(umapper.readcnt(users_id)==1){
         check=1;
      }
      return check;
   }
	
	@RequestMapping(value = "/user/insert", method = RequestMethod.POST)
	public String insert(UsersVO vo) {
		System.out.println(vo.toString());
		umapper.insert(vo);
		return "redirect:/user/welcome";
	}
	
	@RequestMapping("/user/welcome")
	public void welcome() {
		
	}
	   

	   @RequestMapping("/user/email")
	   public void emailInjeung(UsersVO vo, String idCHK, Model model) {
	      model.addAttribute("users_id", vo.getUsers_id());
	      model.addAttribute("users_pass", vo.getUsers_pass());
	      model.addAttribute("users_passChk", vo.getUsers_passChk());
	      model.addAttribute("users_name", vo.getUsers_name());
	      model.addAttribute("users_birthday", vo.getUsers_birthday());
	      model.addAttribute("users_birthdayYear", vo.getUsers_birthdayYear());
	      model.addAttribute("users_birthdayMonth", vo.getUsers_birthdayMonth());
	      model.addAttribute("users_birthdayDay", vo.getUsers_birthdayDay());
	      model.addAttribute("users_gender", vo.getUsers_gender());
	      model.addAttribute("users_zipcode", vo.getUsers_zipcode());
	      model.addAttribute("users_address", vo.getUsers_address());
	      model.addAttribute("users_addresss", vo.getUsers_addresss());
	      model.addAttribute("users_addressDetail", vo.getUsers_addressDetail());
	      model.addAttribute("users_phone", vo.getUsers_phone());
	      model.addAttribute("users_email", vo.getUsers_email());
	      model.addAttribute("idCHK", idCHK);
	   }
	   @Inject // 서비스를 호출하기 위해서 의존성을 주입
	   JavaMailSender mailSender; // 메일 서비스를 사용하기 위해 의존성을 주입함.
	   UsersService uservice; // 서비스를 호출하기 위해 의존성을 주입
	   
	   @RequestMapping(value = "/emailSendInjeung", method = RequestMethod.POST)
	   public ModelAndView sendInjeung(UsersVO vo, String idCHK, Model model, HttpServletRequest request, String emailSendInjeung, HttpServletResponse response_email)throws IOException {
	      Random r = new Random();
	      int dice = r.nextInt(4589362) + 49311; // 이메일로 받는 인증코드 부분 (난수)

	      String setfrom = "korea78245@gamil.com";
	      String tomail = request.getParameter("emailSendInjeung"); // 받는 사람 이메일
	      String title = "회원가입 인증 이메일 입니다."; // 제목
	      String content =System.getProperty("line.separator") + // 한줄씩 줄간격을 두기위해 작성
	                  System.getProperty("line.separator") +
	                  "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
	                  + System.getProperty("line.separator") +
	                  System.getProperty("line.separator") +
	                  " 인증번호는 " + dice + " 입니다. "
	                  + System.getProperty("line.separator") +
	                  System.getProperty("line.separator") +
	                  "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
	      try {
	         MimeMessage message = mailSender.createMimeMessage();
	         MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

	         messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
	         messageHelper.setTo(tomail); // 받는사람 이메일
	         messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	         messageHelper.setText(content); // 메일 내용

	         mailSender.send(message);
	      } catch (Exception e) {
	         System.out.println(e);
	      }
	      
	      ModelAndView mv = new ModelAndView(); // ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
	      mv.setViewName("/user/email_injeung"); // 뷰의이름
	      mv.addObject("dice", dice);
	      
	      model.addAttribute("users_id", vo.getUsers_id());
	      model.addAttribute("users_pass", vo.getUsers_pass());
	      model.addAttribute("users_passChk", vo.getUsers_passChk());
	      model.addAttribute("users_name", vo.getUsers_name());
	      model.addAttribute("users_birthday", vo.getUsers_birthday());
	      model.addAttribute("users_birthdayYear", vo.getUsers_birthdayYear());
	      model.addAttribute("users_birthdayMonth", vo.getUsers_birthdayMonth());
	      model.addAttribute("users_birthdayDay", vo.getUsers_birthdayDay());
	      model.addAttribute("users_gender", vo.getUsers_gender());
	      model.addAttribute("users_zipcode", vo.getUsers_zipcode());
	      model.addAttribute("users_address", vo.getUsers_address());
	      model.addAttribute("users_addresss", vo.getUsers_addresss());
	      model.addAttribute("users_addressDetail", vo.getUsers_addressDetail());
	      model.addAttribute("users_phone", vo.getUsers_phone());
	      model.addAttribute("users_email", vo.getUsers_email());
	      model.addAttribute("idCHK", idCHK);
	      
	      response_email.setContentType("text/html; charset=UTF-8");
	      PrintWriter out_email = response_email.getWriter();
	      out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
	      out_email.flush();
	      
	      return mv;
	   }

	   // 이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
	   // 내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 회원가입 페이지로 넘어가고, 틀리면 다시 원래 페이지로 돌아오는 메소드
	   @RequestMapping(value = "/emailCheckInjeung", method = RequestMethod.POST)
	   public ModelAndView emailCheckInjeung(UsersVO vo, String idCHK, Model model, String requestDice, String dice, HttpServletResponse response_equals) throws IOException {

	      // 페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음
	      ModelAndView mv = new ModelAndView();
	      mv.setViewName("/user/realSignup");
	      mv.addObject("requestDice", requestDice);
	            
	      if (requestDice.equals(dice)) {
	         // 인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함
	         mv.setViewName("/user/realSignup");
	         mv.addObject("requestDice", requestDice);
	         
	         model.addAttribute("users_id", vo.getUsers_id());
	         model.addAttribute("users_pass", vo.getUsers_pass());
	         model.addAttribute("users_passChk", vo.getUsers_passChk());
	         model.addAttribute("users_name", vo.getUsers_name());
	         model.addAttribute("users_birthday", vo.getUsers_birthday());
	         model.addAttribute("users_birthdayYear", vo.getUsers_birthdayYear());
	         model.addAttribute("users_birthdayMonth", vo.getUsers_birthdayMonth());
	         model.addAttribute("users_birthdayDay", vo.getUsers_birthdayDay());
	         model.addAttribute("users_gender", vo.getUsers_gender());
	         model.addAttribute("users_zipcode", vo.getUsers_zipcode());
	         model.addAttribute("users_address", vo.getUsers_address());
	         model.addAttribute("users_addresss", vo.getUsers_addresss());
	         model.addAttribute("users_addressDetail", vo.getUsers_addressDetail());
	         model.addAttribute("users_phone", vo.getUsers_phone());
	         model.addAttribute("users_email", vo.getUsers_email());
	         model.addAttribute("idCHK", idCHK);
	         
	         // 만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을 한번더 입력할 필요가 없게 한다.
	         response_equals.setContentType("text/html; charset=UTF-8");
	         PrintWriter out_equals = response_equals.getWriter();
	         out_equals.println("<script>alert('인증번호가 일치하였습니다.');</script>");
	         out_equals.flush();
	         return mv;
	         
	      } else if (requestDice != dice) {
	         ModelAndView mv2 = new ModelAndView();
	         mv2.setViewName("/user/email_injeung");
	         
	         response_equals.setContentType("text/html; charset=UTF-8");
	         PrintWriter out_equals = response_equals.getWriter();
	         out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
	         out_equals.flush();
	         return mv2;
	      }
	      return mv;
	   }
	}