package goodee.gdj58.online.filter;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebFilter("/*")
public class EncodingFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		log.info("init");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		log.debug("\u001B[31m" + "EncodingFilter");
		
		request.setCharacterEncoding("UTF-8");
		
		// controller 실행 전
		chain.doFilter(request, response);
		// controller 실행 후
		
	}

	@Override
	public void destroy() {
		log.info("destroy");
	}
}
