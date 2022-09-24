DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.planos(
      id_plano INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      plano VARCHAR(15) NOT NULL,
      valor DOUBLE NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.assinatura(
      id_assinatura INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      data_assinatura DATETIME NOT NULL,
      id_plano INT NOT NULL,
      FOREIGN KEY (id_plano) REFERENCES planos (id_plano)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.usuarios(
      id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      nome_completo VARCHAR(50) NOT NULL,
      idade INT NOT NULL,
      id_assinatura INT NOT NULL,
      id_plano INT NOT NULL,
      FOREIGN KEY (id_plano) REFERENCES planos (id_plano),
      FOREIGN KEY (id_assinatura) REFERENCES assinatura (id_assinatura)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artistas(
      id_artista INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      artista VARCHAR(20) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.albuns(
      id_album INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      album VARCHAR(30) NOT NULL,
      ano_lancamento INT NOT NULL,
      id_artista INT NOT NULL,
      FOREIGN KEY (id_artista) REFERENCES artistas (id_artista)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.musicas(
      id_musica INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      musica VARCHAR(50) NOT NULL,
      duracao_segundos INT NOT NULL,
      id_album INT,
      FOREIGN KEY (id_album) REFERENCES albuns (id_album)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.historicos_repr(
      historico_reproducao VARCHAR(50) NOT NULL,
      data_reproducao DATETIME NOT NULL,
      id_musica INT NOT NULL,
      id_usuario INT NOT NULL,
      CONSTRAINT PRIMARY KEY(id_usuario, id_musica),
      FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario),
      FOREIGN KEY (id_musica) REFERENCES musicas (id_musica)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.seguindo_artista(
      id_artista INT NOT NULL,
      id_usuario INT NOT NULL,
      CONSTRAINT PRIMARY KEY(id_artista, id_usuario),
      FOREIGN KEY (id_artista) REFERENCES artistas (id_artista),
      FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.planos (plano, valor)
  VALUES
    ("gratuito", 0.00),
    ("universitário", 5.99),
    ("pessoal", 6.99),
    ("familiar", 7.99);

  INSERT INTO SpotifyClone.assinatura (data_assinatura, id_plano)
  VALUES
    ("2019-10-20", 1),
    ("2017-01-06", 1),
    ("2017-12-30", 4),
    ("2017-01-17", 4),
    ("2018-04-29", 4),
    ("2018-02-14", 2),
    ("2018-01-05", 2),
    ("2019-06-05", 3),
    ("2020-05-13", 3),
    ("2017-02-17", 3);

  INSERT INTO SpotifyClone.usuarios (nome_completo, idade, id_assinatura, id_plano)
  VALUES
    ("Barbara Liskov", 82, 1, 1),
    ("Robert Cecil Martin", 58, 2, 1),
    ("Ada Lovelace", 37, 3, 4),
    ("Martin Fowler", 46, 4, 4),
    ("Sandi Metz", 58, 5, 4),
    ("Paulo Freire", 19, 6, 2),
    ("Bell Hooks", 26, 7, 2),
    ("Christopher Alexander", 85, 8, 3),
    ("Judith Butler", 45, 9, 3),
    ("Jorge Amado", 58, 10, 3);

  INSERT INTO SpotifyClone.artistas (artista)
  VALUES
    ("Beyoncé"),
    ("Queen"),
    ("Elis Regina"),
    ("Baco Exu do Blues"),
    ("Blind Guardian"),
    ("Nina Simone");

  INSERT INTO SpotifyClone.albuns (album, ano_lancamento, id_artista)
  VALUES
    ("Renaissance", 2022, 1),
    ("Jazz", 1978, 2),
    ("Hot Space", 1982, 2),
    ("Falso Brilhante", 1998, 3),
    ("Vento de Maio", 2001, 3),
    ("QVVJFA?", 2003, 4),
    ("Somewhere Far Beyond", 2007, 5),
    ("I Put A Spell On You", 2012, 6);

  INSERT INTO SpotifyClone.musicas (musica, duracao_segundos, id_album)
  VALUES
      ("BREAK MY SOUL", 279, 1),
      ("VIRGOS GROOVE", 369, 1),
      ("ALIEN SUPERSTAR", 116, 1),
      ("Dont Stop Me Now", 203, 2),
      ("Under Pressure", 152, 3),
      ("Como Nossos Pais", 105, 4),
      ("O Medo de Amar é o Medo de Ser Livre", 207, 5),
      ("Samba em Paris", 267, 6),
      ("The Bards Song", 244, 7),
      ("Feeling Good", 100, 8);

  INSERT INTO SpotifyClone.historicos_repr (historico_reproducao, data_reproducao, id_musica, id_usuario)
  VALUES
    ( "Samba em Paris", "2022-02-28 10:45:55", 8, 1),
    ( "VIRGOS GROOVE", "2020-05-02 05:30:35", 2, 1),
    ( "Feeling Good", "2020-03-06 11:22:33", 10, 1),
    ( "Feeling Good", "2022-08-05 08:05:17", 10, 2),
    ( "O Medo de Amar é o Medo de Ser Livre", "2020-01-02 07:40:33", 7, 2),
    ( "Feeling Good", "2020-11-13 16:55:13", 10, 3),
    ( "VIRGOS GROOVE", "2020-12-05 18:38:30", 2, 3),
    ( "Samba em Paris", "2021-08-15 17:10:10", 8, 4),
    ( "Samba em Paris", "2022-01-09 01:44:33", 8, 5),
    ( "Under Pressure", "2020-08-06 15:23:43", 5, 5),
    ( "O Medo de Amar é o Medo de Ser Livre", "2017-01-24 00:31:17", 7, 6),
    ( "BREAK MY SOUL", "2017-10-12 12:35:20", 1, 6),
    ( "Dont Stop Me Now", "2011-12-15 22:30:49", 4, 7),
    ( "Dont Stop Me Now", "2012-03-17 14:56:41", 4, 8),
    ( "The Bards Song", "2022-02-24 21:14:22", 9, 9),
    ( "ALIEN SUPERSTAR", "2015-12-13 08:30:22", 3, 10);

  INSERT INTO SpotifyClone.seguindo_artista (id_usuario, id_artista)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);
