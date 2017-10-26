package Bean;

import java.util.List;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.service.ServiceRegistry;

public class CommentHdao {
	
	private final SessionFactory sessionFactory = buildSessionFactory();
	
	 private SessionFactory buildSessionFactory() {
	        final ServiceRegistry registry = new StandardServiceRegistryBuilder().configure().build();
	        return new MetadataSources(registry).buildMetadata().buildSessionFactory();
	    }
	 
	 
	 private Comment findCommentById(int id){
	        Session session = sessionFactory.openSession();
	        Comment comment = session.get(Comment.class,id);
	        session.close();
	        return comment;
	    }
	 
	 
	 public void update(Comment comment){
	        Session session = sessionFactory.openSession();
	        session.beginTransaction();
	        session.update(comment);
	        session.getTransaction().commit();
	        session.close();
	    }
	 
	 public List<Comment> fetchAllComments(){
		  Session session = sessionFactory.openSession();
		    CriteriaBuilder builder = session.getCriteriaBuilder();
		    CriteriaQuery<Comment> criteria = builder.createQuery(Comment.class);
		    criteria.from(Comment.class);
		    List<Comment> comments= session.createQuery(criteria).getResultList();
		    session.close();
	        return comments;
	    }
	 
	 
	 public int save (Comment comment){
		 Session session = sessionFactory.openSession();
		 session.beginTransaction();
		 int id =(int)session.save(comment);
		 session.getTransaction().commit();
		 session.close();
		return id;	 
	 }
	 public void deleteData(){
		 Session session = sessionFactory.openSession();
		 session.beginTransaction();
		 String stringQuery = "DELETE FROM Comment";
		 Query query = session.createQuery(stringQuery);
		 query.executeUpdate();
		 session.close();
	 }
	 
	 

}
