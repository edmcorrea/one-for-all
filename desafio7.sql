SELECT artista.artista, album.album, COUNT(seguindo.id_artista) AS 'seguidores'
FROM SpotifyClone.artistas AS artista
INNER JOIN SpotifyClone.albuns AS album ON artista.id_artista=album.id_artista
INNER JOIN SpotifyClone.seguindo_artista AS seguindo ON artista.id_artista=seguindo.id_artista
GROUP BY album.id_album
ORDER BY seguidores DESC, artista, album;