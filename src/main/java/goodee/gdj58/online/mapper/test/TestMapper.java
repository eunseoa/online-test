package goodee.gdj58.online.mapper.test;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Test;

@Mapper
public interface TestMapper {
	int updateTest(Test test); // 시험 정보 수정
	List<Map<String, Object>> testOne(int testNo); // 시험지 상세 보기
	int insertTest(Test test); // 시험 제목 등록
	int countTest(String searchWord); // 시험 데이터 총 개수
	List<Test> selectTestOne(int testNo); // 시험 문제 전체 보기
	Test selectTestTitle(int testNo); // 시험 제목만 출력
	List<Test> selectTestNotQuestionList(); // 강사용 : 질문이 생성되지 않은 시험 리스트
	List<Test> selectTestHaveQuestionList(Map<String, Object> map); // 강사용 : 질문이 생성된 시험 리스트
}
