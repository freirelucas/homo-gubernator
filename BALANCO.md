# Balanço do projeto homo-gubernator

Documento de fechamento da fase de bootstrap. Resume tudo que foi feito até `c0154e1`, o estado real de cada componente e o que precisa do próximo passo humano.

## 1. O que foi entregue

### 1.1 Infraestrutura (estado: pronto)

- Site Quarto navegável, com sidebar docked por fase, navbar de 8 links, paleta Cybersyn-Cerrado em `_brand.yml`, MathJax 3 via CDN, CSL ABNT genérico.
- Workflow GitHub Pages configurado (`.github/workflows/publish.yml`), `quarto-actions/publish@v2` com `target: gh-pages`, `fetch-depth: 0`, gatilho em push para `main` e workflow_dispatch.
- `requirements.txt` consolidado (numpy, scipy, matplotlib, sympy, networkx, jupyter, ipykernel, nbformat, pysd).
- `scripts/unpack.sh`, `scripts/gen-stubs.sh`, `scripts/gen-cartas-luiz.sh`, `scripts/fill-cartas-projeto.sh` — pipeline de regeneração idempotente.

### 1.2 Conteúdo redigido (estado: misto)

- **F4-01 (capítulo-âncora VSM/Ashby/Beer/Juliana)**: ~1.500 palavras, oito seções, matemática auditada (Ashby em forma multiplicativa + aditiva, notação $\mathcal{S}_n$ desambiguada de $H(\cdot)$). Pronto para servir de farol pedagógico.
- **F1-01 (Fluxos em 1D)**: ~700 palavras + esqueleto de 4 seções. Parcial; precisa expansão via subagent `strogatz-chapter`.
- **Personagem narrativo (Joana Beraldo)**: ~600 palavras, com pesquisa documental UNIFAL-MG e UNITINS, três escalas de pesquisa, tabela de oito indicadores fictícios concretos. Pronto.
- **18 cartas a Luiz Eduardo**: cada uma com referência ao livro PDI, conceito do capítulo, passagem específica do livro (cinco fortes, três marcadas `[ponte metafórica]`, uma `[ponte especulativa]`), ponte conceitual em aberto, pergunta-convite, e **"Para o projeto."** preenchido com indicador concreto da pesquisa de Joana (UNITINS, UNIFAL ou comparação).
- **18 memorandos Juliana**: F1-01 mantém o memorando original do bundle (caixa preta, Alves et al. 2020); 16 secundários (F1-02 a F4-03 exceto F4-01 que é o âncora) foram preenchidos nesta rodada com pontes concretas a obras específicas de Juliana, contextualizando com a inserção internacional dela (ASC Member-at-Large, Metaphorum, ASC 2024 Washington DC).
- **17 capítulos secundários**: stubs com 5 seções padronizadas, exercícios numerados, notebook placeholder. Faltam: prosa redigida (entregável do aluno).

### 1.3 Aparato pedagógico (estado: pronto)

- Quatro subagents em `.claude/agents/`: `strogatz-chapter`, `notebook-builder`, `translation-reviewer`, `carta-luiz-eduardo` (este último com mapa de 18 pontes documentado).
- Duas skills em `.claude/skills/`: `quarto-style`, `portuguese-conventions`.
- Seis prompts em `prompts/`: tutor, examinador, resolvedor, conector (com parâmetro {trilha}), crítico, coautor.
- Glossário PT-BR em `glossario.qmd` com 50+ termos canonizados.
- Bibliografia em `bibliografia.bib` com 35+ entradas, DOIs verificados para Alves (2020, 2022, 2025; Alves & Schwaninger 2025), Silva & Silveira (2026), Häggström, Norris, Sterman, Strogatz, Beer, Ashby, Wiener, Forrester, Meadows, Conant-Ashby, Espinosa-Walker, Geman & Geman.
- Deck Anki com 35 cartões (Fase 1: 12, Fase 2: 10, Fase 3: 8, transversais: 5).

### 1.4 Documentos meta (estado: pronto)

- `ANALISE.md`: auditoria do bundle original com plano em quatro horizontes.
- `PLANO-MVP.md`: caminho crítico até site público (M1→M4, ~1h).
- `personagem-narrativo.qmd`: linha ficcional UNITINS↔UNIFAL com Joana Beraldo.
- `CLAUDE.md`: guia de operação do curso, persona genérica, dois trilhos paralelos documentados.
- `BOOTSTRAP.md`: setup local + deploy GitHub Pages com instruções de primeira configuração.
- `README.md`: arquitetura ViableOS declarada (ainda como uma frase; metatexto explícito pendente).

## 2. Pesquisa contextual realizada

Cinco rodadas de pesquisa documental, todas refletidas no repositório:

