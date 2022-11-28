package com.sgdiomov.manager;

import com.sgdiomov.manager.repositories.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Component
public class SetupData {

    @Autowired
    RoleRepository roleRepository;

    @PostConstruct
    public void init() {

    }
}