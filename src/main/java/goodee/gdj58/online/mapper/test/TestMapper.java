package goodee.gdj58.online.mapper.test;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Test;

@Mapper
public interface TestMapper {
	int insertTest(Test test); // 시험 등록
	int countTest(String searchWord); // 시험 데이터 총 개수
	List<Test> selectTestOne(int testNo); // 시험 문제 전체 보기
	List<Test> selectTestListByTeacher(Map<String, Object> map); // 강사용 시험 리스트
}
