package product.ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ctrl.AbstractController;
import myshop.mdl.*;

public class ProductRegisterAction extends AbstractController {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		// 메소드가 get 방식이면 바로 등록 페이지로 이동한다. 
		if("GET".equalsIgnoreCase(method)) {
			
			super.setViewPage("/WEB-INF/product/productRegister.jsp");
			
		}
		else {
			// post 방식으로 데이터가 넘어왔다면
			
			String pdname = request.getParameter("pdname");
			String pdcategory_fk = request.getParameter("pdcategory_fk");
			String pdimage1 = request.getParameter("pdimage1");
			String pdimage2 = request.getParameter("pdimage2");
			int pdqty = Integer.parseInt(request.getParameter("pdqty"));
			int price = Integer.parseInt(request.getParameter("price"));
			int saleprice = Integer.parseInt(request.getParameter("saleprice"));
			String pdcontent = request.getParameter("pdcontent");
			int point = (int)(price * 0.01);
			String texture = request.getParameter("texture");
			String pdgender = request.getParameter("pdgender");
			
			ProductVO product = new ProductVO(pdname, pdcategory_fk, pdimage1, pdimage2, pdqty, price, saleprice, pdcontent, point, texture, pdgender);

			InterProductDAO pdao = new ProductDAO();
			int registerProduct = pdao.ProdutcRegisterAll(product);
			
			String message = ""; // alert 내용
			String loc = "";     // 경로			
		
			if(registerProduct == 1) {
				// insert 성공 시
				message = "상품등록 성공";
				
				// message 띄운후 어느 페이지로 갈래?
				loc = request.getContextPath() + "/TeamHomePage.neige"; // 성공하면 시작페이지로 이동할 것이다.				
			} 
			else {
				// insert 실패 시
				message = "상품등록 실패";
				loc = "javascript:history.back()"; // 실패하면 자바스크립트를 이용한 이전페이지로 이동하는 것.				
				
			}
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			// super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp"); // message, location 띄우기
			
						
			
		}
	}

}
