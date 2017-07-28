/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.sangharsha.node.dao.impl;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.sangharsha.node.dao.MailManager;
import org.sangharsha.node.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

/**
 *
 * @author Sangharsha
 */
@Service
public class MailManagerImpl implements MailManager {

    @Autowired
    private JavaMailSender mailSender;

    @Override
    public void sendMail(HttpServletRequest req, HttpServletResponse resp, Object object) {
        String contextPath = req.getContextPath();
        User user = (User) object;
        MimeMessagePreparator messagePreparator = preparator(user, contextPath);
        try {
            mailSender.send(messagePreparator);
        } catch (MailException mx) {
            System.err.println(mx.getMessage());
        }
    }

    private MimeMessagePreparator preparator(final User user, final String contextPath) {
        MimeMessagePreparator mimeMessagePreparator = new MimeMessagePreparator() {
            @Override
            public void prepare(MimeMessage mm) throws Exception {
                String text = "Dear " + user.getFirstName() + ",\n\n\n";
                text += "Thank you for registering for Node Blog.\n\n";
                text += "Please click the link below to acitivate your account.\n\n";
                text += "<a href=" + contextPath + "/activate/user/" + user.getId() + ">" + contextPath + "/activate/user/" + user.getId() + "</a>\n\n";
                text += "Thank you!!!\n\n";
                text += "Regards,\n Node Blog Team.";
                       
                
                mm.setFrom(new InternetAddress("service@node.com"));
                mm.setRecipient(Message.RecipientType.TO, new InternetAddress(user.getEmail()));
                mm.setText(text);
                mm.setSubject("Node Blog - Activation Link");
            }
        };
        return mimeMessagePreparator;
    }
}