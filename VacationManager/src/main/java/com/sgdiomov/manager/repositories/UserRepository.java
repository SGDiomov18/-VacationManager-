package com.sgdiomov.manager.repositories;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sgdiomov.manager.model.Role;
import com.sgdiomov.manager.model.User;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

@Repository
public class UserRepository {
    @PersistenceContext
    private EntityManager entityManager;

    private ObjectMapper mapper=new ObjectMapper();
    @Transactional
    public Integer insertUser(User user) {
        try {

            System.out.println(user);
            System.out.println(new String(user.getPassword().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8));
            if (user.getRole() == null) {
                return entityManager.createNamedQuery("insertUser").setParameter(1, user.getUsername()).setParameter(2, user.getPassword().getBytes(StandardCharsets.UTF_8)).setParameter(3, user.getFirstName()).setParameter(4, user.getLastName()).setParameter(5, user.getCompanyName()).setParameter(6, 1).executeUpdate();

            } else {
                return entityManager.createNamedQuery("insertUser").setParameter(1, user.getUsername()).setParameter(2, user.getPassword().getBytes(StandardCharsets.UTF_8)).setParameter(3, user.getFirstName()).setParameter(4, user.getLastName()).setParameter(5, user.getCompanyName()).setParameter(6, user.getRole().getId()).executeUpdate();

            }
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Transactional
    public <string> Boolean checkPassword(User user) {
        Query query = entityManager.createNativeQuery("SELECT Password " + "FROM Users " + "WHERE Username=?").setParameter(1, user.getUsername());
        List<string> pass = query.getResultList();

        String insertedPass = "";

        if (pass.equals(insertedPass)){
            System.out.println("pass do not match");
            user.setPassword(insertedPass);
            return false;
        }
        System.out.println("pass match");
        return true;
    }

    @Transactional
    public User getUserByUsername(String username){
        try{
            Query q=entityManager.createNativeQuery("SELECT Id,Username,Password,FirstName,LastName,CompanyName,RoleId "+
                    " FROM Users " +
                    "WHERE Username = ?").setParameter(1,username);
            List<Object[]> pass = q.getResultList();
            Object[] arr2= pass.get(0);
                System.out.println(arr2[0]);

            User u =new User(
                    Integer.parseInt( arr2[0].toString()),
                    arr2[1].toString(),
                    arr2[2].toString(),
                    arr2[3].toString(),
                    arr2[4].toString(),
                    arr2[5].toString(),
                    new Role(Integer.parseInt( arr2[6].toString()))
            );
            return u;
        }catch (Exception e){
            e.printStackTrace();
            return new User();
        }
    }


    @Transactional
    public List<User> getUsersByCompanyName(String companyName){
        try{
            Query q=entityManager.createNativeQuery("SELECT Id,Username,Password,FirstName,LastName,CompanyName,RoleId "+
                    " FROM Users " +
                    "WHERE CompanyName = ?").setParameter(1,companyName);
            List<Object[]> pass = q.getResultList();
            
            
            List<User> l = new ArrayList<>();
            for (Object[] arr:
                 pass) {


                
                
                l.add(new User(
                        Integer.parseInt( arr[0].toString()),
                        arr[1].toString(),
                        arr[2].toString(),
                        arr[3].toString(),
                        arr[4].toString(),
                        arr[5].toString(),
                        new Role(Integer.parseInt( arr[6].toString()))
                ));
            }
            

            
            return l;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}

