/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.sangharsha.node.controller;

import java.security.Principal;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.sangharsha.node.dao.MailManager;
import org.sangharsha.node.dao.UserDao;
import org.sangharsha.node.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Sangharsha
 */
@Controller
public class IndexController {

    @Autowired
    private UserDao userDao;

    @Autowired
    private AuthenticationManager authenticationManager;
    
//    @Autowired
//    private MailManager mailManager;

    @RequestMapping(value = {"/", "/index"})
    public String index(Model model, Principal principal) {
        model.addAttribute("isLoggedIn", isLoggedIn());
        if (isLoggedIn()) {
            model.addAttribute("username", principal.getName());
        }
        return "index";
    }

    @RequestMapping(value = {"/login"})
    public String login() {
        if (isLoggedIn()) {
            return "redirect:/";
        }
        return "login";
    }

    @RequestMapping(value = {"/register"})
    public String openRegisterForm(Model model) {
        if (isLoggedIn()) {
            return "redirect:/";
        }
        model.addAttribute("user", new User());
        return "register";
    }

    @RequestMapping(value = {"/register"}, method = RequestMethod.POST)
    public String registerUser(final HttpServletRequest req, final HttpServletResponse resp, @Valid @ModelAttribute("user") User user, Errors errors) {
        if (errors.hasErrors()) {
            return "register";
        } else {
            user.setEnabled(true);
            final User registeredUser = userDao.saveUser(user);
//            new Thread() {
//                @Override
//                public void run() {
//                    mailManager.sendMail(req, resp, registeredUser);
//                }
//            }.start();
            return "redirect:/login";
        }
    }

    @RequestMapping(value = {"/activate/user/{id}"})
    public String activateUser(HttpServletRequest req, @PathVariable("id") String userId) {
        try {
            Long id = Long.parseLong(userId);
            User user = userDao.findById(id);
            user.setEnabled(true);
            user = userDao.updateUser(user);
            authenticateUserAndSetSession(req, user);
            return "redirect:/user";
        } catch (NumberFormatException nfe) {
            return "redirect:/register";
        }
    }

    private void authenticateUserAndSetSession(HttpServletRequest req, User user) {
        String username = user.getUsername();
        String password = user.getPassword();
        
        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(username, password);
        req.getSession();
        token.setDetails(new WebAuthenticationDetails(req));
        Authentication authenticatedUser = authenticationManager.authenticate(token);
        if (token.isAuthenticated()) {
            SecurityContextHolder.getContext().setAuthentication(authenticatedUser);
        }
        req.getSession().setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, SecurityContextHolder.getContext());
        req.getSession().setAttribute("username", username);
        req.getSession().setAttribute("password", password);
        req.getSession().setAttribute("authorities", token.getAuthorities());
    }

    public boolean isLoggedIn() {
        return SecurityContextHolder.getContext().getAuthentication() != null
                && SecurityContextHolder.getContext().getAuthentication().isAuthenticated()
                && //when Anonymous Authentication is enabled
                !(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken);
    }
}
