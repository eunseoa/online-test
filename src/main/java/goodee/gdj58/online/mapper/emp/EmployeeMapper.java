package goodee.gdj58.online.mapper.emp;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Teacher;

@Mapper
public interface EmployeeMapper {
	int updateEmployeePw(Map<String, Object> paramMap); // 관리자 비밀번호 수정
	Employee login(Employee employee); // 관리자 로그인
	int deleteEmployee(int empNo); // 관리자 삭제
	int insetEmployee(Employee employee); // 관리자 등록
	int countEmp(Map<String, Object> paramMap); // 관리자 데이터 총 개수
	// 추상메소드
	List<Employee> selectEmployeeList(Map<String, Object> paramMap); // 관리자 리스트 출력
}
