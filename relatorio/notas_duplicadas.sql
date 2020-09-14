select 
  distinct
  n.grid,
  n.mlid,  modelo,  serie,  numero_nota,   data_emissao,   n.nome,   valor_nota,   valor_icms,
  nfts.nome as situacao
    from nota_fiscal n  join nota_fiscal_situacao nfs on (n.grid = nfs.nota_fiscal)  join nota_fiscal_tipo_situacao nfts on (nfs.situacao=nfts.codigo)  where   --nfs.situacao = 310 and  n.mlid in 
  (		select mlid from 
		(			select 				count(*),				mlid 			from nota_fiscal n				join nota_fiscal_situacao nfs on (n.grid = nfs.nota_fiscal)
			where 1=1
			and n.empresa = 11156
			and n.data_emissao between '2020-02-01' and '2020-02-29' 
			and n.tipo = 'S'
			and n.cfop not in ('5.929', '5.949')
			and n.caixa_conta is not null
			and n.situacao = 'E'
			--and nfs.situacao = 310
			group by n.mlid
		)
		temp where count > 1
	) 
	order by mlid, modelo   