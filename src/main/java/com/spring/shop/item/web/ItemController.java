package com.spring.shop.item.web;

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

import com.spring.shop.common.service.PageMaker;
import com.spring.shop.common.service.SearchCriteria;
import com.spring.shop.common.web.FileUtils;
import com.spring.shop.item.service.ItemReplyVO;
import com.spring.shop.item.service.ItemService;
import com.spring.shop.item.service.ItemVO;
import com.spring.shop.member.service.MemberVO;


@Controller
@RequestMapping("/ingredient/*")
public class ItemController {
	@Autowired
	private ItemService itemService;

	@Resource(name = "uploadPath")
	private String uploadPath;

	/* 관리자 식재료 목록페이지로 이동 */
	@RequestMapping("/admin_ing_list.do")
	public String adminIngList(Model model, ItemVO vo, @ModelAttribute("scri") SearchCriteria scri) {
		List<ItemVO> ingList = itemService.ingList(scri);
		model.addAttribute("ingList", ingList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(itemService.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);
		return "ingredient/admin_ing_list";
	}

	/* 관리자 식재료 등록페이지로 이동 */
	@RequestMapping("/ingredient/admin_ing_regist.do")
	public void adminIngWriteView(Model model) {

	}

	/* 식재료 등록 */

	@RequestMapping("/ingRegister.do")
	@SuppressWarnings("unchecked")
	public String adminIngRegister(ItemVO vo, MultipartHttpServletRequest mpRequest, HttpServletRequest request) throws Exception {

		FileUtils fileUtils = new FileUtils();
		Iterator<String> iterator = mpRequest.getFileNames();
		MultipartFile multipartFile = mpRequest.getFile(iterator.next());
		if (multipartFile.getOriginalFilename()!= null && multipartFile.getOriginalFilename()!= "") {
			List<Map<String, Object>> fileList = fileUtils.parseInsertFileInfo(vo.getIngNum(), mpRequest, request);
		
			vo.setIngImg((String)fileList.get(0).get("img"));
			vo.setIngThumbImg((String)fileList.get(0).get("thumbImg"));
		}else {
			vo.setIngImg("images/noImage.png");
			vo.setIngThumbImg("images/noImage.png");
		}

		itemService.ingRegister(vo);
		return "redirect:/ingredient/admin_ing_list.do";
	}

	// ck 에디터에서 파일 업로드
	@RequestMapping(value = "/ckUpload.do")
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
	/* 관리자 식재료 조회 페이지로 이동 */

	@RequestMapping(value = "/admin_ing_view.do")
	public String read(@RequestParam("n") String ingNum, @ModelAttribute("scri") SearchCriteria scri, Model model) {
		ItemVO ingredient = itemService.ingView(ingNum);
		model.addAttribute("ingredient", ingredient);
		model.addAttribute("scri", scri);
		return "ingredient/admin_ing_view";
	}

	/* 관리자 식재료 수정 페이지로 이동 */
	@RequestMapping(value = "/ingModify.do")
	public String updateView(@RequestParam("n") String ingNum, @ModelAttribute("scri") SearchCriteria scri, Model model) {

		ItemVO ingredient = itemService.ingView(ingNum);
		model.addAttribute("ingredient", ingredient);
		model.addAttribute("scri", scri);

		return "ingredient/admin_ing_update";
	}

	// 식재료 수정
	@RequestMapping(value = "/modify.do")
	public String update(ItemVO vo, MultipartHttpServletRequest mpRequest, HttpServletRequest request,
			@ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {

		FileUtils fileUtils = new FileUtils();
		Iterator<String> iterator = mpRequest.getFileNames();
		MultipartFile multipartFile = mpRequest.getFile(iterator.next());
		if (multipartFile.getOriginalFilename()!= null && multipartFile.getOriginalFilename()!= "") {
			List<Map<String, Object>> fileList = fileUtils.parseInsertFileInfo(vo.getIngNum(), mpRequest, request);
		
			vo.setIngImg((String)fileList.get(0).get("img"));
			vo.setIngThumbImg((String)fileList.get(0).get("thumbImg"));
		}
		itemService.ingredientModify(vo);

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/ingredient/admin_ing_list.do";
	}

	@RequestMapping(value = "/delete.do")
	public String delete(@RequestParam("n") String ingNum, @ModelAttribute("scri") SearchCriteria scri,
			RedirectAttributes rttr) throws Exception {

		itemService.ingredientDelete(ingNum);

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		return "redirect:/ingredient/admin_ing_list.do";
	}

	/* 판매 식재료 목록 페이지로 이동 */
	@RequestMapping("/sell_ing_list.do")
	public String sellIngList(Model model, @ModelAttribute("scri") SearchCriteria scri) {
		List<ItemVO> sellIngList = null;
		sellIngList = itemService.sellIngList(scri);

		model.addAttribute("sellIngList", sellIngList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(itemService.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "ingredient/sell_ing_list";
	}

	/* 판매 식재료 목록 카테고리별 이동 */
	@RequestMapping("/sellIngCateList.do")
	public String sellIngList(@RequestParam("c") String ingCateCode, Model model,
			@ModelAttribute("scri") SearchCriteria scri) {
		List<ItemVO> sellIngList = null;
		sellIngList = itemService.sellIngCateList(ingCateCode);

		model.addAttribute("sellIngList", sellIngList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(itemService.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);
		return "ingredient/sell_ing_list";
	}

	// 식재료 내용
	@RequestMapping("/sellIngView.do")
	public String sellIngView(@RequestParam("n") String ingNum, Model model, @ModelAttribute("scri") SearchCriteria scri) {
		ItemVO sellIngView = itemService.sellIngView(ingNum);
		model.addAttribute("sellIngView", sellIngView);
		model.addAttribute("scri", scri);
		return "ingredient/sell_ing_view";
	}

	// 상품 소감(댓글) 작성
	@ResponseBody
	@RequestMapping(value = "/ing_reply_write.do")
	public void writeReply(ItemReplyVO replyVO, HttpSession session) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("member");
		replyVO.setUserId(member.getUserId());

		itemService.registIngReply(replyVO);
	}

	// 상품 후기(댓글) 목록
	@ResponseBody
	@RequestMapping(value = "/ing_reply_List.do")
	public List<ItemReplyVO> getReplyList(@RequestParam("n") String ingNum) {

		List<ItemReplyVO> ingReplyList = itemService.ingReplyList(ingNum);

		return ingReplyList;
	}

	// 상품 후기(댓글) 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteIngReply.do")
	public int deleteReplyList(ItemReplyVO replyVO, HttpSession session) {

		int result = 0;

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = itemService.idCheck(replyVO.getRepNum());

		if (member.getUserId().equals(userId)) {

			replyVO.setUserId(member.getUserId());
			itemService.deleteIngReply(replyVO);

			result = 1;
		}

		return result;

	}

	// 상품 소감(댓글) 수정
	@ResponseBody
	@RequestMapping(value = "/modifyIngReply.do")
	public int updateReply(ItemReplyVO replyVO, HttpSession session) {

		int result = 0;

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = itemService.idCheck(replyVO.getRepNum());

		if (member.getUserId().equals(userId)) {

			replyVO.setUserId(member.getUserId());
			itemService.modifyIngReply(replyVO);
			result = 1;
		}

		return result;
	}
}
