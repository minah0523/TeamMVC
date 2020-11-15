package product.ctrl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ctrl.AbstractController;
import myshop.mdl.InterProductDAO;
import myshop.mdl.ProductDAO;
import myshop.mdl.ProductVO;

public class ProductDetailAction extends AbstractController {
	
	@Override
	public String toString() {
		return "@@@ : 클래스 IndexController의 인스턴스 메소드 toString() 호출";
	}
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// System.out.println("@@@ 확인용 IndexController의 메소드 execute호출됨");
		
		
		/* 캐러셀의 생성으로 이미지 파일을 DB상에 만들 경우 사용가능하다.
		InterProductDAO pdao = new ProductDAO(); DAO 객체 생성
		
		List<ImageVO> imgList = pdao.ImageSelectAll();
		
		request.setAttribute("imgList", imgList);
		*/
		
		InterProductDAO pdao = new ProductDAO();
/*
		List<ProductVO> productList = pdao.ProductList();
		request.setAttribute("productList", productList);
*/
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/productdetail/ProductDetail.jsp");
		
	}
	
}

