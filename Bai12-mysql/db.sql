-- phim
-- the_loai
-- quoc_gia
-- dien_vien
-- dao_dien
-- tap_phim
-- nguoi_dung

-- table Nguoi dung
CREATE TABLE nguoi_dung(
id int AUTO_INCREMENT PRIMARY KEY,
ten_dang_nhap varchar(30) NOT NULL,
mat_khau varchar(30) NOT NULL,
email varchar(50) NOT NULL,
ho_ten varchar(40) NOT NULL,
ngay_sinh date NOT NULL,
so_dien_thoai varchar(10) NOT NULL,
gioi_tinh boolean NOT NULL
)    

CREATE TABLE the_loai (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ten_the_loai VARCHAR(255) NOT NULL
);

CREATE TABLE dien_vien (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ho_ten VARCHAR(100) NOT NULL,
    ngay_sinh DATE
);

CREATE TABLE dao_dien (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ho_ten VARCHAR(100) NOT NULL,
    ngay_sinh DATE
);

CREATE TABLE phim (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ten_phim VARCHAR(255) NOT NULL,
    quoc_gia VARCHAR(100),
    dao_dien_id INT,
    nam YEAR,
    do_tuoi INT,
    mo_ta VARCHAR(255),

    FOREIGN KEY (dao_dien_id)
    REFERENCES dao_dien(id)
);

CREATE TABLE phim_the_loai (
    id INT AUTO_INCREMENT PRIMARY KEY,
    phim_id INT NOT NULL,
    the_loai_id INT NOT NULL,

    FOREIGN KEY (phim_id)
    REFERENCES phim(id),

    FOREIGN KEY (the_loai_id)
    REFERENCES the_loai(id),

    UNIQUE (phim_id, the_loai_id)
);

CREATE TABLE phim_dien_vien (
    id INT AUTO_INCREMENT PRIMARY KEY,
    phim_id INT NOT NULL,
    dien_vien_id INT NOT NULL,

    FOREIGN KEY (phim_id)
    REFERENCES phim(id),

    FOREIGN KEY (dien_vien_id)
    REFERENCES dien_vien(id),

    UNIQUE (phim_id, dien_vien_id)
);


--dao_dien
INSERT INTO `dao_dien`(`ho_ten`, `ngay_sinh`) VALUES ('Nguyễn Văn A','1999-01-01');
INSERT INTO `dao_dien`(`ho_ten`, `ngay_sinh`) VALUES ('Lương Văn B','1998-01-01');
INSERT INTO `dao_dien`(`ho_ten`, `ngay_sinh`) VALUES ('Trần Văn C','1997-01-01');
INSERT INTO `dao_dien`(`ho_ten`, `ngay_sinh`) VALUES ('Lê Văn D','1996-01-01');
INSERT INTO `dao_dien`(`ho_ten`, `ngay_sinh`) VALUES ('Bùi Văn H','1995-01-01');

--phim
INSERT INTO `phim`(`ten_phim`, `quoc_gia`, `nam`, `do_tuoi`, `dao_dien_id`) VALUES ('Thỏ Ơi','Việt Nam','2025','16', 1);
INSERT INTO `phim`(`ten_phim`, `quoc_gia`, `nam`, `do_tuoi`, `dao_dien_id`) VALUES ('Bố Già','Việt Nam','2024','16',2);
INSERT INTO `phim`(`ten_phim`, `quoc_gia`, `nam`, `do_tuoi`, `dao_dien_id`) VALUES ('Đèn Ăn Hồn','Việt Nam','2023','16',3);
INSERT INTO `phim`(`ten_phim`, `quoc_gia`, `nam`, `do_tuoi`, `dao_dien_id`) VALUES ('Quỷ Ăn Hồn','Việt Nam','2022','16',4);
INSERT INTO `phim`(`ten_phim`, `quoc_gia`, `nam`, `do_tuoi`, `dao_dien_id`) VALUES ('Giag Hồ Chợ Mới','Việt Nam','2021','16',5);

--phim_the_loai
INSERT INTO `phim_the_loai`(`phim_id`,`the_loai_id`) VALUES (1, 1);
INSERT INTO `phim_the_loai`(`phim_id`,`the_loai_id`) VALUES (1, 2);
INSERT INTO `phim_the_loai`(`phim_id`,`the_loai_id`) VALUES (2, 1);
INSERT INTO `phim_the_loai`(`phim_id`,`the_loai_id`) VALUES (3, 2);
INSERT INTO `phim_the_loai`(`phim_id`,`the_loai_id`) VALUES (2, 5);
INSERT INTO `phim_the_loai`(`phim_id`,`the_loai_id`) VALUES (4, 3);

--phim_dien_vien
INSERT INTO `phim_dien_vien`(`phim_id`, `dien_vien_id`) VALUES (1,2);
INSERT INTO `phim_dien_vien`(`phim_id`, `dien_vien_id`) VALUES (3,2);
INSERT INTO `phim_dien_vien`(`phim_id`, `dien_vien_id`) VALUES (2,3);
INSERT INTO `phim_dien_vien`(`phim_id`, `dien_vien_id`) VALUES (2,4);
INSERT INTO `phim_dien_vien`(`phim_id`, `dien_vien_id`) VALUES (5,4);
INSERT INTO `phim_dien_vien`(`phim_id`, `dien_vien_id`) VALUES (3,4);

--nguoi_dung
INSERT INTO `nguoi_dung`(`ten_dang_nhap`, `mat_khau`, `email`, `ho_ten`, `ngay_sinh`, `so_dien_thoai`, `gioi_tinh`) VALUES ('abc123','xyz456','abc123@gmail.com','Nguyễn Văn Hùng','2004-01-24','0999999999',0);