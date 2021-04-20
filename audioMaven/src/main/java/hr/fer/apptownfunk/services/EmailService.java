package hr.fer.apptownfunk.services;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class EmailService {
  
    @Autowired
    public JavaMailSender emailSender;
 
    public void sendSimpleMessage(
      String to, String subject, String text) {
    	
        MimeMessage mm = emailSender.createMimeMessage();
        try {
        	mm.setFrom("Muzej1234");
			mm.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			mm.setSubject(subject);
	        mm.setContent(text, "text/html");

		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
        
        emailSender.send(mm);
    }
}