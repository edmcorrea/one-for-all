SELECT C.cancao AS nome_musica,
    CASE
        WHEN C.cancao LIKE '%Bard%' THEN REPLACE('The Bard’s Song', 'Bard', 'QA')
		    WHEN C.cancao LIKE '%Amar%' THEN REPLACE('O Medo de Amar é o Medo de Ser Livre', 'Amar', 'Code Review')
        WHEN C.cancao LIKE '%Pais%' THEN REPLACE('Como Nossos Pais', 'Pais', 'Pull Requests')
        WHEN C.cancao LIKE '%SOUL%' THEN REPLACE('BREAK MY SOUL', 'SOUL', 'CODE')
        WHEN C.cancao LIKE '%SUPERSTAR%' THEN REPLACE('ALIEN SUPERSTAR', 'SUPERSTAR', 'SUPERDEV')
        ELSE NULL
    END AS novo_nome
FROM SpotifyClone.cancao C
order by novo_nome desc
LIMIT 5;