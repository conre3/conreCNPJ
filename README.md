[![Travis-CI Build Status](https://travis-ci.org/conre3/conreCNPJ.svg?branch=master)](https://travis-ci.org/conre3/conreCNPJ)[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/conre3/conreCNPJ?branch=master&svg=true)](https://ci.appveyor.com/project/conre3/conreCNPJ)

# conreCNPJ

Scraper de informações de empresas cadastradas nos Conselhos Regionais de Estatística. Só funciona para as regiões 3 e 6, que são as únicas que
disponibilizam dados de CNPJ publicamente.

# Utilização

```
if (!require(devtools)) install.packages('devtools')
devtools::install_github('conre3/conreCNPJ')

library(conreCNPJ)
conre3 <- conre_get_cnpj(region = 3)
conre6 <- conre_get_cnpj(region = 6)
```

```
knitr::kable(head(conre3))
```

|empresa                                            |uf |cnpj           |
|:--------------------------------------------------|:--|:--------------|
|A F C – CONSULTORIA E ASSISTÊNCIA ESTATÍSTICA      |SP |04339846000101 |
|A Y TANAKA PESQUISA E CONSULTORIA ESTATISTICA – ME |SP |20813593000112 |
|A. C. NIELSEN DO BRASIL LTDA                       |SP |33000159000165 |
|A. F. BARBOSA E CIA LTDA – ME                      |MS |06270812000133 |
|A.R. DE MOURA E CIA LTDA EPP                       |PR |04982801000150 |
|AC STATPLUS CONSULTORIA DE ESTATÍSTICA LTDA        |SP |09027925000109 |

```
knitr::kable(head(conre6))
```

|empresa                                                |uf |cnpj           |
|:------------------------------------------------------|:--|:--------------|
|ABG CONSULTORIA ESTATÍSTICA LTDA - ME                  |MG |11097313000126 |
|AJE CONSULTORIA E ASSESSORIA EMPRESARIAL - EIRELI - ME |MG |16715396000193 |
|ANALYSIS - SOLUÇÕES EM ESTATÍSTICA LTDA - ME           |MG |10327675000101 |
|APONTE DADOS PESQUISA E CONSULTORIA LTDA - ME          |MG |15428156000145 |
|BOAS & BOAS CONSULTORIA E PESQUISAS LTDA - ME          |MG |01269029000136 |
|BRUNA CARLA DA SILVA MOREIRA - ME                      |MG |25291235000100 |

# Licença

MIT
