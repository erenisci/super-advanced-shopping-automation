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
    private float urunFiyat;
    private int urunStok;
    private String urunNewPageUrl;
    private int urunKullaniciId;

    public Product() {
    }

    public Product(String urunIsim, String urunUrl, float urunFiyat, int urunStok) {
        this.urunIsim = urunIsim;
        this.urunUrl = urunUrl;
        this.urunFiyat = urunFiyat;
        this.urunStok = urunStok;
    }
    
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

    public float getUrunFiyat() {
        return urunFiyat;
    }

    public void setUrunFiyat(float urunFiyat) {
        this.urunFiyat = urunFiyat;
    }

    public int getUrunStok() {
        return urunStok;
    }

    public void setUrunStok(int urunStok) {
        this.urunStok = urunStok;
    }
    
    public int getUrunKullaniciId() {
        return urunKullaniciId;
    }

    public void setUrunKullaniciId(int urunKullaniciId) {
        this.urunKullaniciId = urunKullaniciId;
    }
    
    public String getUrunNewPageUrl() {
        return urunNewPageUrl;
    }

    public void setUrunNewPageUrl() {
        this.urunNewPageUrl = "urunIsim=" + this.urunIsim + "&urunUrl=" + this.urunUrl + "&urunFiyat=" + this.urunFiyat + "&urunStok=" + this.urunStok;
    }
}