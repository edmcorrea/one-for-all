SELECT artista.artista, album.album
FROM SpotifyClone.artistas AS artista
INNER JOIN SpotifyClone.albuns AS album ON artista.id_artista=album.id_artista
WHERE artista.artista="Elis Regina"
ORDER BY album;