/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.web.programming.project;

import java.util.Date;

/**
 *
 * @author iscie
 */
public class Orders {

    private int siparisId;
    private int kullaniciId;
    private String siparisIsim;
    private String siparisUrl;
    private float siparisFiyat;
    private int siparisAdet;
    private Date siparisTarih;

    public Orders() {
    }

    public void setSiparisId(int siparisId) {
        this.siparisId = siparisId;
    }

    public void setKullaniciId(int kullaniciId) {
        this.kullaniciId = kullaniciId;
    }

    public void setSiparisIsim(String siparisIsim) {
        this.siparisIsim = siparisIsim;
    }

    public void setSiparisUrl(String siparisUrl) {
        this.siparisUrl = siparisUrl;
    }

    public void setSiparisFiyat(float siparisFiyat) {
        this.siparisFiyat = siparisFiyat;
    }

    public void setSiparisAdet(int siparisAdet) {
        this.siparisAdet = siparisAdet;
    }

    public void setSiparisTarih(Date siparisTarih) {
        this.siparisTarih = siparisTarih;
    }

    public int getSiparisId() {
        return siparisId;
    }

    public int getKullaniciId() {
        return kullaniciId;
    }

    public String getSiparisIsim() {
        return siparisIsim;
    }

    public String getSiparisUrl() {
        return siparisUrl;
    }

    public float getSiparisFiyat() {
        return siparisFiyat;
    }

    public int getSiparisAdet() {
        return siparisAdet;
    }

    public Date getSiparisTarih() {
        return siparisTarih;
    }
}