package goodee.gdj58.online.mapper.question;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface QuestionMapper {
	int insertQuestion(Map<String, Object> paramMap); // 시험지 등록 후 질문 등록
}
