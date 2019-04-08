package prs.indv.RetailBanking.Services;

import prs.indv.RetailBanking.DAO.EmployeeDao;

public class EmployeeServices {

	public Boolean changePassword(String email, String oldpass, String newpass, String confirmnewpass) 
	{
		EmployeeDao ed=new EmployeeDao();
		Boolean flag=ed.getValidation(email,oldpass);
		if(!oldpass.equals(newpass))
		{
			return false;

		}
		
		else if(!flag)
		{
			return false;
		}
		else if(flag)
		{
			Boolean flag2=ed.changePassword(email,newpass);
			if(flag2)
			{
				return true;
			}
			else
			{
				return false;
			}
			
		}
		return false;
	}
	
	
	
	public String fetchSecurityQuestion(String email){
		EmployeeDao dao=new EmployeeDao();
		return dao.fetchSecurityQuestion(email);
	}

	public boolean validateAnswer(String email,String answer){
		EmployeeDao dao=new EmployeeDao();
		return dao.validateAnswer(email, answer);
	}
	
	public boolean changeForgetPassword(String email,String newPassword,String confirmpassword){
		EmployeeDao dao=new EmployeeDao();
		if(!newPassword.equals(confirmpassword))
		{
			return false;
		}
		return dao.changeForgetPassword(email, newPassword);
	}
	
	public boolean checkEmail(String email) {
		EmployeeDao dao=new EmployeeDao();
		return dao.checkEmail(email);
	}
}
