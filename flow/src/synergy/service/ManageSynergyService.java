/**
 * Service
 */
package synergy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import dswork.core.db.EntityDao;
import dswork.core.db.BaseService;
import synergy.model.SynergyProfession;
import synergy.dao.SynergyProfessionDao;

@Service
@SuppressWarnings("all")
public class ManageSynergyService extends BaseService<SynergyProfession, Long>
{
	@Autowired
	private SynergyProfessionDao dao;

	@Override
	protected EntityDao getEntityDao()
	{
		return dao;
	}
}
