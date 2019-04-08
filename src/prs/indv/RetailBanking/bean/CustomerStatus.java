package prs.indv.RetailBanking.bean;

import java.sql.Date;

public class CustomerStatus {
private String ssnID;
private String customerId;
private String status;
private String message;
private Date lastupdated;
public String getSsnID() {
	return ssnID;
}
public void setSsnID(String ssnID) {
	this.ssnID = ssnID;
}
public String getCustomerId() {
	return customerId;
}
public void setCustomerId(String customerId) {
	this.customerId = customerId;
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
