package restaurant.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import restaurant.model.RestaurantBean;
import restaurant.model.RestaurantDao;

@Controller
public class RestaurantListController {

	private final String command = "/restaurantList.re";
	private final String viewPage = "restaurantListForm";
	
	@Autowired
	private RestaurantDao restaurantDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String restaurantList(Model model,
						@RequestParam(value = "WhatColumn", required = false) String WhatColumn,
						@RequestParam(value = "keyword", required = false) String keyword) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", "%"+keyword+"%");
		map.put("WhatColumn", WhatColumn);

		
		List<RestaurantBean> lists = restaurantDao.resList(map);
		
		model.addAttribute("lists", lists);
		
		return viewPage;
	}
}
