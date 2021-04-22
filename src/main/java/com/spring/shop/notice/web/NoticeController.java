package com.spring.shop.notice.web;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.shop.common.service.PageMaker;
import com.spring.shop.common.service.SearchCriteria;
import com.spring.shop.common.web.FileUtils;
import com.spring.shop.member.service.MemberVO;
import com.spring.shop.notice.service.NoticeReplyVO;
import com.spring.shop.notice.service.NoticeService;
import com.spring.shop.notice.service.NoticeVO;



@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Autowired
	NoticeService service;
	
	@RequestMapping(value = "/writeView.do", method =RequestMethod.GET)
	public void writeView(HttpSession session, Model model) throws Exception{
		logger.info("noticeWriteView");
		Object loginInfo = session.getAttribute("member");
		if(loginInfo==null) {
			model.addAttribute("msg",false);
		}
	}
	
	@RequestMapping(value = "/write.do", method =RequestMethod.POST)
	public String write(NoticeVO vo, HttpSession session, MultipartHttpServletRequest mpRequest, HttpServletRequest request) throws Exception{
		logger.info("noticeWrite");
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String writer = memberVO.getUserId();
		vo.setWriter(writer);
		
		FileUtils fileUtils = new FileUtils();
		Iterator<String> iterator = mpRequest.getFileNames();
		MultipartFile multipartFile = mpRequest.getFile(iterator.next());
		if (multipartFile.getOriginalFilename()!= null && multipartFile.getOriginalFilename()!= "") {
			List<Map<String, Object>> fileList = fileUtils.parseInsertFileInfo(vo.getNno(), mpRequest, request);
		
			vo.setnImg((String)fileList.get(0).get("img"));
			vo.setnThumbImg((String)fileList.get(0).get("thumbImg"));
		}else {
			vo.setnImg("images/noImage.png");
			vo.setnThumbImg("images/noImage.png");
		}
		
		service.write(vo);
		return "redirect:/notice/list.do";
	}
	
	@RequestMapping(value = "/list.do", method =RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		logger.info("noticeList");
		
		model.addAttribute("list", service.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "notice/noticeList";
		
	}
	
	@RequestMapping(value = "/readView.do", method =RequestMethod.GET)
	public String read(NoticeVO NoticeVO,MemberVO memberVO, @ModelAttribute("scri") SearchCriteria scri, Model model,HttpSession session) throws Exception{
		logger.info("noticeRead");
		
		model.addAttribute("read", service.read(NoticeVO.getNno()));
		model.addAttribute("scri", scri);
		
		List<NoticeReplyVO> replyList = service.readNoticeReply(NoticeVO.getNno());
		model.addAttribute("replyList", replyList);
		
		return "notice/readView";
	}
	
	@RequestMapping(value = "/updateView.do", method =RequestMethod.GET)
	public String updateView(NoticeVO NoticeVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("noticeUpdateView");
		
		model.addAttribute("update", service.read(NoticeVO.getNno()));
		model.addAttribute("scri", scri);
		
		return "notice/updateView";
	}
	
	@RequestMapping(value = "/update.do", method =RequestMethod.POST)
	public String update(NoticeVO vo, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr, MultipartHttpServletRequest mpRequest, HttpServletRequest request) throws Exception{
		logger.info("noticeUpdate");
		
		FileUtils fileUtils = new FileUtils();
		Iterator<String> iterator = mpRequest.getFileNames();
		MultipartFile multipartFile = mpRequest.getFile(iterator.next());
		if (multipartFile.getOriginalFilename()!= null && multipartFile.getOriginalFilename()!= "") {
			List<Map<String, Object>> fileList = fileUtils.parseInsertFileInfo(vo.getNno(), mpRequest, request);
		
			vo.setnImg((String)fileList.get(0).get("img"));
			vo.setnThumbImg((String)fileList.get(0).get("thumbImg"));
		}
		service.update(vo);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/notice/list.do";
	}

	@RequestMapping(value = "/delete.do", method =RequestMethod.POST)
	public String delete(NoticeVO NoticeVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("noticeDelete");
		
		service.delete(NoticeVO.getNno());
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/notice/list.do";
	}
	
	
	@RequestMapping(value="/replyWrite.do", method =RequestMethod.POST)
	public String replyWrite(NoticeReplyVO vo, SearchCriteria scri, RedirectAttributes rttr, HttpSession session) throws Exception {
		logger.info("replyWrite");
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String writer = memberVO.getUserId();
		vo.setWriter(writer);
		
		service.writeReply(vo);
		
		rttr.addAttribute("nno", vo.getNno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/notice/readView.do";
	}
	
	@ResponseBody
	@RequestMapping(value="/replyUpdateForm.do", method =RequestMethod.POST)
	public NoticeReplyVO replyUpdateView(NoticeReplyVO vo) throws Exception {
		logger.info("replyUpdateForm");
		
		NoticeReplyVO replyInfo = service.updateReplyForm(vo);
		
		return replyInfo;
	}
	
	@ResponseBody
	@RequestMapping(value = "/replyUpdate.do", method = RequestMethod.POST)
	public String replyUpdate(NoticeReplyVO vo) throws Exception {
		logger.info("replyUpdate");
		service.updateReply(vo);

		return null;
	}
	
	@RequestMapping(value = "/replyDeleteView.do", method = RequestMethod.GET)
	public String replyDeleteView(NoticeReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		logger.info("replyDelete");

		model.addAttribute("replyDelete", service.selectNoticeReply(vo.getNno()));
		model.addAttribute("scri", scri);

		return "notice/replyDeleteView";
	}
	
	@ResponseBody
	@RequestMapping(value = "/replyDelete.do", produces = "application/text; charset=utf8", method = RequestMethod.POST)
	public String replyDelete(NoticeReplyVO vo) throws Exception {
		logger.info("replyDelete");
		String msg = "삭제가 완료되었습니다.";
		service.deleteReply(vo);

		return msg;
	}
	

}