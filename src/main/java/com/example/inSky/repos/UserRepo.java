package com.example.inSky.repos;

import com.example.inSky.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByActivationCode(String code);
    User findByUsername(String username);
}
