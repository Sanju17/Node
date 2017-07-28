/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.sangharsha.node.controller;

import java.security.Principal;
import javax.servlet.http.HttpServletRequest;
import org.sangharsha.node.dao.UserDao;
import org.sangharsha.node.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Sangharsha
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserDao userDao;

    @RequestMapping(value = {"", "/", "/dashboard"})
    public String index() {
        return "dashboard";
    }

    @RequestMapping(value = {"/account"})
    public String account(Model model, Principal principal) {
        model.addAttribute("user", userDao.findUserByUsername(principal.getName()));
        return "account";
    }

    @RequestMapping(value = {"/account/edit"})
    public String editAccount(Model model, Principal principal) {
        model.addAttribute("user", userDao.findUserByUsername(principal.getName()));
        return "edit_account";
    }

    @RequestMapping(value = {"/account/edit"}, method = RequestMethod.POST)
    public String updateAccount(Model model, @ModelAttribute("user") User user) {
        userDao.updateUser(user);
        return "redirect:/user/account";
    }

    @RequestMapping(value = {"/account/password/update"})
    public String editPassword() {
        return "update_password";
    }

    @Autowired
    private AuthenticationManager authenticationManager;

    @RequestMapping(value = {"/account/password/update"}, method = RequestMethod.POST)
    public String updatePassword(Principal principal, HttpServletRequest request) {
        User user = userDao.findUserByUsername(principal.getName());
        String currentPassword = request.getParameter("current_password");
        String newPassword = request.getParameter("new_password");
        String confirmPassword = request.getParameter("confirm_password");
        if (!(user.getPassword().equals(currentPassword)) || !(newPassword.equals(confirmPassword))) {
            return "redirect:/user/account/password/update";
        } else {
            user.setPassword(newPassword);
            userDao.updateUser(user);
            String username = user.getUsername();
            String password = user.getPassword();

            UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(username, password);
            request.getSession();
            token.setDetails(new WebAuthenticationDetails(request));
            Authentication authenticatedUser = authenticationManager.authenticate(token);
            if (token.isAuthenticated()) {
                SecurityContextHolder.getContext().setAuthentication(authenticatedUser);
            }
            request.getSession().setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, SecurityContextHolder.getContext());
            request.getSession().setAttribute("username", username);
            request.getSession().setAttribute("password", password);
            request.getSession().setAttribute("authorities", token.getAuthorities());
            return "redirect:/user";
        }
    }

    @RequestMapping(value = {"/follower"})
    public String follower(Model model, Principal principal) {
        User user = userDao.findUserByUsername(principal.getName());
        model.addAttribute("user", user);
        return "follower";
    }
}
