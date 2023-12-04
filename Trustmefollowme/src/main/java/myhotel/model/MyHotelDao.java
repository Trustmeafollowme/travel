package myhotel.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MyHotelDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
}
