package com.ant.vote.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ant.vote.dao.VoteDAO;

@Service
public class VoteServiceImpl implements VoteService {
	
	@Autowired
	private VoteDAO voteDAO;
	
}
