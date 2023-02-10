package goodee.gdj58.online.mapper.question;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Question;

@Mapper
public interface QuestionMapper {
	List<Map<String, Object>> questionOne(int questionNo); // 질문 수정폼에 띄울 문제 내용
	int updateQuestion(Question question); // 문제 수정
	int insertQuestion(Map<String, Object> paramMap); // 시험지 등록 후 문제 등록
}
