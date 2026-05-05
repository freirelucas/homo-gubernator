# Plano até o MVP

Documento de trabalho. Define o que conta como **MVP do curso autoinstrutório** e a sequência mínima até lá.

## Definição de MVP

O MVP é um site Quarto **publicado em GitHub Pages** com as seguintes propriedades:

1. Renderiza sem erros nem links quebrados (`quarto render` e a action `Render and Publish` verdes).
2. Aluno consegue **iniciar a Semana 1 hoje**: cap. F1-01 redigido, exercícios numerados, memorando Juliana #1 redigido, carta Luiz Eduardo #1 redigida, pergunta de verificação clara.
3. **Capítulo-âncora F4-01** redigido em estado estável (não placeholder) — é o farol pedagógico do curso.
4. **Mecânica das duas trilhas paralelas funciona**: cada capítulo tem `memorando-juliana.qmd` + `carta-luiz-eduardo.qmd` apontando para passagens específicas.
5. Subagents e prompts em estado utilizável; `CLAUDE.md` documenta o workflow.
6. Auditoria matemática limpa (ou explicitamente sinalizada) nos dois capítulos redigidos e nas 18 cartas.
7. URL pública compartilhável.

**O MVP _não_ exige** que os 21 capítulos secundários estejam redigidos. Esses são entregáveis do aluno ao longo das 24 semanas, não do bootstrap.

## Estado atual (commit `3d3c757` + correções desta sessão)

Já em estado MVP-ready:
- Estrutura Quarto completa, navegável, com sidebar docked por fase.
- Bibliografia consolidada (silvasilveira2026 e gonzalezwoods2017 adicionados).
- 18 stubs de capítulo + 18 cartas Luiz Eduardo + 1 memorando Juliana redigido.
- Subagents `strogatz-chapter`, `notebook-builder`, `translation-reviewer`, `carta-luiz-eduardo`.
- Workflow `publish.yml` configurado (`quarto-actions/publish@v2 target: gh-pages`).
- F4-01 redigido (~1.500 palavras, com auditoria matemática limpa).
- F1-01 parcial (~700 palavras + esqueleto das demais seções).

Faltando para o MVP:
- M1 Render-test local com Quarto CLI (ambiente atual não tem Quarto instalado).
- M2 Habilitar GitHub Pages no repositório (passo manual humano em `Settings > Pages`).
- M3 Push em `main` (a publicação só dispara em `main`; estamos em branch de feature).
- M4 Verificar primeiro deploy verde e URL pública.

Opcional para MVP-fortalecido (não bloqueante):
- M5 Expandir F1-01 até ~3.000 palavras via subagent `strogatz-chapter`.
- M6 Um notebook real executável (F1-01 ou F2-02) — paleta Cybersyn-Cerrado, simulação SciPy.
- M7 Auditoria final das 18 cartas com `translation-reviewer`.

## Sequência ordenada

### Etapa M1 — Render-test (próxima sessão, ~30 min)

Em ambiente local com Quarto 1.4+:

```bash
quarto render
quarto preview  # localhost:4444
```

Critério de sucesso: zero warnings de citação faltante, zero `404`, navbar e sidebar funcionais. Se houver erro, corrigir antes de prosseguir.

Riscos previstos:
- `bibliografia.bib` referenciado de subdiretório (`../../bibliografia.bib`) pode falhar — verificar caminhos.
- `csl: https://www.zotero.org/styles/abnt-ipea` requer download via internet na hora do render — fallback: baixar localmente em `assets/abnt-ipea.csl`.
- Notebooks `.qmd` com `jupyter: python3` precisam de kernel registrado: `python -m ipykernel install --user --name python3` em ambiente com `requirements.txt` instalado.

### Etapa M2 — GitHub Pages enable (5 min, humano)

No GitHub:
1. `Settings > Pages > Source: Deploy from a branch`.
2. `Branch: gh-pages` (será criada na primeira execução do workflow).
3. `Folder: / (root)`.

### Etapa M3 — Merge em `main` e primeiro deploy (10 min)

```bash
git checkout main
git merge claude/analysis-research-planning-4D8gU
git push origin main
```

