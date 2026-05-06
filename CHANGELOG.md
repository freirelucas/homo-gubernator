# CHANGELOG

Todas as mudanças relevantes desde o bootstrap. Formato baseado em [Keep a Changelog](https://keepachangelog.com/), versionamento semântico simplificado.

## [v1.0] — 2026-05-06

### Plataforma de estudo autônomo

Primeira versão oficial. Site renderizado em <https://freirelucas.github.io/homo-gubernator/>.

#### Argumentação editorial (S1–S3)

- **Adicionado** `metatexto/viable-os.qmd` — argumento ViableOS explícito, com tabela tripla de recursões e quatro afirmações operacionais.
- **Adicionado** `como-estudar.qmd` — camada operacional do estudo autônomo, fluxo semanal detalhado, seis modos de Claude Code, critérios de auto-avaliação 1-5, três disparadores algedônicos.
- **Adicionado** `recursos/index.qmd` — IMPA YouTube (Marcelo Viana — Tópicos de Sistemas Dinâmicos 2014, CBMs 28-34), Probabilidade/Markov (MIT 6.041, Francisco Rodrigues, Izbicki), SD (MIT 15.871 com Sterman, PySD), VSM (Metaphorum, ASC, Espinosa-Walker, Espejo-Reyes, Beer original), EaD/UniRede/ESUD, comunidades, lacunas honestas.

#### Capítulos-âncora finais (S4–S5)

- **Expandido** `fase-04-sintese/01-vsm-ashby-beer/intro.qmd` de 1.500 para 3.000 palavras, com seções novas sobre variantes contemporâneas de VSM (Espinosa-Walker, Espejo-Reyes, Schwaninger), Conant-Ashby formalizado com leitura de homomorfismo, e tabela de três colunas (descrição clássica vs descrição cibernética vs regulação Conant-Ashby).
- **Expandido** `fase-04-sintese/02-bacia-formoso-caso/intro.qmd` de 600 para 2.500 palavras, com pesquisa documental sobre ACP nº 001070-72.2016.8.27.2716, GAN (Projeto de Gestão de Alto Nível), diagnóstico VSM em recursão tripla, paralelo institucional explícito com pesquisa-cenário UAB-UNITINS, três perguntas de verificação (factual, diagnóstica, propositiva), caveats explícitos onde fontes são secundárias.

#### Polish editorial (S6–S7)

- **Adicionadas** três figuras SVG do capítulo F1-01: bacia de potencial, retrato de fase 1D, carregamento RC. Inseridas no `intro.qmd` com legendas formais e `fig-alt` em PT-BR.
- **Auditoria de citações**: corrigida `[@impabr]` (escape em link), adicionada entrada `@brin1998` à bibliografia, reformulada referência ao PageRank em F2-05.

#### Estrutura navegacional (S8)

- **Reorganizada** sidebar de `_quarto.yml`: agora exibe "Semanas 1-24" como título principal, com seções por fase contendo cada semana rotulada explicitamente ("Sem 1 · Fluxos 1D", "Sem 2 · Bifurcações 1D", etc.).
- **Atualizado** `index.qmd` com callout-tip "Pronto para começar?" apontando direto à Semana 1.

#### Figuras canônicas (S9)

- **Adicionadas** três figuras SVG transversais em `assets/figs/canonicas/`:
  - `fig-vsm-5-sistemas.svg` — diagrama clássico Beer com S1-S5, S2 lateral em ocre, canal algedônico em vermelho, inserida em F4-01.
  - `fig-conant-ashby.svg` — homomorfismo regulador-sistema com $D, S, R, E$ e setas $f, g$, inserida em F4-01.
  - `fig-bhrf-recursao-tripla.svg` — três caixas aninhadas representando recursões 1, 2, 3 do diagnóstico VSM da BHRF, com GAN como S2 inter-outorgantes, S4 marcado como ausente, MPTO destacado como pressão externa, inserida em F4-02.

#### README e release

- **README.md reescrito** com badges, link explícito ao site público, descrição em cinco frases, quatro entradas para começar, biografias verificadas dos referenciais, instruções de desenvolvimento.
- **Tag v1.0** criada.

---

## Histórico anterior à v1.0

### 2026-05-05 / 2026-05-06 (sessão de bootstrap)

Cinco commits prévios à v1.0 que estabeleceram a plataforma:

- Extração do bundle textual em árvore Quarto navegável.
- Capítulo-âncora F4-01 redigido com matemática auditada (Ashby aditiva+multiplicativa, $\mathcal{S}_n$ desambiguada).
- Trilha paralela: 18 cartas a Luiz Eduardo (livro PDI UNIFAL) com pontes específicas.
- Persona ficcional Joana Beraldo (cotutela UNITINS-UNIFAL) costurando todos os capítulos.
- 18 memorandos a Juliana com pontes a obras específicas, contextualizados com inserção internacional (ASC Member-at-Large, Metaphorum Directorate, ASC 2024 Washington DC).
- Workflow GitHub Pages funcional via `peaceiris/actions-gh-pages@v3 + force_orphan: true`.
- F1-01 com notebook executável real (logístico + retrato de fase + potencial via SciPy).

### Commits relevantes

```
S9-S10  README cinematográfico + figuras canônicas + tag v1.0
S6-S8   F1-01 polish + auditoria editorial + sidebar semanas
S4-S5   F4-01 expansão integral + F4-02 BHRF documentado
S1-S3   ViableOS metatexto + como-estudar + recursos curados
75f50de Recheio: F1-01 expandido (3000 palavras), notebook executável, 16 intros redigidas
31880a1 Corrige workflow GH Pages (peaceiris) + desabilita execução de notebooks-stub
9dc9872 Merge: bootstrap completo do curso para deploy em GitHub Pages
711f493 Integra atuação ASC/Metaphorum de Juliana nos memorandos
80c23fd Adiciona BALANCO.md e calibra personagem com achado UniRede
c0154e1 Pivota o curso para contexto educacional: persona ficcional Joana Beraldo
c8a7364 Auditoria matemática: corrige Ashby, recursão e pontes metafóricas
3d3c757 Adiciona trilha paralela: cartas a Luiz Eduardo (livro PDI)
f190108 Extrai o bundle e estrutura o site Quarto para GitHub Pages
4ed07e4 Adiciona análise, pesquisa e plano operacional do bundle
```
