#!/usr/bin/env bash
# Gera stubs intro/exercicios/notebook/memorando-juliana para um capítulo.
# Uso: scripts/gen-stubs.sh <fase-dir>/<cap-dir> "<título>" "<subtítulo>" "<sem>"
set -euo pipefail
DIR="$1"; TITULO="$2"; SUBTITULO="$3"; SEM="$4"
mkdir -p "$DIR"

cat > "$DIR/intro.qmd" <<EOF
---
title: "$TITULO"
subtitle: "$SUBTITULO"
author: "Lucas Freire"
bibliography: ../../bibliografia.bib
format: html
---

::: {.callout-warning}
Capítulo em estado de gabarito (semana $SEM). Estrutura de seções abaixo. Para expandir até ~2.500–3.000 palavras, ative o subagent \`.claude/agents/strogatz-chapter.md\` (ou variante por fase).
:::

## A pergunta operacional
[Em um parágrafo: a pergunta que o capítulo responde, na voz densa, sem manualese.]

## Formalização
[Definições centrais com LaTeX. Equações importantes numeradas via \`{#eq-rotulo}\`.]

## Exemplos canônicos
[Mínimo três: pelo menos um físico/biológico e um institucional.]

## Conexão com Ashby/Beer
[Identificar o análogo cibernético do conceito do capítulo dentro do VSM.]

## Pergunta de verificação
[Questão única que o aluno responderá antes de avançar.]
EOF

cat > "$DIR/exercicios.qmd" <<EOF
---
title: "Exercícios — $TITULO"
---

**1.** [Enunciado.]
**2.** [Enunciado.]
**3.** [Enunciado.]
**4.** [Enunciado.]
**5.** [Enunciado.]
**6.** [Enunciado.]
**7.** [Conexão Ashby/Beer.]
**8.** (Aberto.) [Aplicação ao próprio trabalho na DIEST.]
EOF

cat > "$DIR/notebook.qmd" <<EOF
---
title: "Notebook — $TITULO"
jupyter: python3
---

\`\`\`python
# placeholder: ativar via subagent notebook-builder
# 1. carregar matplotlibrc
# 2. integrar/simular o sistema-modelo do capítulo
# 3. plotar trajetórias / retrato de fase / distribuição
# 4. interpretar
\`\`\`
EOF

cat > "$DIR/memorando-juliana.qmd" <<EOF
---
title: "Memorando Juliana — $TITULO"
---

**Referência.** [A preencher com a citação completa do trabalho de Juliana onde o conceito aparece.]

**Conceito técnico do capítulo.** [Em uma frase.]

**Onde aparece em Alves.** [Identificar a passagem específica e descrevê-la.]

**Pergunta de pesquisa para a DIEST.** [Conexão concreta ao trabalho do aluno.]
EOF

cat > "$DIR/carta-luiz-eduardo.qmd" <<EOF
---
title: "Carta a Luiz Eduardo — $TITULO"
---

**Referência.** SILVA, Luiz Eduardo da; SILVEIRA, Tiago. *Processamento Digital de Imagens*. UNIFAL-MG, 2026. Disponível em: <https://luizedsilva.github.io/livro-pdi/>.

**Conceito técnico do capítulo do curso.** [Em uma frase.]

**Onde aparece em Silva & Silveira (2026).** [Identificar capítulo, seção e fórmula correspondente do livro PDI.]

**Ponte conceitual.** [Como o aparato deste capítulo ilumina ou reforma a apresentação do livro.]

**Pergunta-convite a Luiz Eduardo.** [Pergunta retórica sobre o que mudaria na pedagogia do livro.]

**Para a DIEST.** [Em uma frase: o que esta dupla leitura habilita no trabalho próprio do aluno.]
EOF
echo "ok: $DIR"
