package com.kh.T3B1.study.model.vo;

import lombok.Data;

@Data
public class Study {
	private int studyNo;
	private int managerNo;
	private String studyName;
	private String studyInfo;
	private String studyImg;
	private String studyRecruit;
	private int talkroomNo;
	
	// 스터디 그룹 멤버수
	private int memberCount;
	// 스터디 그룹장 이름
	private String managerName;
	// 스터디 그룹장 자기소개
	private String managerIntro;
}
