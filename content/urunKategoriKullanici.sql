USE projectdb;

 CREATE TABLE IF NOT EXISTS kullanicilar (
    urunKullanici_id INT AUTO_INCREMENT PRIMARY KEY,
    kullaniciNick VARCHAR(20) NOT NULL UNIQUE,
    kullaniciEposta VARCHAR(255) NOT NULL UNIQUE,
    kullaniciSifre VARCHAR(255) NOT NULL
) ENGINE=INNODB;
 
CREATE TABLE IF NOT EXISTS kategoriler (
    urunKategori_id INT AUTO_INCREMENT PRIMARY KEY,
    urunKategori_ad VARCHAR(255) NOT NULL
) ENGINE=INNODB;
 
 CREATE TABLE IF NOT EXISTS urunler (
    id INT AUTO_INCREMENT PRIMARY KEY,
    urunIsim VARCHAR(255) NOT NULL,
    urunUrl VARCHAR(255) NOT NULL,
    urunAciklama VARCHAR(255) NOT NULL,
	urunFiyat DECIMAL(10, 2) NOT NULL,
    urunStok INT NOT NULL,
    urunKategori_id INT NOT NULL, 
    urunKullanici_id INT NOT NULL,
    FOREIGN KEY (urunKategori_id) REFERENCES kategoriler(urunKategori_id),
    FOREIGN KEY (urunKullanici_id) REFERENCES kullanicilar(urunKullanici_id)
) ENGINE=INNODB;

INSERT INTO kullanicilar (kullaniciNick, kullaniciEposta, kullaniciSifre) VALUES 
('admin', 'admin@admin.com', 'admin');

INSERT INTO kategoriler (urunKategori_ad) VALUES
 ('mutfak'), 
 ('teknoloji'), 
 ('kırtasiye'), 
 ('eşya'),
 ('ev'), 
 ('giyim'), 
 ('gıda'),
 ('otomotiv'),
 ('ayakkabı'),
 ('bahçe'),
 ('bebek'),
 ('bilgisayar'),
 ('elektronik'),
 ('evcil hayvan'),
 ('kitap'),
 ('telefon'),
 ('müzik ekipmanları'),
 ('kişisel bakım'),
 ('kozmetik');
 
