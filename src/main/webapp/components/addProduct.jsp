<%-- 
    Document   : addProduct
    Created on : 10 Ara 2023, 05:59:59
    Author     : iscie
--%>

<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mycompany.web.programming.project.Product"%>
<%@page import="com.mycompany.web.programming.project.UserBean"%>
<%@page import="com.mycompany.web.programming.project.Categories"%>
<%@page import="com.mycompany.web.programming.project.DBConnection"%>
<%@page import="com.mycompany.web.programming.project.DBOperations"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String isAdded = request.getParameter("added");
    
    if(isAdded != null && !isAdded.isEmpty()) {
        if (isAdded.equals("true")) {
            %><script>alert("Ürününüzü Başarıyla Eklediniz!");</script><%
        }
    }
%>

<div class="right-col">
    <form class="right-col-profile" method="post" action="add.jsp" enctype="multipart/form-data">
        <div class="flex">
            <div class="flex-width">
                <p class="urunEkle-p">Resim</p>
                <input class="border-bot" id="inputImg" type="file" name="resim" accept="image/jpeg, image/png" required/>
            </div>
            <div class="flex-width">
                <p class="urunEkle-p">İsim</p>
                <input class="border-bot" id="inputImg-Right" type="text" pattern="[a-zA-ZçÇğĞıİöÖşŞüÜ0-9 ]+" title="Sadece Türkçe karakterler ve rakam içerebilir. [a-z], [A-Z], [0-9]" placeholder="Ürün İsmi" name="isim" required/>
            </div>
        </div>
        <div class="flex">
            <div class="flex-width">         
                <p class="urunEkle-p">Stok</p>
                <input class="border-bot" type="number" name="stok" placeholder="Ürün Stok" required/>
            </div>
            <div class="flex-width">
                <p class="urunEkle-p">Fiyat</p>
                <input class="border-bot" type="number" name="fiyat" placeholder="Ürün Fiyat" required/>
            </div>
        </div>
        <div class="flex flex-4">
            <div class="flex-width">
                <p class="urunEkle-p">Açıklama</p>
                <textarea maxlength="255" placeholder="Açıklama" name="aciklama" rows="6" cols="41" required></textarea>
            </div>
            <div class="select-flex" class="flex-width">
                <p class="urunEkle-p">Kategori</p>
                <div class="goCenter">
                    <select name="kategori" class="flex-select" required>
                        <option value="">Kategori</option>
                        <%
                            try (ResultSet resultCat = DBOperations.executeQuery("SELECT * FROM kategoriler ORDER BY urunKategori_ad")) {
                                List<Categories> categoryResults = new ArrayList<>();
                                while (resultCat.next()) {
                                    Categories category = new Categories();
                                    category.setCategoryId(resultCat.getInt("urunKategori_id"));
                                    category.setCategoryName(resultCat.getString("urunKategori_ad"));
                                    categoryResults.add(category);
                                }
                                for (Categories category : categoryResults) {
                        %>
                                    <option value="<%out.print(category.getCategoryId());%>">
                                        <%out.print(category.getCategoryName().substring(0,1).toUpperCase() + category.getCategoryName().substring(1));%>
                                    </option>
                        <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </select>
                </div>
            </div>
        </div>
        <div class="flex flex-4">
            <button>Satışa Çıkar</button>
        </div>
    </form>
</div>