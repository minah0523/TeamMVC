<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String ctxPath = request.getContextPath();
%>    

<jsp:include page="../header.jsp" />  


<style>
   table#tblMemberRegister {
          width: 93%;
          
          /* 선을 숨기는 것 */
          /* border: solid 1px gray; */
          
          margin: 10px;
   }  
   
   table#tblMemberRegister #th {
         height: 40px;
         text-align: center;
         background-color: silver;
         font-size: 14pt;
   }
   
   table#tblMemberRegister td {
         border-bottom: solid 1px gray;  
         line-height: 30px;
         padding-top: 8px;
         padding-bottom: 8px;
   }
   
   .star { color: red;
           font-weight: bold;
           font-size: 13pt;
   }
</style>

<br>
    
<div class="row" id="divRegisterFrm">
   <div class="col-md-12" align="center">
   <form name="registerFrm" style ="margin-left: 50px; width: 1200px;">   
   <table id="tblMemberRegister">
      <thead>
      <tr>
         <th colspan="2" id="th" style=" background-color: white;"> 제품등록 </th>
      </tr>
      </thead>
      <tbody>
	      <tr>
	      	 <td style="width: 20%; font-weight: bold;">카테고리&nbsp;<span class="star">*</span></td>
	         <td style="width: 80%; text-align: left;">
	            <select id="pdcategory_fk" name="pdcategory_fk" style= "width: 170px; height: 40px; padding: 8px;">
	               <option>선택</option>
	               <option value ="1">코트</option>
	               <option value ="2">자켓</option>
	               <option value ="3">점퍼</option>
	               <option value ="4">무스탕</option>
	               <option value ="5">가디건</option>
	            </select> 
	         </td>
	      </tr>
	      <tr>
	         <td style="width: 20%; font-weight: bold;">제품명&nbsp;<span class="star">*</span></td>
	         <td style="width: 80%; text-align: left;">
	             <input type="text" name="pdname" id="pdname" class="requiredInfo" /> 
	             <span class="error">제품명은 필수입력 사항입니다.</span>
	         </td>
	      </tr>
	      <tr>
	         <td style="width: 20%; font-weight: bold;">제품이미지1&nbsp;<span class="star">*</span></td>
	         <td style="width: 80%; text-align: left;">
	         	 <span>
	             	<input type="file" name="pdimage1" id="pdimage1" class="requiredInfo" /><span class="error">제품이미지는 필수입력 사항입니다.</span>
	             </span>
	         </td> 
	      </tr>
	      <tr>
	      	<td style="width: 20%; font-weight: bold;">제품이미지2&nbsp;<span class="star">*</span></td>
	      	<td style="width: 80%; text-align: left;">
	      		<span>
	             	<input type="file" name="pdimage2" id="pdimage2" class="requiredInfo" /><span class="error">제품이미지는 필수입력 사항입니다.</span>
	             </span>
	        </td>	      	
	      </tr>
	      <tr>
	         <td style="width: 20%; font-weight: bold;">제품수량&nbsp;<span class="star">*</span></td>
	         <td style="width: 80%; text-align: left;"><input type="text" name="pdqty" id="pdqty" class="requiredInfo" />
	            <span class="error">제품수량은 필수입력 사항입니다.</span>
	         </td>
	      </tr>
	      <tr>
	         <td style="width: 20%; font-weight: bold;">제품정가&nbsp;<span class="star">*</span></td>
	         <td style="width: 80%; text-align: left;"><input type="text" id="price" class="requiredInfo" /> 
	            <span class="error">제품정가는 필수입력 사항입니다. </span>
	         </td>
	      </tr>
	      <tr>
	         <td style="width: 20%; font-weight: bold;">제품판매가&nbsp;<span class="star">*</span></td>
	         <td style="width: 80%; text-align: left;"><input type="text" name="saleprice" id="saleprice" class="requiredInfo" /> 
	             <span class="error">제품판매가  필수입력 사항입니다.</span>
	         </td>
	      </tr>
	      <tr>
	         <td style="width: 20%; font-weight: bold;">제품설명&nbsp;<span class="star">*</span></td>
	         <td style="width: 80%; text-align: left;">
	             <textarea name = "pdcontent" rows="5" cols="50"></textarea>
	             <span class="error">제품설명 필수입력 사항입니다.</span>
	         </td>
	      </tr>
	      <tr>
	         <td style="width: 20%; font-weight: bold;">포인트&nbsp;<span class="star">*</span></td>
	         <td style="width: 80%; text-align: left;"><input type="text" name="point" id="point" class="requiredInfo" /> 
	            <span class="error">포인트는 필수입력 사항입니다.</span>
	         </td>
	      </tr>      
	      <tr>
	         <td style="width: 20%; font-weight: bold;">소재</td>
	         <td style="width: 80%; text-align: left;">
	            <input type="text" id="texture" name="texture" size="20" maxlength="10" />&nbsp;&nbsp;
	            <span class="error">소재는 필수입력 사항입니다.</span>
	         </td>
	      </tr>
	      <tr>
	         <td style="width: 20%; font-weight: bold; border-bottom: hidden;">성별</td>
	         <td style="width: 80%; text-align: left; border-bottom: hidden;">
	            <input type="radio" id="male" name="gender" value="1" /><label for="male" style="margin-left: 2%;">남자</label>
	            <input type="radio" id="female" name="gender" value="2" style="margin-left: 10%;" /><label for="female" style="margin-left: 2%;">여자</label>
	         </td>
	      </tr>         
	      <tr>
	         <td colspan="2" style="line-height: 30px; border-bottom: hidden;">
	            <button type="button" id="btnRegister" style="margin-left:450px; width: 100px; align:center; background-color: #555; color:white;">가입하기</button> 
	         </td>
	      </tr>
      </tbody>
   </table>
   </form>
   </div>
</div>

<jsp:include page="../footer.jsp" />  