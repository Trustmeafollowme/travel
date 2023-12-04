package cafe.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("cafeDao")
public class CafeDao {
	private final String namespace = "cafe.Cafe";

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
}
