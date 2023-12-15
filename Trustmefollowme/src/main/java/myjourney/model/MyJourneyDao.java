package myjourney.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import main.model.StartBean;
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

	public List<MyJourneyBean> myjSelect(MemberBean mb) {
		List<MyJourneyBean> list = sqlSessionTemplate.selectList(namespace+".myjSelect",mb);
		return list;
	}
	
}
