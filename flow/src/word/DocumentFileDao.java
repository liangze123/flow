package word;

import java.util.Map;

import dswork.core.db.BaseDao;

/**
 * OFC_DOCUMENTFILE������
 * @author: liuyi
 */
public class DocumentFileDao extends BaseDao<DocumentFile,Long>
{
	public String getExpression(Map map)
	{
		// TODO Auto-generated method stub
		return "";
	}

	public String getTableName()
	{
		// TODO Auto-generated method stub
		return "OFC_DOCUMENTFILE";
	}

	@Override
	protected Class getEntityClass()
	{
		// TODO Auto-generated method stub
		return DocumentFile.class;
	}
}
