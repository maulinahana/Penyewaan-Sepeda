CREATE TABLE Customer (
    customer_id VARCHAR(15) NOT NULL,
    nik VARCHAR(20),
    nama VARCHAR(40),
    alamat VARCHAR(100),
    no_hp VARCHAR(15),
    email VARCHAR(25),
    CONSTRAINT customer_constraint PRIMARY KEY (customer_id)
);

CREATE TABLE Transaksi (
    transaksi_id VARCHAR (15) NOT NULL,
    customer_id VARCHAR(15) NOT NULL,
    sepeda_id VARCHAR(15) NOT NULL,
    total_harga NUMBER,
    waktu_sewa TIMESTAMP,
    waktu_kembali TIMESTAMP,
    tanggal_sewa DATE,
    tanggal_kembali DATE,
    CONSTRAINT transaksi_constraint PRIMARY KEY (transaksi_id)
);

CREATE TABLE Sepeda (
    sepeda_id VARCHAR(15) NOT NULL,
    status_id VARCHAR(10) NOT NULL,
    nama VARCHAR(12),
    harga_sewa NUMBER,
    gambar BLOB,
    CONSTRAINT sepeda_constraint PRIMARY KEY (sepeda_id)
);

CREATE TABLE Gambar_Sepeda (
    sepeda_id VARCHAR(15) NOT NULL,
    gambar BLOB,
    CONSTRAINT gambar_sepeda_constraint FOREIGN KEY (sepeda_id) REFERENCES Sepeda(sepeda_id)
);

CREATE TABLE Status_Sepeda (
    status_id VARCHAR(10) NOT NULL,
    status VARCHAR(20) NOT NULL,
    CONSTRAINT status_sepeda_constraint PRIMARY KEY (status_id)
);

INSERT INTO Status_Sepeda VALUES (1, 'pinjam');
INSERT INTO Status_Sepeda VALUES (2, 'tersedia');

CREATE TABLE Peminjaman (
    peminjaman_id VARCHAR(15) NOT NULL,
    customer_id VARCHAR(15) NOT NULL,
    sepeda_id VARCHAR(15) NOT NULL,
    statusp_id VARCHAR(10) NOT NULL,
    waktu_sewa TIMESTAMP,
    tanggal_sewa DATE,
    CONSTRAINT peminjaman_constraint PRIMARY KEY (peminjaman_id)
);

CREATE TABLE Status_Peminjaman (
    statusp_id VARCHAR(10) NOT NULL,
    status VARCHAR(20) NOT NULL,
    CONSTRAINT status_peminjaman_constraint PRIMARY KEY(statusp_id)
);

INSERT INTO Status_Peminjaman VALUES (1, 'pinjam');
INSERT INTO Status_Peminjaman VALUES (2, 'kembali');

ALTER TABLE Transaksi ADD CONSTRAINT transaksi_sepeda_constraint FOREIGN KEY (sepeda_id) REFERENCES Sepeda(sepeda_id);
ALTER TABLE Transaksi ADD CONSTRAINT transaksi_customer_constraint FOREIGN KEY (customer_id) REFERENCES Customer(customer_id);

ALTER TABLE Sepeda ADD CONSTRAINT sepeda_status_constraint FOREIGN KEY (status_id) REFERENCES Status_Sepeda(status_id);

ALTER TABLE Peminjaman ADD CONSTRAINT peminjaman_customer_constraint FOREIGN KEY (customer_id) REFERENCES Customer(customer_id);
ALTER TABLE Peminjaman ADD CONSTRAINT peminjaman_sepeda_constraint FOREIGN KEY (sepeda_id) REFERENCES Sepeda(sepeda_id);
ALTER TABLE Peminjaman ADD CONSTRAINT peminjaman_status_constraint FOREIGN KEY (statusp_id) REFERENCES Status_Peminjaman(statusp_id);

