package com.demo.docker.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.demo.docker.model.User;
import com.demo.docker.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {
	private final UserRepository userRepository;
	
	@GetMapping(value="/")  
	public String users(Model model) { 	
		List<User> users = userRepository.findAll();
		model.addAttribute("users", users);
		return "user/users";
	}
}
