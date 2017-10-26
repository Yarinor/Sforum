<%@ page language="java" contentType="text/html; charset=windows-1255"
    pageEncoding="windows-1255"%>
     <%@page import="java.util.List" %>
     <%@page import="Bean.Topic" %>
      <%@page import="Bean.Comment" %>
     <%@page import="Bean.TopicHdao" %>
     <%@page import="Bean.CommentHdao" %>
     <%@page import="java.text.SimpleDateFormat" %>
     <%@page import="java.util.Date" %>
     

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<head>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<meta charset="utf-8">
<title>Forum Page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
      <style>
 
{ -webkit-box-sizing:border-box; -moz-box-sizing:border-box; -ms-box-sizing:border-box; -o-box-sizing:border-box; box-sizing:border-box; }

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
	overflow: scroll;
}





h2,h1{
	color:white;
	text
}

.topic-info-title{
background:#4285f4;
text-align:left;
font-size: 15px;
}

.topic-bottom{
background:#4285f4;
height:37px;
}
.logo{
background:#3A3955;
}
.logo img{
margin:20px;
}


tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
     color:white;
}
.table{
background:white;
width:1400px;
height:auto;

}
.div-title-wrap{
margin-left:55px;
}
.username{
color:black;
width:200px;
height:200px;
text-align:center;
margin-top:50px;
}

.username h4{
margin-top:20px;
}
.description{
color:black;
width:1200px;
height:200px;
}
.reply-button-wrap{
margin-right:150px;
}
#logout{
margin-right:30px;
}


    </style>

</head>
<body>
<% 
TopicHdao topicHdao = new TopicHdao();
CommentHdao commentHdao = new CommentHdao();
List<Comment> commentList = commentHdao.fetchAllComments();
SimpleDateFormat sdf = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");
%>
<%
String topicId= request.getParameter("id");
String topicTitle= request.getParameter("title");
String author = request.getParameter("a");
String description = request.getParameter("des");
String dateCreated = request.getParameter("dc");
String username = request.getParameter("un");
Topic topic = topicHdao.findTopicById(Integer.parseInt(topicId));
topic.setTopicViews(topic.getTopicViews()+1);
topicHdao.update(topic);

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
<br><br><br><br>
<div align="right" class="reply-button-wrap">
<a href="MessagePage.jsp?isComment=true&id=<%=topicId%>&tt=<%=topicTitle %>&un=<%=username%>">
<button type="button" class="btn btn-primary">Reply <span class="glyphicon glyphicon-share-alt"></span></button>
</a>
</div>
<div class=div-title-wrap>
<div class="thread-title">
<h2 class="topTitle">Topic: <%=topicTitle %></h2>
</div>
</div>
<br>

<table class="table" align="center">
  <div>
  <thead>
  <th class="topic-info-title">Post info</th>
  <th class="topic-info-title"></th>
  </thead>
  </div>
  <tbody>
  <tr>
  <td class="username"><h4><%=author %></h4><span><%=dateCreated %></span></td>
  <td class=description><p><%=description %></p></td>
  </tr>
  <tr>
  <%for (Comment comment:commentList){ %>
  <%if(comment.getTopicId()==Integer.parseInt(topicId)){ %>
  <td class="username"><h4><%=comment.getUsername() %></h4> <span><%=sdf.format(comment.getTime().getTime())%></span></td>
  <td class=description><p><%=comment.getDescription() %></p></td>
  </tr>
  <%} %>
  <%} %>
  </tbody>
   <thead>
  <th class="topic-bottom"></th>
  <th class="topic-bottom"></th>
  </thead>
  </table>



</body>
</html>