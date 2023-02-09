package goodee.gdj58.online.mapper.question;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Question;

@Mapper
public interface QuestionMapper {
	int updateQuestion(Question question); // 문제 수정
	int insertQuestion(Map<String, Object> paramMap); // 시험지 등록 후 문제 등록
}
