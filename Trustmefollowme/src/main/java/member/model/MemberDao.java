package member.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("memberDao")
public class MemberDao {

	private final String namespace = "member.Member";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
}
