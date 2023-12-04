package spot.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("spotDao")
public class SpotDao {
	private final String namespace = "spot.Spot";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
}
