package goodee.gdj58.online.controller;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
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
	
	// 시험 정보 수정
	@PostMapping("/teacher/test/modifyTestTitle")
	public String updateTest(Test test) {
		
		testService.updateTest(test);
		
		return "redirect:/teacher/test/testOne?testNo=" + test.getTestNo();
	}
	
	// 시험 문제 전체 보기
	@GetMapping("/teacher/test/testOne")
	public String testOneByTeacher(Model model, @RequestParam(value="testNo") int testNo) {
		
		// 시험 제목만 출력
		Test testTitle = testService.selectTestTitle(testNo);
		
		// 시험 문제+보기 출력
		List<Map<String, Object>> testOne = testService.testOne(testNo);
		
		model.addAttribute("testNo", testNo);
		model.addAttribute("testTitle", testTitle);
		model.addAttribute("testOne", testOne);
		
		return "teacher/test/testOne";
	}
	
	@GetMapping("/teacher/test/addQuestion")
	public String insertQuestion(Model model, @RequestParam(value="testNo") int testNo) {
		// 시험 제목만 출력
		Test testTitle = testService.selectTestTitle(testNo);
		
		model.addAttribute("testNo", testNo);
		model.addAttribute("testTitle", testTitle);
		
		return "teacher/test/addQuestion";
	}
	
	@PostMapping("/teacher/test/addQuestion")
	public String insertQuestion(@RequestParam(value="testNo") int testNo
							, @RequestParam(value="questionCount") int questionCount
							, @RequestParam(value="questionIdx") int[] questionIdx
							, @RequestParam(value="questionTitle") String[] questionTitle
							, @RequestParam(value="questionScore") int questionScore
							, @RequestParam(value="exampleIdx") int[] exampleIdx
							, @RequestParam(value="exampleTitle") String[] exampleTitle
							, @RequestParam(value="answer") int answer) {
		
		Question[] question = new Question[questionCount];
		for(int j = 0; j<question.length; j++) {
			question[j] = new Question();
			question[j].setQuestionIdx(questionIdx[j]);
			question[j].setQuestionTitle(questionTitle[j]);
			question[j].setQuestionScore(questionScore);
			
			int questionNo = questionService.insertQuestion(testNo, question[j]);
			
			log.debug("\u001B[31m" + questionNo + "<-- questionNo");
			
			if(questionNo != 0) {
				Example[] example = new Example[4];
				for(int i = 0; i<example.length; i++) {
					example[i] = new Example();
					example[i].setQuestionNo(questionNo);
					example[i].setExampleIdx(exampleIdx[i]);
					example[i].setExampleTitle(exampleTitle[i]);
					example[i].setAnswer("오답");
					if(answer == i+1) {
						example[i].setAnswer("정답");
					}
					
					exampleService.insertExample(questionNo, example[i]);
				}
			}
		}
		return "redirect:/teacher/test/testList";
	}
	
	// 시험 등록
	@GetMapping("/teacher/test/addTest")
	public String insertTest() {
		return "teacher/test/addTest";
	}
	
	// 시험 등록
	@PostMapping("/teacher/test/addTest")
	public String insertTest(Test test, Question question) {
		
		testService.insertTest(test);
		
		return "redirect:/teacher/test/testList";
	}

	// 강사용 : 문제 생성된 시험 리스트
	@GetMapping("/teacher/test/testList")
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
		
		return "teacher/test/testList";
	}
}
