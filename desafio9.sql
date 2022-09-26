SELECT COUNT(usuario.nome_completo) AS "quantidade_musicas_no_historico"
FROM SpotifyClone.usuarios AS usuario
INNER JOIN SpotifyClone.historicos_repr AS history ON history.id_usuario=usuario.id_usuario
WHERE usuario.nome_completo="Barbara Liskov";