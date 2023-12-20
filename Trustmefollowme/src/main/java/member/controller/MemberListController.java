package member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberListController {

	private final String command = "/memberList.mb";
	private final String viewPage = "memberListForm";
	@Autowired
	@Qualifier("memberDao")
	private MemberDao memberDao;	
	
	@RequestMapping(value = command)
	public String memberListForm(Model model) {
	List<MemberBean>list = memberDao.getAllMember();
	model.addAttribute("list",list);
		
	return viewPage;
	
	}
}
 