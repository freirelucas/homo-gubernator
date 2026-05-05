# Análise, pesquisa e planejamento — homo-gubernator-curriculum

Documento de trabalho sobre o artefato `compass_artifact_wf-41e76427-41a5-4694-bc50-06d6da772fd8_text_markdown.md` (bundle textual no padrão "concatenated repo", 877 linhas, 52 KB) entregue como ponto de partida para o repositório do curso.

## 1. Análise do artefato

### 1.1 Inventário dos arquivos contidos no bundle

Trinta e quatro arquivos delimitados por `===== FILE: ... =====`. Distribuição:

| Categoria | Arquivos | Estado |
|---|---|---|
| Estrutura Quarto | `_quarto.yml`, `_brand.yml`, `styles/custom.scss`, `styles/matplotlibrc`, `assets/styles.css`, `assets/references.bib`, `requirements.txt`, `.gitignore`, `.github/workflows/publish.yml` | Completos |
| Páginas-índice | `index.qmd`, `plano/plano-estudos.qmd`, `glossario.qmd`, `bibliografia.bib`, `PROGRESSO.md`, `revisao/index.qmd`, `revisao/anki/deck-cibernetica.csv`, `prompts/index.qmd` | Completos |
| Operação Claude Code | `CLAUDE.md`, 6× `prompts/*.md`, 3× `.claude/agents/*.md`, 2× `.claude/skills/*.md` | Completos |
| Caderno do aluno | `caderno/estado.md`, `caderno/duvidas-em-aberto.md` | Stubs propositais |
| Capítulo Fase 1 cap. 1 | `fase-01-strogatz/index.qmd`, `01-fluxos-1d/{intro,exercicios,notebook,memorando-juliana}.qmd` | `intro.qmd` parcial (≈700 palavras + esqueleto seções restantes); `notebook.qmd` é placeholder; demais completos |
| Capítulo Fase 4 cap. 1 (âncora) | `fase-04-sintese/01-vsm-ashby-beer/intro.qmd` | **Ausente** — o marcador existe mas o corpo é uma referência textual a "entrega anterior" (linhas 845–852) |

### 1.2 O que **falta** vs. o que o TL;DR alega

O TL;DR do artefato afirma que o capítulo-âncora da Fase 4 está "produzido na íntegra (~3.300 palavras)", e que "três dos quatro capítulos âncora longos (Fases 1, 2 e 3) e os 18 esqueletos secundários estão entregues como gabaritos parametrizados densos". Confronto com o conteúdo:

- **Capítulo Fase 4 âncora**: o corpo prometido **não está no bundle**. Existe apenas a referência `[Conteúdo integral produzido pelo subagent vsm-chapter-writer — 3.300 palavras. Ver o texto completo, na entrega anterior desta sessão...]`. A "entrega anterior" não é acessível neste repositório.
- **Capítulos-âncora das Fases 2 e 3**: nenhum arquivo `fase-02-markov/...` ou `fase-03-sterman/...` aparece no bundle. Apenas a Fase 1 cap. 1 saiu como gabarito redigido.
- **Dezoito esqueletos secundários**: nenhum capítulo secundário (F1-02 a F1-06, F2-01 a F2-05, F3-01 a F3-04, F4-02, F4-03) está no bundle.

Síntese: o que foi efetivamente entregue cobre toda a infraestrutura do site, todo o ferramental Claude Code, e **um único capítulo redigido em estado parcial** (F1-01). Os 22 capítulos restantes precisam ser produzidos do zero, não apenas expandidos.

### 1.3 Consistência interna

Conferi referências cruzadas relevantes:

