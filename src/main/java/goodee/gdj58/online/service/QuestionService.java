package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.question.QuestionMapper;
import goodee.gdj58.online.vo.Question;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class QuestionService {
	@Autowired QuestionMapper questionMapper;
	
	// 문제 수정
	public int updateQuestion(Question question) {
		return questionMapper.updateQuestion(question);
	}
	
	// 시험지 등록 후 문제 등록
	public int insertQuestion(int testNo, Question question) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("testNo", testNo);
		paramMap.put("questionIdx", question.getQuestionIdx());
		paramMap.put("questionTitle", question.getQuestionTitle());
		paramMap.put("questionScore", question.getQuestionScore());
		questionMapper.insertQuestion(paramMap);
		
		log.debug("\u001B[31m" + "questionNo : " + paramMap.get("questionNo"));
		
		// map을 int타입으로 형변환
		int questionNo = Integer.parseInt(String.valueOf(paramMap.get("questionNo")));
		
		log.debug("\u001B[31m" + "int questionNo : " + questionNo);
		
		return questionNo;
	}
}
