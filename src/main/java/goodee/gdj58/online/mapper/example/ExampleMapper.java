package goodee.gdj58.online.mapper.example;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Example;

@Mapper
public interface ExampleMapper {
	int questionAnswer(int questionNo); // 문제의 정답 exampleIdx
	int updateExample(Example example); // 보기 수정
	int insertExample(Map<String, Object> paramMap); // 문제당 보기 등록
}
