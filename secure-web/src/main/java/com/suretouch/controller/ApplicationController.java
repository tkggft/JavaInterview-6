package com.suretouch.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.suretouch.hbm.Employee;

@Controller
public class ApplicationController {

 


    @RequestMapping(value = "/loginfailed.htm", method = RequestMethod.GET)
    public String loginerror(ModelMap model) {
        model.addAttribute("error", "true");
        return "template-main";
    }

    @RequestMapping(value = "/landing.htm", method = RequestMethod.GET)
    public String commonPage(ModelMap model, HttpServletRequest request) {

        try {

            Employee employee = (Employee) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            request.getSession().setAttribute("FIRSTNAME", employee.getFirstname());

            request.getSession().setAttribute("LASTNAME", employee.getLastname());

        } catch (Exception e) {
        }


        return "forward-page";
    }

    @RequestMapping(value = "/admin/home.htm", method = RequestMethod.GET)
    public String adminHome(ModelMap model) {

        return "admin-home";

    }

    @RequestMapping(value = "/manager/home.htm", method = RequestMethod.GET)
    public String manager(ModelMap model) {

        return "manager-home";

    }

    @RequestMapping(value = "/login.htm", method = RequestMethod.GET)
    public String login(ModelMap model) {

        return "template-main";

    }

    @RequestMapping(value = "/logout.htm", method = RequestMethod.GET)
    public String logout(ModelMap model) {

        return "template-main";

    }

}