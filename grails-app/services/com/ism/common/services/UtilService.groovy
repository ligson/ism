package com.ism.common.services

import org.codehaus.groovy.grails.web.context.ServletContextHolder
import org.codehaus.groovy.grails.web.util.WebUtils

import javax.servlet.ServletContext
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse
import javax.servlet.http.HttpSession

class UtilService {
    public static final anonymousName = "anonymous";
    def grailsApplication
    def appService

    public HttpServletRequest getRequest() {
        def webUtils = WebUtils.retrieveGrailsWebRequest()
        return webUtils.getCurrentRequest()
    }

    public HttpServletResponse getResponse() {
        def webUtils = WebUtils.retrieveGrailsWebRequest()
        return webUtils.getCurrentResponse()
    }

    public ServletContext getServletContext() {
        try {
            def webUtils = WebUtils.retrieveGrailsWebRequest()
            return webUtils.getServletContext()
        } catch (Exception ignored) {
            ServletContext servletContext = ServletContextHolder.servletContext
            return servletContext;
        }
    }

    public HttpSession getSession() {
        return getRequest().getSession();
    }


    /***
     * 区分浏览器
     * @return
     */
    public String differentBrowser(HttpServletRequest request) {
        String browser = null;
        def userAgent = request.getHeader("User-Agent");
        if (userAgent != null) {
            userAgent = userAgent.toLowerCase();
            // IE浏览器，只能采用URLEncoder编码
            if (userAgent.indexOf("msie") != -1) {
                browser = "IE";
            } // Opera浏览器只能采用filename*
            else if (userAgent.indexOf("opera") != -1) {
                browser = "Opera";
            }
            // Safari浏览器，只能采用ISO编码的中文输出
            else if (userAgent.indexOf("safari") != -1) {
                browser = "Safari";
            }
            // Chrome浏览器，只能采用MimeUtility编码或ISO编码的中文输出
            else if (userAgent.indexOf("applewebkit") != -1) {
                browser = "Chrome";
            }
            // FireFox浏览器，可以使用MimeUtility或filename*或ISO编码的中文输出
            else if (userAgent.indexOf("mozilla") != -1) {
                browser = "FireFox";
            }

        }
        return browser;
    }


}
