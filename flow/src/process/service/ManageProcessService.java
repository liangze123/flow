/**
 * Service
 */
package process.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import dswork.core.db.EntityDao;
import dswork.core.db.BaseService;
import process.model.FProcessPi;
import process.dao.FProcessPiDao;

@Service
@SuppressWarnings("all")
public class ManageProcessService extends BaseService<FProcessPi, Long>
{
	@Autowired
	private FProcessPiDao dao;

	@Override
	protected EntityDao getEntityDao()
	{
		return dao;
	}
}