INSERT INTO urunler (urunIsim, urunUrl, urunAciklama, urunFiyat, urunStok, urunKategori_id, urunKullanici_id) VALUES  
('nevresim', 'https://www.nevresimdunyasi.com/UserFiles/Fotograflar/org/37075-nevresim-dunyasi-moda-ranforce-cift-kisilik-nevresim-takimi-aras-nevresim-dunyasi-moda-ranforce-cift-kisilik-nevresim-takimi-bulut-12891.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 299.00, 21, 5, 1),
('cila', 'https://www.meguiars.com.tr/ultimate-quik-wax-hizli-sprey-wax-cila-v2-meguiartt2s-trkiye-1040-53-B.png','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 79.00, 33, 4, 1),
('zar', 'https://ae01.alicdn.com/kf/S976a168ca0f842938758c1f991227fc1r/Bescon-zar-profesyonel-hassas-zar-yuvarlak-k-e-5-8-16mm-rastgele-seri-numaras-ile-hassas.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 18.00, 80, 4, 1),
('defter', 'https://i.dr.com.tr/cache/500x400-0/originals/0002043120001-1.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 46.00, 22, 3, 1),
('elbise', 'https://vakko.akinoncdn.com/products/2023/03/15/1454858/042e3430-e68b-4aea-a04b-afc32f2532e5.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 799.00, 11, 6, 1),
('flüt', 'https://m.media-amazon.com/images/I/61Pwpp3b-tL._AC_UF1000,1000_QL80_.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 29.00, 40, 17, 1),
('gardırop', 'https://larconcept.com/gardrop-elibise-dolabi-3-kapakli-1-cekmeceli-beyaz-ceviz-1135-18-B.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 3199.00, 8, 5, 1),
('halı', 'https://akn-enza.a-cdn.akinoncloud.com/products/2022/11/07/36672/186889b5-6148-4df3-9b1d-8fee2f0992d6_size1684x950.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 299.00, 14, 5, 1),
('yastık', 'https://img-puffy.mncdn.com/Content/Images/Thumbs/0000474_gronn-bambu-yastik-her-mevsim-rahat-uyutan-yastik-beyaz-1349.jpeg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 250.00, 15, 5, 1),
('iğne', 'https://cdn03.ciceksepeti.com/cicek/kcm58190953-1/XL/enj.-igne-ucu-yesil-tibset-kcm58190953-1-6020ae94946a40808e4ddf2c4154921c.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 9.00, 77, 4, 1),
('jilet', 'https://productimages.hepsiburada.net/s/40/375-375/10682342211634.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 19.00, 55, 4, 1),
('lamba', 'https://mylamp.com.tr/UserFiles/Fotograflar/16830-anna-26x15-cm-dogal-desenli-siyah-ayakli-bambu-solar-lamba-slr0021-2-png-slr0021-2.png','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 180.00, 18, 4, 1),
('maytap', 'https://partibeta.com/image/cache/data/resimler/tel-maytap-10-lu-32-1000x1000.png','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 15.00, 49, 4, 1),
('ayakkabı', 'https://static.nike.com/a/images/t_prod_ss/w_960,c_limit,f_auto/c2372c88-c72a-4f95-a506-5a2f8694b21b/kyrie-7-horus-lansman-tarihi.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 2099.00 , 20, 9, 1),
('oklava', 'https://cdn03.ciceksepeti.com/cicek/kcx39313499/XL/kisiye-ozel-isimli-ahsap-oklava.jpeg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 20.00, 40, 1, 1),
('plak', 'https://m.media-amazon.com/images/I/71WwO2Lip7L._AC_UF1000,1000_QL80_.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 9999.00, 2, 2, 1),
('radyo', 'https://m.media-amazon.com/images/I/61hZ6c75QLL._AC_UF1000,1000_QL80_.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 800.00, 6, 2, 1),
('silgi', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGp8Z4bqjl_VIC_6N8LZqHAcAXcbbO51kwWg&usqp=CAU','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 31.00, 1, 3, 1),
('tava', 'https://cdn.karaca.com/image/cdndata/182/202206/600.15.01.2346/8699343491563-108.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 400.00, 27, 1, 1),
('un', 'https://www.makbul.com/Content/global/images/products/1/119/ORG-un-kg623.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 46.00, 30, 7, 1),
('pirinç','https://intacgida.com/wp-content/uploads/2020/02/baldo_pirinc_nedir_baldo_pirinc_ozellikleri_nelerdir_2019_baldo_pirinc_fiyatlari_1561547197_8591.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 25.00, 54, 7, 1),
('valiz', 'https://akn-mudo.a-cdn.akinoncdn.com/products/2023/04/28/502929/b2945727-0ea0-44e5-9300-a30fd71e8ced_size450x450_cropCenter.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 280.00, 23, 4, 1),
('lastik','https://cdn03.ciceksepeti.com/cicek/kc3255121-1/XL/michelin-20555-r16-91h-crossclimate-mi-4-mevsim-oto-lastik-kc3255121-1-fc6e5bc68d8a49df9fbeb713e7c588bf.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 600.00, 20, 8, 1),
('jant','https://jantdunyasi.com/cdn/shop/files/monaco-arc-18190-52-9-0x18-5x112-et40-73-1-titanium-jant-4-adet-53627.jpg?v=1695740872','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 1000.00, 40, 8, 1),
('gül','https://cdn03.ciceksepeti.com/cicek/at4273-1/XL/11-li-kirmizi-gul-cicek-buketi-at4273-1-bf4868a0836d4c5898c8f8a1366ed969.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 20.00, 45, 10, 1),
('saksı','https://bahcemarket.com/files/images/2022/06_m/16_6/thmb/12-no-saksi-kiremit-54-lt-3-w345-h350.webp','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 100.00, 78, 10, 1),
('papatya','https://www.istanbulcicekleri.com/Upload/433161778papatyacicegianthemisnobilis.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 40.00, 24, 10, 1),
('bebek bezi','https://cdn.civilim.com/productimages/437307/big/8006540044797_1.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 200.00, 42, 11, 1),
('biberon','https://static.ticimax.cloud/55720/uploads/urunresimleri/buyuk/wee-baby-745-klasik-kulplu-pp-biberon---9203-.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 152.00, 37, 11, 1),
('emzik','https://www.bibsturkiye.com/cdn/shop/products/bibs-colour-kaucuk-emzik-vanilla-1500_8c9fb687-fb0f-491c-96ce-a92a9947ff96_800x.png?v=1686720694','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 49.00, 25, 11, 1),
('monster','https://cdn.dsmcdn.com/ty948/product/media/images/20230612/16/385064187/967833979/1/1_org_zoom.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 20000.00, 5, 12, 1),
('lenovo','https://www.incehesap.com/resim/urun/201411/lenovo-20c6006jtx-notebook-notebook-44829_500.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 10000.00, 8, 12, 1),
('asus','https://cdn.vatanbilgisayar.com/Upload/PRODUCT/asus/thumb/121791-1_large.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 25000.00, 14, 12, 1),
('ampul','https://cdn.dsmcdn.com/ty338/product/media/images/20220220/13/54113711/108850385/1/1_org_zoom.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 20.00, 80, 13, 1),
('pil','https://www.zeybekmarket.com/duracell-sarjli-kalem-pil-2500-mah-piller-duracell-7848-31-B.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 27.00, 32, 13, 1),
('suç ve ceza','https://i.dr.com.tr/cache/600x600-0/originals/0001788076001-1.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 200.00, 50, 15, 1),
('tutunamayanlar','https://i.dr.com.tr/cache/500x400-0/originals/0000000061424-1.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 190.00, 22, 15, 1),
('anna karenina','https://m.media-amazon.com/images/I/611LKLWlBFL._AC_UF894,1000_QL80_.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 180.00, 72, 15, 1),
('keman','https://www.do-re.com.tr/yamaha-v3ska-keman-4-4-7170bb56301d5d2600bc8dd121d0f826-2d63c9f041e68f8d4ff351dbd26d530b-max-pp.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 2500.00, 42, 17, 1),
('gitar','https://ideacdn.net/idea/as/29/myassets/products/105/9f.jpg?revision=1697143329','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 3300.00, 42, 17, 1),
('diş macunu','https://m.media-amazon.com/images/I/71iWWF02-FL._AC_UF1000,1000_QL80_.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 50.00, 14, 18, 1),
('diş ipi','https://cdn.dsmcdn.com/ty741/product/media/images/20230222/15/286822757/6178086/2/2_org_zoom.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 20.00, 18, 18, 1),
('diş fırçası','https://cdn.dsmcdn.com/ty137/product/media/images/20210628/13/105029511/82632560/1/1_org_zoom.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 59.00, 36, 18, 1),
('krem','https://cdn03.ciceksepeti.com/cicek/kcm18747248-1/XL/neutrogena-yogun-nemlendirici-krem-kuru-cilt-200ml-kcm18747248-1-bebc3e05eace4e0a94bdbc9bbd81ca4e.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 200.00, 78, 19, 1),
('rimel','https://cdn03.ciceksepeti.com/cicek/kc7810336-1/XL/maybelline-cils-sensational-sky-high-mascara-siyah-kc7810336-1-7dbbbc82c2c54936b78b9c4933313bfe.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 290.00, 34, 19, 1),
('ruj','https://cdn.dsmcdn.com/ty729/product/media/images/20230213/12/280163206/7203098/1/1_org_zoom.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 280.00, 22, 19, 1);