package goodee.gdj58.online.mapper.paper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Paper;

@Mapper
public interface PaperMapper {
	List<Map<String, Object>> paperOne(Paper paper); // 답안지 상세보기
	int insertPaper(Paper paper); // 답안지 제출
}
