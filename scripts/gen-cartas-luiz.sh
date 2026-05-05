#!/usr/bin/env bash
# Gera carta-luiz-eduardo.qmd para cada capítulo do curso.
set -euo pipefail

write_carta() {
  local DIR="$1" TITULO="$2" CAP_PDI="$3" PONTE="$4" CONCEITO="$5" ESPECULATIVA="${6:-}"
  local FLAG=""
  [ "$ESPECULATIVA" = "spec" ] && FLAG=" [ponte especulativa]"
  cat > "$DIR/carta-luiz-eduardo.qmd" <<EOF
---
title: "Carta a Luiz Eduardo — $TITULO$FLAG"
---

**Referência.** SILVA, Luiz Eduardo da; SILVEIRA, Tiago. *Processamento Digital de Imagens*. Universidade Federal de Alfenas (UNIFAL-MG), 2026. Disponível em: <https://luizedsilva.github.io/livro-pdi/>. Capítulo de referência: **$CAP_PDI**.

**Conceito técnico do capítulo do curso.** $CONCEITO

**Onde aparece em Silva & Silveira (2026).** $PONTE

**Ponte conceitual.** [Em um parágrafo: como o aparato do capítulo deste curso ilumina ou reforma a apresentação que o livro de PDI faz do mesmo problema. Atenção à diferença de vocabulário — o que o livro chama de X, o curso chama de Y — e o que se ganha tratando ambos sob a mesma linguagem.]

**Pergunta-convite a Luiz Eduardo.** [Se o conceito do curso fosse incorporado à pedagogia do livro, qual capítulo do livro mudaria mais? Por quê?]

**Para a DIEST.** [Em uma frase: o que esta dupla leitura — governança (Juliana) + sinal/imagem (Luiz Eduardo) — habilita no trabalho próprio do aluno.]
EOF
  echo "ok: $DIR/carta-luiz-eduardo.qmd"
}

# Fase 1
write_carta fase-01-strogatz/01-fluxos-1d \
  "Fluxos em uma dimensão" \
  "3. Melhoramento (transformações de intensidade)" \
  "O capítulo 3 introduz as transformações de intensidade — linear, logarítmica, gama, equalização — como funções \$T: [0,L-1] \\to [0,L-1]\$ aplicadas pixel a pixel. A iteração discreta \$g_{n+1}(x,y) = T(g_n(x,y))\$ é, formalmente, um fluxo unidimensional autônomo no espaço de cinza." \
  "Estabilidade linear de pontos fixos em \$\\dot{x}=f(x)\$: \$f'(x^*)<0 \\Rightarrow\$ atrator local."

write_carta fase-01-strogatz/02-bifurcacoes-1d \
  "Bifurcações em 1D" \
  "8. Segmentação (método de Otsu)" \
  "O método de Otsu escolhe o limiar \$t^*\$ que maximiza a variância entre classes. Variando o histograma da imagem (ou um parâmetro de iluminação), \$t^*\$ pode saltar descontinuamente — uma bifurcação no espaço de partições." \
  "Bifurcações canônicas de 1D: sela-nó \$\\dot{x}=r+x^2\$, transcrítica, tridente."

write_carta fase-01-strogatz/03-fluxos-2d \
  "Fluxos em 2D" \
  "4. Transformada de Fourier" \
  "O domínio da frequência \$F(u,v)\$ é um espaço bidimensional onde uma imagem é representada como soma de senoides. A trajetória de um filtro passa-baixa parametrizado por raio de corte é um caminho no plano \$(u,v)\$ — análogo ao retrato de fase 2D." \
  "Sistemas planares \$\\dot{\\mathbf{x}} = \\mathbf{F}(\\mathbf{x})\$, nulóclinas, classificação de pontos fixos via traço-determinante da jacobiana."

write_carta fase-01-strogatz/04-ciclos-limite \
  "Ciclos-limite" \
  "7. Morfologia matemática" \
  "Abertura \$A \\circ B = (A \\ominus B) \\oplus B\$ e fechamento \$A \\bullet B = (A \\oplus B) \\ominus B\$ são operadores **idempotentes**: \$(A \\circ B) \\circ B = A \\circ B\$. Iterar a operação não muda o resultado — o sistema atinge um conjunto invariante estrutural análogo a um ciclo-limite." \
  "Ciclos-limite como conjuntos invariantes isolados; teorema de Poincaré-Bendixson."

