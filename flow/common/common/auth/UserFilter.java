package common.auth;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

/**
 * 认证过滤器
 */
public class UserFilter implements Filter
{
	public void init(FilterConfig config) throws ServletException
	{
		try
		{
		}
		catch(Exception e)
		{
		}
		System.out.println("UserFilter initialization");
	}

	public void destroy()
	{
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException
	{
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpServletRequestWrapper requestWrapper = new HttpServletRequestWrapper(req);
		HttpServletResponseWrapper responseWraper = new HttpServletResponseWrapper(res);
		try
		{
			// 取得当前用户账号
			String userAccount = dswork.sso.WebFilter.getAccount(req.getSession());
			if(userAccount.length() == 0)
			{
				return;
			}
			Auth auth = AuthUtil.getLoginUser(req);
			if(auth != null && !userAccount.equals(auth.getAccount()))
			{
				auth = null;
			}
			if(auth == null)
			{
				auth = new Auth();
				try
				{
					dswork.sso.model.IUser m = dswork.sso.AuthFactory.getUser(userAccount);
					if(m.getStatus() != 0)
					{
						auth.setAccount(m.getAccount());
						//auth.setLogintype(Integer.parseInt(m.getType()));
						req.getSession().setAttribute(AuthUtil.SessionName_LoginUser, auth);
						chain.doFilter(requestWrapper, responseWraper);
					}
				}
				catch(Exception xx)
				{
					xx.printStackTrace();
				}
			}
			else
			{
				req.getSession().setAttribute(AuthUtil.SessionName_LoginUser, auth);
				chain.doFilter(requestWrapper, responseWraper);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
