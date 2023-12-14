package main.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import myjourney.model.MyJourneyBean;
import myjourney.model.MyJourneyDao;

@Controller
public class MainJourneyController {
	@Autowired
	MyJourneyDao myjDao;
	
	@RequestMapping("mainJourney.m")
	public String mainJourney(HttpServletRequest request) {
		String id="admin";
		List<MyJourneyBean> myjList=myjDao.myjSelect(id);
		request.setAttribute("list", myjList);
	return "mainJourney";	
	}
}
