<%@ page language="java" contentType="text/html; charset=windows-1255"
    pageEncoding="windows-1255"%>
     <%@page import="java.util.List" %>
     <%@page import="Bean.Topic" %>
     <%@page import="Bean.TopicHdao" %>
     <%@page import="java.text.SimpleDateFormat" %>
     <%@page import="java.util.Date" %>
     <%@page import="java.util.Collections" %>
     

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
.topTitle{
margin-top:20x;
margin-left:50px;
}

.list{
margin:10px;
width:1400px;
}

.table{
   
    margin:50px;
    text-align: center;
}



.table thead tr{
    border:2px outset #092756;
    text-align: center;
}
.table thead>tr>th{
    text-align: center;
}

.table tbody tr td{
    border:2px outset #092756;
}

.topic{
    background:rgba(191, 191, 191,0.6);
    width:500px;
 
}
.comments-views{
background:rgba(191, 191, 191,0.6);
  width:100px;

  
}
.by-date{
  background:rgba(128, 128, 128,0.6);
  width:200px;

   
}
.last-date{
background:rgba(128, 128, 128,0.6);
width:200px;


}
td{
    color:white;
	border:2px outset #092756;


}

h1{
	color:white;
}
.navbar{

}
.logo{
background:#3A3955;
}
.logo img{
margin:20px;
}
.topicTitle{
color:white;
}
#topicId{
visibility: hidden;
width:0.1px;
}
#logout{
margin-right:30px;
}


<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    </style>

</head>
<body>
<%String username=request.getParameter("un"); %>
<% TopicHdao topicHdao = new TopicHdao(); 

%>
<%List<Topic> topicList = topicHdao.fetchAllTopics();
Collections.sort(topicList);
Collections.reverse(topicList);%>
<%SimpleDateFormat sdf = new SimpleDateFormat("dd-M-yyyy hh:mm:ss"); %>
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
<div class=navbar>
<h1 class="topTitle">Recent Topics</h1>
</div>
<br>
<br>


<div class=list>
<table class="table">
  <tbody>
  
  <% for(Topic topic:topicList){ %>
    <tr>
      <td id="topicId"><%=topic.getTopicId() %></td>
      <td id ="topicName" class="topic"><a href="DiscussionPage.jsp?id=<%=topic.getTopicId()%>&un=<%=username%>&title=<%=topic.getTopicTitle()%>&cn=<%=topic.getCommentNumber()%>&tv=<%=topic.getTopicViews()%>&dc=<%=topic.getDateCreated().getTime().toString()%>&lcd=<%=topic.getLastCommentDate().getTime().toString()%>&a=<%=topic.getAuthor() %>&des=<%=topic.getTopicDescription() %>" class="topicTitle"><%=topic.getTopicTitle() %></a></td>
      <td  class="comments-views"><%=topic.getCommentNumber() %><br><%=topic.getTopicViews() %></td>
      <% String dateCreated=topic.getDateCreated().getTime().toString(); %>
      <% String lastCommentDate=topic.getLastCommentDate().getTime().toString(); %>
      <td class=by-date><%=topic.getAuthor() %><br><%=dateCreated %></td>
      <td class="last-date"><%=topic.getLastCommentUsername() %><br><%=lastCommentDate %></td> 
    </tr>
    <%} %>
  
  </tbody>
  
</table>.
</div>
<div align="center">
<a href="MessagePage.jsp?un=<%=username%>&isComment=false">
<button type="button" class="btn btn-primary" type="submit" >New topic <span class="glyphicon glyphicon-plus"></span></button>
</a>
</div>
<br><br><br><br><br><br><br>
</body>

</html>