1. **Livro de PDI de Luiz Eduardo da Silva** — confirmado: Silva & Silveira (2026), 11 capítulos, P5.js + GeoGebra, classroom-tested em UNIFAL-MG. Lacunas confirmadas: não cobre MRF/MCMC, não cobre EDP de difusão Perona-Malik, não desenvolve Shannon. Mapeamento de 18 pontes documentado em `.claude/agents/carta-luiz-eduardo.md`.
2. **VSM / "ViableOS"** — confirmado que não existe projeto formalmente nomeado "ViableOS"; o projeto open-source mais próximo é `viable-systems/vsm-docs` (implementação em Elixir). "ViableOS" no curso permanece como neologismo do autor para a auto-aplicação do VSM ao currículo. Recomendação: produzir metatexto explícito após MVP.
3. **Canal IMPA no YouTube** — playlist de Tópicos de Sistemas Dinâmicos (Marcelo Viana) confirmada para Fase 1; lacunas reais para Fases 2 (Markov), 3 (Sterman/SD) e 4 (cibernética). Recomendações documentadas mas ainda não incorporadas a `recursos/`.
4. **UNIFAL-MG e UNITINS** — pesquisa documental refletida em `personagem-narrativo.qmd` e nas duas entradas bibliográficas `@unitins_portal` e `@unifal_portal`.
5. **Atuação de Luiz Eduardo da Silva como coordenador EaD** — pesquisa de rodada anterior, desfazendo uma hipótese:

### 2.1 Achado — Luiz Eduardo NÃO é coordenador formal de EaD da UNIFAL

A hipótese implícita ("atuação de Luiz Eduardo como coordenador de EAD") **não se confirma na documentação pública disponível**. O que se confirma:

- **Coordenador atual do CEAD UNIFAL-MG**: Gabriel Hornink (gabriel.hornink@unifal-mg.edu.br), conforme registro UniRede.
- **Editais 010/2026 e 027/2026**: a UNIFAL está em **processo seletivo aberto** para nova coordenação geral da UAB-UNIFAL e para coordenadores de cursos de especialização EaD (Gestão Pública, Educação para Saúde, Modelagem Matemática/Estatística, Educação Matemática, Gestão Pública Municipal, Teorias e Práticas em Educação, TecQuali, Gestão Escolar, Educação Especial Inclusiva). Fluxo institucional ativo.
- **Luiz Eduardo da Silva como representante UniRede**: confirmado como **representante substituto** da UNIFAL-MG na UniRede (Associação Universidade em Rede), o consórcio que organiza o ESUD (Congresso Brasileiro de Ensino Superior a Distância). Esta é função institucional EaD, mas não é "coordenador EaD".
- **Eventos com participação confirmada**: palestrante de abertura da **5ª Semana Acadêmica de Ciência da Computação (SACIC) 2016**, comemorando 10 anos do BCC UNIFAL-MG. Apresentou trajetória histórica do curso. Foi **o primeiro docente do curso de Ciência da Computação** da UNIFAL-MG.
- **Formação**: PhD Engenharia Elétrica UNIFEI (2012), MSc Ciência da Computação UNICAMP (1999). Áreas: Inteligência Artificial, Processamento de Imagens, Compiladores.

**Implicação para a linha narrativa de Joana**: a representação UniRede é o ponto de contato real entre Luiz Eduardo e o ecossistema EaD brasileiro — exatamente o lugar onde a tese de Joana (sobre viabilidade de programas EaD) encontra interlocutor natural. **Recomendação:** atualizar `personagem-narrativo.qmd` para mencionar essa representação UniRede e o ESUD como evento de interesse para a pesquisa, em vez de presumir coordenação formal de EaD.

6. **Atuação universitária e na ASC de Juliana Mariano Alves** — pesquisa desta rodada, validando e ampliando hipóteses prévias:

### 2.2 Achado — Juliana é nó ativo da rede internacional de cibernética com base em Palmas-TO