- `_quarto.yml` declara navbar com links para `fase-0X-.../index.qmd` em todas as quatro fases. Apenas `fase-01-strogatz/index.qmd` existe — links 2/3/4 quebrarão na primeira renderização.
- `plano/plano-estudos.qmd` referencia `04-ciclos-limite`, `05-bifurcacoes-2d`, `06-caos-lorenz` etc.; os diretórios não existem.
- `CLAUDE.md` cita três subagents que de fato estão presentes em `.claude/agents/`. Coerente.
- `bibliografia.bib` traz 30+ entradas, incluindo os cinco trabalhos de Juliana com DOIs. O artefato afirma DOIs verificados; tratar como provisório até confronto direto com Crossref.
- Glossário PT-BR cobre os termos técnicos das quatro fases. Internamente coerente com hifenização Acordo de 1990.
- Workflow `publish.yml` não foi inspecionado em detalhe — assume `quarto render` + push em `gh-pages`.

### 1.4 Riscos identificados

1. **`quarto preview` quebrará imediatamente** na navbar por capítulos ausentes.
2. **Bundle alega cobertura que não tem**, o que é um sintoma típico de geração truncada por limite de output. Aceitar a entrega como estrutura + 1 capítulo parcial, não como currículo.
3. **`scripts/unpack.sh`** é mencionado no TL;DR mas o arquivo correspondente não está no bundle (apenas o snippet awk inline em "Recommendations").
4. **Capítulo-âncora F4** é declarado pelo TL;DR como "ponto alto pedagógico" e ordem-de-leitura recomendada nº 1 — sua ausência é a lacuna mais crítica.
5. **Memorandos Juliana**: apenas o #1 foi redigido. Os demais (10 no total pelo plano) são premissa da arquitetura pedagógica e estão pendentes.

## 2. Pesquisa — o que precisa ser verificado externamente

Itens que dependem de validação fora do que está no repositório, ordenados por prioridade:

1. **Tese Alves 2022** (UFT, handle `11612/4020`): localizar PDF, confirmar capítulos relevantes para os memorandos #2, #3, #4, #5, #7, #8.
2. **Alves & Schwaninger 2025** (Environ. Manage., DOI `10.1007/s00267-025-02262-7`): confirmar paginação 3344–3363 e seção de validação para memorando #9.
3. **Alves 2025** (Constructivist Foundations 20(2):124–127): confirmar URL e citação para memorando #2.
4. **Detalhes da Ação Civil Pública do MPTO (Bacia do Formoso, 2016)** — caveat explícito do próprio artefato.
5. **Workflow GitHub Pages**: confirmar que `quarto-pub-action` ou ação equivalente em `publish.yml` corresponde à versão atual mantida pelo Posit/Quarto-Dev (a não foi inspecionada).
6. **Compatibilidade `requirements.txt`**: verificar se versões pinadas resolvem com Python 3.11+ e Quarto 1.4+.

## 3. Plano operacional

Plano em três horizontes, alinhado com o calendário de 24 semanas do `plano/plano-estudos.qmd`.

### 3.1 Horizonte 0 — bootstrap (1 sessão, antes da semana 1)

Objetivo: deixar o repositório navegável, com `quarto preview` funcional e CI verde.

| # | Ação | Critério de pronto |
|---|---|---|
| 0.1 | Extrair o bundle: rodar o awk one-liner sobre o `.md` para gerar a árvore `homo-gubernator-curriculum/` | `tree -L 2` mostra 7 diretórios e ~30 arquivos |
| 0.2 | Criar stubs `index.qmd` para Fases 2, 3, 4 + um `intro.qmd` placeholder por capítulo listado no plano | `quarto preview` sobe sem 404 nos links da navbar |
| 0.3 | Adicionar `scripts/unpack.sh` ausente (já há snippet a copiar) | Script é executável e idempotente |
| 0.4 | Sanity-check do workflow `publish.yml` contra a action oficial atual | CI verde no primeiro push |
| 0.5 | Inicializar `caderno/estado.md` com a sessão atual | Aluno tem ponto de partida |

### 3.2 Horizonte 1 — produção dos quatro capítulos-âncora (semanas 1, 7, 13, 18)

