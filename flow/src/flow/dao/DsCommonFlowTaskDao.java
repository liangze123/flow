/**
 * 流程任务Dao
 */
package flow.dao;

import java.util.List;

import org.springframework.stereotype.Repository;


import dswork.core.db.MyBatisDao;
import flow.model.DsCommonFlowTask;

@Repository
@SuppressWarnings("all")
public class DsCommonFlowTaskDao extends MyBatisDao
{
	public void update(DsCommonFlowTask a)
	{
		executeUpdate("updateDatatable", a);
	}
	
	@Override
	public Class getEntityClass()
	{
		return DsCommonFlowTaskDao.class;
	}

	public int save(DsCommonFlowTask entity)
	{
		return executeInsert("insert", entity);
	}

	public void deleteByFlowid(Long flowid)
	{
		executeUpdate("deleteByFlowid", flowid);
	}

	public List<DsCommonFlowTask> queryList(Long flowid)
	{
		return executeSelectList("query", flowid);
	}
	public DsCommonFlowTask getByid(long id)
	{
		return (DsCommonFlowTask)executeSelect("getbyid",id);
	}
}
