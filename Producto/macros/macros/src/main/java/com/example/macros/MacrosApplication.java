package com.example.macros;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class MacrosApplication {

	public static void main(String[] args) {
		SpringApplication.run(MacrosApplication.class, args);
	}

}
