/**
 * Service
 */
package incomingessay.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import dswork.core.db.EntityDao;
import dswork.core.db.BaseService;
import incomingessay.model.IncomingEssay;
import incomingessay.dao.IncomingEssayDao;

@Service
@SuppressWarnings("all")
public class ManageIncomingessayService extends BaseService<IncomingEssay, Long>
{
	@Autowired
	private IncomingEssayDao dao;

	@Override
	protected EntityDao getEntityDao()
	{
		return dao;
	}
}
