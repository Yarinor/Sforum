package Bean;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import org.hibernate.service.ServiceRegistry;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.transaction.Transactional;

public class UserHdao {
	private final SessionFactory sessionFactory = buildSessionFactory();
	private ServiceRegistry registry;
	
	 private SessionFactory buildSessionFactory() {
	         registry = new StandardServiceRegistryBuilder().configure().build();
	        return new MetadataSources(registry).buildMetadata().buildSessionFactory();
	    }
	 private User findUserByName(String username){
	        Session session = sessionFactory.openSession();
	        User user = session.get(User.class,username);
	        session.close();
	        return user;
	    }
	 public void update(User user){
	        Session session = sessionFactory.openSession();
	        session.beginTransaction();
	        session.update(user);
	        session.getTransaction().commit();
	    }
	 public List<User> fetchAllUsers(){
		  Session session = sessionFactory.openSession();
		    CriteriaBuilder builder = session.getCriteriaBuilder();
		    CriteriaQuery<User> criteria = builder.createQuery(User.class);
		    criteria.from(User.class);
		    List<User> users= session.createQuery(criteria).getResultList();
		    session.close();
	        return users;
	    }
	 public String save (User user){
		 Session session = sessionFactory.openSession();
		 session.beginTransaction();
		 String username =(String)session.save(user);
		 session.getTransaction().commit();
		 session.close();
		return username;	 
	 }
	public boolean isUsernameExists(String username){
		 String hql ="SELECT username FROM User WHERE username ='"+username+"'";
		 boolean answer;
		 Session session = sessionFactory.openSession();
		 session.beginTransaction();
		 answer =session.createQuery(hql).uniqueResult() != null;
		 System.out.println(answer);
		 session.close();
		 return answer;	
	}
	
	public String getUserPassword(String username){ 
		String hql="SELECT password FROM User WHERE username ='"+username+"'";
		String password;
		 Session session = sessionFactory.openSession();
		 session.beginTransaction();
		 password =(String) session.createQuery(hql).uniqueResult();
		 System.out.println(password);
		 return password;	
	}
	
	public void destroy(){
		StandardServiceRegistryBuilder.destroy(registry);
	}
	 
}
