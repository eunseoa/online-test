package goodee.gdj58.online.mapper.teacher;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Teacher;

@Mapper
public interface TeacherMapper {
	int updateTeacherPw(Map<String, Object> paramMap); // 강사 비밀번호 수정
	Teacher login(Teacher teacher); // 강사 로그인
	int deleteTeacher(int teacherNo); // 강사 삭제
	int insertTeacher(Teacher teacher); // 강사 등록
	int countTeacher(String searchWord); // 강사 데이터 총 개수
	List<Teacher> selectTeacherList(Map<String, Object> paramMap); // 관리자가 볼 수 있는 강사 리스트 출력
}
