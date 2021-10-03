package department.model.dto;

import java.sql.Date;

public class DepartmentDTO {
	
	private int department_id;
	private String department_name;
	private Date regi_date;
	
	public DepartmentDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getDepartment_id() {
		return department_id;
	}

	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}

	public String getDepartment_name() {
		return department_name;
	}

	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}

	public Date getRegi_date() {
		return regi_date;
	}

	public void setRegi_date(Date regi_date) {
		this.regi_date = regi_date;
	}

	

	




	
	
}