-- Initial Data Sample
INSERT ALL
    INTO Customer VALUES ('202021227596731', '2730212912960020', 'Setiawan Bima Hardja', 'Jl Irian 18, Gondangdia Menteng Jakarta', '0821315793041', 'setiawan1229@gmail.com')
    INTO Customer VALUES ('202051928471921', '1324511212980040', 'Raharjo Hengki Budiaman', 'Jl. Mulia IV Blok M-X No. 9 Cipondoh Makmur, Banten', '085128741520', 'raharjohb21@gmail.com')
    INTO Customer VALUES ('202028471072738', '2728291601960080', 'Adi Wibawa Widjaja', 'Jl Jend Sudirman Kav 1 Wisma 46 Kota BNI Lt 35, Dki Jakarta', '082381927361', 'adiaw19@gmail.com')
    INTO Customer VALUES ('202084787629107', '8781910811970100', 'Yuliani Dewi Sugiarto', 'Jl MH Thamrin 9 Menara Cakrawala Lt 5,Kebon Sirih', '081237424588', 'yulia0897@gmail.com')
    INTO Customer VALUES ('202082917462021', '8918670107960190', 'Ratna Devi Budiaman', 'Jl Puyuh Brt VI 9,Jurang Manggu Timur,Pondok Aren , Jakarta', '088571827477', 'ratnabudiaman@gmail.com')
SELECT * FROM dual;

INSERT ALL
    INTO Transaksi VALUES ('0101240221', '202021227596731', 'A10GZ', 10000, TO_TIMESTAMP('24/02/2021 14:15', 'DD/MM/YYYY HH24:MI'), 
        TO_TIMESTAMP('24/02/2021 13:15', 'DD/MM/YYYY HH24:MI'), TO_DATE('24/02/2021', 'DD/MM/YYYY'), TO_DATE('24/02/2021', 'DD/MM/YYYY'))
    INTO Transaksi VALUES ('0203240221', '202082917462021', 'B15UP', 45000, TO_TIMESTAMP('24/02/2021 15:00', 'DD/MM/YYYY HH24:MI'), 
        TO_TIMESTAMP('24/02/2021 17:45', 'DD/MM/YYYY HH24:MI'), TO_DATE('24/02/2021', 'DD/MM/YYYY'), TO_DATE('24/02/2021', 'DD/MM/YYYY'))
    INTO Transaksi VALUES ('0301240221', '202021227596731', 'C12HY', 12000, TO_TIMESTAMP('24/02/2021 16:25', 'DD/MM/YYYY HH24:MI'), 
        TO_TIMESTAMP('24/02/2021 17:00', 'DD/MM/YYYY HH24:MI'), TO_DATE('24/02/2021', 'DD/MM/YYYY'), TO_DATE('24/02/2021', 'DD/MM/YYYY'))
    INTO Transaksi VALUES ('0302250221', '202051928471921', 'C12HY', 24000, TO_TIMESTAMP('25/02/2021 07:20', 'DD/MM/YYYY HH24:MI'), 
        TO_TIMESTAMP('25/02/2021 09:03', 'DD/MM/YYYY HH24:MI'), TO_DATE('25/02/2021', 'DD/MM/YYYY'), TO_DATE('25/02/2021', 'DD/MM/YYYY'))
    INTO Transaksi VALUES ('0303250221', '202082917462021', 'C12HY', 36000, TO_TIMESTAMP('25/02/2021 15:15', 'DD/MM/YYYY HH24:MI'), 
        TO_TIMESTAMP('25/02/2021 18:00', 'DD/MM/YYYY HH24:MI'), TO_DATE('25/02/2021', 'DD/MM/YYYY'), TO_DATE('25/02/2021', 'DD/MM/YYYY'))
    INTO Transaksi VALUES ('0101250221', '202082917462021', 'A10GZ', 10000, TO_TIMESTAMP('25/02/2021 16:20', 'DD/MM/YYYY HH24:MI'), 
        TO_TIMESTAMP('25/02/2021 17:20', 'DD/MM/YYYY HH24:MI'), TO_DATE('25/02/2021', 'DD/MM/YYYY'), TO_DATE('25/02/2021', 'DD/MM/YYYY'))
    INTO Transaksi VALUES ('0202260221', '202084787629107', 'B15UP', 30000, TO_TIMESTAMP('26/02/2021 06:00', 'DD/MM/YYYY HH24:MI'), 
        TO_TIMESTAMP('25/02/2021 08:00', 'DD/MM/YYYY HH24:MI'), TO_DATE('26/02/2021', 'DD/MM/YYYY'), TO_DATE('26/02/2021', 'DD/MM/YYYY'))
    INTO Transaksi VALUES ('0201260221', '202028471072738', 'B15UP', 15000, TO_TIMESTAMP('26/02/2021 07:20', 'DD/MM/YYYY HH24:MI'), 
        TO_TIMESTAMP('25/02/2021 08:20', 'DD/MM/YYYY HH24:MI'), TO_DATE('26/02/2021', 'DD/MM/YYYY'), TO_DATE('26/02/2021', 'DD/MM/YYYY'))
