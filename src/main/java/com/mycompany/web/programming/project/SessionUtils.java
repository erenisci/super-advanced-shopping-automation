/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.web.programming.project;

import java.util.UUID;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author iscie
 */

public class SessionUtils {
    
    public static Cookie createSessionCookie(String sessionId) {
        Cookie sessionCookie = new Cookie("userSessId", sessionId);
        sessionCookie.setPath("/");
        sessionCookie.setMaxAge(24 * 60 * 60);
        return sessionCookie;
    }
    
    public static String generateUniqueSessionID() {
        return UUID.randomUUID().toString();
    }

    public static boolean isUserLoggedIn(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("us_sessId".equals(cookie.getName())) {
                    return true;
                }
            }
        }

        return false;
    }
}