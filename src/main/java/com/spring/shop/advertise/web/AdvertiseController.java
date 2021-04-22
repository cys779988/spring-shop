package com.spring.shop.advertise.web;

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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.shop.advertise.service.AdvertiseService;
import com.spring.shop.advertise.service.AdvertiseVO;
import com.spring.shop.common.service.PageMaker;
import com.spring.shop.common.service.SearchCriteria;
import com.spring.shop.common.web.FileUtils;


@Controller
@RequestMapping("/advertise/*")
public class AdvertiseController {

	@Autowired
	AdvertiseService service;

	@Resource(name = "uploadPath")
	private String uploadPath;

	/* 관리자 식재료 목록페이지로 이동 */
	@RequestMapping(value = "/list.do", method =RequestMethod.GET)
	public String adList(Model model, AdvertiseVO vo, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		List<AdvertiseVO> adList = service.adList(scri);
		model.addAttribute("adList", adList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);
		return "advertise/advertiseList";
	}

	/* 관리자 식재료 등록페이지로 이동 */
	@RequestMapping(value = "/registView.do", method =RequestMethod.GET)
	public String adRegistView(Model model) {

		return "advertise/registView";
	}

	@RequestMapping(value = "/regist.do", method =RequestMethod.POST)
	public String adRegist(AdvertiseVO vo, MultipartHttpServletRequest mpRequest, HttpServletRequest request) throws Exception {

		FileUtils fileUtils = new FileUtils();
		Iterator<String> iterator = mpRequest.getFileNames();
		MultipartFile multipartFile = mpRequest.getFile(iterator.next());
		if (multipartFile.getOriginalFilename()!= null && multipartFile.getOriginalFilename()!= "") {
			List<Map<String, Object>> fileList = fileUtils.parseInsertFileInfo(vo.getAdNum(), mpRequest, request);
		
			vo.setAdImg((String)fileList.get(0).get("img"));
			vo.setAdThumbImg((String)fileList.get(0).get("thumbImg"));
		}else {
			vo.setAdImg("");
			vo.setAdThumbImg("");
		}
		service.adRegist(vo);
		return "redirect:/advertise/list.do";
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

	@RequestMapping(value = "/readView.do", method =RequestMethod.GET)
	public String adRead(AdvertiseVO vo, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		AdvertiseVO advertise = service.adRead(vo.getAdNum());
		model.addAttribute("advertise", advertise);
		model.addAttribute("scri", scri);

		return "advertise/readView";
	}

	/* 관리자 식재료 수정 페이지로 이동 */
	@RequestMapping(value = "/updateView.do", method =RequestMethod.GET)
	public String adUpdateView(AdvertiseVO vo, @ModelAttribute("scri") SearchCriteria scri, Model model)
			throws Exception {

		AdvertiseVO advertise = service.adRead(vo.getAdNum());
		model.addAttribute("advertise", advertise);

		return "advertise/updateView";
	}

	// 식재료 수정
	@RequestMapping(value = "/update.do", method =RequestMethod.POST)
	public String adUpdate(AdvertiseVO vo, MultipartHttpServletRequest mpRequest, HttpServletRequest request,
			@ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {

		FileUtils fileUtils = new FileUtils();
		Iterator<String> iterator = mpRequest.getFileNames();
		MultipartFile multipartFile = mpRequest.getFile(iterator.next());
		if (multipartFile.getOriginalFilename()!= null && multipartFile.getOriginalFilename()!= "") {
			List<Map<String, Object>> fileList = fileUtils.parseInsertFileInfo(vo.getAdNum(), mpRequest, request);
		
			vo.setAdImg((String)fileList.get(0).get("img"));
			vo.setAdThumbImg((String)fileList.get(0).get("thumbImg"));
		}

		service.update(vo);

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/advertise/list.do";
	}

	@RequestMapping(value = "/delete")
	public String adDelete(AdvertiseVO vo, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr)
			throws Exception {

		service.delete(vo.getAdNum());

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/advertise/list.do";
	}
}
