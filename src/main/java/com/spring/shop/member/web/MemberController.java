package com.spring.shop.member.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.shop.member.service.MemberService;
import com.spring.shop.member.service.MemberVO;


@Controller
@RequestMapping("/member/*")
public class MemberController {

   @Autowired
   private MemberService memberService;

   @RequestMapping(value = "/registForm")
   public String registForm() {
      return "/member/registForm";
   }

   @RequestMapping(value = "/insert.do")
   public String addMember(MemberVO memberVO) {

      memberService.addMember(memberVO);

      return "redirect:/main.do";

   }

   @RequestMapping(value = "/loginForm.do")
   public String loginPage() {

      return "/member/loginForm";
   }

   @RequestMapping(value = "/login.do")
   public String login(MemberVO memberVO, HttpServletRequest req, RedirectAttributes rttr) {

      HttpSession session = req.getSession();
      MemberVO login = memberService.login(memberVO);

      if (login == null) {
         session.setAttribute("member", null);
         rttr.addFlashAttribute("msg", false);
         return "redirect:/member/loginForm.do";
      } else {
         session.setAttribute("member", login);
      }

      return "redirect:/main.do";
   }

   @RequestMapping(value = "/logout.do")
   public String logout(HttpSession session) {
      session.invalidate();

      return "redirect:/main.do";
   }

   @RequestMapping(value = "/modifyForm.do")
   public String modifyForm(MemberVO memberVO, HttpSession session) {

      return "/member/modifyForm";
   }

   @RequestMapping("/modify.do")
   public String modifyMember(MemberVO memberVO, HttpSession session) {
      memberService.updateMember(memberVO);

      return "redirect:/main.do";
   }

   @RequestMapping(value = "/deleteForm.do")
   public String memberDeleteView() {
      return "member/deleteForm";
   }

   @RequestMapping(value = "/memberDelete.do")
   public String memberDelete(MemberVO memberVO, HttpSession session, RedirectAttributes rttr) throws Exception {

      MemberVO member = (MemberVO) session.getAttribute("member");
      String sessionPass = member.getUserPasswd();
      String voPass = memberVO.getUserPasswd();

      if (!(sessionPass.equals(voPass))) {
         rttr.addFlashAttribute("msg", false);
         return "redirect:/member/deleteForm.do";
      }
      memberService.memberDelete(memberVO);
      session.invalidate();
      return "redirect:/main.do";
   }

   @ResponseBody
   @RequestMapping(value = "/idChk.do", method =RequestMethod.POST)
   public int idChk(MemberVO vo) throws Exception {
      int result = memberService.idChk(vo);
      return result;
   }

   @ResponseBody
   @RequestMapping(value = "/passChk.do", method =RequestMethod.POST)
   public int passChk(MemberVO memberVO) throws Exception {
      int result = memberService.passChk(memberVO);
      return result;
   }

   @RequestMapping("/myPageView.do")
   public String myPageView() {
      return "member/myPageView";
   }
   
   @RequestMapping(value = "/find_id_form.do")
	public String find_id_form() throws Exception {
		return "/member/find_id_form";
	}
   @RequestMapping(value = "/find_id.do", method =RequestMethod.POST)
	public String find_id(HttpServletResponse response, @RequestParam("email") String email, Model model)
			throws Exception {
		model.addAttribute("userId", memberService.find_id(response, email));
		return "/member/find_id";
	}

   
   @RequestMapping(value = "/find_pw_form.do")
	public String find_pw_form() throws Exception{
		return "/member/find_pw_form";
	}
   
	@RequestMapping(value = "/find_pw.do", method =RequestMethod.POST)
	public String find_pw(@ModelAttribute MemberVO memberVO, HttpServletResponse response) throws Exception{
		memberService.find_pw(response, memberVO);
		return "redirect:/member/loginForm.do";
	}

}