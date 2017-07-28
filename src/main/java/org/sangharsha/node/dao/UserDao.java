/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.sangharsha.node.dao;

import org.sangharsha.node.model.User;

/**
 *
 * @author Sangharsha
 */
public interface UserDao {
    public User findUserByUsername(String username);
    public User findById(Long id);
    public User saveUser(User user);
    public User updateUser(User user);
}
