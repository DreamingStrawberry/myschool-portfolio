package com.example.demo;

import java.io.IOException;
import java.time.LocalDate;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
public class ScheduleService {

	@Scheduled(cron="0 0 0 * * *")
	public void schoolBackup() 
	{
		try
		{
			LocalDate today=LocalDate.now();
			                                                                // school2025-04-03.sql
			String command = "mysqldump -u root -p1234 school --result-file=d:/school"+today.toString()+".sql";
 
			Process process = Runtime.getRuntime().exec(command);
	        int exitCode = process.waitFor();  // 0이면 정상종료 (명령어가 계속 실행될수있게 한다)
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}		 
	}
	
	/*	
	@Scheduled(fixedRate=1000)
	public void test1()
	{
		System.out.println("안녕");
	}
	
	@Scheduled(cron="0 13 11 * * *")
	public void test2()
	{
		System.out.println("오늘은 목요일");
	}
	*/
	
	/* 
	    예제 : 구글링이나 쳇gpt에 물어보세요
	    0 * * * * * : 1분마다
	    * 0 * * * * : 1시간마다
	    * * 0 * * * : 매일
	    0 * 12 * * * : 12시 0~59분 0초마다
	    0 0/10 12 * * * : 12시 0분부터 10분 간격으로
 	*/
}










