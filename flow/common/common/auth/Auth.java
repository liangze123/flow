package common.auth;

public class Auth
{
	private Long id;
	private String account;
	private String name;
	private String qybm;
	private String createtime;

	private String type;

	/**
	 * 判断是否是管理员
	 */
	public boolean isAdmin()
	{
		return "0".equals(type);
	}

	/**
	 * 判断是否是网站管理员
	 */
	public boolean isWWWAdmin()
	{
		return "3".equals(type);
	}

	/**
	 * 判断是否是企业
	 */
	public boolean isEnterprise()
	{
		return "2".equals(type);
	}

	/**
	 * 判断是否是个人
	 */
	public boolean isUser()
	{
		return "1".equals(type);
	}
	
	public Long getId()
	{
		return id;
	}

	public Auth setId(Long id)
	{
		this.id = id;
		return this;
	}

	public String getAccount()
	{
		return account;
	}

	public Auth setAccount(String account)
	{
		this.account = account;
		return this;
	}

	public String getName()
	{
		return name;
	}

	public Auth setName(String name)
	{
		this.name = name;
		return this;
	}

	public String getQybm()
	{
		return qybm;
	}

	public void setQybm(String qybm)
	{
		this.qybm = qybm;
	}

	public String getCreatetime()
	{
		return createtime;
	}

	public void setCreatetime(String createtime)
	{
		this.createtime = createtime;
	}

	public String getType()
	{
		return type;
	}

	public Auth setType(String type)
	{
		this.type = type;
		return this;
	}
}
