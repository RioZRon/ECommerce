package interceptor;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import entity.Mguser;

@SuppressWarnings("serial")
public class LoginInterceptor extends AbstractInterceptor{

	@SuppressWarnings("unchecked")
	@Override
	public String intercept(ActionInvocation inv) throws Exception {
		Map session = inv.getInvocationContext().getSession();
		List<Mguser> user = (List<Mguser>) session.get("User");
		if (user != null) {
			return inv.invoke();
		} else {
			return "user";
		}
	}
	        
}
