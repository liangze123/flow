package word;

import java.util.Map;

import dswork.core.db.BaseDao;

/**
 * OFC_DOCUMENT������
 * @author: liuyi
 */
public class TemplateFileDao extends BaseDao<TemplateFile,Long>
{
	public String getExpression(Map map)
	{
		// TODO Auto-generated method stub
		return "";
	}

	public String getTableName()
	{
		// TODO Auto-generated method stub
		return "OFC_TEMPLATEFILE";
	}

	@Override
	protected Class getEntityClass()
	{
		// TODO Auto-generated method stub
		return TemplateFile.class;
	}
}
