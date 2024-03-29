package goodee.gdj58.online.filter;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebFilter("/student/*")
public class StudentLoginFilter implements Filter {
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		log.info("init");
		//Filter.super.init(filterConfig);
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		log.debug("\u001B[31m" + "StudentLoginFilter");
		
		// 웹브라우저 요청 확인
		if(request instanceof HttpServletRequest) {
			HttpServletRequest req = (HttpServletRequest)request;
			HttpSession session = req.getSession();
			if(session.getAttribute("loginStudent") == null) {
				((HttpServletResponse)response).sendRedirect(req.getContextPath() + "/loginStudent");
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
		//Filter.super.destroy();
	}
}
