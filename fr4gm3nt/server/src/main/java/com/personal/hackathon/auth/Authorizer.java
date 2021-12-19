package com.personal.hackathon.auth;

import com.personal.hackathon.exception.Forbidden;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Set;

public class Authorizer {

    public static AuthUserDetails hasRole(String role){
        var auth = SecurityContextHolder.getContext().getAuthentication();
        var authorityOfCurrentUser = auth.getAuthorities().iterator().next().getAuthority();

        if(!authorityOfCurrentUser.equalsIgnoreCase(role)){
            throw new Forbidden();
        }

        return AuthUserDetails.builder()
                .email(auth.getName())
                .role(authorityOfCurrentUser)
                .build();
    }

    public static AuthUserDetails hasAnyRole(String... permittedAuthorities){
        var auth = SecurityContextHolder.getContext().getAuthentication();
        var authorityOfCurrentUser = auth.getAuthorities().iterator().next().getAuthority();

        if(!Set.of(permittedAuthorities).contains(authorityOfCurrentUser)){
            throw new Forbidden() ;
        }
        return AuthUserDetails.builder()
                .email(auth.getName())
                .role(authorityOfCurrentUser)
                .build();
    }
}
