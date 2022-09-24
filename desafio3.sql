SELECT usuario.nome_completo AS usuario,
COUNT(history.historico_reproducao) AS "qt_de_musicas_ouvidas",
ROUND(SUM(musicas.duracao_segundos)/60,2) AS "total_minutos"
FROM SpotifyClone.historicos_repr AS history
INNER JOIN SpotifyClone.usuarios AS usuario ON usuario.id_usuario=history.id_usuario
INNER JOIN SpotifyClone.musicas AS musicas ON musicas.id_musica=history.id_musica
GROUP BY usuario.nome_completo
ORDER BY usuario.nome_completo;