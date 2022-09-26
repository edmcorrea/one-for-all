SELECT musica.musica AS nome_musica,
    CASE
        WHEN musica.musica LIKE '%Bard%' THEN REPLACE('The Bard’s Song', 'Bard', 'QA')
		    WHEN musica.musica LIKE '%Amar%' THEN REPLACE('O Medo de Amar é o Medo de Ser Livre', 'Amar', 'Code Review')
        WHEN musica.musica LIKE '%Pais%' THEN REPLACE('Como Nossos Pais', 'Pais', 'Pull Requests')
        WHEN musica.musica LIKE '%SOUL%' THEN REPLACE('BREAK MY SOUL', 'SOUL', 'CODE')
        WHEN musica.musica LIKE '%SUPERSTAR%' THEN REPLACE('ALIEN SUPERSTAR', 'SUPERSTAR', 'SUPERDEV')
        ELSE NULL
    END AS novo_nome
FROM SpotifyClone.musicas AS musica
ORDER BY novo_nome desc
LIMIT 5;