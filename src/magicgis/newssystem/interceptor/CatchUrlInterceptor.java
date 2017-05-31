package magicgis.newssystem.interceptor;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import magicgis.newssystem.services.RightService;
import magicgis.newssystem.utils.ValidateUtils;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionProxy;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class CatchUrlInterceptor implements Interceptor {

	private static final long serialVersionUID = 1L;

	@Override
	public void destroy() {

	}

	@Override
	public void init() {

	}

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionProxy proxy = invocation.getProxy();
		String nameSpace = proxy.getNamespace();
		String actionName = proxy.getActionName();
		if (!ValidateUtils.isValid(nameSpace) || nameSpace.equals("/")) {
			nameSpace = "";
		}
		String url = nameSpace + "/" + actionName;
		ServletContext servletContext = ServletActionContext
				.getServletContext();
		ApplicationContext applicationContext = WebApplicationContextUtils
				.getWebApplicationContext(servletContext);
		RightService rs = (RightService) applicationContext
				.getBean("rightService");
		rs.appendRightByURL(url);
		return invocation.invoke();
	}

}
