package cafe.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cafe.model.CafeBean;
import cafe.model.CafeDao;
import utility.Paging;

@Controller
public class CafeListController {

	private final String command = "/mainCafeList.cf";
	private final String viewPage = "cafeListForm";
	
	@Autowired
	private CafeDao cafeDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView cafeList(@RequestParam(value = "whatColumn", required = false) String whatColumn, 
						@RequestParam(value = "keyword", required = false) String keyword, 
						@RequestParam(value = "pageNumber", required = false) String pageNumber, 
						HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount = cafeDao.getTotalCount(map);
		
		String url = request.getContextPath()+command;
		
		Paging pageInfo = new Paging(pageNumber, null, totalCount, url, whatColumn, keyword);
		
		List<CafeBean> lists = cafeDao.getAllCafe(map, pageInfo);
		mav.addObject("lists", lists);
		mav.addObject("pageInfo", pageInfo);
		mav.setViewName(viewPage);
		return mav;
	}
	
}
