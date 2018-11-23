/**
 * 功能:Controller
 * 开发人员:无名氏
 * 创建时间:2018-11-7 18:07:38
 */
package synergy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dswork.mvc.BaseController;
import dswork.core.page.Page;
import dswork.core.page.PageNav;
import dswork.core.util.CollectionUtil;
import synergy.model.SynergyProfession;
import synergy.service.ManageSynergyService;

@Scope("prototype")
@Controller
@RequestMapping("/manage/synergy")
public class ManageSynergyController extends BaseController
{
	@Autowired
	private ManageSynergyService service;

	//添加
	@RequestMapping
	public String addSynergyProfession1()
	{
		return "/manage/synergy/addSynergyProfession.jsp";
	}

	@RequestMapping
	public void addSynergyProfession2(SynergyProfession po)
	{
		long id1=po.getFlowPiId();
		try
		{
			service.save(po);
			print(1);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			print("0:" + e.getMessage());
		}
	}

	//删除
	@RequestMapping
	public void delSynergyProfession()
	{
		try
		{
			service.deleteBatch(CollectionUtil.toLongArray(req.getLongArray("keyIndex", 0)));
			print(1);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			print("0:" + e.getMessage());
		}
	}

	//修改
	@RequestMapping
	public String updSynergyProfession1()
	{
		Long id = req.getLong("keyIndex");
		put("po", service.get(id));
		put("page", req.getInt("page", 1));
		return "/manage/synergy/updSynergyProfession.jsp";
	}

	@RequestMapping
	public void updSynergyProfession2(SynergyProfession po)
	{
		try
		{
			service.update(po);
			print(1);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			print("0:" + e.getMessage());
		}
	}

	//获得分页
	@RequestMapping
	public String getSynergyProfession()
	{
		Page<SynergyProfession> pageModel = service.queryPage(getPageRequest());
		put("pageModel", pageModel);
		put("pageNav", new PageNav<SynergyProfession>(request, pageModel));
		return "/manage/synergy/getSynergyProfession.jsp";
	}

	//明细
	@RequestMapping
	public String getSynergyProfessionById()
	{
		Long id = req.getLong("keyIndex");
		put("po", service.get(id));
		return "/manage/synergy/getSynergyProfessionById.jsp";
	}
}
