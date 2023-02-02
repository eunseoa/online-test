package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.teacher.TeacherMapper;
import goodee.gdj58.online.vo.Teacher;

@Service
@Transactional
public class TeacherService {
	@Autowired TeacherMapper teacherMapper;
	
	// 강사 로그인
	public Teacher login(Teacher teacher) {
		return teacherMapper.login(teacher);
	}
	
	// 강사 삭제
	public int deleteTeacher(int teacherNo) {
		return teacherMapper.deleteTeacher(teacherNo);
	}
	
	// 강사 등록 
	public int insertTeacher(Teacher teacher) {
		return teacherMapper.insertTeacher(teacher);
	}
	
	// 강사 리스트
	public List<Teacher> getTeacherList(int currentPage, int rowPerPage) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		return teacherMapper.selectTeacherList(paramMap);
	}
}
