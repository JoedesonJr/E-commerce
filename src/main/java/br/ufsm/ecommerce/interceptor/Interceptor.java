package br.ufsm.ecommerce.interceptor;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Interceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			  HttpServletResponse response, Object controller) throws Exception {
		
		String uri = request.getRequestURI();
	    if(uri.endsWith("login") || uri.endsWith("autenticarUsuario") || uri.endsWith("buscarUsuario") || uri.endsWith("recuperarSenha") ||  uri.contains("resources")){
	        return true;
	    }

	    if(request.getSession().getAttribute("usuarioLogado") != null) {
	        return true;
	    }
	      
	    response.sendRedirect("login");

	    return false;
	}

}
