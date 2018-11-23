/**
 * Dao
 */
package process.dao;

import org.springframework.stereotype.Repository;
import dswork.core.db.BaseDao;
import process.model.FProcessPi;

@Repository
@SuppressWarnings("all")
public class FProcessPiDao extends BaseDao<FProcessPi, Long>
{
	@Override
	public Class getEntityClass()
	{
		return FProcessPiDao.class;
	}
}