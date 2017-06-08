package com.jb;

public class PersonData {
	private String Name = "";
	private String age = "";

	public PersonData()
	{}

	public void setUserName(String name)
	{ this.Name = name; }
	public void setAge(String age)
	{ this.age = age; }

	public String getUserName()
	{ return this.Name; }
	public String getAge()
	{ return this.age; }
}
