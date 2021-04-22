package com.spring.shop.board.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.shop.board.service.BoardService;
import com.spring.shop.board.service.BoardVO;
import com.spring.shop.board.service.ReplyVO;
import com.spring.shop.common.service.PageMaker;
import com.spring.shop.common.service.SearchCriteria;
import com.spring.shop.common.web.FileUtils;
import com.spring.shop.member.service.MemberVO;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Resource(name = "uploadPath")
	private String uploadPath;

	@Autowired
	BoardService service;

	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("boardList");

		model.addAttribute("list", service.list(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "board/boardList";

	}

	@RequestMapping(value = "/writeView.do", method = RequestMethod.GET)
	public void writeView(HttpSession session, Model model) throws Exception {
		logger.info("boardWriteView");
		Object loginInfo = session.getAttribute("member");
		if (loginInfo == null) {
			model.addAttribute("msg", false);
		}
	}

	@RequestMapping(value = "/write.do", method =RequestMethod.POST)
	public String write(BoardVO vo, HttpSession session, MultipartHttpServletRequest mpRequest, HttpServletRequest request) throws Exception{
		logger.info("boardWrite");
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String writer = memberVO.getUserId();
		vo.setWriter(writer);
		FileUtils fileUtils = new FileUtils();
		Iterator<String> iterator = mpRequest.getFileNames();
		MultipartFile multipartFile = mpRequest.getFile(iterator.next());
		if (multipartFile.getOriginalFilename()!= null && multipartFile.getOriginalFilename()!= "") {
			List<Map<String, Object>> fileList = fileUtils.parseInsertFileInfo(vo.getBno(), mpRequest, request);
		
			vo.setbImg((String)fileList.get(0).get("img"));
			vo.setbThumbImg((String)fileList.get(0).get("thumbImg"));
		}else {
			vo.setbImg("images/noImage.png");
			vo.setbThumbImg("images/noImage.png");
		}
		  
		service.write(vo);
		return "redirect:/board/list.do";
	}

	// ck 에디터에서 파일 업로드
	@RequestMapping(value = "/ckUpload.do", method = RequestMethod.POST)
	public void postCKEditorImgUpload(HttpServletRequest req, HttpServletResponse res,
			@RequestParam MultipartFile upload) throws Exception {
		// 랜덤 문자 생성
		UUID uid = UUID.randomUUID();

		OutputStream out = null;
		PrintWriter printWriter = null;

		// 인코딩
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8");

		try {

			String fileName = upload.getOriginalFilename(); // 파일 이름 가져오기
			byte[] bytes = upload.getBytes();

			// 업로드 경로
			String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;

			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // out에 저장된 데이터를 전송하고 초기화

			String callback = req.getParameter("CKEditorFuncNum");
			printWriter = res.getWriter();
			String fileUrl = "/ckUpload/" + uid + "_" + fileName; // 작성화면

			// 업로드시 메시지 출력
			printWriter.println("<script type='text/javascript'>" + "window.parent.CKEDITOR.tools.callFunction("
					+ callback + ",'" + fileUrl + "','이미지를 업로드하였습니다.')" + "</script>");

			printWriter.flush();

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return;
	}

	@RequestMapping(value = "/readView.do", method = RequestMethod.GET)
	public String read(BoardVO boardVO, MemberVO memberVO, @ModelAttribute("scri") SearchCriteria scri, Model model,
			HttpSession session) throws Exception {
		logger.info("boardRead");

		model.addAttribute("read", service.read(boardVO.getBno()));
		model.addAttribute("scri", scri);

		List<ReplyVO> replyList = service.readReply(boardVO.getBno());
		model.addAttribute("replyList", replyList);

		return "board/readView";
	}

	@RequestMapping(value = "/updateView.do", method = RequestMethod.GET)
	public String updateView(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model)
			throws Exception {
		logger.info("boardUpdateView");

		model.addAttribute("update", service.read(boardVO.getBno()));
		model.addAttribute("scri", scri);

		return "board/updateView";
	}

	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String update(BoardVO vo, @ModelAttribute("scri") SearchCriteria scri,
			RedirectAttributes rttr, MultipartHttpServletRequest mpRequest, HttpServletRequest request) throws Exception {
		logger.info("boardUpdate");
		FileUtils fileUtils = new FileUtils();
		Iterator<String> iterator = mpRequest.getFileNames();
		MultipartFile multipartFile = mpRequest.getFile(iterator.next());
		if (multipartFile.getOriginalFilename()!= null && multipartFile.getOriginalFilename()!= "") {
			List<Map<String, Object>> fileList = fileUtils.parseInsertFileInfo(vo.getBno(), mpRequest, request);

			vo.setbImg((String)fileList.get(0).get("img"));
			vo.setbThumbImg((String)fileList.get(0).get("thumbImg"));
		}
		service.update(vo);

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/board/list.do";
	}

	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public String delete(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr)
			throws Exception {
		logger.info("boardDelete");

		service.delete(boardVO.getBno());

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/board/list.do";
	}

	@RequestMapping(value = "/replyWrite.do", method = RequestMethod.POST)
	public String replyWrite(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr, HttpSession session)
			throws Exception {
		logger.info("replyWrite");
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String writer = memberVO.getUserId();
		vo.setWriter(writer);

		service.writeReply(vo);

		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/board/readView.do";
	}

	@RequestMapping(value = "/replyUpdateView.do", method = RequestMethod.GET)
	public String replyUpdateView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		logger.info("replyWrite");

		model.addAttribute("replyUpdate", service.selectReply(vo.getRno()));
		model.addAttribute("scri", scri);

		return "board/replyUpdateView";
	}

	@ResponseBody
	@RequestMapping(value = "/replyUpdateForm.do", method = RequestMethod.POST)
	public ReplyVO replyUpdateForm(ReplyVO vo) throws Exception {
		logger.info("replyUpdateForm");
		
		ReplyVO replyInfo = service.updateReplyForm(vo);
		
		return replyInfo;
	}
	
	@ResponseBody
	@RequestMapping(value = "/replyUpdate.do", method = RequestMethod.POST)
	public String replyUpdate(ReplyVO vo) throws Exception {
		logger.info("replyUpdate");
		service.updateReply(vo);

		return null;
	}
	
	@RequestMapping(value = "/replyDeleteView.do", method = RequestMethod.GET)
	public String replyDeleteView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		logger.info("replyDelete");

		model.addAttribute("replyDelete", service.selectReply(vo.getRno()));
		model.addAttribute("scri", scri);

		return "board/replyDeleteView";
	}

	@ResponseBody
	@RequestMapping(value = "/replyDelete.do", produces = "application/text; charset=utf8", method = RequestMethod.POST)
	public String replyDelete(ReplyVO vo) throws Exception {
		logger.info("replyDelete");
		String msg = "삭제가 완료되었습니다.";
		service.deleteReply(vo);

		return msg;
	}

}
