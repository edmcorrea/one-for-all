SELECT SUBSTRING(0.00, 1, 4) AS "faturamento_minimo", SUBSTRING(MAX(plano.valor), 1, 4) AS "faturamento_maximo",
SUBSTRING(AVG(plano.valor), 1, 4) AS "faturamento_medio", SUBSTRING(SUM(plano.valor), 1, 5) AS "faturamento_total"
FROM SpotifyClone.usuarios AS usuario
INNER JOIN SpotifyClone.planos AS plano ON plano.id_plano=usuario.id_plano;