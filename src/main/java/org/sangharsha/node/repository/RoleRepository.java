/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.sangharsha.node.repository;

import org.sangharsha.node.model.UserRoles;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Sangharsha
 */
@Repository
public interface RoleRepository extends JpaRepository<UserRoles, Long>{
    UserRoles findByRole(String role);
}