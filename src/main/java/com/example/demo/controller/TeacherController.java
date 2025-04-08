package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.service.annotation.GetExchange;

import com.example.demo.dto.TeacherDto;
import com.example.demo.service.TeacherService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class TeacherController {
    @Autowired
    private TeacherService service;
    
    @GetMapping("/teacher/tlist")
    public String tlist(Model model,
    		HttpSession session)
    {
    	return service.tlist(model,session);
    }
    
    @GetMapping("/teacher/twrite")
    public String twrite(HttpSession session)
    {
    	return service.twrite(session);
    }
    
    @PostMapping("/teacher/twriteOk")
    public String twriteOk(TeacherDto tdto,
    		HttpSession session)
    {
    	return service.twriteOk(tdto,session);
    }
    
    @GetMapping("/teacher/tdelete")
    public String tdelete(@RequestParam int id,
    		HttpSession session)
    {
    	return service.tdelete(id,session);
    }
    
    @GetMapping("/teacher/tupdate")
    public String tupdate(@RequestParam int id,
    		HttpSession session,Model model)
    {
    	System.out.println(id);
    	return service.tupdate(id,session,model);
    }
    
    @PostMapping("/teacher/tupdateOk")
    public String tupdateOk(TeacherDto tdto,HttpSession session)
    {
    	return service.tupdateOk(tdto,session);
    }
    
    @GetMapping("/teacher/myInfo")
    public String myInfo(HttpSession session,Model model,HttpServletRequest request)
    {
    	return service.myInfo(session,model,request);
    }
    
    @GetMapping("/teacher/chgInfo")
    public @ResponseBody String chgInfo(HttpSession session,
    		@RequestParam int n,
    		@RequestParam String data)
    {
    	return service.chgInfo(session,n,data);
    }
    
    @PostMapping("/teacher/pwdChg")
    public String pwdChg(@RequestParam String oldPwd,
    		@RequestParam String pwd,
    		HttpSession session)
    {
    	return service.pwdChg(oldPwd,pwd,session);
    }
}






