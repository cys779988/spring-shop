package com.spring.shop.member.web;



import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.shop.common.service.PageMaker;
import com.spring.shop.common.service.SearchCriteria;
import com.spring.shop.member.service.MemberManageService;
import com.spring.shop.member.service.MemberManageVO;

@Controller
@RequestMapping("/memberManage/*")
public class MemberManageController {
	private static final Logger logger = LoggerFactory.getLogger(MemberManageController.class);

	@Autowired
	MemberManageService service;
	
	@RequestMapping(value = "/list.do", method =RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("memberManageList");

		model.addAttribute("list", service.list(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "memberManage/memberManageList";
	}

	@RequestMapping(value = "/readView.do", method =RequestMethod.GET)
	public String read(MemberManageVO memberManageVO, @ModelAttribute("scri") SearchCriteria scri, Model model,
			HttpSession session) throws Exception {
		logger.info("memberManageRead" + memberManageVO);
		logger.debug("memberManageRead" + memberManageVO);

		model.addAttribute("read", service.read(memberManageVO.getUserId()));
		model.addAttribute("scri", scri);

		return "memberManage/readView";
	}

	@RequestMapping(value = "/delete.do", method =RequestMethod.POST)
	public String delete(MemberManageVO memberManageVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr)
			throws Exception {
		logger.info("memberManageDelete");

		service.delete(memberManageVO.getUserId());

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/memberManage/list.do";
	}

}
