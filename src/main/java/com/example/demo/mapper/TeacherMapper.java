package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.TeacherDto;

@Mapper
public interface TeacherMapper {
    public ArrayList<TeacherDto> tlist();
    public void twriteOk(TeacherDto tdto);
    public void tdelete(int id);
    public TeacherDto getTeacher(int id);
    public TeacherDto getTeacher2(String userid);
    public void tupdateOk(TeacherDto tdto);
    public void chgInfo(String userid,int n,String data);
    public boolean isPwd(String userid,String oldPwd);
    public void pwdChg(String userid,String pwd);
}
