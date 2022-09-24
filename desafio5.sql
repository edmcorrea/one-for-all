SELECT DISTINCT(historico_reproducao) AS cancao,
COUNT(historico_reproducao) AS reproducoes
FROM SpotifyClone.historicos_repr
GROUP BY historico_reproducao
ORDER BY reproducoes DESC, cancao
LIMIT 2;