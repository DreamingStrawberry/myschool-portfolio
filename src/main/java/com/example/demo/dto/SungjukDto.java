package com.example.demo.dto;

import lombok.Data;

@Data
public class SungjukDto {
    private int id,kor,eng,mat,sci,mus;
    private int ban,bunho;
    private String name;
    private int tot,avg;
}
