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