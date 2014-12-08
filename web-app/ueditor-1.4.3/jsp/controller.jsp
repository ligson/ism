<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.baidu.ueditor.ActionEnter"
    pageEncoding="UTF-8"%>
<%@ page import="static com.sun.org.apache.xalan.internal.xsltc.compiler.util.Util.println" %>
<%@ page trimDirectiveWhitespaces="true" %>
<script>
	alert("111");
</script>

<%

    request.setCharacterEncoding( "utf-8" );
	response.setHeader("Content-Type" , "text/html");
	
	String rootPath = application.getRealPath( "/" );
		println("-========azhengyunfei");
	out.write(new ActionEnter(request, rootPath).exec());
	
%>