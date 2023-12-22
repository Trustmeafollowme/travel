package board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import board.model.BoardBean;
import board.model.BoardDao;
import member.model.MemberBean;
import member.model.MemberDao;
import myjourney.model.MyJourneyBean;
import myjourney.model.MyJourneyDao;

@Controller
public class BoardInsertController {

	private final String command = "/boardInsert.bd";
	private final String viewPage = "boardInsertForm";
	private final String viewPage2 = "boardInsertForm2";
	private final String gotoPage = "redirect:/boardList.bd";
	
	@Autowired
	private BoardDao boardDao;

	@Autowired
	private MemberDao memberDao;

	@Autowired
	MyJourneyDao myJourneyDao;
	
	@Autowired
	private ServletContext servletContext;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String boardInsertForm(HttpServletResponse response, Model model,
								HttpSession session) {
		
		response.setContentType("text/html; charset=UTF-8");

		String myemail=(String)session.getAttribute("myemail");
		
		int jnum = memberDao.getMyjNum(myemail);
		PrintWriter out;
		try {
			out = response.getWriter();
			if(jnum == 0) {
				out.write("<script>alert('만들어진 여정이 없습니다.');"
						+ "location.href='boardList.bd'</script>");
				out.flush();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		model.addAttribute("jnum", jnum);

		return viewPage;
	}
	
	@RequestMapping("boardInsert2.bd")
	public String boardInsertForm2(HttpSession session, HttpServletRequest request,
			@RequestParam("jnum") String jnum,
			@Valid BoardBean bb, BindingResult result,
			@RequestParam(value = "jdate",required = false) String jdate) {
		

		String id=(String)session.getAttribute("myemail");
		
		MyJourneyBean mb= new MyJourneyBean();
		
		mb.setId(id);
		List<MyJourneyBean> myjDayList=myJourneyDao.myjDateSelect(mb);
		
		mb.setJdate(myjDayList.get(0).getJdate());
		if(jdate!=null) {
			mb.setJdate(jdate);
		}
		List<MyJourneyBean> myjList=myJourneyDao.myjSelect(mb);
		List<String> myjXpos = new ArrayList<String>();
		List<String> myjYpos=new ArrayList<String>() ;
		
		for(int i=0 ;i<myjList.size();i++) {
			myjXpos.add(myjList.get(i).getXpos());
			myjYpos.add(myjList.get(i).getYpos());
		}
		for(int i=0;i<myjXpos.size();i++) {
			System.out.println("myjXpos.get"+myjXpos.get(i));
		}
		if(result.hasErrors()) {
			request.setAttribute("myjXpos", myjXpos);
			request.setAttribute("myjYpos", myjYpos);
			request.setAttribute("jnum", jnum);
			
			request.setAttribute("myemail", id);
			request.setAttribute("list", myjList);
			request.setAttribute("daylist", myjDayList);
			return viewPage2;
		}
		request.setAttribute("myjXpos", myjXpos);
		request.setAttribute("myjYpos", myjYpos);
	
		request.setAttribute("myemail", id);
		request.setAttribute("list", myjList);
		request.setAttribute("daylist", myjDayList);
		
		return viewPage2;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String boardInsert(HttpSession session, HttpServletRequest request,
							@RequestParam("jnum") String jnum,
							@RequestParam("myemail") String myemail,
							@RequestParam("writer") String writer,
							@Valid BoardBean bb, BindingResult result) {

		
		if(result.hasErrors()) {
			System.out.println("팅김");
			return viewPage;
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(new Date());
		
		bb.setReg_date(date);
		bb.setIp(request.getRemoteAddr());
		bb.setmEmail(myemail);
		bb.setJnum(jnum);
		bb.setWriter(writer);
		
		String upload = servletContext.getRealPath("/resources/images/");
		
		boardDao.boardInsert(bb);
		File file = new File(upload+File.separator+bb.getImage());
		
		MultipartFile multi = bb.getImgUpload();
		
		try {
			multi.transferTo(file);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("시작");
		return gotoPage;
	}
}
