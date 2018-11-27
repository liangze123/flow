<%@ page language="java" pageEncoding="UTF-8"%><%
java.util.Map<String, String> map = null;
dswork.web.MyRequest req = new dswork.web.MyRequest(request);
Long piid = req.getLong("piid");
dswork.web.MyFile f = req.getFile("FileData");
String[] formData = req.getStringArray("FormData");
OfficeUtil util = new OfficeUtil();
if(formData.length > 0)
{
	String data = formData[0];
	map = new com.google.gson.GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().fromJson(data, java.util.Map.class);
}
if(map != null)
{
	String username = map.get("USERNAME");
	String recordid = map.get("RECORDID");
	String filename = map.get("FILENAME");
	String filetype = map.get("FILETYPE");
	if("LOADFILE".equals(map.get("OPTION")))
	{
		int isOK = 0;
		try
		{
			long id = Long.parseLong(recordid);
			if(id > 0)
			{
				DsFileDao dao = new DsFileDao();
				DsFile model = dao.getById(id);
				if(model == null)
				{
					model = new DocumentFile();
					model.setId(id);
					model.setFileName("市委公文");
					model.setFileType(".DOC");
					model.setFileBody(util.getDataStream());
					model.setUserName("tecamo");
					isOK = dao.add(model);
				}
				else
				{
					model.setFileName("市委公文");
					model.setFileType(".DOC");
					model.setFileSize(util.getDataStream().length);
					model.setUserName("tecamo");
					isOK = dao.update(model);
				}
				util.SetMsgByName ("STATUS", "保存成功!");
				//util.setMsgError("");
				util.send(response);
			}
		}
		catch(Exception ex)
		{
		}
	}
	else if("SAVEFILE".equals(map.get("OPTION")))
	{
		System.out.println("SAVEFILE");
		System.out.println("username=" + username);
		System.out.println("recordid=" + recordid);
		System.out.println("filename=" + filename);
		System.out.println("filetype=" + filetype);
	}
}
%>