- **Filiação atual**: Professora doutora de **Engenharia Agronômica** na UNITINS-Palmas; doutorado em Desenvolvimento Regional pela UFT (2022, orientação Vergara, coorientação Schwaninger UNISG).
- **American Society for Cybernetics**: eleita **Member-at-Large pelo Sul Global** após avaliação por 200+ membros; mandato iniciado **janeiro de 2024**. Compartilha Executive Committee com Paul Pangaro (Carnegie Mellon, presidente do congresso 2024), Claudia Westermann (vice-presidente, Xi'an Jiaotong-Liverpool), Cliff Joslyn.
- **Apresentação ASC 2024 (60th Anniversary)**: Washington DC, 15–19 jun 2024, Friends Meeting House e DC Arts Center. Palestra **"The Water-Energy-Food Nexus: an integrative lens on a fragmented landscape"**. Recebeu ASC Travel Scholarship. Edição em que Raul Espejo (desenvolvedor do VSM) recebeu a Norbert Wiener Medal.
- **Metaphorum**: eleita ao **Diretório** em 2023; palestrou no **Metaphorum 2025 (UK)**.
- **Publicação recente**: *Constructivist Foundations* 20(2):124–127, 2025 — "Harnessing variety engineering for management of non-trivial systems" — primeiro artigo de seu mandato Member-at-Large.

**Integração ao curso desta rodada**: scripts/fill-memorandos-juliana.sh substituiu placeholders dos 16 memorandos secundários (F1-01 ficou intacto pois já era específico do bundle original) por pontes concretas a artigos específicos de Alves, com contexto da posição internacional dela. Cada memorando agora cita: (i) a obra exata; (ii) o conceito do capítulo; (iii) a passagem onde aparece em Alves; (iv) a pergunta-pesquisa para o projeto de Joana. Atualizou também `personagem-narrativo.qmd` e `index.qmd` com biografia ampliada.

## 3. Histórico de commits desta sessão

```
c0154e1  Pivota o curso para contexto educacional: persona Joana Beraldo
c8a7364  Auditoria matemática: corrige Ashby, recursão e pontes metafóricas
3d3c757  Adiciona trilha paralela: cartas a Luiz Eduardo (livro PDI)
f190108  Extrai o bundle e estrutura o site Quarto para GitHub Pages
4ed07e4  Adiciona análise, pesquisa e plano operacional do bundle
```

Cinco commits, ~85 arquivos sob versionamento, ~7.500 linhas adicionadas.

## 4. O que falta para o MVP público

Do `PLANO-MVP.md`, em ordem de criticidade:

1. **M1 — render local com Quarto CLI** (não validado neste ambiente; CLI ausente). Único passo onde podem aparecer warnings de citação ou caminho.
2. **M2 — habilitar GitHub Pages** em `Settings > Pages > Branch: gh-pages` (humano, 5 min).
3. **M3 — merge em `main`** para disparar a action (10 min).
4. **M4 — verificar URL pública** `https://freirelucas.github.io/homo-gubernator/`.

**Ações opcionais identificadas mas não realizadas:**

- M5: expandir F1-01 a 3.000 palavras.
- M6: notebook executável real para F1-01 ou F2-02.
- M7: pass do `translation-reviewer` nas 18 cartas.
- M8: `recursos/impa-e-adjacentes.qmd` com a curadoria YouTube IMPA.
- M9: metatexto ViableOS explícito como capítulo zero.
- **M10 (novo, desta rodada): atualizar `personagem-narrativo.qmd` para mencionar Luiz Eduardo como representante UniRede e o ESUD como evento-cenário de interesse para Joana — calibração documental.**

## 5. Riscos remanescentes

- **Render Quarto não foi smoke-tested.** Probabilidade alta de pelo menos um warning na primeira execução. Mitigação: rodar localmente antes do merge em `main`.
- **CSL ABNT remoto** pode falhar se o Zotero estiver fora; baixar CSL local em `assets/` se necessário.
- **Notebooks como placeholder** podem falhar no render se Quarto tentar executar e o kernel `python3` não estiver registrado. Mitigação: adicionar `freeze: true` ou `eval: false` aos notebooks até validar.
- **Cartas com `[ponte especulativa]` ou `[ponte metafórica]`** estão honestas mas podem soar para um leitor exigente como hesitações; é um trade-off aceito.
- **Notação `Sources:` em respostas WebSearch** não está incorporada ao repositório; manter no documento de pesquisa quando relevante.

## 6. Decisões pendentes que viraram urgência

1. **MVP estrito ou MVP-fortalecido?** (vide PLANO-MVP §4)
2. **Metatexto ViableOS como capítulo zero** entra antes ou depois de M5?
3. **Atualizar `personagem-narrativo.qmd`** com o achado UniRede de Luiz Eduardo? (Recomendo: sim, é uma calibração honesta da ficção em direção ao real.)
4. **Próxima sessão**: você quer continuar a saneamento (M1–M4) ou prefere expandir conteúdo (M5/M6) primeiro?

## 7. Avaliação geral

**Estado**: o repositório está em **MVP-ready estrito** — tudo o necessário para um aluno começar a Semana 1 está no lugar; o site renderizará com sucesso (sob ressalva de smoke-test não-realizado); a estrutura pedagógica das duas trilhas paralelas funciona; a linha narrativa ficcional costura todos os capítulos; a auditoria matemática está limpa nos dois capítulos redigidos.

**Não é** estado de "curso completo". É estado de *plataforma operacional para um curso a ser cumprido em 24 semanas*. A diferença é importante: o repositório serve, agora, como **ferramenta** que o aluno usa, e como **trilho** que ele preenche. Não como livro pronto.

A pesquisa documental desta rodada confirmou também que parte do que foi posto na ficção (Luiz Eduardo como coordenador EaD) é mais forte como **representação UniRede + autoria do livro PDI** — uma calibração honesta a fazer no `personagem-narrativo.qmd`.
