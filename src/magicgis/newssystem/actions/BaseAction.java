package magicgis.newssystem.actions;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import magicgis.newssystem.utils.ReflectionUtils;
import magicgis.newssystem.utils.VerificationCodeUtils;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

@SuppressWarnings("unchecked")
public abstract class BaseAction<T> extends ActionSupport implements
		ModelDriven<T>, Preparable, RequestAware, SessionAware ,ApplicationAware{

	private static final long serialVersionUID = 1L;
	public T model;
	protected Map<String, Object> sessionMap;
	protected Map<String, Object> requestMap;
	@SuppressWarnings("unused")
	private Map<String, Object> applicationMap;
	protected HttpSession httpSession = ServletActionContext.getRequest().getSession();
	protected HttpServletRequest httpRequest = ServletActionContext.getRequest();
	protected HttpServletResponse httpResponse = ServletActionContext.getResponse();
	protected ServletContext application = ServletActionContext.getRequest().getSession().getServletContext();
	protected InputStream inputStream;
	protected VerificationCodeUtils vcu = VerificationCodeUtils.Instance();
	
	
	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public BaseAction() {
		try {
			model = (T) ReflectionUtils.getSuperGenericType(this.getClass())
					.newInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void prepare() throws Exception {

	}
	
	public void writeJSON(Object obj) throws IOException{
		ObjectMapper om = new ObjectMapper();
		String str = null;
		try {
			str = om.writeValueAsString(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ServletActionContext.getResponse().setContentType("text/html");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		try {
			ServletActionContext.getResponse().getWriter().printf(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ServletActionContext.getResponse().getWriter().flush();
		ServletActionContext.getResponse().getWriter().close();
	}

	@Override
	public T getModel() {
		return model;
	}

	@Override
	public void setSession(Map<String, Object> sessionMap){
		this.sessionMap = sessionMap;
	}

	@Override
	public void setRequest(Map<String, Object> requestMap){
		this.requestMap = requestMap;
	}

	@Override
	public void setApplication(Map<String, Object> applicationMap) {
		this.applicationMap = applicationMap;
	}

}
