package dev.department.subscribe.sec;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import dev.department.subscribe.dto.MemberDTO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@SuppressWarnings("serial")
public class SecurityMember extends MemberDTO implements UserDetails {
//	private int no;
//	private String id;
//	private String name;
	private Collection<? extends GrantedAuthority> authorities;
//	private String password;
//	private int enabled;
//	private String email;
//	private Date birthdate;
//	private String phone;
//	private String address;
//	private int point;
//	private String role;
//	private int brandNo;
	
	@Override
	public String getUsername() {
		return getId();
	}
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	@Override
	public boolean isEnabled() {
		return true;
	}
	
}
