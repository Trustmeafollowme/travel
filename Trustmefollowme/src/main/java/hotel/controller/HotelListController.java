package hotel.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import hotel.model.HotelBean;
import hotel.model.HotelDao;
import utility.Paging;

@Controller
public class HotelListController {

	private final String command = "/hotelList.ht";
	private final String viewPage = "hotelListForm";
@Autowired
@Qualifier("hotelDao")
private HotelDao hotelDao;


	@RequestMapping(value = command)
	public String hotelList(Model model, HttpServletRequest request,
			@RequestParam(value = "WhatColumn", required = false) String WhatColumn,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "pageNumber", required = false) String pageNumber) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", "%"+keyword+"%");
		map.put("WhatColumn", WhatColumn);
		
		int totalCount = hotelDao.totalCount(map);
		String url = request.getContextPath()+command;
		String pageSize = "6";
		
		Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url, WhatColumn, keyword);
		
		List<HotelBean> list = hotelDao.getAllHotel(map, pageInfo);
		System.out.println("list.size()"+list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("pageInfo", pageInfo);
		
		return viewPage;
	}
}
