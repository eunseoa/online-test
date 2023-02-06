package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.test.TestMapper;
import goodee.gdj58.online.vo.Test;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class TestService {
	@Autowired TestMapper testMapper;
	
	// 시험 등록
	public int insertTest(Test test) {
		testMapper.insertTest(test);
		
		log.debug("\u001B[31m" + "Insert testNo : " + test.getTestNo());
		
		return test.getTestNo();
	}
	
	// 시험 데이터 총 개수
	public int countTest(String searchWord) {
		return testMapper.countTest(searchWord);
	}
	
	public List<Test> testList(int testNo) {
		return testMapper.selectTestOne(testNo);
	}
	
	// 강사용 시험 리스트
	public List<Test> selectTestListByTeacher(int currentPage, int rowPerPage, String searchWord) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		
		return testMapper.selectTestListByTeacher(paramMap);
	}
}
