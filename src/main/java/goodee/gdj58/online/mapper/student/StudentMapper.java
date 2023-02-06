package goodee.gdj58.online.mapper.student;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Student;

@Mapper
public interface StudentMapper {
	int updateStudentPw(Map<String, Object> paramMap); // 학생 비밀번호 수정
	Student login(Student student); // 학생 로그인
	int deleteStudent(int studentNo); // 학생 삭제
	int insertStudent(Student student); // 학생 등록
	int countStudent(String searchWord); // 학생 데이터 총 개수
	List<Student> selectStudentList(Map<String, Object> paramMap); // 관리자가 볼 수 있는 학생 리스트
}
