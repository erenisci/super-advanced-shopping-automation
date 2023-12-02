/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.web.programming.project;

/**
 *
 * @author iscie
 */
public class Product {
    private String urunIsim;
    private String urunUrl;
    private String urunFiyat;
    private int urunStok;

    public Product() {
    }

    public Product(String urunIsim, String urunUrl, String urunFiyat, int urunStok) {
        this.urunIsim = urunIsim;
        this.urunUrl = urunUrl;
        this.urunFiyat = urunFiyat;
        this.urunStok = urunStok;
    }
    // Getter ve setter metotları
    public String getUrunIsim() {
        return urunIsim;
    }

    public void setUrunIsim(String urunIsim) {
        this.urunIsim = urunIsim;
    }

    public String getUrunUrl() {
        return urunUrl;
    }

    public void setUrunUrl(String urunUrl) {
        this.urunUrl = urunUrl;
    }

    public String getUrunFiyat() {
        return urunFiyat;
    }

    public void setUrunFiyat(String urunFiyat) {
        this.urunFiyat = urunFiyat;
    }

    public int getUrunStok() {
        return urunStok;
    }

    public void setUrunStok(int urunStok) {
        this.urunStok = urunStok;
    }
}