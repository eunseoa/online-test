package goodee.gdj58.online.mapper.test;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Test;

@Mapper
public interface TestMapper {
	int deleteTest(int testNo); // 문제 등록되기 전 시험 삭제
	int updateTest(Test test); // 시험 정보 수정
	List<Map<String, Object>> testOne(int testNo); // 시험지 상세 보기
	int insertTest(Test test); // 시험 등록
	Test selectTestTitle(int testNo); // 시험 제목, 문제 개수 출력
	int notQueCnt(String searchWord); // 질문이 생성되지 않은 시험 데이터 총 개수
	int haveQueCnt(String searchWord); // 질문이 생성된 시험 데이터 총 개수
	List<Test> selectNotQuestionTestList(Map<String, Object> map); // 강사용 : 질문이 생성되지 않은 시험 리스트
	List<Test> selectHaveQuestionTestList(Map<String, Object> map); // 강사용 : 질문이 생성된 시험 리스트
}