write_carta fase-01-strogatz/05-bifurcacoes-2d \
  "Bifurcações em 2D" \
  "8. Segmentação por *watershed*" \
  "O *watershed* interpreta a imagem como superfície topográfica e \"inunda\" a partir dos mínimos. Conforme o nível d'água sobe, bacias adjacentes coalescem em pontos de sela — exatamente o tipo de bifurcação topológica estudada em 2D." \
  "Bifurcação de Hopf, sela-nó em 2D, bifurcações globais."

write_carta fase-01-strogatz/06-caos-lorenz \
  "Caos e atrator de Lorenz" \
  "9. Representação e descrição / 10. Reconhecimento" \
  "Descritores de forma robustos (momentos invariantes, descritores de Fourier) precisam ser estáveis a perturbações de pixel. A questão do livro espelha a do capítulo do curso: como medir o quanto pequenas mudanças nas condições iniciais (ruído, oclusão) ampliam-se na saída do sistema (classificação)?" \
  "Sensibilidade às condições iniciais; expoentes de Lyapunov; estrutura fractal de atratores estranhos."

# Fase 2
write_carta fase-02-markov/01-cadeias-finitas \
  "Cadeias finitas" \
  "2. Amostragem e quantização" \
  "Quantização mapeia intensidades contínuas em \$L\$ níveis discretos: \$Q: \\mathbb{R} \\to \\{0, 1, \\dots, L-1\\}\$. A varredura raster transforma a imagem em uma sequência sobre esse alfabeto finito — base discreta sobre a qual qualquer modelo markoviano de transição entre níveis adjacentes pode ser definido." \
  "Cadeias finitas, matriz de transição estocástica, propriedade markoviana."

write_carta fase-02-markov/02-distribuicoes-estacionarias \
  "Distribuições estacionárias" \
  "3. Equalização de histograma" \
  "A equalização redistribui as intensidades de modo a aproximar o histograma da uniforme. Pensada como dinâmica, é o operador linear cujo **ponto fixo é a distribuição uniforme** — exatamente uma distribuição estacionária no sentido markoviano." \
  "\$\\pi P = \\pi\$, unicidade em cadeias irredutíveis aperiódicas."

write_carta fase-02-markov/03-reversibilidade-mcmc \
  "Reversibilidade e MCMC" \
  "8. Segmentação probabilística (ausente no livro)" \
  "[ponte especulativa] O livro cobre segmentação determinística (thresholding, watershed, k-means) mas não chega a Markov Random Fields nem ao Gibbs sampler. A inserção natural seria reformular segmentação como inferência MAP em um MRF, exatamente o que @geman1984 propôs há quarenta anos." \
  "Balanço detalhado \$\\pi_i P_{ij} = \\pi_j P_{ji}\$; Metropolis-Hastings; Gibbs sampler." \
  spec

write_carta fase-02-markov/04-tempo-continuo \
  "Tempo contínuo" \
  "3. Filtros de suavização gaussiana" \
  "A convolução iterada com kernel gaussiano de variância \$\\sigma^2\$ é equivalente a integrar a equação do calor \$\\partial_t u = \\nabla^2 u\$ até \$t=\\sigma^2/2\$. O \"escala\" do filtro é, literalmente, tempo contínuo de um processo de difusão — uma cadeia markoviana em tempo contínuo no espaço de pixels." \
  "Processos markovianos em tempo contínuo, matriz geradora \$Q\$, equações de Kolmogorov."

write_carta fase-02-markov/05-aplicacoes-algoritmicas \
  "Aplicações algorítmicas" \
  "6. Compressão de imagens" \
  "Huffman e LZW são, no fundo, exploração de redundância estatística — a mesma quantidade que MCMC explora ao amostrar de uma distribuição-alvo. O Huffman ótimo aproxima o limite de Shannon \$H(X) = -\\sum p_i \\log p_i\$, que é a métrica de variedade que o curso usa para Ashby." \
  "Aplicações algorítmicas de cadeias de Markov: MCMC, simulated annealing."

