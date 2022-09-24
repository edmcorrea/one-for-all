SELECT usuario.nome_completo AS usuario,
IF(MAX(history.data_reproducao)>='2021-01-01', 'Usuário ativo', 'Usuário inativo') AS "status_usuario"
FROM SpotifyClone.historicos_repr AS history
INNER JOIN SpotifyClone.usuarios AS usuario ON usuario.id_usuario=history.id_usuario
GROUP BY usuario.nome_completo
ORDER BY usuario.nome_completo;