Cada âncora consome 1 sessão dedicada com o subagent `strogatz-chapter` (renomeável por fase) e produz ~3.000 palavras. Ordem **deliberadamente não-linear**, seguindo a recomendação operacional do próprio artefato:

1. **Semana 1 — F4-01 (`vsm-ashby-beer`)**: produzir do zero. É o "farol" — quem lê primeiro entende a arquitetura ViableOS antes de retornar à Fase 1. A ausência do conteúdo no bundle torna esta a primeira pendência crítica.
2. **Semana 1 — F1-01 (`fluxos-1d`)**: expandir o gabarito existente até 2.500–3.000 palavras, completando as quatro seções marcadas como esqueleto.
3. **Semanas 7 e 13** — F2-01 (`cadeias-finitas`) e F3-01 (`fundamentos-sd`): produzir do zero.

Para cada capítulo-âncora, o pipeline interno é:

```
intro.qmd (≈3.000 palavras)  →  exercicios.qmd (8 exercícios)
        ↓                              ↓
notebook.qmd (subagent           memorando-juliana.qmd
notebook-builder)                (1 passagem específica)
```

Critério de pronto por âncora: (i) `quarto render` sem warning de citação faltante; (ii) `translation-reviewer` sobre o texto retorna ≤3 sugestões; (iii) memorando Juliana cita passagem nominal, não associação genérica.

### 3.3 Horizonte 2 — esqueletos secundários (semanas 2–6, 8–11, 14–16, 19–20)

Dezoito capítulos secundários. Estratégia de batching para minimizar context-switching:

- **Semana 0 (bootstrap)**: gerar todos os 18 esqueletos *parametrizados* em uma única sessão — apenas YAML + headers de seção + 8 exercícios numerados sem solução + stub de memorando Juliana com referência apontada. Isso não substitui o trabalho redacional posterior; apenas dá ao aluno um trilho onde colar suas anotações.
- **Por capítulo, na semana correspondente**: o aluno (não o subagent) redige a `intro.qmd` em prosa densa, validando contra o livro-base. O subagent atua como `tutor` e `crítico`, não como ghostwriter.

Esta é a inversão pedagógica importante: **os capítulos secundários são entregáveis do aluno, não da máquina**. O artefato original sugere o contrário em "Recommendations item 2"; recomendo desviar.

### 3.4 Horizonte 3 — produto final (semanas 21–24)

Diagnóstico VSM da DIEST (objetivo declarado em `CLAUDE.md`). Pré-requisitos: F4-01 e F4-02 (Bacia do Formoso) prontos. Saída: documento autônomo + apresentação interna IPEA. Fora do escopo deste repositório-curso; entra como `fase-04-sintese/03-aplicacao-propria/diagnostico-diest.qmd`.

## 4. Decisões pendentes para o usuário

Questões que não posso resolver sozinho e que afetam o plano:

1. **Recuperação do âncora F4**: o conteúdo "produzido na entrega anterior" pode ser recuperado de outro chat/arquivo? Ou aceitar que está perdido e produzi-lo do zero na primeira sessão?
2. **Cronograma real**: 24 semanas calendário ou 24 "blocos-semana" elásticos? O `PROGRESSO.md` aceita os dois, mas ritmo afeta a recomendação do horizonte 2.
3. **Formato final do diagnóstico DIEST**: nota técnica IPEA, TD (Texto para Discussão), ou apresentação? A escolha define qual template Quarto deve ser preparado em paralelo.
4. **Branch de trabalho**: confirmar se este repositório vai virar o `homo-gubernator-curriculum` final ou se o bundle será extraído em outro repo. O caminho atual mistura raiz com uma futura subpasta.

## 5. Próximo passo recomendado

Uma única ação prioritária: **rodar a extração do bundle (horizonte 0.1)** e abrir o site com `quarto preview` para confrontar a árvore real com o que o TL;DR alega. Com a árvore extraída e o preview de pé, todas as outras decisões ficam mais baratas de tomar.
