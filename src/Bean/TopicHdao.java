package Bean;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import org.hibernate.service.ServiceRegistry;
import java.util.List;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;


public class TopicHdao {
	private final SessionFactory sessionFactory = buildSessionFactory();
	
	 private SessionFactory buildSessionFactory() {
	        final ServiceRegistry registry = new StandardServiceRegistryBuilder().configure().build();
	        return new MetadataSources(registry).buildMetadata().buildSessionFactory();
	    }
	 public Topic findTopicById(int id){
	        Session session = sessionFactory.openSession();
	        Topic topic = session.get(Topic.class,id);
	        session.close();
	        return topic;
	    }
	 
	 public void update(Topic topic){
	        Session session = sessionFactory.openSession();
	        session.beginTransaction();
	        session.update(topic);
	        session.getTransaction().commit();
	        session.close();
	    }
	 
	 
	public List<Topic> fetchAllTopics(){
		  Session session = sessionFactory.openSession();
		    CriteriaBuilder builder = session.getCriteriaBuilder();
		    CriteriaQuery<Topic> criteria = builder.createQuery(Topic.class);
		    criteria.from(Topic.class);
		    List<Topic> topics= session.createQuery(criteria).getResultList();
		    session.close();
	        return topics;
	    }
	 
	 public int save (Topic topic){
		 Session session = sessionFactory.openSession();
		 session.beginTransaction();
		 int id =(int)session.save(topic);
		 session.getTransaction().commit();
		 session.close();
		return id;	 
	 }
	 public void deleteData(){
		 Session session = sessionFactory.openSession();
		 session.beginTransaction();
		 String stringQuery = "DELETE FROM Topic";
		 Query query = session.createQuery(stringQuery);
		 query.executeUpdate();
		 session.close();
	 }

}
