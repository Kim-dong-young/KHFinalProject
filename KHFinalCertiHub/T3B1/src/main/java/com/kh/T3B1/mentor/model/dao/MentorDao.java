package com.kh.T3B1.mentor.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.T3B1.common.vo.License;
import com.kh.T3B1.common.vo.PageInfo;
import com.kh.T3B1.common.vo.SearchOption;
import com.kh.T3B1.member.model.vo.Member;

@Repository
public class MentorDao {
	
	public int countMentor(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.countMentor");
	}

	public ArrayList<Member> selectMentorList(SqlSessionTemplate sqlSession, PageInfo pi, SearchOption so) {
		int offset = (pi.getCurrentPage() - 1) * pi.getPageLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getPageLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMentorList", so, rowBounds);
	}

	public Member selectMentorDetail(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("memberMapper.selectMentorDetail", memberNo);
	}

	public int countMentorLike(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("memberMapper.countMentorLike", memberNo);
	}

	public ArrayList<License> selectLicenseList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("commonMapper.selectLicenseList");
	}

}
