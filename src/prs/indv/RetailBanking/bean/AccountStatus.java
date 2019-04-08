package prs.indv.RetailBanking.bean;

import java.sql.Date;

public class AccountStatus {
private String customerId;
private String accountId;
private String acctype;
private String status;
private String message;
private Date lastupdated;
public String getCustomerId() {
	return customerId;
}
public void setCustomerId(String customerId) {
	this.customerId = customerId;
}
public String getAccountId() {
	return accountId;
}
public void setAccountId(String accountId) {
	this.accountId = accountId;
}
public String getAcctype() {
	return acctype;
}
public void setAcctype(String acctype) {
	this.acctype = acctype;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getMessage() {
	return message;
}
public void setMessage(String message) {
	this.message = message;
}
public Date getLastupdated() {
	return lastupdated;
}
public void setLastupdated(Date lastupdated) {
	this.lastupdated = lastupdated;
}

}
