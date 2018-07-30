package com.spin_the_wheel.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.log4j.Logger;
import org.hibernate.Transaction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spin_the_wheel.model.Participants;
import com.spin_the_wheel.model.Receipt;
import com.spin_the_wheel.model.User_check;
import com.spin_the_wheel.model.Winners;
import com.spin_the_wheel.objects.HibernateObjects;

@Controller
public class UserController {
	private static final Logger logger = Logger.getLogger(UserController.class);
	private static final String UPLOAD_DIRECTORY ="H:\\spring_workspace\\SpinTheWheelProject\\WebContent\\images";  
	
	@RequestMapping(value="/game")  
	public ModelAndView userPlaysGame(User_check user,HttpServletRequest request) {
		
		return new ModelAndView("spin");  
		
	} 
	
	
	@RequestMapping(value="/mail",method = RequestMethod.GET) 
	public ModelAndView sendMail(HttpServletRequest request,ModelMap model){ 
		HttpSession userSessions1=request.getSession();
		List list=(List) userSessions1.getAttribute("allUsers1");
		 
		System.out.println(list);
		Participants p;
		
		
	    Iterator it=  list.iterator();	    
	    String from = "kambli.jayendra@gmail.com";
	    final String username = "kambli.jayendra@gmail.com";
	    final String password = "123@capricornsutarwadi";
	    String host = "smtp.gmail.com"; 
	    
	    Properties props = new Properties();
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.smtp.host", host); 
	    props.put("mail.smtp.port", "587");  
	    
	    
	    Session session = Session.getInstance(props,
	            new javax.mail.Authenticator() {
	               protected PasswordAuthentication getPasswordAuthentication() {
	                  return new PasswordAuthentication(username, password);
	               }
	            });
	    
	    try {
	    	while(it.hasNext()){
	 	       p=(Participants) it.next();
	    	String to =p.getEmailId(); 
	         // Create a default MimeMessage object.
	         Message message = new MimeMessage(session);

	         // Set From: header field of the header.
	         message.setFrom(new InternetAddress(from));

	         // Set To: header field of the header.
	         message.setRecipients(Message.RecipientType.TO,
	            InternetAddress.parse(to));

	         // Set Subject: header field 
	         message.setSubject("Spin the Wheel Contest");

	         // This mail has 2 part, the BODY and the embedded image
	         MimeMultipart multipart = new MimeMultipart("related");

	         // first part (the html)  
	         BodyPart messageBodyPart = new MimeBodyPart();  
	         String htmlText = "<H1>Hello "+p.getFirstName()+"</H1><br><h3>You have been selected for spin the wheel contest.<br>Click on the below image to go on website and win prizes.<h3><br><a href='http://localhost:8083/SpinTheWheelProject/game.html'><img src=\"cid:image\"></a>";  
	         messageBodyPart.setContent(htmlText, "text/html");
	         // add it
	         multipart.addBodyPart(messageBodyPart);

	         // second part (the image)
	         messageBodyPart = new MimeBodyPart();
	         DataSource fds = new FileDataSource(
	            "H:/spring_workspace/SpinTheWheelProject/WebContent/adminImages/spin.jpg");

	         messageBodyPart.setDataHandler(new DataHandler(fds));
	         messageBodyPart.setHeader("Content-ID", "<image>");

	         // add image to the multipart
	         multipart.addBodyPart(messageBodyPart);

	         // put everything together
	         message.setContent(multipart);
	         // Send message
	         Transport.send(message);
	    	}
	         System.out.println("Sent message successfully....");

	      } catch (MessagingException e) {
	         throw new RuntimeException(e);
	      }
	  
	    
		String msg="Mailed Subscribers successfully"; 
		model.addAttribute("success", msg);
		return new ModelAndView("adminPanel");
		 
		
		
	} 
	
	
	@RequestMapping(value="/userRegister",method = RequestMethod.POST)   
	public ModelAndView showUserRegistrationForm() { 
		
		 
		
		return new ModelAndView("participantRegister"); 
		
		
	}
	
	 
	@RequestMapping(value="/checkPrize", method = RequestMethod.POST)         
	@ResponseBody 
	public String checkPrize(@RequestBody String gameId,HttpServletRequest request) {
		
	 	 
		
		HttpSession session=request.getSession();
		session.setAttribute("prizeName", gameId); 
		
		return "some";
 		
	}
	
	@RequestMapping(value="/getUserInfo",method = RequestMethod.POST)   
	public ModelAndView insertUserInfo(@ModelAttribute("winners") Winners winners,HttpServletRequest request,Receipt receipt,@RequestParam CommonsMultipartFile file) {
		HttpSession session=request.getSession();
		/* code to upload image */
		ServletContext context = session.getServletContext();  
		String imagePath=UPLOAD_DIRECTORY;
		System.out.println(file);
		String filename=file.getOriginalFilename(); 
		logger.debug(filename);
		
	//	String path=request.getParameter("fileImage");
		try{  
			byte[] bytes = file.getBytes();  
		    BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(  
		         new File(imagePath + File.separator + filename)));  
		    stream.write(bytes);  
		    stream.flush();  
		    stream.close();   
	          
	        }catch(Exception e){System.out.println(e);}  
		String prize=(String) session.getAttribute("prizeName");
		Transaction tr = null;
		org.hibernate.Session newSession = null;
		receipt.setImagePath(filename);
		receipt.setPrizeWon(prize); 
		winners.setReceiptId(receipt);
		logger.debug(winners.toString());
		logger.error(filename);
		//logger.debug(path.toString());
		try { 
		newSession=HibernateObjects.getSessionObjects();
		tr=newSession.beginTransaction();
		newSession.save(winners); 
		tr.commit();   
		} catch (Exception e) { 
		    System.out.println(e.getMessage());
		} finally {
		    if (!tr.wasCommitted()) {
		        tr.rollback();
		    }

		    newSession.flush();   
		    newSession.close();   
		}
		return new ModelAndView("participantRegister"); 
		
		
	}
	
	
	
	
	

}
