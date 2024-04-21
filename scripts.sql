-- 1.2 Escreva um cursor que exibe todos os nomes dos youtubers em ordem reversa. Para tal
-- - O SELECT deverá ordenar em ordem não reversa
-- - O Cursor deverá ser movido para a última tupla
-- - Os dados deverão ser exibidos de baixo para cima
DO $$
	DECLARE
	cur_reverse REFCURSOR;
	tupla RECORD;
	BEGIN
		OPEN cur_reverse SCROLL FOR
			SELECT youtuber
			FROM tb_youtubers
			ORDER BY youtuber;
		MOVE LAST FROM cur_reverse;
	LOOP
		FETCH BACKWARD FROM cur_reverse INTO tupla;
		EXIT WHEN NOT FOUND;
		RAISE NOTICE '%', tupla.youtuber;
	END LOOP;
	CLOSE cur_reverse;
END;
$$

