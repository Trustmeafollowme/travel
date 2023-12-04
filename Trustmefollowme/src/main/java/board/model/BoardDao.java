package board.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("boardDao")
public class BoardDao {
	private final String namespace = "board.Board";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
}
