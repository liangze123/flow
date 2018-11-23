/**
 * 功能:Controller
 * 开发人员:无名氏
 * 创建时间:2018-11-7 18:32:46
 */
package incomingessay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dswork.mvc.BaseController;
import dswork.core.page.Page;
import dswork.core.page.PageNav;
import dswork.core.util.CollectionUtil;
import incomingessay.model.IncomingEssay;
import incomingessay.service.ManageIncomingessayService;

@Scope("prototype")
@Controller
@RequestMapping("/manage/incomingessay")
public class ManageIncomingessayController extends BaseController
{
	@Autowired
	private ManageIncomingessayService service;

	//添加
	@RequestMapping
	public String addIncomingEssay1()
	{
		return "/manage/incomingessay/addIncomingEssay.jsp";
	}

	@RequestMapping
	public void addIncomingEssay2(IncomingEssay po)
	{
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
	public void delIncomingEssay()
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
	public String updIncomingEssay1()
	{
		Long id = req.getLong("keyIndex");
		put("po", service.get(id));
		put("page", req.getInt("page", 1));
		return "/manage/incomingessay/updIncomingEssay.jsp";
	}

	@RequestMapping
	public void updIncomingEssay2(IncomingEssay po)
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
	public String getIncomingEssay()
	{
		Page<IncomingEssay> pageModel = service.queryPage(getPageRequest());
		put("pageModel", pageModel);
		put("pageNav", new PageNav<IncomingEssay>(request, pageModel));
		return "/manage/incomingessay/getIncomingEssay.jsp";
	}

	//明细
	@RequestMapping
	public String getIncomingEssayById()
	{
		Long id = req.getLong("keyIndex");
		put("po", service.get(id));
		return "/manage/incomingessay/getIncomingEssayById.jsp";
	}
}
