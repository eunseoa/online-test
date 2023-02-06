package goodee.gdj58.online.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.ExampleService;
import goodee.gdj58.online.service.QuestionService;
import goodee.gdj58.online.service.TestService;
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Test;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TestController {
	@Autowired TestService testService; 
	@Autowired QuestionService questionService;
	@Autowired ExampleService exampleService;
	
	// 시험 등록
	@GetMapping("/teacher/addTest")
	public String insertTest() {
		return "teacher/addTest";
	}
	
	// 시험 등록
	@PostMapping("/teacher/addTest")
	public String insertTest(Test test, Question question, Example example) {
		
		int testNo = testService.insertTest(test);
		log.debug("\u001B[31m" + "testNo : " + testNo);
		
		if(testNo != 0) {
			int questionNo = questionService.insertQuestion(testNo, question);
			if(questionNo != 0) {
				exampleService.insertExample(questionNo, example);
			}
			
		}
		return "redirect:/teacher/testList";
	}
	
	// 시험 문제 전체 보기
	@GetMapping("/teacher/testOne")
	public String testOneByTeacher(Model model, @RequestParam(value="testNo") int testNo) {
		
		log.debug("\u001B[31m" + testNo + "<-- testNo");
		
		List<Test> list = testService.testList(testNo);
		
		model.addAttribute("list", list);
		
		return "teacher/testOne";
	}

	// 강사용 시험 리스트
	@GetMapping("/teacher/testList")
	public String testListByTeacher(Model model
								, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
								, @RequestParam(value="rowPerpage", defaultValue = "10") int rowPerPage
								, @RequestParam(value="searchWord", defaultValue = "") String searchWord) {
		
		// 디버깅
		log.debug("\u001B[31m" + currentPage + "<-- currentPage");
		log.debug("\u001B[31m" + rowPerPage + "<-- rowPerPage");
		log.debug("\u001B[31m" + searchWord + "<-- searchWord");
		
		// 리스트
		List<Test> list = testService.selectTestListByTeacher(currentPage, rowPerPage, searchWord);
		
		// 데이터 총 개수
		int countTest = testService.countTest(searchWord);
		
		// 페이징
		int lastPage = countTest / rowPerPage;
		if(countTest % rowPerPage != 0) {
			lastPage++;
		}
		
		int showPage = 10;
		int startPage = ((currentPage - 1) / showPage) * showPage + 1;
		int endPage = (((currentPage - 1) / showPage) + 1) * showPage;
		if(lastPage < endPage) {
			endPage = lastPage;
		}
		
		boolean prev = (currentPage == 1) ? false : true;
		boolean next = (currentPage == lastPage) ? false : true;
		
		// model 저장 (session과 같은 역할)
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("showPage", showPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		
		return "teacher/testList";
	}
}
