package flow.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import dswork.core.page.PageRequest;
import dswork.core.util.CollectionUtil;
import dswork.mvc.BaseController;
import dswork.web.MyRequest;
import flow.model.DsCommonFlow;
import flow.model.DsCommonFlowCategory;
import flow.model.DsCommonFlowTask;
import flow.service.DsCommonFlowService;

@Scope("prototype")
@Controller
@RequestMapping("/manage/flow")
//@RequestMapping(value = {"/manage/flow","/flow"})
@SuppressWarnings("all")
public class DsCommonFlowController2 extends BaseController
{
	static com.google.gson.GsonBuilder builder = new com.google.gson.GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss");

	public static String toJson(Object object)
	{
		return builder.create().toJson(object);
	}

	public static <T> T toBean(String json, Class<T> classOfT)
	{
		return builder.create().fromJson(json, classOfT);
	}
	
	@Autowired
	private DsCommonFlowService service;
	// 获得人员列表
	@RequestMapping("/orglist")
	public String orglist( long pid)
	{
//		String men =dswork.common.DsCommonFactoryOrg.getInstance().getJsonOrgTree(pid);
//		DsCommonFactoryOrg b= toBean(men,dswork.common.DsCommonFactoryOrg.class);
		
		return "/flow/orglist.jsp";
//		try
//		{
//			Long categoryid = req.getLong("categoryid");
//			if(categoryid > 0)
//			{
//				DsCommonFlowCategory po = service.get(categoryid);
//				if(po != null)
//			{
//					PageRequest rq = getPageRequest();
//					rq.getFilters().put("vnum", 0);
//					put("po", po);
//					put("list2", service.queryListFlow(rq.getFilters()));
//					List<DsCommonFlow> a = service.queryListFlow(rq.getFilters());
//					return "/manage/flow/chooseFlow.jsp";
//				}
//			}
//		}
//		catch(Exception e)
//		{
//			e.printStackTrace();
//			print("0:" + e.getMessage());
//		}
//		return null;
		
	}

	// 获得待办列表
//	@RequestMapping("/waiting")
	public String waiting()
	{
		return "/flow/waiting.jsp";
	}
	@RequestMapping("/getFlow1")
	public String getFlow1()
	{
		Long categoryid = req.getLong("categoryid");
		if(categoryid > 0)
		{
			DsCommonFlowCategory po = service.get(categoryid);
			if(po != null)
			{
				PageRequest rq = getPageRequest();
				rq.getFilters().put("vnum", 1);
				rq.getFilters().put("username", "jbr1");
				put("po", po);
				List<DsCommonFlow> a=service.queryListFlow(rq.getFilters());
				put("list", service.queryListFlow(rq.getFilters()));
				return "/manage/flow/getFlow2.jsp";
			}
		}
		return null;
	}
	// 流程分类树形管理
		@RequestMapping("/getFlowCategoryTree1")
		public String getFlowCategoryTree1()
		{
			Long rootid = req.getLong("rootid");// 作为限制根节点显示
			DsCommonFlowCategory po = null;
			if(rootid > 0)
			{
				po = service.get(rootid);
				if(null == po)
				{
					return null;// 没有此根节点
				}
			}
			else
			{
				po = new DsCommonFlowCategory();
			}
			put("po", po);
			return "/manage/flow//getFlowCategoryTree2.jsp";
		}

	// 获得流程列表
	@RequestMapping("/chooseFlow1")
	public String chooseFlow1()
	{
		try
	{
			Long pid = req.getLong("");
			List<DsCommonFlowCategory> list = service.queryList(pid);
			put("list1", list);
			return "/manage/flow/chooseFlow.jsp";
		}
		catch(Exception e)
		{
			e.printStackTrace();
			print("0:" + e.getMessage());
		}
		return null;
		
	}
	// 获得流程列表
		@RequestMapping("/chooseFlow2")
		public String chooseFlow2()
		{
			try
			{
				Long categoryid = req.getLong("categoryid");
				if(categoryid > 0)
				{
					DsCommonFlowCategory po = service.get(categoryid);
					if(po != null)
				{
						PageRequest rq = getPageRequest();
						rq.getFilters().put("vnum", 0);
						put("po", po);
						put("list2", service.queryListFlow(rq.getFilters()));
						List<DsCommonFlow> a = service.queryListFlow(rq.getFilters());
						return "/manage/flow/chooseFlow.jsp";
					}
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
				print("0:" + e.getMessage());
			}
			return null;
			
		}

	
	// 解析表单自定义字段成json字符串
	private String resolve(MyRequest req)
	{
		String[] name = req.getStringArray("tname");// 自定义字段名称数组
		String[] info = req.getStringArray("tinfo");// 自定义字段说明数组
		String[] datatype = req.getStringArray("ttype");// 自定义字段类型数组
		Map<String, Map<String, String>> map = new LinkedHashMap<String, Map<String, String>>();
		if(name != null && name.length == info.length && name.length == datatype.length)
		{
			for(int i = 0; i < name.length; i++)
			{
				Map<String, String> map2 = new HashMap<String, String>();
				map2.put("name", name[i]);
				map2.put("info", info[i]);
				map2.put("datatype", datatype[i]);
				map.put(name[i], map2);
			}
		}
		else
	{
			throw new RuntimeException("json 数据解析错误");
		}
		return toJson(map);
	}

	@SuppressWarnings("unused")
	private String resolveTask(MyRequest req)
	{
		String[] name = req.getStringArray("tname");// 自定义字段名称数组
		String[] info = req.getStringArray("tinfo");// 自定义字段说明数组
		String[] datatype = req.getStringArray("ttype");// 自定义字段类型数组
		String[] limit = req.getStringArray("tlimit");// 自定义权限数组
		Map<String, Map<String, String>> map = new LinkedHashMap<String, Map<String, String>>();
		if(name != null && name.length == info.length && name.length == datatype.length && name.length == limit.length)
		{
			for(int i = 0; i < name.length; i++)
			{
				Map<String, String> map2 = new HashMap<String, String>();
				map2.put("name", name[i]);
				map2.put("info", info[i]);
				map2.put("datatype", datatype[i]);
				map2.put("limit", limit[i]);
				map.put(name[i], map2);
			}
		}
		else
		{
			throw new RuntimeException("json 数据解析错误");
		}
		return toJson(map);
	}

	private String resolveTask1(HttpServletRequest req)
	{
		String[] name = req.getParameterValues("tname");// 自定义字段名称数组
		String[] info = req.getParameterValues("tinfo");// 自定义字段说明数组
		String[] datatype = req.getParameterValues("ttype");// 自定义字段类型数组
		// String[] limit = req.getParameterValues("tlimit");//自定义权限数组
		List<String> limit = new ArrayList<String>();
		Map<String, String[]> prameters = req.getParameterMap();
		for(String string : prameters.keySet())
		{
			if(string.length() > 5)
			{
				if("lim".equals(string.substring(0, 3)))
				{
					limit.add(prameters.get(string)[0]);
				}
			}
		}
		Map<String, Map<String, String>> map = new LinkedHashMap<String, Map<String, String>>();
		if(name != null && name.length == info.length && name.length == datatype.length && name.length == limit.size())
		{
			for(int i = 0; i < name.length; i++)
			{
				Map<String, String> map2 = new HashMap<String, String>();
				map2.put("name", name[i]);
				map2.put("info", info[i]);
				map2.put("datatype", datatype[i]);
				map2.put("limit", limit.get(i));
				map.put(name[i], map2);
			}
		}
		else
		{
			throw new RuntimeException("json 数据解析错误");
		}
	return toJson(map);
	}
}
