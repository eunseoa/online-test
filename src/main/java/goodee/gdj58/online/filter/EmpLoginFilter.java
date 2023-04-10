package goodee.gdj58.online.filter;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;

@Slf4j // log객체를 주입해줌 \ static Log log = new Log();
@WebFilter("/employee/*") // /employee로 시작하는 모든 것을 가로챔
public class EmpLoginFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		log.info("init");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		// 색상을 지정하는 문자열 \u001B[31m
		log.debug("\u001B[31m" + "EmpLoginFilter");
		
		// 웹브라우저 요청 확인
		if(request instanceof HttpServletRequest) {
			HttpServletRequest req = (HttpServletRequest)request;
			HttpSession session = req.getSession();
			if(session.getAttribute("loginEmp") == null) {
				((HttpServletResponse)response).sendRedirect(req.getContextPath() + "/loginEmp");
				return;
			}
		} else {
			log.debug("\u001B[31m" + "웹브라우저 요청만 허용합니다");
			return;
		}
		
		// controller 실행 전
		chain.doFilter(request, response); 
		// controller 실행 후
		
	}

	@Override
	public void destroy() {
		log.info("destroy");
	}
}
