package flow.util;

import java.util.HashMap;
import java.util.Map;
import dswork.spring.BeanFactory;
import flow.dao.FlowDaoIFlow;

public class DsCommonIFlowUtil
{
	private static FlowDaoIFlow dao = null;

	private static void init()
	{
		if(dao == null)
		{
			dao = (FlowDaoIFlow) BeanFactory.getBean("flowDaoIFlow");
		}
	}
	//通过实例id、办理人姓名、任务标识查找待办id
	public String getFlowWaitingId(String piid, String username, String alias)
	{	try
		{
			init();
			Map<String, String> map = new HashMap<String, String>();
			map.put("piid", piid);
			map.put("username", username);
			map.put("alias", alias);
			return dao.getFlowWaitingId(map);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	return "";
	}
}	