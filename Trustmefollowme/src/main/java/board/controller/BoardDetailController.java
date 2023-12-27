package board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;
import board.model.ChatBean;
import board.model.LikeBean;
import myjourney.model.MyJourneyBean;
import myjourney.model.MyJourneyDao;

@Controller
public class BoardDetailController {

    private final String command = "/boardDetail.bd";
    private final String viewPage = "boardDetailForm";

    @Autowired
    private BoardDao boardDao;
    
    @Autowired
    MyJourneyDao myJourneyDao;

    @RequestMapping(value = command, method = RequestMethod.GET)
    public String boardDetailForm(HttpSession session, Model model, @RequestParam("num") String num
    		,@RequestParam("mEmail") String mEmail, @RequestParam("jnum") String jnum,
    		@RequestParam("minDate") String minDate, LikeBean lb) {
    	try {
			
		
        BoardBean bb = boardDao.boardDetail(num);
        model.addAttribute("bb", bb);
        
        String id = (String)session.getAttribute("myemail");
        Map<String, String> map = new HashMap<String, String>();

        String customer = "";
        if(id == null) {
        	customer += "customer";
        	map.put("b_num", num);
        	map.put("m_num", customer);
        }else {
        	map.put("b_num", num);
        	map.put("m_num", id);
        }
        
        int likecount = boardDao.likeCount(num); // ���ƿ� ����
        
        LikeBean likeInfo = boardDao.findLike(map); // ���ƿ� ��� ����
        if (likeInfo == null) {
            int cnt = boardDao.likeInsert(map);
            if (cnt != -1) {
                LikeBean getInfo = boardDao.findLike(map);
                model.addAttribute("likeInfo", getInfo);
            }
        } else {
            model.addAttribute("likeInfo", likeInfo); 
        }											// ���ƿ� ��� ��
        
        model.addAttribute("likecount", likecount); // ���ƿ� ���� �Ӽ�
        // ����Ʈ �������� ����
        
        List<MyJourneyBean> boardListCount = myJourneyDao.boardListCount(mEmail,jnum);
        int dateCount = myJourneyDao.dateCount(mEmail,jnum);
        String date = "";
        for(int i=0;i<boardListCount.size();i++) {
        	date += boardListCount.get(i).getJdate()+",";
        }	
        
        String minDate2 = myJourneyDao.minDate(jnum, mEmail);
        String maxDate = myJourneyDao.maxDate(jnum, mEmail);
        
        MyJourneyBean mb = new MyJourneyBean();
        mb.setId(mEmail);
        mb.setJnum(Integer.parseInt(jnum));
        mb.setJdate(minDate);
        
        List<MyJourneyBean> list = myJourneyDao.myjSelect(mb);
        List<ChatBean> lists = boardDao.chatList(num);
        if(list.isEmpty()) {
        	model.addAttribute("num", num);
        	model.addAttribute("jnum", jnum);
        	
        	return "redirect:/boardDelete.bd";
        }
        model.addAttribute("lists", lists);
        model.addAttribute("list", list);
        model.addAttribute("date", date);
        model.addAttribute("dateCount", dateCount);
        model.addAttribute("likeInfo", likeInfo);
        model.addAttribute("minDate", minDate2);
        model.addAttribute("maxDate", maxDate);
    	} catch (NumberFormatException e) {
			// TODO: handle exception
		}
       
        
        return viewPage;
        
    }
}