package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.example.ExampleMapper;
import goodee.gdj58.online.vo.Example;

@Service
@Transactional
public class ExampleService {
	@Autowired ExampleMapper exampleMapper;
	
	// 보기 수정
	public int updateExample(Example example) {
		return exampleMapper.updateExample(example);
	}
	
	// 문제당 보기 등록
	public int insertExample(int questionNo, Example example) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("questionNo", questionNo);
		paramMap.put("exampleIdx", example.getExampleIdx());
		paramMap.put("exampleTitle", example.getExampleTitle());
		paramMap.put("answer", example.getAnswer());
		
		return exampleMapper.insertExample(paramMap);
	}
}
