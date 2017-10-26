<%@ page language="java" contentType="text/html; charset=windows-1255"
    pageEncoding="windows-1255"%>
    
  <%@page import="Bean.MessagePageFunc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Oswald:700|Patua+One|Roboto+Condensed:700" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<style type="text/css">
html { width: 100%; height:100%; overflow:hidden; }
body { 
	width: 100%;
	height:100%;
    font-family: 'Roboto Condensed', sans-serif;
	background: #092756;
	background: -moz-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%),-moz-linear-gradient(top,  rgba(57,173,219,.25) 0%, rgba(42,60,87,.4) 100%), -moz-linear-gradient(-45deg,  #670d10 0%, #092756 100%);
	background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -webkit-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -webkit-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
	background: -o-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -o-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -o-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
	background: -ms-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -ms-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -ms-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
	background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), linear-gradient(to bottom,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), linear-gradient(135deg,  #670d10 0%,#092756 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#3E1D6D', endColorstr='#092756',GradientType=1 );
}
h1,h3{
	color:white;
}
.logo{
background:#3A3955;
}
.logo img{
margin:20px;
}
#logout{
margin-right:30px;
}



#AddInputDescription{
height:200px;
width:400px;

}
#AddInputSubjectName{
width:400px;
}
.hidden{
visibility:hidden;
}


</style>

</head>
<body>
<%
MessagePageFunc mpf= new MessagePageFunc();
String isComment =request.getParameter("isComment");
String topicId = request.getParameter("id");
String topicTitle = request.getParameter("tt");
String username= request.getParameter("un");
String commentOrTopicResult="";
String tester="";
String servlet="#";
if(topicId==null){
	commentOrTopicResult="";
	tester="";
}
else{
	commentOrTopicResult = mpf.commentOrTopic(isComment, Integer.parseInt(topicId));
	tester=mpf.commentOrTopic(isComment, Integer.parseInt(topicId));
	
}


if(isComment.equals("true")){
	servlet="AddCommentServlet";
}
else if(isComment.equals("false")){
	servlet="AddTopicServlet";
}


%>
<div class="logo">
<a href="Forum Page.jsp?un=<%=username%>">
<img class="img-responsive2" src="Resources/logoforum50perc.png">
</a>
<div id="logout" align="right">
<a  href="LoginForm.jsp">
<button type="button" class="btn btn-primary">Logout </button>
</a>
</div>
</div>
<br>
		<form action="<%=servlet%>" method="post">
			
			<h3 align="center">Add a new message</h3>
			<br><br>
		<div>
		<h3 align="center">Subject title:</h3>
		 <div class="form-group" align="center"> 
                <input name="id" type="text" class="hidden" value="<%=topicId %>"></input>
       		</div>
		     <div class="form-group" align="center"> 
                <input name="un" type="text" class="hidden" value="<%=username %>"></input>
       		</div>
              <div class="form-group" align="center">
                <input <%=mpf.checkDisabled(tester) %> value="<%=commentOrTopicResult %>" name="subjectTitle" type="text" class="form-control" id="AddInputSubjectName">
              </div>
              <br>
                 <h3 align="center">Description:</h3>d
              <div class="form-group" align="center"> 
          
                <textarea value=""  name="addDescription" type="text" class="form-control" id="AddInputDescription"></textarea>
              </div>
              <br>
		</div>
		<div align="center">
	<button type="submit" id="addtTopic" class="btn btn-primary btn-hover-green" data-action="save" role="button">Send</button>
			</div>
		</div>
</form>


</body>
</html>
