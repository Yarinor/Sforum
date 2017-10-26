package Bean;



import java.util.Calendar;

import javax.persistence.*;

@Entity
public class Comment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int commentID;
	private String username;
	private String description;
	private Calendar time;
	private int topicId;
	
	public Comment(){}
	
	public Comment( String username, String description, Calendar time, int topicId) {
		super();
		this.username = username;
		this.description = description;
		this.time = time;
		this.topicId = topicId;
	}
	
	
	
	public int getCommentID() {
		return commentID;
	}
	public void setCommentID(int commentID) {
		this.commentID = commentID;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Calendar getTime() {
		return time;
	}
	public void setTime(Calendar time) {
		this.time = time;
	}
	public int getTopicId() {
		return topicId;
	}
	public void setTopicId(int topicId) {
		this.topicId = topicId;
	}

	
}