SELECT * FROM dual;

INSERT ALL
    INTO Sepeda VALUES ('A10GZ', '1', 'U Monanza 4', 10000, NULL)
    INTO Sepeda VALUES ('B15UP', '2', 'U Detroit 1', 15000, NULL)
    INTO Sepeda VALUES ('C12HY', '2', 'Genio M-345', 12000, NULL)
SELECT * FROM dual;

-- Database Feature
CREATE TRIGGER SelesaiPeminjaman
AFTER INSERT ON Transaksi
FOR EACH ROW
BEGIN
    DELETE FROM Peminjaman p WHERE p.peminjaman_id = :new.transaksi_id;
END;

CREATE OR REPLACE PROCEDURE TotalSewa (tr_id VARCHAR) 
IS
    start_time Transaksi.waktu_sewa%TYPE;
    stop_time Transaksi.waktu_kembali%TYPE;
    durasi_jam NUMBER;
    durasi_menit NUMBER;
    harga_per_jam NUMBER;
BEGIN
    SELECT waktu_sewa, waktu_kembali
    INTO start_time, stop_time
    FROM Transaksi
    WHERE transaksi_id = tr_id;

    SELECT EXTRACT(HOUR FROM diff), EXTRACT(MINUTE FROM diff)
    INTO durasi_jam, durasi_menit
    FROM (SELECT (stop_time - start_time) diff FROM dual);

    IF (durasi_menit >= 10) THEN
        durasi_jam := durasi_jam + 1;
    END IF;

    SELECT harga_sewa
    INTO harga_per_jam
    FROM (SELECT harga_sewa FROM Sepeda WHERE sepeda_id = (
        SELECT sepeda_id FROM Transaksi WHERE transaksi_id = tr_id));

    UPDATE Transaksi t SET t.total_harga = harga_per_jam * durasi_jam WHERE t.transaksi_id = tr_id;

    htp.p('Durasi dalam Jam: ' || durasi_jam || ', dengan harga: ' || harga_per_jam * durasi_jam);
END;

UPDATE Transaksi t SET t.total_harga = NULL WHERE transaksi_id = '0302250221';

-- Test Sample
BEGIN
    TotalSewa('0302250221');
END;

INSERT INTO Peminjaman VALUES ('12345678', '202028471072738', 'A10GZ', '2', TO_TIMESTAMP('26/02/2021 15:00', 'DD/MM/YYYY HH24:MI'), TO_DATE('26/02/2021', 'DD/MM/YYYY'));
INSERT INTO Transaksi VALUES ('12345678', '202028471072738', 'A10GZ', NULL, TO_TIMESTAMP('26/02/2021 15:00', 'DD/MM/YYYY HH24:MI'), 
    TO_TIMESTAMP('26/02/2021 17:00', 'DD/MM/YYYY HH24:MI'), TO_DATE('26/02/2021', 'DD/MM/YYYY'), TO_DATE('26/02/2021', 'DD/MM/YYYY'))