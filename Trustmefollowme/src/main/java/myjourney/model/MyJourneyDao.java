package myjourney.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myJourneyDao")
public class MyJourneyDao {
	private final String namespace = "myjourney.Myjourney";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
}
