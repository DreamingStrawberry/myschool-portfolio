package com.example.demo.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dto.TeacherDto;
import com.example.demo.mapper.TeacherMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
public class TeacherService {
    @Autowired
    private TeacherMapper mapper;
    
    public String tlist(Model model,HttpSession session)
    {
    	if(session.getAttribute("userid")!=null && Integer.parseInt(session.getAttribute("level").toString()) >= 80)
        {
    		ArrayList<TeacherDto> tlist=mapper.tlist();
        	model.addAttribute("tlist",tlist);
        	
        	return "/teacher/tlist";
        }
        else if(session.getAttribute("userid")==null) // null이거나 level이 80미만
       	     {
       	         return "redirect:/main/login";
       	     }
             else
       	         return "redirect:/main/main";
    	
    	
    }
    
    public String twrite(HttpSession session)
    {
    	 
         if(session.getAttribute("userid")!=null && Integer.parseInt(session.getAttribute("level").toString()) >= 80)
         {
        	 return "/teacher/twrite";        	 
         }
         else if(session.getAttribute("userid")==null) // null이거나 level이 80미만
        	  {
        	      return "redirect:/main/login";
        	  }
              else
        	      return "redirect:/main/main";
     
    }
    
    public String twriteOk(TeacherDto tdto,
    		HttpSession session)
    {
        
    	if(session.getAttribute("userid")!=null && Integer.parseInt(session.getAttribute("level").toString()) >= 80)
        {
   	        mapper.twriteOk(tdto);
        	
       	    return "redirect:/teacher/tlist";
        }
    	else if(session.getAttribute("userid")==null) // null이거나 level이 80미만
   	         {
  	             return "redirect:/main/login";
  	         }
             else
  	             return "redirect:/main/main";
    }
    
    
    public String tdelete(int id,HttpSession session)
    {

    	if(session.getAttribute("userid")!=null && Integer.parseInt(session.getAttribute("level").toString()) >= 80)
        {
    		 mapper.tdelete(id);
    		 return "redirect:/teacher/tlist";	 
        }
        else if(session.getAttribute("userid")==null) // null이거나 level이 80미만
       	  {
       	      return "redirect:/main/login";
       	  }
             else
       	      return "redirect:/main/main";
    	
    }
    
    public String tupdate(int id, HttpSession session,Model model)
    {
        
    	if(session.getAttribute("userid")!=null && Integer.parseInt(session.getAttribute("level").toString()) >= 80)
        {
    		 model.addAttribute("tdto",mapper.getTeacher(id));
    		 System.out.println(id);
    		 return "/teacher/tupdate";	 
        }
        else if(session.getAttribute("userid")==null) // null이거나 level이 80미만
       	  {
       	      return "redirect:/main/login";
       	  }
             else
       	      return "redirect:/main/main";
    	
    }
    
    public String tupdateOk(TeacherDto tdto , HttpSession session)
    {
    	if(session.getAttribute("userid")!=null && Integer.parseInt(session.getAttribute("level").toString()) >= 80)
        {   // 수정할 권한이 80이상
    		 mapper.tupdateOk(tdto);
    		 return "redirect:/teacher/tlist";	 
        }
        else if(session.getAttribute("userid")==null) // null이거나 level이 80미만
       	  {
       	      return "redirect:/main/login";
       	  }
             else
       	      return "redirect:/main/main";
    	
    }
    
    public String myInfo(HttpSession session,Model model,HttpServletRequest request)
    {
    	if(session.getAttribute("userid")==null)
    	{
    		return "redirect:/main/login";
    	}
    	else
    	{
    		String  userid=session.getAttribute("userid").toString();
    		model.addAttribute("tdto",mapper.getTeacher2(userid));
    		model.addAttribute("err",request.getParameter("err"));
    		
    		return "/teacher/myInfo";
    	}
    }

	public String chgInfo(HttpSession session, int n, String data) 
	{
		if(session.getAttribute("userid")==null)
    	{
    		return "redirect:/main/login";
    	}
    	else
    	{
    		try
    		{
    			String userid=session.getAttribute("userid").toString();
        	    mapper.chgInfo(userid,n,data);
        	    
        	    return "1";
    		}
    		catch(Exception e)
    		{
    			return "0";
    		}
    		
    	}	 
	}

	public String pwdChg(String oldPwd, String pwd, HttpSession session) 
	{ 
		if(session.getAttribute("userid")==null)
		{
			return "redirect:/main/login";
		}
		else
		{
			String userid=session.getAttribute("userid").toString();
			
			if(mapper.isPwd(userid,oldPwd))
			{
				mapper.pwdChg(userid,pwd);
				return "redirect:/teacher/myInfo";
			}
			else
			{
				return "redirect:/teacher/myInfo?err=1";
			}
			
		}
	}
}







