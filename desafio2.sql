SELECT COUNT(DISTINCT musica) AS cancoes, COUNT(DISTINCT artista) AS artistas, COUNT(DISTINCT album) AS albuns
FROM SpotifyClone.musicas, SpotifyClone.artistas, SpotifyClone.albuns;