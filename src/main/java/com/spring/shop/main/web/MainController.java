package com.spring.shop.main.web;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.shop.advertise.service.AdvertiseService;
import com.spring.shop.advertise.service.AdvertiseVO;
import com.spring.shop.common.service.PageMaker;
import com.spring.shop.common.service.SearchCriteria;
import com.spring.shop.item.service.ItemService;
import com.spring.shop.item.service.ItemVO;
import com.spring.shop.recipe.service.RecipeService;
import com.spring.shop.recipe.service.RecipeVO;


@Controller
public class MainController {

   @Autowired
   AdvertiseService advertiseService;

   @Autowired
   ItemService itemService;
   
   @Autowired
   RecipeService recipeService;
   
   @RequestMapping("/main.do")
   public String mainPage(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
	  PageMaker pageMaker = new PageMaker();
	   
      List<ItemVO> sellIngList = null;
      sellIngList = itemService.sellIngList(scri);
      Collections.shuffle(sellIngList);
      
      pageMaker.setCri(scri);
      pageMaker.setTotalCount(itemService.listCount(scri));
      model.addAttribute("sellIngList", sellIngList);
      
      List<AdvertiseVO> adList = null;
      adList = advertiseService.adList(scri);
      Collections.shuffle(adList);
      
      pageMaker.setCri(scri);
      pageMaker.setTotalCount(advertiseService.listCount(scri));
      model.addAttribute("adList", adList);
      
      List<RecipeVO> recipeList = null;
      recipeList = recipeService.sellRecipeList(scri);
      Collections.shuffle(recipeList);
      
      pageMaker.setCri(scri);
      pageMaker.setTotalCount(recipeService.listCount(scri));
      model.addAttribute("recipeList", recipeList);
      
      
      return "mainPage";
   }
}