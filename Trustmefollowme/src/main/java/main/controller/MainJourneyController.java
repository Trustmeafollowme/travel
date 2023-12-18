package main.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import myjourney.model.MyJourneyBean;
import myjourney.model.MyJourneyDao;

@Controller
public class MainJourneyController {
	@Autowired
	MyJourneyDao memberDao;
	
	@RequestMapping("mainJourney.m")
	public String mainJourney(HttpServletRequest request,HttpSession session,
			@RequestParam(value = "jdate",required = false)String jdate) {
		
		String id=(String)session.getAttribute("myemail");
		//int myjNum=(Integer)session.getAttribute("myjNum");
		MyJourneyBean mb= new MyJourneyBean();
		//mb.setMyjNum(myjNum);
		mb.setId(id);
		List<MyJourneyBean> myjDayList=memberDao.myjDateSelect(mb);
		
		mb.setJdate(myjDayList.get(0).getJdate());
		if(jdate!=null) {
			mb.setJdate(jdate);
		}
		List<MyJourneyBean> myjList=memberDao.myjSelect(mb);
		List<String> myjXpos = new ArrayList<String>();
		List<String> myjYpos=new ArrayList<String>() ;
	for(int i=0 ;i<myjList.size();i++) {
		myjXpos.add(myjList.get(i).getXpos());
		myjYpos.add(myjList.get(i).getYpos());
	}
		for(int i=0;i<myjXpos.size();i++) {
			System.out.println("myjXpos.get"+myjXpos.get(i));
		}
		request.setAttribute("myjXpos", myjXpos);
		request.setAttribute("myjYpos", myjYpos);
	
		request.setAttribute("myemail", id);
		request.setAttribute("list", myjList);
		request.setAttribute("daylist", myjDayList);
	return "mainJourney";	
	}
}
