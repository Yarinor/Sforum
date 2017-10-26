<%@ page language="java" contentType="text/html; charset=windows-1255"
    pageEncoding="windows-1255"%>
<%@page import="java.sql.*"%>
<%@page import="Bean.UserHdao"%>
<%
 UserHdao userHdao = new UserHdao();
 String username=request.getParameter("un");
 boolean isUserExists = userHdao.isUsernameExists(username);
      if (isUserExists==true)
       {
            response.setContentType("text/xml");
            response.setHeader("Cache-Control", "no-cache");
            response.getWriter().write("Someone already has that username. Try another?");
        }
      else
          {
            response.setContentType("text/xml");
            response.setHeader("Cache-Control", "no-cache");
            response.getWriter().write("");
         }

%>
