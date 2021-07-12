package dev.department.subscribe.dto;

import java.util.Objects;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString
public class AdminIdentifierDTO {

	private int brandNo;
	private int storeNo;
	
	@Override
	public boolean equals(Object obj) {
		
        if(this == obj) return true;    
        if(obj == null || getClass() != obj.getClass()) return false;
        
		AdminIdentifierDTO compare = (AdminIdentifierDTO) obj;
		
		if(brandNo == compare.getBrandNo() && storeNo == compare.getStoreNo()) {
			return true;
		}
		
		return false;
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(brandNo, storeNo);
	}
}


