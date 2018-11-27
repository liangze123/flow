/**
 * Model
 */
package file.dao;

public class DsFile
{
	//
	private Long id = 0L;
	//
	private Long piid = 0L;
	//
	private String fileId = "";
	//
	private String filename = "";
	//
	private String fileext = "";
	//
	private byte[] filebody;

	//
	private int state = 0;

	public Long getId()
	{
		return id;
	}

	public void setId(Long id)
	{
		this.id = id;
	}

	public Long getPiid()
	{
		return piid;
	}

	public void setPiid(Long piid)
	{
		this.piid = piid;
	}

	public String getFileId()
	{
		return fileId;
	}

	public void setFileId(String fileId)
	{
		this.fileId = fileId;
	}

	public String getFilename()
	{
		return filename;
	}

	public void setFilename(String filename)
	{
		this.filename = filename;
	}

	public String getFileext()
	{
		return fileext;
	}

	public void setFileext(String fileext)
	{
		this.fileext = fileext;
	}

	public byte[] getFilebody()
	{
		return filebody;
	}

	public void setFilebody(byte[] filebody)
	{
		this.filebody = filebody;
	}

	public int getState()
	{
		return state;
	}

	public void setState(int state)
	{
		this.state = state;
	}
}