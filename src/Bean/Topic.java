package Bean;
import java.util.Calendar;
import java.util.Date;

import javax.persistence.*;

@Entity
public class Topic implements Comparable<Topic>{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int topicId;
	private String topicTitle;
	private String topicDescription;
	private int commentNumber;
	private int topicViews;
	private String author;
	private Calendar dateCreated;
	private String lastCommentUsername;
	private Calendar lastCommentDate;
	
	public Topic(){};
	
	public Topic(String topicTitle, String topicDescription, int commentNumber, int topicViews,
			String author, Calendar dateCreated, String lastCommentUsername, Calendar lastCommentDate) {
		super();
		this.topicTitle = topicTitle;
		this.topicDescription = topicDescription;
		this.commentNumber = commentNumber;
		this.topicViews = topicViews;
		this.author = author;
		this.dateCreated = dateCreated;
		this.lastCommentUsername = lastCommentUsername;
		this.lastCommentDate = lastCommentDate;
	}



	public int getTopicId() {
		return topicId;
	}



	public void setTopicId(int topicId) {
		this.topicId = topicId;
	}



	public String getTopicTitle() {
		return topicTitle;
	}



	public void setTopicTitle(String topicTitle) {
		this.topicTitle = topicTitle;
	}



	public String getTopicDescription() {
		return topicDescription;
	}



	public void setTopicDescription(String topicDescription) {
		this.topicDescription = topicDescription;
	}



	public int getCommentNumber() {
		return commentNumber;
	}



	public void setCommentNumber(int commentNumber) {
		this.commentNumber = commentNumber;
	}



	public int getTopicViews() {
		return topicViews;
	}



	public void setTopicViews(int topicViews) {
		this.topicViews = topicViews;
	}



	public String getAuthor() {
		return author;
	}



	public void setAuthor(String author) {
		this.author = author;
	}



	public Calendar getDateCreated() {
		return dateCreated;
	}



	public void setDateCreated(Calendar dateCreated) {
		this.dateCreated = dateCreated;
	}



	public String getLastCommentUsername() {
		return lastCommentUsername;
	}



	public void setLastCommentUsername(String lastCommentUsername) {
		this.lastCommentUsername = lastCommentUsername;
	}



	public Calendar getLastCommentDate() {
		return lastCommentDate;
	}



	public void setLastCommentDate(Calendar lastCommentDate) {
		this.lastCommentDate = lastCommentDate;
	}
	
	public Date getDateTime() {
	    return lastCommentDate.getTime();
	  }

	@Override
	public int compareTo(Topic topic) {
		return getDateTime().compareTo(topic.getDateTime());
	}
	
	
	
	
	
	
	
	
	
	
	

}
