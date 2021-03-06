package Bean;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddTopicServlet
 */
@WebServlet("/AddTopicServlet")
public class AddTopicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTopicServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TopicHdao topicHdao= new TopicHdao();
		String subjectTitle= request.getParameter("subjectTitle");
		String subjectDescription=request.getParameter("addDescription");
		String username=request.getParameter("un");
		Topic topic = new Topic(subjectTitle,subjectDescription,0,0,username,Calendar.getInstance(),username,Calendar.getInstance());
		topicHdao.save(topic);
		request.getRequestDispatcher("/DiscussionPage.jsp?un="+username+"&id="+topic.getTopicId()+"&title="+topic.getTopicTitle()+"&cn="+topic.getCommentNumber()+"&tv="+topic.getTopicViews()+"&dc="+topic.getDateCreated().getTime()+"&lcd="+topic.getLastCommentDate().getTime().toString()+"&a="+topic.getAuthor()+"&des="+topic.getTopicDescription()).include(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
