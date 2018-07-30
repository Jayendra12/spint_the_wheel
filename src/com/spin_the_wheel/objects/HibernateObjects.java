package com.spin_the_wheel.objects;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateObjects {
	
	
	
	
	
	
	public static Session getSessionObjects(){
		SessionFactory factory=null;
		Session session=null;
		
		factory=new Configuration().configure().buildSessionFactory();
		session=factory.openSession();
		return session;
		
	}

}
