USE projectdb;
 
CREATE TABLE IF NOT EXISTS kategoriler (
    urunKategori_id INT AUTO_INCREMENT PRIMARY KEY,
    urunKategori_ad VARCHAR(255) NOT NULL
) ENGINE=INNODB;

INSERT INTO kategoriler (urunKategori_ad) VALUES
 ('Mutfak'), ('Teknoloji'), ('Kırtasiye'), ('Eşya'), ('Ev'), ('Giyim'), ('Yemek');