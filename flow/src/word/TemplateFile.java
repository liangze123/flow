package word;

public class TemplateFile
{
	// Fields
	private long id;
	private String fileName = "";
	private String fileType = "";
	private Integer fileSize = 0;
	private String fileDate = "";
	private byte[] fileBody;
	private String filePath = "";
	private String userName = "";
	private String descript = "";

	// Constructors
	/** default constructor */
	public TemplateFile()
	{
	}

	/** minimal constructor */
	public TemplateFile(long id)
	{
		this.id = id;
	}

	// Property accessors
	public long getId()
	{
		return this.id;
	}

	public void setId(long id)
	{
		this.id = id;
	}

	public String getFileName()
	{
		return this.fileName;
	}

	public void setFileName(String fileName)
	{
		this.fileName = fileName;
	}

	public String getFileType()
	{
		return this.fileType;
	}

	public void setFileType(String fileType)
	{
		this.fileType = fileType;
	}

	public Integer getFileSize()
	{
		return this.fileSize;
	}

	public void setFileSize(Integer fileSize)
	{
		this.fileSize = fileSize;
	}

	public String getFileDate()
	{
		return this.fileDate;
	}

	public void setFileDate(String fileDate)
	{
		this.fileDate = fileDate;
	}

	public byte[] getFileBody()
	{
		return fileBody;
	}

	public void setFileBody(byte[] fileBody)
	{
		this.fileBody = fileBody;
	}

	public String getFilePath()
	{
		return this.filePath;
	}

	public void setFilePath(String filePath)
	{
		this.filePath = filePath;
	}

	public String getUserName()
	{
		return this.userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public String getDescript()
	{
		return this.descript;
	}

	public void setDescript(String descript)
	{
		this.descript = descript;
	}
}
