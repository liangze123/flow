<%
java.util.Map<String, String> map = null;
dswork.web.MyRequest req = new dswork.web.MyRequest(request);
Long piid = req.getLong("piid");
dswork.web.MyFile f = req.getFile("FileData");
String[] formData = req.getStringArray("FormData");
if(formData.length > 0)
{
	String data = formData[0];
	map = new com.google.gson.GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().fromJson(data, java.util.Map.class);
}
if(map != null)
{
	file.dao.DsFileDao dao = (file.dao.DsFileDao) dswork.spring.BeanFactory.getBean("dsFileDao");
	String username = map.get("USERNAME");
	Long recordid = Long.parseLong(map.get("RECORDID"));
	String filename = map.get("FILENAME");
	String filetype = map.get("FILETYPE");
	file.dao.DsFile file = (file.dao.DsFile) dao.getById(recordid);
	if("LOADFILE".equals(map.get("OPTION")))
	{
		if(file == null)
		{
			file = new file.dao.DsFile();
			file.setId(recordid);
			file.setPiid(piid);
			file.setFilename(filename);
			file.setFileext(filetype);
			file.setState(-1);
			dao.add(file);
		}
		else
		{
			response.getOutputStream().write(file.getFilebody());
		}
	}
	else if("SAVEFILE".equals(map.get("OPTION")))
	{
		file.setFilebody(f.getFileData());
		file.setState(0);
		dao.update(file);
	}
}
%><%@ page language="java" pageEncoding="UTF-8"%>