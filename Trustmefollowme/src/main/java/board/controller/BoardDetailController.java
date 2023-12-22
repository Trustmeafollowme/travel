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
    public String boardDetailForm(HttpSession session, Model model, @RequestParam("num") int num
    		,@RequestParam("mEmail") String mEmail, @RequestParam("jnum") String jnum, LikeBean lb) {

        BoardBean bb = boardDao.boardDetail(num);
        model.addAttribute("bb", bb);
        
        int memberNum = (Integer)session.getAttribute("mynum");
        
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("b_num", num);
        map.put("m_num", memberNum);
        
        
        int likecount = boardDao.likeCount(num); // 좋아요 갯수
        
        LikeBean likeInfo = boardDao.findLike(map); // 좋아요 기능 시작
        if (likeInfo == null) {
            int cnt = boardDao.likeInsert(map);
            if (cnt != -1) {
                LikeBean getInfo = boardDao.findLike(map);
                model.addAttribute("likeInfo", getInfo);
            }
        } else {
            model.addAttribute("likeInfo", likeInfo); 
        }											// 좋아요 기능 끝
        
        model.addAttribute("likecount", likecount); // 좋아요 갯수 속성
        
        List<MyJourneyBean> lists2 = myJourneyDao.boardList(mEmail, jnum);
        List<ChatBean> lists = boardDao.chatList(num);
        model.addAttribute("lists", lists);
        model.addAttribute("list", lists2);
        
        return viewPage;
    }
}