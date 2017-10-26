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
 * Servlet implementation class AddCommentServlet
 */
@WebServlet("/AddCommentServlet")
public class AddCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommentHdao commentHdao= new CommentHdao();
		TopicHdao topicHdao = new TopicHdao();
		String topicId = request.getParameter("id");
		String username = request.getParameter("un");
		String description = request.getParameter("addDescription");
		Comment comment = new Comment(username,description,Calendar.getInstance(),Integer.parseInt(topicId));
		commentHdao.save(comment);
		Topic topic = topicHdao.findTopicById(Integer.parseInt(topicId));
		topic.setCommentNumber(topic.getCommentNumber()+1);
		topic.setLastCommentDate(Calendar.getInstance());
		topic.setLastCommentUsername(username);
		topicHdao.update(topic);
		request.getRequestDispatcher("/DiscussionPage.jsp?un="+username+"&id="+topicId+"&title="+topic.getTopicTitle()+"&cn="+topic.getCommentNumber()+"&tv="+topic.getTopicViews()+"&dc="+topic.getDateCreated().getTime()+"&lcd="+topic.getLastCommentDate().getTime().toString()+"&a="+topic.getAuthor()+"&des="+topic.getTopicDescription()).include(request, response);
		
			
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
