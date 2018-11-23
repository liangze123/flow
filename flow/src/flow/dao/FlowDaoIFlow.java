/**
 * 公共Dao
 */
package flow.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import flow.model.IFlowWaiting;
import dswork.core.db.MyBatisDao;
import dswork.core.util.TimeUtil;
import dswork.core.util.UniqueId;

@Repository
@SuppressWarnings("all")
public class FlowDaoIFlow extends MyBatisDao
{
	com.google.gson.GsonBuilder builder = new com.google.gson.GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss");
	
	private String dtSet = "";

	public String toJson(Object object)
	{
		return builder.create().toJson(object);
	}

	public <T> T toBean(String json, Class<T> classOfT)
	{
		return builder.create().fromJson(json, classOfT);
	}
	
	//	梁泽加
	//根据流程实例id、tuser、流程标识查找流程待办
	public  String getFlowWaitingId(Map<String, String> map)
	{
		
		Set<String> keySet = map.keySet();
		Iterator<String> iterator = keySet.iterator();
		return (String) executeSelect("selectWaitingId",map);
	}

	@Override
	protected Class getEntityClass()
	{
		// TODO Auto-generated method stub
		return FlowDaoIFlow.class;
	}


}
