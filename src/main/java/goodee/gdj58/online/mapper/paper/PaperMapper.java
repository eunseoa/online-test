package goodee.gdj58.online.mapper.paper;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Paper;

@Mapper
public interface PaperMapper {
	int selectQuestionAnswer(int answer);
	int insertPaper(Paper paper); // 답안지 제출
}
