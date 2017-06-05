package com.ant.survey.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ant.survey.dao.SurveyDAO;

@Service
public class SurveyServiceImpl implements SurveyService{

	@Autowired
	private SurveyDAO surveyDAO;
}
