package com.spring.shop.recipe.web;

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
import com.spring.shop.member.service.MemberVO;
import com.spring.shop.recipe.service.ItemVO;
import com.spring.shop.recipe.service.RecipeReplyVO;
import com.spring.shop.recipe.service.RecipeService;
import com.spring.shop.recipe.service.RecipeVO;


@Controller
@RequestMapping("/recipe/*")
public class RecipeController {
	@Autowired
	private RecipeService recipeService;

	@Resource(name = "uploadPath")
	private String uploadPath;

	/* 관리자 식재료 목록페이지로 이동 */
	@RequestMapping("/admin_recipe_list.do")
	public String adminrecipeList(Model model, RecipeVO vo, @ModelAttribute("scri") SearchCriteria scri) {
		List<RecipeVO> recipeList = recipeService.recipeList(scri);
		model.addAttribute("recipeList", recipeList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(recipeService.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);
		return "recipe/admin_recipe_list";
	}

	/* 관리자 식재료 등록페이지로 이동 */
	@RequestMapping("/admin_recipe_regist.do")
	public String adminRecipeWriteView(Model model) {
		
		List<?> itemList = recipeService.selectItemList();
		model.addAttribute("item", itemList);
		return "recipe/admin_recipe_regist";
	}

	@ResponseBody
	@RequestMapping("/checkItemInfo.do")
	public ItemVO checkItemInfo(String n) {
		ItemVO itemInfo = recipeService.checkItemInfo(n);
		return itemInfo;
	}

	/* 식재료 등록 */
	@RequestMapping("/recipeRegist.do")
	public String adminRecipeRegister(RecipeVO vo, MultipartHttpServletRequest mpRequest, HttpServletRequest request) throws Exception {

		FileUtils fileUtils = new FileUtils();
		Iterator<String> iterator = mpRequest.getFileNames();
		MultipartFile multipartFile = mpRequest.getFile(iterator.next());
		if (multipartFile.getOriginalFilename()!= null && multipartFile.getOriginalFilename()!= "") {
			List<Map<String, Object>> fileList = fileUtils.parseInsertFileInfo(vo.getRecipeNum(), mpRequest, request);
		
			vo.setRecipeImg((String)fileList.get(0).get("img"));
			vo.setRecipeThumbImg((String)fileList.get(0).get("thumbImg"));
		}else {
			vo.setRecipeImg("images/noImage.png");
			vo.setRecipeThumbImg("images/noImage.png");
		}
		recipeService.recipeRegist(vo);
		return "redirect:/recipe/admin_recipe_list.do";
	}

	// ck 에디터에서 파일 업로드
	@RequestMapping(value = "/ckUpload.do", method =RequestMethod.POST)
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

	@RequestMapping(value = "/admin_recipe_view.do")
	public String read(@RequestParam("n") String recipeNum, @ModelAttribute("scri") SearchCriteria scri, Model model) {
		RecipeVO recipe = recipeService.recipeView(recipeNum);
		model.addAttribute("recipe", recipe);
		model.addAttribute("scri", scri);
		return "recipe/admin_recipe_view";
	}

	/* 관리자 식재료 수정 페이지로 이동 */
	@RequestMapping(value = "/recipeModify.do")
	public String updateView(@RequestParam("n") String recipeNum, @ModelAttribute("scri") SearchCriteria scri, Model model) {

		RecipeVO recipe = recipeService.recipeView(recipeNum);
		List<?> itemList = recipeService.selectItemList();

		
		model.addAttribute("item", itemList);
		model.addAttribute("recipe", recipe);
		model.addAttribute("scri", scri);

		return "recipe/admin_recipe_update";
	}

	// 식재료 수정
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/modify.do")
	public String update(RecipeVO vo, MultipartHttpServletRequest mpRequest, HttpServletRequest request,
			@ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {

		FileUtils fileUtils = new FileUtils();
		Iterator<String> iterator = mpRequest.getFileNames();
		MultipartFile multipartFile = mpRequest.getFile(iterator.next());
		if (multipartFile.getOriginalFilename()!= null && multipartFile.getOriginalFilename()!= "") {
			List<Map<String, Object>> fileList = fileUtils.parseInsertFileInfo(vo.getRecipeNum(), mpRequest, request);
		
			vo.setRecipeImg((String)fileList.get(0).get("img"));
			vo.setRecipeThumbImg((String)fileList.get(0).get("thumbImg"));
		}

		recipeService.recipeModify(vo);

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/recipe/admin_recipe_list.do";
	}

	@RequestMapping(value = "/delete.do")
	public String delete(@RequestParam("n") String recipeNum, @ModelAttribute("scri") SearchCriteria scri,
			RedirectAttributes rttr) throws Exception {

		recipeService.recipeDelete(recipeNum);

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		return "redirect:/recipe/admin_recipe_list.do";
	}

	/* 판매 식재료 목록 페이지로 이동 */
	@RequestMapping("/sell_recipe_list.do")
	public String sellrecipeList(Model model, @ModelAttribute("scri") SearchCriteria scri) {
		List<RecipeVO> sellRecipeList = null;
		sellRecipeList = recipeService.sellRecipeList(scri);

		model.addAttribute("sellRecipeList", sellRecipeList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(recipeService.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "recipe/sell_recipe_list";
	}

	/* 판매 식재료 목록 카테고리별 이동 */
	@RequestMapping("/sellRecipeCateList.do")
	public String sellrecipeList(@RequestParam("c") String recipeCateCode, Model model,
			@ModelAttribute("scri") SearchCriteria scri) {
		List<RecipeVO> sellRecipeList = null;
		sellRecipeList = recipeService.sellRecipeCateList(recipeCateCode);

		model.addAttribute("sellRecipeList", sellRecipeList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(recipeService.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);
		return "recipe/sell_recipe_list";
	}

	// 식재료 내용
	@RequestMapping("/sellRecipeView.do")
	public String sellRecipeView(@RequestParam("n") String recipeNum, Model model, @ModelAttribute("scri") SearchCriteria scri) {
		RecipeVO sellRecipeView = recipeService.sellRecipeView(recipeNum);
		model.addAttribute("sellRecipeView", sellRecipeView);
		model.addAttribute("scri", scri);
		return "recipe/sell_recipe_view";
	}

	// 상품 소감(댓글) 작성
	@ResponseBody
	@RequestMapping(value = "/recipe_reply_write.do")
	public void writeReply(RecipeReplyVO replyVO, HttpSession session) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("member");
		replyVO.setUserId(member.getUserId());

		recipeService.registRecipeReply(replyVO);
	}

	// 상품 후기(댓글) 목록
	@ResponseBody
	@RequestMapping(value = "/recipe_reply_List.do")
	public List<RecipeReplyVO> getReplyList(@RequestParam("n") String recipeNum) {

		List<RecipeReplyVO> recipeReplyList = recipeService.recipeReplyList(recipeNum);

		return recipeReplyList;
	}

	// 상품 후기(댓글) 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteRecipeReply.do")
	public int deleteReplyList(RecipeReplyVO replyVO, HttpSession session) {

		int result = 0;

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = recipeService.idCheck(replyVO.getRepNum());

		if (member.getUserId().equals(userId)) {

			replyVO.setUserId(member.getUserId());
			recipeService.deleteRecipeReply(replyVO);

			result = 1;
		}

		return result;

	}

	// 상품 소감(댓글) 수정
	@ResponseBody
	@RequestMapping(value = "/modifyRecipeReply.do")
	public int updateReply(RecipeReplyVO replyVO, HttpSession session) {

		int result = 0;

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = recipeService.idCheck(replyVO.getRepNum());

		if (member.getUserId().equals(userId)) {

			replyVO.setUserId(member.getUserId());
			recipeService.modifyRecipeReply(replyVO);
			result = 1;
		}

		return result;
	}
}
