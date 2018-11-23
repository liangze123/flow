/**
 * Dao
 */
package incomingessay.dao;

import org.springframework.stereotype.Repository;
import dswork.core.db.BaseDao;
import incomingessay.model.IncomingEssay;

@Repository
@SuppressWarnings("all")
public class IncomingEssayDao extends BaseDao<IncomingEssay, Long>
{
	@Override
	public Class getEntityClass()
	{
		return IncomingEssayDao.class;
	}
}