package com.spin_the_wheel.controller;



import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import javax.mail.BodyPart;
import javax.mail.MessagingException;
import javax.mail.internet.MimeBodyPart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.fabric.xmlrpc.base.Array;
import com.spin_the_wheel.model.Participants;
import com.spin_the_wheel.model.User_check;
import com.spin_the_wheel.objects.HibernateObjects;



@Controller 
public class AdminController { 

	
	
	@RequestMapping(value="/login",method=RequestMethod.GET)  
	public ModelAndView login(User_check user,HttpServletRequest request) {   
		
		 
		
		
		String msg=null;
		String uname=user.getUsername();
		String pass=user.getPassword();
		User_check u = null; 
		Session session=HibernateObjects.getSessionObjects();
		
		 
		 
		Query query=session.createQuery("from User_check where username=:u and password=:pd"); 
		query.setParameter("u", uname);
		query.setParameter("pd",pass);  
        
		List list=query.list();
		if(list.toString().equals("[]")){
			msg="invalid username and password";
			return new ModelAndView("redirect:/login.jsp","msg",msg); 
		}
        Iterator iterator=list.iterator(); 
		
		while (iterator.hasNext()) {
			 u=(User_check) iterator.next();
			 System.out.println(u.toString());
			 
		}
		Query query2=session.createQuery("from Participants");
		List<Participants> participantsList=query2.list();
		
      
		 
		
		if(u.getUsername().equals(uname)&&(u.getPassword().equals(pass))){
			msg=uname;
			request.setAttribute("allUsers", participantsList);
			HttpSession userSession= request.getSession();
			userSession.setAttribute("allUsers1", participantsList);
			
			return new ModelAndView("adminPanel", "msg", msg);
		}
		
//		String sender="sender@gmail.com";
//		String receiver="kambli.jayendra@gmail.com";
//		
//		mail_Send.sendMail(sender, receiver, "hi","welcome");
//		
//		System.out.println("success"); 
		
		return null;
		
		 
 
	}
	  

	
	
   	
	
	

}
