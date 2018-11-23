/**
 * Model
 */
package synergy.model;
public class SynergyProfession
{
	// 主键id
	private Long id = 0L;
	// 业务流水号 
	private String ywlsh = "";
	// 流程实例id  
	private long flowPiId = 0L;
	// 流程标识
	private String alias = "";
	// 业务分类标识
	private String differserv = "";
	// 业务摘要信息
	private String memo = "";
	// 业务发起人 
	private String initiator = "";
	// 发起时间	       
	private String starttime = "";

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

	public long getFlowPiId()
	{
		return flowPiId;
	}

	public void setFlowPiId(long flowPiId)
	{
		this.flowPiId = flowPiId;
	}

	public String getAlias()
	{
		return alias;
	}

	public void setAlias(String alias)
	{
		this.alias = alias;
	}

	public String getDifferserv()
	{
		return differserv;
	}

	public void setDifferserv(String differserv)
	{
		this.differserv = differserv;
	}

	public String getMemo()
	{
		return memo;
	}

	public void setMemo(String memo)
	{
		this.memo = memo;
	}

	public String getInitiator()
	{
		return initiator;
	}

	public void setInitiator(String initiator)
	{
		this.initiator = initiator;
	}

	public String getStarttime()
	{
		return starttime;
	}

	public void setStarttime(String starttime)
	{
		this.starttime = starttime;
	}
}