USE testdb;

CREATE TABLE IF NOT EXISTS urunler (
    urun_no INT AUTO_INCREMENT PRIMARY KEY,
    urun_adi VARCHAR(255) NOT NULL,
    urun_stok INT DEFAULT 100
) ENGINE=INNODB;

INSERT INTO urunler (urun_adi, urun_stok) VALUES
('Ayakkabı',100),
('Bilgisayar',100),
('Cila',100),
('Çilek',100),
('Defter',100),
('Elbise',100),
('Fülüt',100),
('Gardırop',100),
('Halı',100),
('İğne',100),
('Jilet',100),
('Kitap',100),
('Lamba',100),
('Maytap',100),
('Nevresim',100),
('Oklava',100),
('Örtü',100),
('Plak',100),
('Radyo',100),
('Silgi',100),
('Şemsiye',100),
('Tava',100),
('Un',100),
('Ütü',100),
('Valiz',100),
('Yastık',100),
('Zar',100);