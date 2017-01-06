#' Download CONRE registered companies
#'
#' Downloads CONRE registered companies from CONRE sites.
#'
#' @param region CONRE region from 1 to 6.
#'
#' @return \code{tibble} with 2 columns (name, state and id) as specified in the saved
#'   datasets.
#'
#' @seealso \code{\link{conre3}}, \code{\link{conre6}}
#'
#' @export
conre_get_cnpj <- function(region = 3) {
  if (!region %in% 1:6 || length(region) != 1) stop('Region must be a number from 1 to 6.')
  if (region == 1) {
    stop('This region does not provide a public list.')
  } else if (region == 2) {
    stop('This region does not provide a public list.')
  } else if (region == 3) {
    get_conre3_companies()
  } else if (region == 4) {
    stop('This region does not provide a public list.')
  } else if (region == 5) {
    stop('This region does not provide a public list with CNPJ.')
  } else if (region == 6) {
    get_conre6_companies()
  }
}

get_conre3_companies <- function() {
  u <- 'http://www.conre3.org.br/portal/profissionais-e-empresas-do-conre-3-2'
  tab <- u %>%
    httr::GET() %>%
    xml2::read_html() %>%
    rvest::html_node('#tab-02 > table') %>%
    rvest::html_table(header = TRUE) %>%
    tibble::as_tibble() %>%
    janitor::clean_names() %>%
    purrr::set_names(abjutils::rm_accent(names(.))) %>%
    dplyr::mutate(cnpj = stringr::str_replace_all(cnpj, '[^0-9]', '')) %>%
    dplyr::select(empresa = 1, uf = 2, cnpj = 3)
  tab
}

get_conre6_companies <- function() {
  estados <- stringr::str_c(c("AC", "AL", "AM", "AP", "BA",
                              "CE", "DF", "ES", "GO", "MA",
                              "MG", "MS", "MT", "PA", "PB",
                              "PE", "PI", "PR", "RJ", "RN",
                              "RO", "RR", "RS", "SC", "SE",
                              "SP", "TO"), collapse = '|\t')
  u <- 'http://www.conre6.org.br/downloads/PESSOA%20JUR%C3%8DDICA%2003.01.17.pdf'
  re <- '^([^\t]+)\t.*(%s).*([0-9]{2}\\.[0-9]{3}\\.[0-9]{3}/[0-9]{4}-[0-9]{2})'
  re <- sprintf(re, estados)
  r <- httr::GET(u)
  r %>%
    httr::content() %>%
    pdftools::pdf_text() %>%
    stringr::str_replace_all('[[:space:]]{2,}', '\t') %>%
    stringr::str_split('\n', simplify = TRUE) %>%
    stringr::str_match_all(re) %>%
    {do.call(rbind, .)} %>%
    tibble::as_tibble() %>%
    dplyr::select(empresa = 2, uf = 3, cnpj = 4) %>%
    dplyr::mutate(cnpj = stringr::str_replace_all(cnpj, '[^0-9]', ''),
                  uf = stringr::str_trim(uf))
}
