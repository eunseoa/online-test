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
	
	// 시험지 수정
	public int updateTest(Test test) {
		return testMapper.updateTest(test);
	}
	
	// 시험지 상세 보기
	public List<Map<String, Object>> testOne(int testNo) {
		return testMapper.testOne(testNo);
	}
	
	// 시험 제목만 출력
	public Test selectTestTitle(int testNo) {
		return testMapper.selectTestTitle(testNo);
	}
	
	// 시험 등록
	public int insertTest(Test test) {
		return testMapper.insertTest(test);
	}
	
	// 시험 데이터 총 개수
	public int countTest(String searchWord) {
		return testMapper.countTest(searchWord);
	}
	
	// 강사용 시험 리스트
	public List<Test> selectTestListByTeacher(int currentPage, int rowPerPage, String searchWord) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		
		return testMapper.selectTestHaveQuestionList(paramMap);
	}
}
