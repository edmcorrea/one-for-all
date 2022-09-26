SELECT DISTINCT history.historico_reproducao AS nome, COUNT(history.historico_reproducao) AS "reproducoes"
FROM SpotifyClone.historicos_repr AS history
INNER JOIN SpotifyClone.usuarios AS usuario ON history.id_usuario=usuario.id_usuario
WHERE usuario.id_plano=1 OR usuario.id_plano=3
GROUP BY nome
ORDER BY nome;