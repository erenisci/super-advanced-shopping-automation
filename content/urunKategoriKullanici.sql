USE projectdb;

 CREATE TABLE IF NOT EXISTS kullanicilar (
    urunKullanici_id INT AUTO_INCREMENT PRIMARY KEY,
    kullaniciNick VARCHAR(20) NOT NULL UNIQUE,
    kullaniciEposta VARCHAR(255) NOT NULL UNIQUE,
    kullaniciSifre VARCHAR(255) NOT NULL,
    kullaniciUrl VARCHAR(255) NOT NULL,
    kullaniciChange VARCHAR(5) NOT NULL
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

INSERT INTO kullanicilar (kullaniciNick, kullaniciEposta, kullaniciSifre, kullaniciUrl, kullaniciChange) VALUES 
('admin', 'admin@admin.com', 'admin', 'kullaniciResim/user.jpg', 'false'),
('user', 'user@user.com', 'user', 'kullaniciResim/user.jpg', 'false');

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
('nevresim', 'urunResim/1nevresim.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 299.00, 21, 5, 1),
('cila', 'urunResim/1cila.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 79.00, 33, 4, 1),
('zar', 'urunResim/2zar.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 18.00, 80, 4, 2),
('defter', 'urunResim/1defter.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 46.00, 22, 3, 1),
('elbise', 'urunResim/1elbise.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 799.00, 11, 6, 1),
('flüt', 'urunResim/1flüt.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 29.00, 40, 17, 1),
('gardırop', 'urunResim/1gardırop.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 3199.00, 8, 5, 1),
('halı', 'urunResim/1halı.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 299.00, 14, 5, 1),
('yastık', 'urunResim/1yastık.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 250.00, 15, 5, 1),
('iğne', 'urunResim/1iğne.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 9.00, 77, 4, 1),
('jilet', 'urunResim/1jilet.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 19.00, 55, 4, 1),
('lamba', 'urunResim/1lamba.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 180.00, 18, 4, 1),
('maytap', 'urunResim/1maytap.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 15.00, 49, 4, 1),
('ayakkabı', 'urunResim/2ayakkabı.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 2099.00 , 20, 9, 2),
('oklava', 'urunResim/1oklava.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 20.00, 40, 1, 1),
('plak', 'urunResim/1plak.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 4999.00, 2, 2, 1),
('radyo', 'urunResim/1radyo.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 800.00, 6, 2, 1),
('silgi', 'urunResim/1silgi.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 31.00, 1, 3, 1),
('tava', 'urunResim/1tava.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 400.00, 27, 1, 1),
('un', 'urunResim/1un.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 46.00, 30, 7, 1),
('pirinç','urunResim/1pirinç.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 25.00, 54, 7, 1),
('valiz', 'urunResim/1valiz.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 280.00, 23, 4, 1),
('lastik', 'urunResim/1lastik.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 600.00, 20, 8, 1),
('jant', 'urunResim/1jant.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 1000.00, 40, 8, 1),
('gül', 'urunResim/1gül.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 20.00, 45, 10, 1),
('saksı', 'urunResim/1saksı.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 100.00, 78, 10, 1),
('papatya', 'urunResim/1papatya.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 40.00, 24, 10, 1),
('bebek bezi', 'urunResim/1bebek-bezi.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 200.00, 42, 11, 1),
('biberon', 'urunResim/1biberon.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 152.00, 37, 11, 1),
('emzik', 'urunResim/1emzik.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 49.00, 25, 11, 1),
('monster', 'urunResim/1monster.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 20000.00, 5, 12, 1),
('lenovo', 'urunResim/1lenovo.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 10000.00, 8, 12, 1),
('asus', 'urunResim/1asus.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 25000.00, 14, 12, 1),
('ampul', 'urunResim/1ampul.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 20.00, 80, 13, 1),
('pil', 'urunResim/1pil.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 27.00, 32, 13, 1),
('suç ve ceza', 'urunResim/1suç-ve-ceza.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 200.00, 50, 15, 1),
('tutunamayanlar', 'urunResim/1tutunamayanlar.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 190.00, 22, 15, 1),
('anna karenina', 'urunResim/1anna-karenina.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 180.00, 72, 15, 1),
('keman', 'urunResim/1keman.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 2500.00, 42, 17, 1),
('gitar','urunResim/1gitar.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 3300.00, 42, 17, 1),
('diş macunu', 'urunResim/1diş-macunu.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 50.00, 14, 18, 1),
('diş ipi', 'urunResim/1diş-ipi.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 20.00, 18, 18, 1),
('diş fırçası', 'urunResim/1diş-fırçası.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 59.00, 36, 18, 1),
('krem', 'urunResim/1krem.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 200.00, 78, 19, 1),
('rimel', 'urunResim/1rimel.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 290.00, 34, 19, 1),
('ruj', 'urunResim/1ruj.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat.', 280.00, 22, 19, 1);