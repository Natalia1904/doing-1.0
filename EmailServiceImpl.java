package by.burim.doing.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import by.burim.doing.beans.EmailBean;
import by.burim.doing.service.EmailService;

@Service
public class EmailServiceImpl implements EmailService {

	@Autowired
	JavaMailSender mailSender;

	@Override
	public void sendEmail(EmailBean email) {
		SimpleMailMessage message = new SimpleMailMessage();

		message.setFrom(email.getEmailFrom());
		message.setTo(email.getEmailTo());
		message.setSubject(email.getSubject());
		message.setText(email.getEmailText());

		mailSender.send(message);
	}
}