A action dispara automaticamente. Acompanhar em `Actions > Render and Publish`.

Critério de sucesso: action verde em ≤5 min; `https://freirelucas.github.io/homo-gubernator/` carrega o `index.qmd`; navbar leva a `Plano > Fase 1 > F1-01 > Memorando Juliana > Carta Luiz Eduardo` sem erro.

Se a action falhar:
- Faltando `nbformat`: já está em `requirements.txt`. Verificar se `pip install` rodou.
- Faltando dados de tipografia: substituir Inter/JuliaMono por fontes default se a CI não tiver acesso.
- `quarto publish gh-pages` precisa de `_publish.yml`? — não, com `target: gh-pages` na action ele cria.

### Etapa M4 — Verificação de qualidade (15 min)

Acessar URL pública e conferir:
- Capítulo F1-01 lê-se de ponta a ponta.
- F4-01 lê-se com matemática renderizada (MathJax CDN funciona).
- Sidebar mostra os 4 fases e os 18 capítulos.
- Carta Luiz Eduardo #1 abre e o link para o livro PDI funciona.
- Memorando Juliana #1 abre e a referência aos artigos da Juliana está no estilo ABNT.

Se algo quebrar visualmente (CSS), abrir issue, mas **não** bloquear o MVP por isso.

### Etapa M5 (opcional) — Expandir F1-01

Em sessão dedicada de ~2 h:
1. Abrir Claude Code no repositório.
2. Disparar o subagent `strogatz-chapter` sobre `fase-01-strogatz/01-fluxos-1d/intro.qmd`.
3. Pedir expansão das seções "O potencial $V(x)$", "Existência e unicidade (Picard)", "Exemplo institucional (indicador orçamentário)" até ~3.000 palavras totais.
4. Rodar `translation-reviewer` sobre o resultado.
5. Commit em `main`, action redeploya.

### Etapa M6 (opcional) — Um notebook real

`fase-01-strogatz/01-fluxos-1d/notebook.qmd` é o candidato natural:
1. Carregar `styles/matplotlibrc`.
2. Integrar $\dot{N} = rN(1-N/K)$ via `scipy.integrate.solve_ivp` para múltiplas condições iniciais.
3. Plotar trajetórias temporais + retrato de fase 1D (eixo $x$ com setas de $f(x)$).
4. Texto interpretativo final amarrando à Lei de Ashby.

Critério de sucesso: notebook executa em CI sem erro de kernel; figuras saem em paleta Cybersyn-Cerrado; `fig-alt` em PT-BR presente.

## Riscos e mitigações

| Risco | Probabilidade | Mitigação |
|---|---|---|
| Action `publish.yml` falha por motivo obscuro no primeiro run | média | Testar localmente com `quarto publish gh-pages --no-prompt` antes do merge |
| CSL ABNT não carrega (Zotero down) | baixa | Baixar `abnt-ipea.csl` para `assets/` e referenciar local |
| Notebook quebra render por kernel ausente | média | Adicionar `freeze: true` no header dos notebooks até validar localmente |
| Math do F4-01 renderiza estranho (subscripts $H(D)$ etc.) | baixa | MathJax 3 lida bem; verificar |
| Aluno começa Semana 1 e percebe lacuna no F1-01 | alta | Bloquear MVP em F1-01 expandido (M5) — promover de "opcional" para obrigatório se houver banda |

## Caminho crítico

M1 → M2 → M3 → M4. Tempo estimado total: **1 h de trabalho dedicado** (excluindo M5/M6/M7).

## Decisão pendente para o usuário

Antes de iniciar M1, três escolhas:

1. **MVP estrito (F1-01 parcial) ou MVP-fortalecido (F1-01 completo)?** O segundo adiciona ~2 h.
2. **Notebook executável obrigatório no MVP?** Se sim, +1 h em M6.
3. **CSL ABNT crítico?** Se a renderização com CSL default for aceitável temporariamente, simplifica M1.

Recomendação: MVP estrito + notebook em M6, sem CSL custom. Total: ~2 h de trabalho. Ship-and-iterate.
