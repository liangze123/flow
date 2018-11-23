/**
 * Dao
 */
package synergy.dao;

import org.springframework.stereotype.Repository;
import dswork.core.db.BaseDao;
import synergy.model.SynergyProfession;

@Repository
@SuppressWarnings("all")
public class SynergyProfessionDao extends BaseDao<SynergyProfession, Long>
{
	@Override
	public Class getEntityClass()
	{
		return SynergyProfessionDao.class;
	}
}