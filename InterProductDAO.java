package myshop.mdl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface InterProductDAO {
	
	// 메인페이지의 캐러셀에 보여지는 상품이미지파일명을 모두 조회(SELECT) 하는 메소드 (JIEUN)
	List<ImageVO> ImageCarouselSelectAll() throws SQLException;
		
	// 메인페이지에 보여지는 상품 이미지 tbl_product 에서 조회해오는 메소드  (JIEUN)
	// List<ProductVO> ProductMainImageSelectAll(String sortType) throws SQLException;
	List<ProductVO> ProductMainImageSelectAll(Map<String, String> paraMap) throws SQLException;
	
	// 메인페이지에서 보여지는 상품 색상 tbl_product_info에서 조회 및 정렬해오는 메소드(JIEUN)
	List<String> ProductMainColorSelectAll(String pdno) throws SQLException;
	
	// 카테고리 목록 보여주는 메소드(코트, 자켓, 점퍼, 무스탕, 가디건)  (JIEUN)
	List<CategoryVO> CategoryListSelectAll() throws SQLException;

	// 카테고리 목록 클릭시 카테고리 코드에 따라 조회 및 정렬하는 메소드  (JIEUN)
	List<ProductVO> categoryProducClickSelectAll(Map<String, String> paraMap) throws SQLException;
	
	// ============= 상품 등록 하는 메소드  ==================== //
	// tbl_prodcut에 상품을 등록하는(insert) 메소드(JIEUN)
	int ProdutcRegisterAll(ProductVO product) throws SQLException;		
	
	// search페이지에 보여지는 상품이미지파일명을 모두 조회(select)하는 메소드 (MINA)
	List<ProductVO> searchProduct(Map<String, String> paraMap) throws SQLException;

	// 제품별 컬러 리스트를 조회하는 메서드 (MINA)
	List<String> selectProductColor(String pdno) throws SQLException;

	// 제품별 사이즈 리스트를 조회하는 메서드 (MINA)
	List<String> selectProductSize(String pdno) throws SQLException;

	// 페이징처리를 위해서 전체회원에 대한 총 제품 개수와 페이지 개수 알아오기(select) (MINA)
	Map<String, String> getTotal(Map<String, String> paraMap) throws SQLException;	
	
	
	/*	
	// 물품상세페이지에 ProductList 모두 조회 (승의)
	List<ProductVO> ProductList() throws SQLException;
	 */	

	// 물품상세페이지에 ProductList의 해당 pdno의 정보 조회  (승의)
	List<ProductVO> ProductList(int pdno) throws SQLException;
	
	/*
	// 물품상세페이지에서의 장바구니 (승의)
	List<CartVO> CartList() throws SQLException;
	 */	
		
	/*	
	// 물품상세페이지에서의 사이즈,색상 (승의)
	List<ProductInfoVO> ProductInfoList(int pdno) throws SQLException;
	 */	

	// 물품상세페이지에서의 사이즈,색상 (승의)
	List<ProductInfoVO> ProductInfoList() throws SQLException;
	
	/*
	// 물품상세페이지에서의 사이즈,색상 (승의)
	List<ProductVO> ImgList() throws SQLException;
	*/

	// 장바구니 테이블에 존재하는 row를 특정유저(로그인된 유저)의 아이디와 제품번호를 사용하여
	// select 해온뒤 List에 담는다. 그 뒤 해당 List를 이용하여 반복문을 사용해 선택한 제품을 화면에 출력  (동휘)
	List<ProductVO> getCartList(String userid) throws SQLException;

	
}
