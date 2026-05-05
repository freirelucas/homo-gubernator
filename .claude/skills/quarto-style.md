# Skill: quarto-style

## Callouts
Usar com parcimônia (máx. 3 por capítulo). Tipos: note (informação adicional), tip (boa prática), warning (cuidado conceitual), caution (operação delicada), important (afirmação central).

## Cross-references
Sempre via `{#eq-...}`, `{#fig-...}`, `{#tbl-...}` e citação via `@eq-...`, `@fig-...`.

## Equações
Numerar equações *centrais* do capítulo. Não numerar manipulações intermediárias.

## Tabelas
Markdown nativo do Pandoc. Usar `:` para alinhamento. Para tabelas grandes, considerar `kable`-like via include.

## Figuras
`![Legenda formal.](caminho){#fig-rotulo fig-alt="descrição PT-BR para acessibilidade"}`

## Estilo
Sem bullet decorativo. Prosa densa. Frases curtas alternadas com longas.
