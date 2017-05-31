package magicgis.newssystem.interceptor;

import org.apache.struts2.ServletActionContext;

import magicgis.newssystem.actions.BaseAction;
import magicgis.newssystem.utils.ValidateUtils;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionProxy;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class RightFilterInterceptor implements Interceptor {

	private static final long serialVersionUID = -458610734177999180L;

	@Override
	public void destroy() {

	}

	@Override
	public void init() {

	}

	@SuppressWarnings("rawtypes")
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		BaseAction baseAction = (BaseAction) invocation.getAction();
		ActionProxy proxy = invocation.getProxy();
		String nameSpace = proxy.getNamespace();
		String actionName = proxy.getActionName();
		if(ValidateUtils.hasRight(nameSpace, actionName, ServletActionContext.getRequest(),baseAction)){
			return invocation.invoke();
		}
		return "error_no_right";
	}

}
