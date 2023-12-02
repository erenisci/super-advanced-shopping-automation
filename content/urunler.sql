USE projectdb;

CREATE TABLE IF NOT EXISTS urunler (
    id INT AUTO_INCREMENT PRIMARY KEY,
    urunIsim VARCHAR(255) NOT NULL,
    urunUrl VARCHAR(255) NOT NULL,
    urunFiyat VARCHAR(255) NOT NULL,
    urunStok INT NOT NULL
) ENGINE=INNODB;

INSERT INTO urunler (urunIsim, urunUrl, urunFiyat, urunStok) VALUES
('Şemsiye', 'https://www.ilpen.com.tr/7890-large_default/rubber-sapli-katlanir-semsiye.jpg', '70', 31),
('Nevresim', 'https://www.nevresimdunyasi.com/UserFiles/Fotograflar/org/37075-nevresim-dunyasi-moda-ranforce-cift-kisilik-nevresim-takimi-aras-nevresim-dunyasi-moda-ranforce-cift-kisilik-nevresim-takimi-bulut-12891.jpg', '299', 21),
('Cila', 'https://www.meguiars.com.tr/ultimate-quik-wax-hizli-sprey-wax-cila-v2-meguiartt2s-trkiye-1040-53-B.png', '79', 33),
('Zar', 'https://ae01.alicdn.com/kf/S976a168ca0f842938758c1f991227fc1r/Bescon-zar-profesyonel-hassas-zar-yuvarlak-k-e-5-8-16mm-rastgele-seri-numaras-ile-hassas.jpg', '18', 80),
('Defter', 'https://i.dr.com.tr/cache/500x400-0/originals/0002043120001-1.jpg', '46', 22),
('Elbise', 'https://vakko.akinoncdn.com/products/2023/03/15/1454858/042e3430-e68b-4aea-a04b-afc32f2532e5.jpg',799, 11),
('Flüt', 'https://m.media-amazon.com/images/I/61Pwpp3b-tL._AC_UF1000,1000_QL80_.jpg',29, 40),
('Örtü', 'https://akn-mudo.a-cdn.akinoncdn.com/products/2018/09/26/314592/c6b756cc-dfe9-4005-b10b-fa54d75fe4fa.jpg', '99', 17),
('Gardırop', 'https://larconcept.com/gardrop-elibise-dolabi-3-kapakli-1-cekmeceli-beyaz-ceviz-1135-18-B.jpg', '3199', 8),
('Halı', 'https://akn-enza.a-cdn.akinoncloud.com/products/2022/11/07/36672/186889b5-6148-4df3-9b1d-8fee2f0992d6_size1684x950.jpg', '299', 14),
('Yastık', 'https://img-puffy.mncdn.com/Content/Images/Thumbs/0000474_gronn-bambu-yastik-her-mevsim-rahat-uyutan-yastik-beyaz-1349.jpeg', '250', 15),
('İğne', 'https://cdn03.ciceksepeti.com/cicek/kcm58190953-1/XL/enj.-igne-ucu-yesil-tibset-kcm58190953-1-6020ae94946a40808e4ddf2c4154921c.jpg', '9', 77),
('Jilet', 'https://productimages.hepsiburada.net/s/40/375-375/10682342211634.jpg', '19', 55),
('Kitap', 'https://m.media-amazon.com/images/I/61Q3YdCXGML._AC_UF1000,1000_QL80_.jpg', '160', 35),
('Lamba', 'https://mylamp.com.tr/UserFiles/Fotograflar/16830-anna-26x15-cm-dogal-desenli-siyah-ayakli-bambu-solar-lamba-slr0021-2-png-slr0021-2.png', '180', 18),
('Maytap', 'https://partibeta.com/image/cache/data/resimler/tel-maytap-10-lu-32-1000x1000.png', '15', 49),
('Ayakkabı', 'https://static.nike.com/a/images/t_prod_ss/w_960,c_limit,f_auto/c2372c88-c72a-4f95-a506-5a2f8694b21b/kyrie-7-horus-lansman-tarihi.jpg', '2099' , 20),
('Oklava', 'https://cdn03.ciceksepeti.com/cicek/kcx39313499/XL/kisiye-ozel-isimli-ahsap-oklava.jpeg', '20', 40),
('Plak', 'https://m.media-amazon.com/images/I/71WwO2Lip7L._AC_UF1000,1000_QL80_.jpg', '9999', 2),
('Radyo', 'https://m.media-amazon.com/images/I/61hZ6c75QLL._AC_UF1000,1000_QL80_.jpg', '800', 6),
('Islak Mendil', 'https://f-evy-l.mncdn.com/livephotos/evyap/611112-1.jpg', '69', 35),
('Silgi', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGp8Z4bqjl_VIC_6N8LZqHAcAXcbbO51kwWg&usqp=CAU', '31', 0),
('Çilek', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Strawberry444.jpg/250px-Strawberry444.jpg', '69', 122),
('Tava', 'https://cdn.karaca.com/image/cdndata/182/202206/600.15.01.2346/8699343491563-108.jpg', '400', 27),
('Un', 'https://www.makbul.com/Content/global/images/products/1/119/ORG-un-kg623.jpg', '46', 30),
('Ütü', 'https://cdn.karaca.com/image/banner/karaca/urun/urun2/700.01.01.0338.jpg', '399', 12),
('Valiz', 'https://aydinli-cacharel.a-cdn.akinoncdn.com/products/2022/09/19/644541/d27cc3aa-0172-4ba8-98c5-77afd861c4bd_size2724x3540_quality100_cropCenter.jpg', '280', 23),
('Bilgisayar', 'https://cdn.evkur.com.tr/c/Product/thumbs/lenovo-ideapad3-1_ns95yr_500.jpg', '16999', 5);