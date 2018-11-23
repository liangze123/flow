/**
 * Model
 */
package process.model;

import java.io.File;
import java.io.InputStream;

public class FProcessPi
{
	// 主键id
	private Long id = 0L;
	// 业务流水号
	private String ywlsh = "";
	// 自定义内容
	private String content = "";
	// 操作人
	private String operator = "";
	// 操作时间
	private String operatortime = "";
	// 修改人
	private String modifier = "";
	// 修改时间
	private String changetime = "";
	// 业务摘要信息
	private String digest = "";
	// 文档内容
	private  byte[] doccontent;

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

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

	public String getOperator()
	{
		return operator;
	}

	public void setOperator(String operator)
	{
		this.operator = operator;
	}

	public String getOperatortime()
	{
		return operatortime;
	}

	public void setOperatortime(String operatortime)
	{
		this.operatortime = operatortime;
	}

	public String getModifier()
	{
		return modifier;
	}

	public void setModifier(String modifier)
	{
		this.modifier = modifier;
	}

	public String getChangetime()
	{
		return changetime;
	}

	public void setChangetime(String changetime)
	{
		this.changetime = changetime;
	}

	public String getDigest()
	{
		return digest;
	}

	public void setDigest(String digest)
	{
		this.digest = digest;
	}

	public byte[] getDoccontent()
	{
		return doccontent;
	}

	public void setDoccontent(byte[] doccontent)
	{
		this.doccontent = doccontent;
	}

	
//	public String getDoccontent()
//	{
//		return doccontent;
//	}
//
//	public void setDoccontent(String doccontent)
//	{
//		this.doccontent = doccontent;
//	}
}