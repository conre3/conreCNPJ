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

# Licença

MIT
