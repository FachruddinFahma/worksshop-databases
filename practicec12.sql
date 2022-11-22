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

-- Menampilkan nama dosen, nama jurusan, jumlah mata kuliah dari masingmasing dosen pada setiap jurusan.
SELECT dosen.nama_dosen, jurusan.nama_jur,
    -> COUNT(mata_kuliah.kode_mk) AS jumlah_mk
    -> FROM mata_kuliah, dosen, jurusan
    -> WHERE mata_kuliah.nip = dosen.nip
    -> AND mata_kuliah.kode_jur = jurusan.kode_jur
    -> GROUP BY dosen.nama_dosen, jurusan.nama_jur;