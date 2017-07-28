/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.sangharsha.node.dao.impl;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import org.sangharsha.node.dao.UserDao;
import org.sangharsha.node.model.User;
import org.sangharsha.node.model.UserRoles;
import org.sangharsha.node.repository.RoleRepository;
import org.sangharsha.node.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Sangharsha
 */
@Service
public class UserDaoImpl implements UserDao {

    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private RoleRepository roleRepository;
    
    @Override
    public User findUserByUsername(String username) {
        User user = userRepository.findByUsername(username);
        return user;
    }

    @Override
    public User saveUser(User user) {
        UserRoles userRoles = roleRepository.findByRole("USER");
        user.setRoles(new HashSet<>(Arrays.asList(userRoles)));
        return userRepository.save(user);
    }

    @Override
    public User updateUser(User user) {
        UserRoles userRoles = roleRepository.findByRole("USER");
        user.setRoles(new HashSet<>(Arrays.asList(userRoles)));
        return userRepository.save(user);
    }

    @Override
    public User findById(Long id) {
        User user = userRepository.findOne(id);
        return user;
    }
}
