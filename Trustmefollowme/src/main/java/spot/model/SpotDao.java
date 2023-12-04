package spot.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("spotDao")
public class SpotDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
}
