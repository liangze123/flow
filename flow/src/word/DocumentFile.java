package word;

/**
 * Desc:OFC_DOCUMENTFILE model����
 * @author: liuyi
 */
public class DocumentFile
{
	// FILEID
	private long id;
	// FILENAME
	private String fileName;
	// FILETYPE
	private String fileType;
	// FILESIZE
	private int fileSize;
	// FILEDATE
	private String fileDate;
	// FILEBODY
	private byte[] fileBody;
	// FILEPATH
	private String filePath;
	// USERNAME
	private String userName;
	// DESCRIPT
	private String descript;

	public long getId()
	{
		return id;
	}

	public void setId(long id)
	{
		this.id = id;
	}

	public String getFileName()
	{
		return fileName;
	}

	public void setFileName(String fileName)
	{
		this.fileName = fileName;
	}

	public String getFileType()
	{
		return fileType;
	}

	public void setFileType(String fileType)
	{
		this.fileType = fileType;
	}

	public int getFileSize()
	{
		return fileSize;
	}

	public void setFileSize(int fileSize)
	{
		this.fileSize = fileSize;
	}

	public String getFileDate()
	{
		return fileDate;
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
		return filePath;
	}

	public void setFilePath(String filePath)
	{
		this.filePath = filePath;
	}

	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public String getDescript()
	{
		return descript;
	}

	public void setDescript(String descript)
	{
		this.descript = descript;
	}
}
