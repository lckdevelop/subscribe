package dev.department.subscribe.sec;

import java.sql.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.core.authority.*;
import org.springframework.security.core.userdetails.*;
import org.springframework.stereotype.*;

import dev.department.subscribe.dto.*;
import lombok.extern.slf4j.*;

@Slf4j
@Component
public class MemberDetailServieImpl implements UserDetailsService {
	@Autowired
	private MemberInfoDAO memberInfoDAO;
	
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		String divisionInfo = "";
		MemberDTO memberDTO = new MemberDTO();
		SecurityMember securitymember = new SecurityMember();
		
		try {
			divisionInfo = memberInfoDAO.divisionMember(id);
		} catch (SQLException e) {
			e.getMessage();
		}
		log.info(divisionInfo);
		if (divisionInfo.equals("admin")) {
			try {
				memberDTO = memberInfoDAO.managerInfo(id);
				
				if ( memberDTO != null ) { 
		        	securitymember.setNo(memberDTO.getNo());        
		        	securitymember.setName(memberDTO.getName());         
		        	securitymember.setId(memberDTO.getId()); 
		        	securitymember.setPassword(memberDTO.getPassword());
		        	securitymember.setEnabled(memberDTO.getEnabled());
		        	securitymember.setAddress(memberDTO.getAddress());
		        	securitymember.setPoint(memberDTO.getPoint());
		        	log.info(memberDTO.getBrandNo() + " ");
		        	log.info(memberDTO.getBrandName());
		        	securitymember.setBrandNo(memberDTO.getBrandNo());
		        	securitymember.setBrandName(memberDTO.getBrandName());
		        	securitymember.setAuthorities(Arrays.asList(new SimpleGrantedAuthority(memberDTO.getRole()))); 
		        }
				
			} catch (SQLException e) {
				e.getMessage();
			} 
		} else if (divisionInfo.equals("user")) {
			try {
				memberDTO = memberInfoDAO.memberInfo(id);
				
				if ( memberDTO != null ) { 
		        	securitymember.setNo(memberDTO.getNo());        
		        	securitymember.setName(memberDTO.getName());         
		        	securitymember.setId(memberDTO.getId()); 
		        	securitymember.setPassword(memberDTO.getPassword());
		        	securitymember.setEnabled(memberDTO.getEnabled());
		        	securitymember.setAddress(memberDTO.getAddress());
		        	securitymember.setPoint(memberDTO.getPoint());
		        	securitymember.setAuthorities(Arrays.asList(new SimpleGrantedAuthority(memberDTO.getRole()))); 
		        }
			} catch (SQLException e) {
				e.getMessage();
			} 
		}
		

        if ( memberDTO != null ) { 
        	securitymember.setNo(memberDTO.getNo());        
        	securitymember.setName(memberDTO.getName());         
        	securitymember.setId(memberDTO.getId()); 
        	securitymember.setPassword(memberDTO.getPassword());
        	securitymember.setEnabled(memberDTO.getEnabled());
        	securitymember.setAddress(memberDTO.getAddress());
        	securitymember.setPoint(memberDTO.getPoint());
        	securitymember.setBrandNo(memberDTO.getBrandNo());
        	securitymember.setStoreNo(memberDTO.getStoreNo());
        	securitymember.setAuthorities(Arrays.asList(new SimpleGrantedAuthority(memberDTO.getRole()))); 
//            List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
//            authorities.add(new SimpleGrantedAuthority(memberDTO.getRole()));
        }
        
        log.info("완료");
        
        
        return securitymember;
	}

}