# Fase 3
write_carta fase-03-sterman/01-fundamentos-sd \
  "Fundamentos de SD" \
  "1. Introdução ao PDI" \
  "O capítulo 1 apresenta o pipeline canônico: aquisição → pré-processamento → segmentação → representação → reconhecimento. Em linguagem SD, é uma **cadeia de estoques** (a imagem em cada estágio) interligada por **fluxos** (algoritmos), com possíveis laços de feedback (refinamento iterativo)." \
  "Estoque \$S\$ vs. fluxo \$\\phi\$; \$dS/dt = \\phi_{in} - \\phi_{out}\$."

write_carta fase-03-sterman/02-feedback-loops \
  "Laços de feedback" \
  "3. Filtros iterativos (sharpening, unsharp mask)" \
  "*Unsharp masking* — \$g = f + k(f - \\bar{f})\$ — é, em linguagem CLD, um **laço reforçador**: a diferença entre o sinal e sua média é re-injetada com ganho \$k>0\$. Iterado, dá origem aos modos canônicos de Sterman: crescimento exponencial das altas frequências, eventualmente saturando." \
  "Laços R/B; polaridade; quatro modos canônicos de SD."

write_carta fase-03-sterman/03-modelagem-formal \
  "Modelagem formal" \
  "4. Transformada de Fourier" \
  "Modelagem espectral é a forma SD canônica de um sistema linear invariante no tempo: a função de transferência \$H(s)\$ é o equivalente da decomposição em laços lineares. O domínio da frequência do PDI é, formalmente, o mesmo espaço onde Sterman analisa modos próprios." \
  "Modelagem formal de sistemas dinâmicos: ODEs, integração numérica, função de transferência."

write_carta fase-03-sterman/04-validacao \
  "Validação" \
  "6. Compressão (PSNR, MSE)" \
  "PSNR \$= 10 \\log_{10}(\\text{MAX}^2 / \\text{MSE})\$ é uma métrica de fidelidade comportamental — exatamente o tipo de teste que Sterman classifica em \"replicação\" (cap. 21). Validar JPEG por PSNR e validar um modelo SD por replicação histórica são instâncias da mesma família epistemológica." \
  "Testes estruturais e comportamentais de Sterman (cap. 21)."

# Fase 4
write_carta fase-04-sintese/01-vsm-ashby-beer \
  "VSM como linguagem integradora" \
  "1. Introdução / Níveis baixo, médio e alto" \
  "O livro hierarquiza o PDI em três níveis: baixo (filtragem, realce), médio (segmentação), alto (interpretação). Esta é, exatamente, uma **recursão Beer**: cada nível é um sistema viável completo cujo S1 é o nível inferior. A interpretação semântica (S5 do PDI) define o que conta como sucesso para a segmentação (S1 do PDI)." \
  "VSM, recursão cibernética, Lei da Variedade Requisita."

write_carta fase-04-sintese/02-bacia-formoso-caso \
  "Bacia do Formoso: caso BHRF" \
  "11. Introdução ao OpenCV" \
  "Fechamento da trilha paralela. Como Juliana usa governança hídrica como sistema viável aplicado, o capítulo de OpenCV é o sistema viável aplicado da visão computacional: pipelines reais, decisões reais, restrições reais. O paralelismo deixa de ser metáfora e vira **dois domínios concretos** onde o aluno exercita o mesmo formalismo." \
  "Diagnóstico VSM aplicado; estudo de caso BHRF (Alves 2022)."

write_carta fase-04-sintese/03-aplicacao-propria \
  "Aplicação própria: diagnóstico DIEST" \
  "9. Representação / 10. Reconhecimento" \
  "Se o trabalho próprio na DIEST envolver evidência baseada em imagens — sensoriamento remoto para política territorial, OCR de documentos para análise de texto, fotos satelitais para auditoria de execução orçamentária — então o livro de Luiz Eduardo deixa de ser metáfora e vira ferramenta operacional, complementando a linguagem VSM com pipelines técnicos concretos." \
  "Síntese final: diagnóstico próprio + apresentação interna IPEA."

echo "---DONE---"
ls fase-*/0*/carta-luiz-eduardo.qmd | wc -l
