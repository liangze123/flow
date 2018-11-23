/**
 * 功能:Controller
 * 开发人员:无名氏
 * 创建时间:2018-10-29 11:42:20
 */
package process.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import javax.servlet.ServletOutputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dswork.mvc.BaseController;
import dswork.core.page.Page;
import dswork.core.page.PageNav;
import dswork.core.util.CollectionUtil;
import dswork.core.util.FileUtil;
import process.model.FProcessPi;
import process.service.ManageProcessService;

import dswork.webio.WebioUtil;

@Scope("prototype")
@Controller
@RequestMapping("/manage/process")
public class ManageProcessController extends BaseController
{
	@Autowired
	private ManageProcessService service;
	@RequestMapping
	public String ceShi()
	{
		return "/manage/process/ceshi.jsp";
	}

	//添加
	@RequestMapping
	public String addFProcessPi1()
	{
		return "/manage/process/addFProcessPi.jsp";
	}

	@RequestMapping
	public void addFProcessPi2(FProcessPi po)
	{
		try
		{
			String a =  request.getParameter("doccontent");
			String b = explain(a);  
			byte[] c = set(b);
			po.setDoccontent(c);
			po.setContent(b);
			service.save(po);
			print(1);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			print("0:" + e.getMessage());
		}
	}

	//删除
	@RequestMapping
	public void delFProcessPi()
	{
		try
		{
			service.deleteBatch(CollectionUtil.toLongArray(req.getLongArray("keyIndex", 0)));
			print(1);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			print("0:" + e.getMessage());
		}
	}
	//下載
	@RequestMapping
	public void download() throws FileNotFoundException
	{
		Long id = req.getLong("keyIndex");
		FProcessPi po = service.get(id);
		//		String name = po.getDoccontent();
		get(po.getDoccontent());
		//		String[] s2 = name.split(":");
		//		String a =new String(s2[1]);
		//		try
		//		{
		//			if(s2[0].length() > 0 && s2[1].length() > 0)
		//			{
		//				String s_name="MYAPP";
		//				getdown(s_name, s2[0], s2[1]);
		//			}
		//		}
		//		catch(Exception e)
		//		{
		//			e.printStackTrace();
		//		}
	}


	//修改
	@RequestMapping
	public String updFProcessPi1()
	{
		Long id = req.getLong("keyIndex");
		put("po", service.get(id));
		put("page", req.getInt("page", 1));
		return "/manage/process/updFProcessPi.jsp";
	}

	@RequestMapping
	public void updFProcessPi2(FProcessPi po)
	{
		try
		{
			service.update(po);
			print(1);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			print("0:" + e.getMessage());
		}
	}

	//获得分页
	@RequestMapping
	public String getFProcessPi()
	{
		Page<FProcessPi> pageModel = service.queryPage(getPageRequest());
		put("pageModel", pageModel);
		put("pageNav", new PageNav<FProcessPi>(request, pageModel));
		return "/manage/process/getFProcessPi.jsp";
	}

	//明细
	@RequestMapping
	public String getFProcessPiById()
	{
		Long id = req.getLong("keyIndex");
		put("po", service.get(id));
		return "/manage/process/getFProcessPiById.jsp";
	}
	//解析文件路径
	public  String explain(String  aim) 
	{	
		String a = "";
		String b = "";
		StringBuilder sb = new StringBuilder();
		for(String s : aim.split("\\|"))
		{
			String[] s2 = s.split(":");
			a=s2[0];
			b=s2[1];
		}
		try
		{
			String path = sb.append(WebioUtil.PATH)
					.append("/").append("MYAPP")
					.append("/").append(a.substring( 0,  4))//1679616=36^4
					.append("/").append(a.substring( 4,  8))
					.append("/").append(a.substring( 8, 12))
					.append("/").append(a.substring(12, 16))
					.append("/").append(a.substring(16, 20))
					.append("/").append(a.substring(20, 24))
					.append("/").append(a.substring(24, 28))
					.append("/").append(a.substring(28, 32))
					.append("/").append(a)
					.toString();
		}
		catch(Exception e)
		{
			// TODO: handle exception
		}

		return sb.toString();

	}
	//将文件改为二进制
	public byte[] set(String aid ) throws FileNotFoundException 
	{
		byte[] b = null;
		StringBuffer  out = new StringBuffer(); 
		b = FileUtil.getToByte(aid);
		return b;

	}


	//将文件由二进制转化为正常格式
	//	public  void get(String  m) throws FileNotFoundException
	public  void get(byte[]  m) throws FileNotFoundException
	{
		String a = "asd.doc";
		ServletOutputStream out = null;
		try
		{
			//byte[] bytes = m.getBytes();
			out = response.getOutputStream();
			response.setContentType("application/vnd.ms-excel");
			response.addHeader("Content-Disposition", "attachment;filename=\"" + (new String(a.getBytes("GBK"), "ISO-8859-1")));
			//			out.write(bytes);
			out.write(m);
			//			File file = new File(pathname)
			//			sos.write(m.getBytes());
			//			sos.flush();
			//			sos.close();
		}
		catch(IOException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(null!=out)
				try
			{
					out.close();
			}
			catch(IOException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return;
	}


	//通过md5下载文件
	public void getdown(String s_name,String f,String t)
	{
		java.io.InputStream in = null;
		try
		{
			//		String s_name = "MYAPP";//经由get方式传递过来的文件名
			//		String f = String.valueOf(request.getParameter("f"));//经由get方式传递过来的文件名
			//		String t = String.valueOf(request.getParameter("t"));//经由get方式传递过来的下载文件名
			if(s_name.length() > 0 && !s_name.equals("null") && f.length() > 33)// f=****.***
			{
				StringBuilder sb = new StringBuilder();
				String path = sb.append(WebioUtil.PATH)
						.append("/").append(s_name)
						.append("/").append(f.substring( 0,  4))//1679616=36^4
						.append("/").append(f.substring( 4,  8))
						.append("/").append(f.substring( 8, 12))
						.append("/").append(f.substring(12, 16))
						.append("/").append(f.substring(16, 20))
						.append("/").append(f.substring(20, 24))
						.append("/").append(f.substring(24, 28))
						.append("/").append(f.substring(28, 32))
						.append("/").append(f)
						.toString();
				ServletOutputStream sos = response.getOutputStream();
				response.setContentType("application/octet-stream");

				sb.setLength(0);

				sb.append("attachment;filename=\"")
				.append(!(t.equals("null")) ? new String(java.net.URLDecoder.decode(t, "UTF-8").getBytes("GBK"), "ISO-8859-1") : f)
				.append("\"");

				response.addHeader("Content-Disposition", sb.toString());
				in = new java.io.FileInputStream(path);
				int b;
				while((b = in.read()) != -1)
				{
					sos.write(b);
				}
				in.close();
				sos.flush();
				sos.close();
				return;
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		try
		{
			if(in != null)
			{
				in.close();
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
}
