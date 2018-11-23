/**
 * Model
 */
package incomingessay.model;
public class IncomingEssay
{
	// 主键id
	private Long id = 0L;
	// 业务流水号
	private String ywlsh = "";
	// 收文号
	private String swbh = "";
	// 收文日期
	private String swdate = "";
	// 来文单位
	private String lwdw = "";
	// 原文日期
	private String originaldate = "";
	// 来文号
	private String lwbh = "";
	// 标题
	private String title = "";
	// 办复时限
	private String bftime = "";
	// 拟办意见
	private String nbyj = "";
	// 领导批示
	private String ldps = "";
	// 阅文情况
	private String ywqk = "";
	// 办理情况及结果
	private String blqkjjg = "";
	// 紧急程度
	private String emergency = "";
	// 密级
	private String mj = "";

	public Long getId()
	{
		return id;
	}

	public void setId(Long id)
	{
		this.id = id;
	}

	public String getYwlsh()
	{
		return ywlsh;
	}

	public void setYwlsh(String ywlsh)
	{
		this.ywlsh = ywlsh;
	}

	public String getSwbh()
	{
		return swbh;
	}

	public void setSwbh(String swbh)
	{
		this.swbh = swbh;
	}

	public String getSwdate()
	{
		return swdate;
	}

	public void setSwdate(String swdate)
	{
		this.swdate = swdate;
	}

	public String getLwdw()
	{
		return lwdw;
	}

	public void setLwdw(String lwdw)
	{
		this.lwdw = lwdw;
	}

	public String getOriginaldate()
	{
		return originaldate;
	}

	public void setOriginaldate(String originaldate)
	{
		this.originaldate = originaldate;
	}

	public String getLwbh()
	{
		return lwbh;
	}

	public void setLwbh(String lwbh)
	{
		this.lwbh = lwbh;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getBftime()
	{
		return bftime;
	}

	public void setBftime(String bftime)
	{
		this.bftime = bftime;
	}

	public String getNbyj()
	{
		return nbyj;
	}

	public void setNbyj(String nbyj)
	{
		this.nbyj = nbyj;
	}

	public String getLdps()
	{
		return ldps;
	}

	public void setLdps(String ldps)
	{
		this.ldps = ldps;
	}

	public String getYwqk()
	{
		return ywqk;
	}

	public void setYwqk(String ywqk)
	{
		this.ywqk = ywqk;
	}

	public String getBlqkjjg()
	{
		return blqkjjg;
	}

	public void setBlqkjjg(String blqkjjg)
	{
		this.blqkjjg = blqkjjg;
	}

	public String getEmergency()
	{
		return emergency;
	}

	public void setEmergency(String emergency)
	{
		this.emergency = emergency;
	}

	public String getMj()
	{
		return mj;
	}

	public void setMj(String mj)
	{
		this.mj = mj;
	}
}