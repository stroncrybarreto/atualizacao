select 
  distinct
  n.grid,
  n.mlid,
  nfts.nome as situacao
  
  (
		(
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