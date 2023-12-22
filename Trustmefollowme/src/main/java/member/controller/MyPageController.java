package member.controller; 

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MyPageController {
	private final String command = "myPage.mb";
	private final String viewPage = "myPage";
	
	@Autowired
	private MemberDao mDao;
	
	@RequestMapping(command)
	public String myPage(Model model, HttpSession session) {
		String myemail = (String) session.getAttribute("myemail");
		MemberBean mb = mDao.getMemberInfoByMyEmail(myemail);
		int jnum = mDao.getMyjNum(myemail);
		model.addAttribute("memberBean", mb);
		model.addAttribute("jnum", jnum);
		return viewPage;
	}
}
