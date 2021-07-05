package dev.department.subscribe.sec;

import java.sql.SQLException;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import dev.department.subscribe.dto.MemberDTO;

@Component
public class MemberDetailServieImpl implements UserDetailsService {
	@Autowired
	private MemberInfoDAO memberInfoDAO;
	
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		MemberDTO memberDTO = new MemberDTO();
		
		try {
			memberDTO = memberInfoDAO.memberInfo(id);
		} catch (SQLException e) {
			e.printStackTrace();
		} 

        SecurityMember securitymember = new SecurityMember();

        if ( memberDTO != null ) { 
        	securitymember.setNo(memberDTO.getNo());        
        	securitymember.setName(memberDTO.getName());         
        	securitymember.setId(memberDTO.getId()); 
        	securitymember.setPassword(memberDTO.getPassword());
        	securitymember.setEnabled(memberDTO.getEnabled());
        	securitymember.setAddress(memberDTO.getAddress());
        	securitymember.setPoint(memberDTO.getPoint());
        	securitymember.setBrandNo(memberDTO.getBrandNo());
        	securitymember.setAuthorities(Arrays.asList(new SimpleGrantedAuthority(memberDTO.getRole()))); 
//            List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
//            authorities.add(new SimpleGrantedAuthority(memberDTO.getRole()));
        }
        return securitymember;
	}

}
