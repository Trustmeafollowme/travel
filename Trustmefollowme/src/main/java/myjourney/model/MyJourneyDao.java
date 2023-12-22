package myjourney.model;
 
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import member.model.MemberBean;

@Component("myJourneyDao")
public class MyJourneyDao {
	private final String namespace = "myjourney.Myjourney";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;


	public void insertTravel(MyJourneyBean mjb) {
		System.out.println("mjb.getId()"+mjb.getId());
		System.out.println("mjb.getJdate()"+mjb.getJdate());
		System.out.println("mjb.getCate()"+mjb.getCate());
		System.out.println("mjb.getNumber()"+mjb.getNum());
		System.out.println("mjb.getTurn()"+mjb.getTurn());
		System.out.println("mjb.getXpos()"+mjb.getXpos());
		System.out.println("mjb.getYpos()"+mjb.getYpos());
		
		sqlSessionTemplate.insert(namespace+".insertjourney",mjb);
		
	}


	public int insertMyJourney(Map<String, Object> map) {
		int cnt = sqlSessionTemplate.insert(namespace+".insertMyJourney", map);
		System.out.println("insertMyJourney cnt:"+cnt);
		return cnt;
	}
	
	public List<MyJourneyBean> getAllMyJourney() {
		List<MyJourneyBean> lists = sqlSessionTemplate.selectList(namespace+".getAllMyJourney");
		System.out.println("lists.size():"+lists.size());
		return lists;
	}

	public void deleteMyjourney(int jnum) {
		int cnt = sqlSessionTemplate.delete(namespace+".deleteMyjourney", jnum);
		System.out.println("deleteMyjourney cnt:"+cnt);
	}

	public List<MyJourneyBean> getAllMyJourneyByJdate(String jdate) {
		List<MyJourneyBean> lists = sqlSessionTemplate.selectList(namespace+".getAllMyJourneyByJdate",jdate);
		System.out.println("lists.size():"+lists.size());
		return lists;
	}

	public int saveMyJourney(String id) {
		int cnt = sqlSessionTemplate.update(namespace+".saveMyJourney", id);
		System.out.println("saveMyJourney cnt:"+cnt);
		return cnt;
	}

	public int searchTurnMore(String id) {
		int tCheck = sqlSessionTemplate.selectOne(namespace+".searchTurnMore", id);
		System.out.println("searchTurnMore tCheck:"+tCheck);
		return tCheck;
	}

	public void updateMJList(String id) {
		int cnt = sqlSessionTemplate.update(namespace+".updateMJList", id);
		System.out.println("saveMyJourney cnt:"+cnt);
	}

	public List<MyJourneyBean> myjDateSelect(MyJourneyBean mb) {
		List<MyJourneyBean> list = sqlSessionTemplate.selectList(namespace+".myjDaySelect",mb);
		return list;
	}


	public List<MyJourneyBean> myjSelect(MyJourneyBean mb) {
		List<MyJourneyBean> list = sqlSessionTemplate.selectList(namespace+".myjSelect",mb);
		return list;
	}


	public List<MyJourneyBean> boardList(String mEmail, String jnum) {		// board �߰�
		Map<String, String> map = new HashMap<String, String>();
		map.put("mEmail", mEmail);
		map.put("jnum", jnum);
		
		List<MyJourneyBean> list = sqlSessionTemplate.selectList(namespace+".boardList",map);
		return list;
		
	}
}
