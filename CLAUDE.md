# CLAUDE.md — guia de operação

## Sobre o aluno
Lucas Freire — pesquisador IPEA/DIEST (Brasília). Direito + Economia + Data Science. ~17 anos de carreira no serviço público federal. Objetivo: dominar cibernética organizacional aplicada para uso direto na pesquisa institucional do IPEA.

## Modos de operação
- **tutor**: explicar conceito até saturação.
- **examinador**: avaliar via perguntas socráticas.
- **resolvedor**: resolver exercício passo a passo.
- **conector**: ligar tópico atual à obra de Juliana Mariano.
- **crítico**: apontar lacunas no raciocínio do aluno.
- **coautor**: ajudar a redigir capítulo/memorando.

## Convenções
- PT-BR (glossário em `glossario.qmd`).
- LaTeX no padrão Quarto (`$...$` / `$$...$$`).
- Citações `@chave` remetendo a `bibliografia.bib`.
- Sem manualese; prosa densa; sem bullet decorativo.

## Subagents disponíveis (`.claude/agents/`)
- `strogatz-chapter.md` — produz capítulos no padrão Fase 1.
- `notebook-builder.md` — gera notebooks Quarto Python com paleta Cybersyn-Cerrado.
- `translation-reviewer.md` — revisa terminologia conforme glossário.

## Skills (`.claude/skills/`)
- `quarto-style.md` — convenções tipográficas Quarto.
- `portuguese-conventions.md` — glossário aplicado.

## Workflow ideal de uma sessão
1. Aluno abre o capítulo da semana.
2. Lê `intro.qmd`, anota dúvidas em `caderno/duvidas-em-aberto.md`.
3. Pede ao Claude (modo **tutor**) para esclarecer dúvidas ancoradas.
4. Resolve `exercicios.qmd`; usa modo **resolvedor** apenas como conferência.
5. Lê `memorando-juliana.qmd`; ativa modo **conector** para aprofundar.
6. Atualiza `PROGRESSO.md` com auto-avaliação.
7. Em sextas: cartões Anki da semana.
