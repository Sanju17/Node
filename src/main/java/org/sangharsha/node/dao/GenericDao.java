/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.sangharsha.node.dao;

import java.util.List;

/**
 *
 * @author Sangharsha
 */
public interface GenericDao<T> {
    List<T> getAll();
    int insert(T c);
    T getById(Long id);
    int delete(Long id);
    int update(T c, Long id);
    T getByName(String name);
}
