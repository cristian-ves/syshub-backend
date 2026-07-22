package com.syshub.core.services;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class EmailService {

    private final JavaMailSender mailSender;

    @Value("${spring.mail.username}")
    private String fromEmail;

    @Value("${app.frontend.url}")
    private String frontendUrl;

    public void sendPasswordResetEmail(String to, String username, String token) {
        try {
            MimeMessage mimeMessage = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "utf-8");

            String url = frontendUrl + "/reset-password?token=" + token;
            String htmlContent = buildHtmlTemplate(username, url);

            helper.setText(htmlContent, true);
            helper.setTo(to);
            helper.setSubject("Password Recovery - Syshub");
            helper.setFrom(fromEmail);

            mailSender.send(mimeMessage);
        } catch (MessagingException e) {
            throw new RuntimeException("Error sending email", e);
        }
    }

    public String buildHtmlTemplate(String username, String url) {
        return "<div style=\"font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f8fafc; padding: 40px; color: #1e293b;\">" +
                "    <div style=\"max-width: 600px; margin: 0 auto; background-color: #ffffff; border-radius: 16px; overflow: hidden; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);\">" +
                "        <div style=\"background-color: #1e40af; padding: 30px; text-align: center;\">" +
                "            <h1 style=\"color: #ffffff; margin: 0; font-size: 28px; font-weight: 800; letter-spacing: -0.025em;\">syshub</h1>" +
                "        </div>" +
                "        <div style=\"padding: 40px;\">" +
                "            <h2 style=\"margin-top: 0; color: #0f172a; font-size: 20px;\">Recover Your Credentials</h2>" +
                "            <p style=\"line-height: 1.6; color: #64748b;\">Hi, <strong>" + username + "</strong>.</p>" +
                "            <p style=\"line-height: 1.6; color: #64748b;\">We received a request to recover access to your academic account. Click the button below to set a new password.</p>" +
                "            <div style=\"text-align: center; margin: 35px 0;\">" +
                "                <a href=\"" + url + "\" style=\"background-color: #1e40af; color: #ffffff; padding: 14px 28px; border-radius: 8px; text-decoration: none; font-weight: bold; display: inline-block; box-shadow: 0 4px 6px -1px rgba(30, 64, 175, 0.2);\">Reset Password</a>" +
                "            </div>" +
                "            <p style=\"font-size: 14px; color: #94a3b8; line-height: 1.6;\">This link is valid for the next <strong>15 minutes</strong>. Your username is: <strong>" + username + "</strong>.</p>" +
                "            <hr style=\"border: 0; border-top: 1px solid #f1f5f9; margin: 30px 0;\">" +
                "            <p style=\"font-size: 12px; color: #94a3b8; text-align: center; margin: 0;\">© 2026 Syshub CUNOC - Engineering Division</p>" +
                "        </div>" +
                "    </div>" +
                "</div>";
    }
}