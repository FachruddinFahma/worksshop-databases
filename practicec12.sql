-- Menampilkan kode matakuliah, nama matakuliah, nama jurusan, nama dosen
-- dan diurutkan berdasarkan nama dosen yang paling awal
SELECT mata_kuliah.kode_mk, mata_kuliah.nama_mk,
    -> jurusan.nama_jur, dosen.nama_dosen
    -> FROM mata_kuliah, jurusan, dosen
    -> WHERE mata_kuliah.kode_jur = jurusan.kode_jur
    -> AND mata_kuliah.nip = dosen.nip
    -> ORDER BY dosen.nama_dosen ASC;

-- Menampilkan nim, nama mahasiswa, alamat, nama jurusan, nama dosen dan
-- diurutkan dari nama jurusan terakhir
SELECT mhs.nim, mhs.nama_mhs, mhs.alamat,
    -> jurusan.nama_jur, dosen.nama_dosen
    -> FROM mhs, jurusan, dosen
    -> WHERE mhs.kode_jur = jurusan.kode_jur
    -> AND mhs.nip = dosen.nip
    -> ORDER BY jurusan.nama_jur DESC;

-- Menampilkan nama jurusan, nama dosen, jumlah mahasiswa dari setiap dosen
-- pada masing-masing jurusan
SELECT jurusan.nama_jur, dosen.nama_dosen,
    -> COUNT(mhs.nim) AS jml_mhs
    -> FROM jurusan, mhs, dosen
    -> WHERE jurusan.kode_jur = mhs.kode_jur
    -> AND dosen.nip = mhs.nip
    -> GROUP BY jurusan.nama_jur, dosen.nama_dosen;

-- Menampilkan nama dosen, nama jurusan, jumlah mata kuliah dari masingmasing 
-- dosen pada setiap jurusan.
SELECT dosen.nama_dosen, jurusan.nama_jur,
    -> COUNT(mata_kuliah.kode_mk) AS jumlah_mk
    -> FROM mata_kuliah, dosen, jurusan
    -> WHERE mata_kuliah.nip = dosen.nip
    -> AND mata_kuliah.kode_jur = jurusan.kode_jur
    -> GROUP BY dosen.nama_dosen, jurusan.nama_jur;

-- Menampilkan nama dosen, nama jurusan, jumlah total sks dari masing-masing
-- dosen pada setiap jurusan
SELECT dosen.nama_dosen, jurusan.nama_jur,
    -> SUM(mata_kuliah.sks) AS jml_sks
    -> FROM mata_kuliah, dosen, jurusan
    -> WHERE mata_kuliah.nip = dosen.nip
    -> AND mata_kuliah.kode_jur = jurusan.kode_jur
    -> GROUP BY dosen.nama_dosen, jurusan.nama_jur;

-- Menampilkan nama dosen, nama jurusan, jumlah total sks dari masing-masing
-- dosen pada setiap jurusan. Dimana akan menampilkan jumlah total sks antara
-- 5 dan 12, serta diurutkan dari jumlah sks paling banyak.
SELECT dosen.nama_dosen, jurusan.nama_jur,
    -> SUM(mata_kuliah.sks) AS jml_sks
    -> FROM mata_kuliah, dosen, jurusan
    -> WHERE mata_kuliah.nip = dosen.nip
    -> AND mata_kuliah.kode_jur = jurusan.kode_jur
    -> GROUP BY dosen.nama_dosen, jurusan.nama_jur
    -> HAVING jml_sks BETWEEN 5 AND 12
    -> ORDER BY jml_sks DESC;

-- Menampilkan kode krs, tanggal krs, nama jurusan, nama mahasiswa,
-- jumlah sks dan diurutkan berdasarkan jumlah terbesar.
SELECT krs.kode_krs, krs.tanggal_krs,
    -> mhs.nama_mhs, krs.jumlah_sks
    -> FROM krs JOIN jurusan
    -> ON krs.kode_jur = jurusan.kode_jur
    -> JOIN mhs
    -> ON krs.nim = mhs.nim
    -> ORDER BY krs.jumlah_sks DESC;

-- Menampilkan kode krs, tanggal krs, hari, jam, nama matakuliah dan
-- diurutkan berdasarkan hari yang paling awal.
SELECT krs.kode_krs, krs.tanggal_krs,
    -> detail_krs.hari, detail_krs.jam, mata_kuliah.nama_mk
    -> FROM krs JOIN detail_krs
    -> ON krs.kode_krs = detail_krs.kode_krs
    -> JOIN mata_kuliah
    -> ON krs.kode_jur = mata_kuliah.kode_jur
    -> ORDER BY detail_krs.hari ASC;