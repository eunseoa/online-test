package goodee.gdj58.online.mapper.example;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ExampleMapper {
	int insertExample(Map<String, Object> paramMap); // 문제당 보기 등록
}
