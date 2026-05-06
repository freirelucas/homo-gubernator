#!/usr/bin/env bash
# Reescreve os 16 intro.qmd dos capítulos secundários (F1-02..F4-03 exceto F1-01 e F4-01)
# com prosa substantiva mantendo a estrutura de 5 seções.
set -euo pipefail

cat > fase-01-strogatz/02-bifurcacoes-1d/intro.qmd <<'EOF'
---
title: "Bifurcações em 1D"
subtitle: "Fase 1 — Capítulo 2 (Strogatz cap. 3)"
bibliography: ../../bibliografia.bib
format: html
---

## A pergunta operacional

Em F1-01 fixamos a função $f$ e perguntamos pelo comportamento de longo prazo. Agora introduzimos um **parâmetro** $r$ e perguntamos o que acontece à estrutura qualitativa de $\dot{x}=f(x,r)$ quando $r$ varia. A resposta de @strogatz2018 (cap. 3) é: na maior parte do tempo, nada qualitativo muda. Mas em **valores críticos** $r_c$ a estrutura colapsa — pontos fixos colidem, criam-se pares novos, ou trocam estabilidade. Esses são os fenômenos de **bifurcação**.

A taxonomia de Strogatz para 1D é exígua e exaustiva: três formas canônicas (sela-nó, transcrítica, tridente, esta com variantes super- e subcrítica) cobrem todos os comportamentos genéricos. Toda bifurcação 1D é equivalente, perto do ponto crítico, a uma dessas formas após mudança de coordenadas.

## Sela-nó

Forma canônica $\dot{x} = r + x^2$. Para $r<0$: dois pontos fixos $x^* = \pm\sqrt{-r}$, um estável e um instável. Em $r=0$: colidem em zero. Para $r>0$: nenhum ponto fixo real, sistema diverge. **A sela-nó é a forma matemática mais simples do conceito de "ruptura institucional"**: pequena variação no parâmetro destrói a estabilidade que existia. Em VSM (F4-01), é o cenário típico de S1 sem S3 adequado — opera estável até o orçamento descer ao limiar, então perde o ponto fixo e precisa reconfigurar-se.

## Transcrítica

$\dot{x} = rx - x^2$. Pontos fixos $x^*=0$ e $x^*=r$, que **trocam estabilidade** ao passar por $r=0$. Em ecologia, modela invasão: a espécie residente cede lugar à invasora à medida que a adaptabilidade ultrapassa o limiar. Em educação superior, modela transição entre regimes de financiamento: o ponto fixo "operação subsidiada" troca estabilidade com "autossustentada via mensalidade" quando a proporção de bolsas cai abaixo do crítico.

## Tridente (pitchfork)

Supercrítica: $\dot{x} = rx - x^3$. Para $r \leq 0$: único ponto fixo estável em zero. Para $r>0$: zero torna-se instável e nascem dois ramos simétricos estáveis $x^*=\pm\sqrt{r}$. **A simetria $x\to-x$ é preservada pela equação mas quebrada pela trajetória escolhida** — o sistema "decide" um lado. É a quebra espontânea de simetria, central em física estatística.

Subcrítica: $\dot{x} = rx + x^3$ — ramos novos instáveis; aparece histerese se houver termo de quinta ordem estabilizador.

## Conexão com Ashby/Beer

Em VSM, S5 (política/identidade) é, no fundo, a função que **escolhe o ponto fixo** entre alternativas equivalentes. Em uma tridente supercrítica, S5 decide qual dos dois ramos simétricos o sistema seguirá depois de cruzar $r=0$. A decisão não é forçada pela dinâmica — é, literalmente, política. @alves2025variety chama isso de engenharia da variedade ativa: configurar o sistema para que, ao cruzar a bifurcação, o ramo desejado seja o atrator natural. Não é controle; é desenho de bacias.

## Pergunta de verificação

Para $\dot{x} = rx - x^3$: identifique pontos fixos em $r<0$, $r=0$, $r>0$; classifique; esboce o diagrama de bifurcação $(r, x^*)$; calcule $V(x)$ para três valores de $r$. Em linguagem cibernética: que configuração institucional sofre tridente supercrítica quando o parâmetro de controle cresce?

::: {.callout-tip}
Para Joana (`personagem-narrativo.qmd`): a transição "presencial → híbrido → EaD" em uma coordenação de curso pode ser modelada como sequência de bifurcações? Se sim, quais e em que parâmetros?
:::
EOF

cat > fase-01-strogatz/03-fluxos-2d/intro.qmd <<'EOF'
---
title: "Fluxos em 2D"
subtitle: "Fase 1 — Capítulo 3 (Strogatz cap. 5–6)"
bibliography: ../../bibliografia.bib
format: html
---

## A pergunta operacional

Saímos da reta. Em duas dimensões, $\dot{\mathbf{x}}=\mathbf{F}(\mathbf{x})$ com $\mathbf{x}=(x,y)$, abre-se a possibilidade de **trajetórias fechadas** — oscilações sustentadas. A monotonicidade que protegia a Fase 1 evapora. O retrato de fase passa a ser um plano com setas: o problema é classificar, qualitativamente, o que acontece próximo aos pontos fixos e entre eles.

## Linearização e jacobiana

Próximo a um ponto fixo $\mathbf{x}^*$, a dinâmica é dominada pela **matriz jacobiana**

$$
J = \begin{pmatrix} \partial_x F_1 & \partial_y F_1 \\ \partial_x F_2 & \partial_y F_2 \end{pmatrix}\bigg|_{\mathbf{x}^*}.
$$

A análise de estabilidade reduz-se ao espectro de $J$: dois autovalores $\lambda_1, \lambda_2$ classificam o ponto fixo via traço $T = \lambda_1+\lambda_2$ e determinante $D = \lambda_1\lambda_2$. Diagrama $T$-$D$ canônico:

- $D<0$: **sela** (autovalores reais de sinais opostos; instável).
- $D>0$, $T<0$: estável; nó se $T^2 > 4D$, foco se $T^2 < 4D$.
- $D>0$, $T>0$: instável; nó ou foco conforme idem.
- $T=0$, $D>0$: centro (caso conservativo, persiste só sob estrutura especial).

## Nulóclinas

Curvas $\dot{x}=0$ e $\dot{y}=0$. Suas interseções são os pontos fixos; entre elas, o sinal das componentes do campo vetor é constante, o que permite esboçar o retrato à mão sem integrar. Nulóclinas são o instrumento canônico de modelos ecológicos (Lotka-Volterra) e farmacológicos.

## Sistemas conservativos vs. dissipativos

Um sistema é **conservativo** quando existe função $H(\mathbf{x})$ constante ao longo das trajetórias ($\dot{H}=0$). Centros aparecem genericamente em conservativos. Sistemas **dissipativos** ($\nabla\cdot\mathbf{F} < 0$ em média) têm contração de áreas no espaço de fase — atratores aparecem genericamente. A distinção é cibernética: sistema conservativo não tem regulador embutido (variedade não é absorvida); dissipativo absorve.

## Conexão com Ashby/Beer

Em VSM, S2 (antioscilação) é a função que aparece exatamente quando o espaço de estados ganha dimensão suficiente para oscilar. A passagem de F1-01 para F1-03 espelha a passagem de S1 isolado para S1 acoplado: cada operação isolada é monótona; o conjunto delas, sem S2, oscila.

## Pergunta de verificação

Para o sistema $\dot{x} = -x + y$, $\dot{y} = x - y - y^3$: localize pontos fixos, calcule a jacobiana em cada um, classifique, esboce nulóclinas e retrato de fase. Em linguagem cibernética: o sistema é conservativo ou dissipativo? Que função VSM ele exemplifica?

::: {.callout-tip}
Para Joana: modele em 2D a dinâmica conjunta de *engajamento* (acessos à plataforma) e *desempenho* (nota corrente) de coorte UAB-UNITINS. As nulóclinas correspondem a quais políticas de monitoria?
:::
EOF

cat > fase-01-strogatz/04-ciclos-limite/intro.qmd <<'EOF'
---
title: "Ciclos-limite"
subtitle: "Fase 1 — Capítulo 4 (Strogatz cap. 7)"
bibliography: ../../bibliografia.bib
format: html
---

## A pergunta operacional

Em sistemas planares dissipativos, oscilações sustentadas só persistem como **ciclos-limite**: trajetórias fechadas isoladas (não há outras curvas fechadas em uma vizinhança). O ciclo-limite é a forma matemática rigorosa do "regime estacionário oscilatório" — coração batendo, oscilador eletrônico, ciclo predador-presa estabilizado.

## Existência: Poincaré-Bendixson

O **Teorema de Poincaré-Bendixson** garante: se uma trajetória de um sistema planar fica confinada a uma região compacta sem pontos fixos, então ela tende a um ciclo-limite. É o instrumento principal para *demonstrar* que oscilação existe, sem precisar resolver as equações. Em prática, constrói-se uma "região de aprisionamento" — anular, com campo apontando para dentro em ambas as bordas — e a conclusão é automática.

## Modelo canônico: Van der Pol

$$
\ddot{x} - \mu(1-x^2)\dot{x} + x = 0, \qquad \mu > 0.
$$

Para $\mu$ pequeno: ciclo-limite quase sinusoidal (sistema linearmente amortecido com perturbação). Para $\mu$ grande: ciclo de relaxação (acumular-disparar). Modelo canônico de oscilador eletrônico, batimento cardíaco, e — em regime social — ciclos de protesto-repressão.

## Modelo predador-presa

Lotka-Volterra clássico tem centros, não ciclos-limite (é conservativo). Variantes com saturação (Holling tipo II) e auto-limitação geram ciclos-limite genuínos. Distinção importante: oscilação como artefato do modelo conservativo vs. oscilação como atrator robusto.

## Conexão com Ashby/Beer

Ciclo-limite é a forma matemática do **ciclo institucional**: orçamento aprovado → execução → relatório → novo orçamento; ou matrícula → curso → trancamento → reativação. A tese de @alves2022 diagnostica o ciclo recorrente outorga-crise-negociação-nova-outorga na BHRF como ciclo-limite institucional: o sistema retorna ao mesmo padrão depois de cada perturbação porque S2 e S4 estão ausentes. Sem antioscilação e sem inteligência de futuro, o ciclo é o atrator natural.

## Pergunta de verificação

Para Van der Pol com $\mu=1$: prove existência de ciclo-limite via Poincaré-Bendixson construindo uma região anular de aprisionamento. Esboce o ciclo. Em linguagem cibernética: qual a "função" do ciclo (S2 efetivo, S4 ausente, ou outra coisa)?

::: {.callout-tip}
Para Joana: o calendário ano-letivo brasileiro é candidato a ciclo-limite institucional. Quais perturbações (greve, pandemia, mudança de gestão) deslocam transientemente o sistema-curso e quais o realimentam de volta ao ciclo?
:::
EOF

cat > fase-01-strogatz/05-bifurcacoes-2d/intro.qmd <<'EOF'
---
title: "Bifurcações em 2D"
subtitle: "Fase 1 — Capítulo 5 (Strogatz cap. 8)"
bibliography: ../../bibliografia.bib
format: html
---

## A pergunta operacional

Em F1-02 vimos bifurcações 1D — colisão, troca, quebra de simetria de pontos fixos. Em 2D abre-se um repertório maior: além das três 1D (que persistem), aparecem **bifurcações de Hopf** (nascimento de ciclos-limite a partir de pontos fixos) e bifurcações **globais** (reorganização do retrato de fase em escala não-local). É aqui que o vocabulário de Strogatz torna-se rico o suficiente para descrever transições de regime de sistemas reais complexos.

## Bifurcação de Hopf

Em $r=r_c$, um par de autovalores complexos conjugados de $J$ cruza o eixo imaginário. Antes: foco estável. Depois: foco instável + ciclo-limite que nasce a partir dele.

- **Supercrítica**: ciclo nasce estável, com amplitude $\sim\sqrt{r-r_c}$ (transição suave).
- **Subcrítica**: ciclo de amplitude finita aparece de uma vez, com histerese (transição abrupta, com salto).

A distinção é crítica em sistemas reais: Hopf supercrítica é o nascimento gradual de uma oscilação; subcrítica é a explosão súbita de um regime oscilatório quando se cruza o limiar.

## Bifurcações globais

Não-detectáveis pela linearização local. Três tipos canônicos:

- **Sela-nó de ciclos**: dois ciclos-limite (estável + instável) colidem e desaparecem.
- **Bifurcação homoclínica**: ciclo-limite cresce até tangenciar uma sela, formando órbita homoclínica.
- **Bifurcação infinita-período**: ciclo-limite "engasga" perto de um ponto fixo nascente.

## Conexão com Ashby/Beer

Hopf é o cenário formal de **emergência de oscilação institucional**: o sistema operava em regime estacionário e, ao cruzar um limiar (orçamento, demanda, tensão), passa a oscilar. Diagnóstico-chave: a oscilação nasceu suave (Hopf supercrítica — sintoma de S2 deficiente mas presente) ou súbita (subcrítica — sintoma de S2 ausente)? @alvesschwaninger2025 trata casos análogos no contexto de governança hídrica.

## Pergunta de verificação

Para o sistema $\dot{r} = r(\mu - r^2)$, $\dot{\theta} = 1$ (em coordenadas polares): identifique a bifurcação que ocorre em $\mu=0$, classifique como super- ou subcrítica, esboce os retratos de fase para $\mu<0$ e $\mu>0$. Em linguagem cibernética: que tipo de oscilação institucional o cenário descreve?

::: {.callout-tip}
Para Joana: a coexistência entre presencial UNIFAL e EaD UNITINS no orçamento federal pode sofrer Hopf subcrítica? Sob quais condições?
:::
EOF

cat > fase-01-strogatz/06-caos-lorenz/intro.qmd <<'EOF'
---
title: "Caos e atrator de Lorenz"
subtitle: "Fase 1 — Capítulo 6 (Strogatz cap. 9)"
bibliography: ../../bibliografia.bib
format: html
---

## A pergunta operacional

Saímos para 3D. Aqui aparece o último fenômeno qualitativo da Fase 1: **caos determinístico** — sensibilidade exponencial às condições iniciais com trajetórias confinadas a um conjunto invariante de medida zero, o **atrator estranho**. O sistema é determinístico (não há aleatoriedade nas equações), mas previsibilidade prática se perde em escala de tempo $\sim 1/\lambda$, onde $\lambda$ é o expoente de Lyapunov dominante.

## Sistema de Lorenz

$$
\dot{x} = \sigma(y-x), \quad \dot{y} = x(\rho-z) - y, \quad \dot{z} = xy - \beta z.
$$

Parâmetros canônicos: $\sigma=10$, $\beta=8/3$, $\rho=28$. Origem: modelo simplificado de convecção atmosférica (@strogatz2018 cap. 9). Para $\rho < 1$: origem estável globalmente. Para $1 < \rho < \rho_c \approx 24.74$: dois pontos fixos não-triviais estáveis. Para $\rho > \rho_c$: caos — atrator estranho com a célebre forma de borboleta.

## Sensibilidade e expoentes de Lyapunov

Duas trajetórias com condições iniciais separadas por $\delta_0$ divergem como $\delta(t) \sim \delta_0 e^{\lambda t}$ no tempo curto. $\lambda > 0$ é a definição operacional de caos. Para Lorenz canônico, $\lambda \approx 0.9$. Tempo de previsibilidade prática: $\sim 1/\lambda \approx 1$ unidade de tempo.

## Estrutura fractal

O atrator de Lorenz tem dimensão de Hausdorff não-inteira ($\approx 2.06$): nem superfície (2D) nem volume (3D). Estrutura auto-similar em escala. **Conjunto de medida zero no espaço de fase, mas com volume de bacia positivo** — é onde quase todas as trajetórias acabam, sem ocupar espaço.

## Conexão com Ashby/Beer

Caos é o regime onde a Lei de Ashby falha de modo curioso: a variedade $H(D)$ instantânea pode ser pequena, mas a variedade *integrada no tempo* explode exponencialmente. Reguladores que operam em banda passante limitada são derrotados por sensibilidade às condições iniciais. A apresentação ASC 2024 de @alves2022 sobre o nexo Água-Energia-Alimento é, formalmente, uma fala sobre exatamente esse tipo de regime — sistemas dissipativos de três variáveis acopladas onde caos é genérico.

## Pergunta de verificação

Para o sistema de Lorenz com parâmetros canônicos: simule duas trajetórias com condições iniciais $\mathbf{x}_0$ e $\mathbf{x}_0 + (10^{-6}, 0, 0)$. Plote $\|\mathbf{x}_1(t) - \mathbf{x}_2(t)\|$ em escala log-linear. Estime $\lambda$. Em linguagem cibernética: que tipo de regulador funcionaria, em princípio, neste sistema?

::: {.callout-tip}
Para Joana: nas séries históricas de evasão por polo UAB-UNITINS, estime expoente de Lyapunov empírico. A sensibilidade ao perfil socioeconômico inicial da coorte é maior do que a tradição da pesquisa em educação supõe?
:::
EOF

cat > fase-02-markov/01-cadeias-finitas/intro.qmd <<'EOF'
---
title: "Cadeias finitas"
subtitle: "Fase 2 — Capítulo 1 (Häggström caps. 1–4)"
bibliography: ../../bibliografia.bib
format: html
---

## A pergunta operacional

Saímos do mundo determinístico. Em uma cadeia de Markov finita, o estado seguinte é amostrado de uma distribuição que depende **apenas do estado atual** (propriedade markoviana). A pergunta operacional: dado o conjunto finito de estados $S = \{1,\ldots,N\}$ e a matriz de transição $P$, o que se pode dizer sobre o comportamento de longo prazo da sequência $(X_n)_{n\geq 0}$?

## Matriz de transição

$P_{ij} = \mathbb{P}(X_{n+1}=j \mid X_n=i)$. Linhas não-negativas que somam 1 (matriz **estocástica**). Probabilidade $n$-passos: $(P^n)_{ij}$. Distribuição em tempo $n$: $\mu_n = \mu_0 P^n$ (vetor-linha).

## Classes de comunicação

$i \to j$ se existe $n$ com $(P^n)_{ij}>0$; $i \leftrightarrow j$ se ambos os sentidos. A relação $\leftrightarrow$ é de equivalência; particiona os estados em **classes de comunicação**. Uma cadeia é **irredutível** se há uma única classe — todos os estados se alcançam mutuamente.

## Recorrência, transitoriedade, periodicidade

- **Recorrente**: o estado é visitado infinitamente often com probabilidade 1.
- **Transiente**: visitado finitamente often.
- **Período** $d(i)$: $\gcd\{n \geq 1 : (P^n)_{ii} > 0\}$. Cadeia **aperiódica** se $d(i)=1$ para algum (e portanto todo, em irredutível) estado.

Em cadeia finita irredutível, todos os estados são recorrentes (não há "fuga ao infinito" em conjunto finito).

## Conexão com Ashby/Beer

A matriz $P$ é a forma probabilística da **caixa preta** de @ashby1956: dado o estado atual, a distribuição de próximas transições é a "função de transferência" do sistema. Se classe de comunicação $\neq$ todo o conjunto, há regiões do espaço de estados inacessíveis a partir de outras — o sistema viola conectividade, sintoma típico de S2 ausente em VSM. A irredutibilidade é, em linguagem institucional, a conectividade da rede de comunicação.

## Pergunta de verificação

Considere a cadeia com estados $\{$matriculado, trancado, jubilado$\}$ e matriz

$$
P = \begin{pmatrix} 0.85 & 0.10 & 0.05 \\ 0.30 & 0.65 & 0.05 \\ 0 & 0 & 1 \end{pmatrix}.
$$

Identifique classes de comunicação, recorrência/transitoriedade de cada estado, periodicidade. É irredutível? Em linguagem cibernética: que função VSM falha quando "jubilado" é estado absorvente?

::: {.callout-tip}
Para Joana: estime a matriz $P$ para coorte UAB-UNITINS com dados anuais de matrícula 2015–2024. Compare com hipotética coorte UNIFAL-MG presencial. Qual diferença estrutural emerge?
:::
EOF

cat > fase-02-markov/02-distribuicoes-estacionarias/intro.qmd <<'EOF'
---
title: "Distribuições estacionárias"
subtitle: "Fase 2 — Capítulo 2 (Häggström caps. 5–6)"
bibliography: ../../bibliografia.bib
format: html
---

## A pergunta operacional

Dada uma cadeia $(P, S)$, existe distribuição $\pi$ sobre $S$ que é **invariante** sob $P$? Se sim, é única? E a distribuição inicial $\mu_0$ converge a $\pi$ em $n \to \infty$? Estas três perguntas — existência, unicidade, convergência — definem o programa do capítulo. Resposta de @haggstrom2002: para cadeias finitas irredutíveis e aperiódicas, sim, sim e sim.

## Distribuição estacionária

$\pi$ é estacionária se $\pi P = \pi$ e $\sum_i \pi_i = 1$. Em palavras: aplicar mais uma transição não muda a distribuição. Computacionalmente, $\pi$ é o autovetor à esquerda de $P$ com autovalor 1, normalizado.

## Teorema de convergência

**Teorema** (@haggstrom2002 cap. 5). Se $P$ é irredutível e aperiódica em conjunto finito, então existe única $\pi$ estacionária e, para qualquer $\mu_0$, $\mu_n \to \pi$ em variação total à medida que $n \to \infty$. A convergência é geométrica: $\|\mu_n - \pi\|_{\text{TV}} \leq C \rho^n$ para algum $\rho < 1$.

## Tempo de mistura

$$
t_{\text{mix}}(\varepsilon) := \min\{n \geq 0 : \max_i \|P^n(i,\cdot) - \pi\|_{\text{TV}} \leq \varepsilon\}.
$$

É a métrica operacional do "quanto tempo o sistema leva para esquecer a condição inicial". Em VSM, $t_{\text{mix}}$ é o tempo característico de S2 — a função antioscilatória só pode operar em escala $\geq t_{\text{mix}}$.

## Conexão com Ashby/Beer

A distribuição estacionária $\pi$ é, em linguagem ashbyana, a **distribuição operacional do regulador**: o conjunto de respostas que o sistema fornece quando deixado em equilíbrio. @alves2025variety propõe que a engenharia da variedade busca, no longo prazo, $\pi$ alvo — não estado-objetivo único, mas distribuição que cobre a variedade dos distúrbios. $\pi$ é meta de design, não $x^*$.

## Pergunta de verificação

Para $P = \begin{pmatrix} 0.7 & 0.3 \\ 0.4 & 0.6 \end{pmatrix}$: encontre $\pi$ analiticamente. Estime $t_{\text{mix}}(0.01)$ por simulação. Em linguagem cibernética: $\pi$ é configuração desejável ou apenas equilíbrio efetivo?

::: {.callout-tip}
Para Joana: a política de cotas UNITINS deveria, no longo prazo, levar a $\pi$ específica de alunado por origem socioeconômica. O desvio entre $\pi$ teórico (objetivo) e estimador empírico (histórico) é diagnóstico de quê?
:::
EOF

cat > fase-02-markov/03-reversibilidade-mcmc/intro.qmd <<'EOF'
---
title: "Reversibilidade e MCMC"
subtitle: "Fase 2 — Capítulo 3 (Häggström caps. 7–11)"
bibliography: ../../bibliografia.bib
format: html
---

## A pergunta operacional

Dada distribuição-alvo $\pi$ que se quer amostrar, mas que é difícil de tratar analiticamente — como construir uma cadeia de Markov cuja estacionária seja exatamente $\pi$? A resposta é a tradição **MCMC** (Markov Chain Monte Carlo), que data dos trabalhos de @metropolis1953 e @hastings1970, e ganha formulação geral em @geman1984.

## Balanço detalhado

Uma cadeia satisfaz **balanço detalhado** com respeito a $\pi$ se

$$
\pi_i P_{ij} = \pi_j P_{ji}, \qquad \forall i,j.
$$

Condição **suficiente** para $\pi$ ser estacionária: somando em $i$ ambos os lados, recupera-se $\pi P = \pi$. Cadeias que satisfazem balanço detalhado são chamadas **reversíveis**.

## Algoritmo de Metropolis-Hastings

Dada distribuição-alvo $\pi$ (até constante de normalização) e distribuição de proposta $q(\cdot \mid i)$:

1. No estado $i$, propor $j \sim q(\cdot \mid i)$.
2. Aceitar com probabilidade $\alpha = \min\!\left(1, \frac{\pi_j q(i \mid j)}{\pi_i q(j \mid i)}\right)$.
3. Caso contrário, ficar em $i$.

Construção garante balanço detalhado. Particularmente útil quando $\pi$ é conhecida só até constante (caso típico em estatística bayesiana).

## Gibbs sampler (@geman1984)

Em distribuições multivariadas $\pi(\mathbf{x})$, atualiza-se uma coordenada de cada vez amostrando da condicional $\pi(x_k \mid x_{-k})$. É caso especial de Metropolis-Hastings com aceitação 1. Aplicação canônica: restauração bayesiana de imagens — um dos primeiros casos de uso de larga escala, e a ponte direta com PDI (`carta-luiz-eduardo.qmd` deste capítulo).

## Conexão com Ashby/Beer

Reversibilidade é, em linguagem institucional, **transparência decisória**: cada decisão pode ser rastreada de volta ao seu fundamento, com a mesma probabilidade que foi tomada. Juliana defende isso explicitamente em fóruns Metaphorum. MCMC é, em linguagem ashbyana, **amplificação computacional de variedade do regulador** — onde antes o regulador limitava-se à variedade analítica que conseguia tratar, MCMC permite-lhe alcançar variedade arbitrária da $\pi$ alvo.

## Pergunta de verificação

Implemente Metropolis-Hastings para amostrar $\pi(x) \propto e^{-x^2/2}\cdot(1 + 0.5\cos(3x))$ em $x \in \mathbb{R}$ (não-normalizada). Compare histograma com $\pi$ via numerical integration. Estime taxa de aceitação. Em linguagem cibernética: que função VSM o algoritmo executa?

::: {.callout-tip}
Para Joana: usar MCMC para estimar distribuição posterior de risco-de-evasão condicional a polo, modalidade e perfil — paralelo direto com Geman & Geman 1984.
:::
EOF

cat > fase-02-markov/04-tempo-continuo/intro.qmd <<'EOF'
---
title: "Tempo contínuo"
subtitle: "Fase 2 — Capítulo 4 (Norris caps. 2–3)"
bibliography: ../../bibliografia.bib
format: html
---

## A pergunta operacional

Em tempo discreto, transições ocorrem a passos inteiros. Em tempo contínuo, ocorrem em instantes aleatórios — o estado salta a um ritmo governado por **taxas**. A pergunta operacional muda de "qual a próxima transição?" para "quando e para onde a próxima transição?".

## Matriz geradora $Q$

Para cadeia em tempo contínuo, $Q_{ij}$ ($i \neq j$) é a taxa de transição $i \to j$, e $Q_{ii} = -\sum_{j \neq i} Q_{ij}$. As probabilidades de transição em tempo $t$ são

$$
P(t) = e^{Qt}.
$$

Equação de Kolmogorov forward: $\frac{dP(t)}{dt} = P(t)\,Q$.

## Tempo de espera

Em cada estado $i$, o tempo até o próximo salto é exponencial com parâmetro $|Q_{ii}|$. Memorylessness: a propriedade markoviana em tempo contínuo decorre da memorylessness exponencial.

## Processos de nascimento-morte

Casos canônicos: filas M/M/1, processos populacionais, modelos químicos. Forma geral $Q$: tridiagonal com taxas $\lambda_n$ (nascimento) e $\mu_n$ (morte). Distribuição estacionária via balanço detalhado: $\pi_n = \pi_0 \prod_{k=1}^n \lambda_{k-1}/\mu_k$.

## Conexão com filtros gaussianos

A cadeia mais simples em tempo contínuo é o **movimento browniano** (limite de cadeia de passeio aleatório com passos pequenos), cuja densidade evolui pela equação do calor $\partial_t u = \nabla^2 u$. Convolução com gaussiana de variância $\sigma^2$ é equivalente a integrar a equação do calor até $t = \sigma^2/2$ — exatamente o filtro suavizador de @silvasilveira2026 (cap. 3 do livro PDI; vide carta-luiz-eduardo).

## Conexão com Ashby/Beer

Tempo contínuo é a forma natural para sistemas onde transições não estão sincronizadas — o que é regra, não exceção, em sistemas institucionais. A tese de @alves2022 modela o balanço hídrico da BHRF em tempo contínuo, com taxas dependentes de regime de chuvas e política de outorgas. Generaliza para qualquer fluxo institucional contínuo.

## Pergunta de verificação

Para fila M/M/1 com $\lambda < \mu$: encontre $\pi_n$ analiticamente. Calcule tempo médio no sistema e tamanho médio da fila. Em linguagem cibernética: o que é S3 em uma fila? E $H(R)$?

::: {.callout-tip}
Para Joana: a difusão do conhecimento em sala virtual UAB-UNITINS é processo markoviano em tempo contínuo. Estime $|Q_{ii}|$ por participante a partir de logs de fórum.
:::
EOF

cat > fase-02-markov/05-aplicacoes-algoritmicas/intro.qmd <<'EOF'
---
title: "Aplicações algorítmicas"
subtitle: "Fase 2 — Capítulo 5 (Häggström caps. 8–10)"
bibliography: ../../bibliografia.bib
format: html
---

## A pergunta operacional

A teoria de cadeias de Markov não é só descritiva — é **algorítmica**. Problemas computacionais podem ser reformulados como amostragem de distribuições específicas, e cadeias de Markov ad-hoc são construídas para resolvê-los. Este capítulo cobre os principais.

## Simulated annealing

Para minimizar função-objetivo $E(\mathbf{x})$ em espaço discreto grande, define-se $\pi_T(\mathbf{x}) \propto e^{-E(\mathbf{x})/T}$. Para $T \to 0$, $\pi_T$ concentra no mínimo global. Algoritmo: rodar Metropolis com $\pi_T$, baixando $T$ gradualmente. Convergência ao mínimo global garantida sob *cooling schedule* logarítmico — lentos, mas teoricamente impecáveis.

## Hard-core model e o problema de empacotamento

Distribuição uniforme sobre configurações independent-set de um grafo. MCMC dá amostragem aproximada; tempo de mistura controla quão rápido. Aplicações: alocação de recursos, scheduling.

## PageRank

A matriz de transição do navegador aleatório na web tem estacionária $\pi$ que é, por definição, o PageRank. @brin1998 não está na bibliografia mas o capítulo explica a redução do problema de ranking ao problema markoviano canônico.

## Particle filters / SMC

Generalização sequencial de MCMC para inferência online em modelos de espaço de estados. Aplicações: tracking, robótica, filtragem em séries temporais.

## Conexão com Ashby/Beer

Algorítmica markoviana é, em linguagem ashbyana, **amplificação operacional da variedade $H(R)$**: o regulador computacional pode tratar problemas cuja variedade combinatória excederia a capacidade analítica humana. @alves2022landuse usa, no fundo, esquemas multi-vista que prefiguram amostragem multimodal — precursor conceitual do que MCMC formaliza.

## Pergunta de verificação

Implemente simulated annealing para o Traveling Salesman em 20 cidades. Compare resultado a heurística greedy. Em linguagem cibernética: como o aparato MCMC amplifica $H(R)$ em problema de otimização institucional?

::: {.callout-tip}
Para Joana: classificar risco-de-evasão por perfil de estudante via posterior MCMC. O paralelo com @alves2022landuse é o uso da diversidade de fontes como amplificador da variedade do regulador.
:::
EOF

cat > fase-03-sterman/01-fundamentos-sd/intro.qmd <<'EOF'
---
title: "Fundamentos de SD"
subtitle: "Fase 3 — Capítulo 1 (Sterman caps. 1–6)"
bibliography: ../../bibliografia.bib
format: html
---

## A pergunta operacional

Dinâmica de sistemas (SD), tradição inaugurada por @forrester1961 e consolidada por @sterman2000, oferece linguagem operacional para modelar sistemas com **estoques**, **fluxos** e **laços de feedback**. A pergunta operacional: dado um sistema com múltiplas variáveis acumulando ao longo do tempo, sob laços de causalidade circular, quais são os modos de comportamento possíveis?

## Estoques e fluxos

Variável de **estoque** $S$: nível com unidade [unidades]. Variável de **fluxo** $\phi$: taxa, [unidades/tempo]. A relação fundamental:

$$
\frac{dS}{dt} = \phi_{\text{in}} - \phi_{\text{out}}.
$$

Estoques têm memória; fluxos não. Em integração numérica via Euler explícito,

$$
S(t+\Delta t) = S(t) + \Delta t \cdot [\phi_{\text{in}}(t) - \phi_{\text{out}}(t)],
$$

com erro local $O(\Delta t^2)$.

## Quatro modos canônicos

@sterman2000 identifica quatro padrões qualitativos:

1. **Crescimento exponencial** (laço R isolado).
2. **Decaimento exponencial** (laço B isolado).
3. **Crescimento sigmóide** (R domina cedo, B domina tarde).
4. **Oscilação** (B com atraso).

Combinações desses quatro modos cobrem o repertório fenomenológico observado em sistemas reais.

## Diagrama causal (CLD)

Grafo dirigido com polaridades + e − e identificação de laços R (reforçador) e B (balanceador). Polaridade negativa: causa e efeito variam em sentidos opostos. Laço R: número par de polaridades negativas (zero conta). Laço B: ímpar.

## Conexão com Ashby/Beer

Em VSM, F3 fornece a **álgebra de S3**: alocação aqui-agora envolve fluxos entre estoques (recursos, atenção, prazo), com atrasos que geram bullwhip institucional (cap. F3-02). A tese de @alves2022 constrói o balanço hídrico da BHRF como sistema de estoques (água armazenada, demanda, outorgas) com fluxos parametrizados pela política — apresentação canônica SD da governança.

## Pergunta de verificação

Modele dN/dt = bN(1 − N/K) − dN como sistema de estoque-fluxo. Identifique laços R e B. Esboce CLD. Em linguagem cibernética: qual estoque é S1, qual fluxo é controlado por S3?

::: {.callout-tip}
Para Joana: o pipeline UNIFAL vestibular → matrícula → integralização → diplomação é cadeia de estoques-fluxos. Compare com UAB-UNITINS — quais atrasos são sistematicamente maiores?
:::
EOF

cat > fase-03-sterman/02-feedback-loops/intro.qmd <<'EOF'
---
title: "Laços de feedback"
subtitle: "Fase 3 — Capítulo 2 (Sterman caps. 4–5, 16)"
bibliography: ../../bibliografia.bib
format: html
---

## A pergunta operacional

Em F3-01 vimos que estoques e fluxos podem formar laços. Aqui o foco é: como a topologia dos laços (R vs B, com ou sem atraso) determina o comportamento dinâmico? E como diagnosticar a estrutura de laços a partir do comportamento observado?

## Laços R e B isolados

R isolado: crescimento exponencial puro, $\dot{S} = aS$, $a>0$. B isolado: decaimento, $\dot{S} = -aS$. Realidade: sistemas têm múltiplos laços coexistindo, R e B se alternam em dominância conforme regime.

## Atraso e bullwhip

Sterman dedica cap. 16 ao **bullwhip effect**: amplificação progressiva da variabilidade dos pedidos a montante na cadeia de suprimentos, originada de atrasos e correções de estoque. Modelagem mínima: $\dot{S} = a(S^* - S)$ vs. $\dot{S} = a(S^*(t-\tau) - S(t-\tau))$ — atraso $\tau$ destabiliza laço B.

Em sistemas institucionais, bullwhip aparece como amplificação de pequenas perturbações na demanda original (matrículas) em grandes oscilações orçamentárias três-quatro semestres adiante.

## Diagnóstico de loops ausentes

Diagnóstico canônico SD: comportamento observado **inconsistente** com qualquer combinação dos quatro modos sugere laço ausente. @alves2020srbs aplica a heurística no caso piscicultura tocantinense — a estagnação observada (entradas crescem, saídas estagnam) é assinatura comportamental de sistema *sem* laço B funcionando, ou de S2 ausente em VSM.

## Conexão com Ashby/Beer

Laço de feedback é a forma matemática elementar do canal de comunicação que liga subsistemas em VSM. Identificar quais laços existem e quais estão ausentes é o primeiro passo de diagnóstico cibernético. Sterman fornece o instrumental quantitativo; Beer fornece a taxonomia funcional.

## Pergunta de verificação

Para o sistema de produção-estoque com atraso $\tau$: simule resposta a degrau na demanda. Identifique bullwhip. Como $\tau$ afeta amplitude da oscilação? Em linguagem cibernética: que função VSM precisaria amplificar-se para atenuar bullwhip?

::: {.callout-tip}
Para Joana: identificar laço R "pesquisa atrai bons alunos → publicação cresce → reputação atrai mais" e laço B "erosão por evasão" é primeiro passo de diagnóstico SD do sistema-curso UNIFAL ou UNITINS.
:::
EOF

cat > fase-03-sterman/03-modelagem-formal/intro.qmd <<'EOF'
---
title: "Modelagem formal"
subtitle: "Fase 3 — Capítulo 3 (Sterman caps. 7–13)"
bibliography: ../../bibliografia.bib
format: html
---

## A pergunta operacional

A passagem do diagrama causal (CLD) à equação diferencial executável é onde o método SD ganha rigor. Esta é a transição do modelo conceitual ao modelo computacional. As perguntas operacionais: como escolher unidades, como parametrizar relações não-lineares, como integrar numericamente sem artefato, como documentar as escolhas?

## Convenções de unidade

Toda variável tem unidade explícita. Verificação dimensional é primeira linha de defesa contra erro: $[\dot{S}] = [\text{estoque}/\text{tempo}]$, e compor expressões respeitando unidades elimina classes inteiras de bug.

## Funções não-lineares e tabelas

Relações empíricas vão à equação como **funções tabuladas** (look-up tables): efeito de utilização sobre produtividade, efeito de pressão sobre erros, etc. Convenção: domínio normalizado a $[0, 1]$ ou $[0, \infty)$, com ponto de referência explícito.

## Integração numérica

Métodos canônicos: Euler explícito (simples, $O(\Delta t)$ global); RK4 (alta ordem, $O(\Delta t^4)$ global); métodos adaptativos via SciPy `solve_ivp`. Critério de escolha: rigidez do sistema. Modelos institucionais tipicamente são *não-rígidos* — Euler com $\Delta t$ pequeno funciona.

## Função de transferência

Para sistemas lineares, $H(s) = Y(s)/U(s)$ caracteriza o sistema completamente. Modelagem espectral via Laplace é a forma SD canônica de um sistema linear; conecta-se diretamente com Fourier (cap. F1-03 e PDI cap. 4).

## Conexão com Ashby/Beer

Modelagem formal é onde a "modelagem-como-governança" de @alvesschwaninger2025 ganha tração. O modelo é construído não para *prever*, mas para funcionar como **órgão regulador adicional** — programa Conant-Ashby aplicado. A diferença prática entre modelo descritivo e modelo regulador está no critério de validação (cap. F3-04).

## Pergunta de verificação

Modele o ciclo logístico ($\dot{N} = rN(1-N/K)$) em PySD. Compare três métodos de integração com $\Delta t$ variando. Em linguagem cibernética: qual o erro tolerável para que o modelo funcione como regulador?

::: {.callout-tip}
Para Joana: modelagem espectral do calendário acadêmico (picos semestrais) revela função de transferência do sistema-curso. Que KPIs de S3 da pró-reitoria respondem a esses modos?
:::
EOF

cat > fase-03-sterman/04-validacao/intro.qmd <<'EOF'
---
title: "Validação"
subtitle: "Fase 3 — Capítulo 4 (Sterman cap. 21)"
bibliography: ../../bibliografia.bib
format: html
---

## A pergunta operacional

Quando um modelo SD é "bom o suficiente"? @sterman2000 (cap. 21) responde com taxonomia em duas frentes: testes **estruturais** (independem do comportamento simulado) e testes **comportamentais** (comparam saída a dados).

## Testes estruturais

- **Verificação de limites**: o modelo se comporta razoavelmente em condições extremas (estoque nulo, fluxo infinito)?
- **Verificação dimensional**: unidades são consistentes em toda equação?
- **Robustez a parâmetros**: pequenas variações causam grandes saltos?
- **Adequação às fronteiras**: variáveis críticas são endógenas, não exógenas?

## Testes comportamentais

- **Replicação histórica**: modelo reproduz dados passados?
- **Robustez a perturbações**: padrões qualitativos sobrevivem a ruído nos parâmetros?
- **Sensibilidade**: que parâmetros mais afetam saídas relevantes?
- **Família de modos**: o modelo gera os quatro modos canônicos do sistema observado?

## Crítica à tradição preditiva

@alvesschwaninger2025 e a apresentação ASC 2024 de Juliana enfatizam: validação para governança não é validação preditiva. **O modelo é bom se ampliou $H(R)$ do tomador de decisão**, não se previu o futuro. Esta é leitura distinta da tradição Sterman — destacada por Espejo na mesa-redonda subsequente — e abre espaço para validação por critérios cibernéticos: o modelo aumenta variedade requisita do regulador? aumenta horizonte de S4? expõe lacunas em S2 antes invisíveis?

## Métricas quantitativas

Quando comparação numérica é apropriada: MSE, RMSE, MAPE, Theil's $U$. Para sistemas onde "padrão" importa mais que valor exato: comparação de modos via análise espectral.

## Conexão com Ashby/Beer

Validação em VSM tem dupla camada: (i) o modelo é internamente consistente (testes Sterman); (ii) o modelo amplia variedade do regulador real (testes Conant-Ashby). Ambas as camadas são necessárias — a primeira garante que o modelo não é absurdo; a segunda garante que ele é útil.

## Pergunta de verificação

Para um modelo SD próprio (escolha um da literatura ou construa simples): aplique três testes estruturais e dois comportamentais. Em linguagem cibernética: o modelo amplia $H(R)$? De quem?

::: {.callout-tip}
Para Joana: validar modelo SD da coordenação de curso (replicação histórica de matrícula 2010–2024) é estruturalmente análogo a validar JPEG por PSNR. Use as duas métricas em paralelo.
:::
EOF

cat > fase-04-sintese/02-bacia-formoso-caso/intro.qmd <<'EOF'
---
title: "Bacia do Formoso: caso BHRF"
subtitle: "Fase 4 — Capítulo 2 (Alves 2022; Alves & Schwaninger 2025)"
bibliography: ../../bibliografia.bib
format: html
---

## A pergunta operacional

Aplicar o aparato cibernético da Fase 4 a um caso real é o que separa pedagogia de retórica. O caso da **Bacia Hidrográfica do Rio Formoso (BHRF)**, no Tocantins, foi diagnosticado por @alves2022 em sua tese de doutorado com diagnóstico VSM em recursão tripla: federal, estadual, usuários. Este capítulo reconstrói o caso e extrai as lições.

## O sistema-objeto

A BHRF abrange municípios de Lagoa da Confusão e Formoso do Araguaia, com agricultura irrigada de larga escala (rizicultura) e estresse hídrico crescente desde 2010. Em 2016, o Ministério Público Estadual moveu Ação Civil Pública por uso conflitante. Foi criado o **Grupo de Acompanhamento e Negociação (GAN)** como resposta institucional.

## Diagnóstico VSM

@alves2022 identifica:

- **S1**: cada outorga ativa (irrigação, abastecimento, dessedentação animal).
- **S2 ausente**: não havia coordenação lateral entre outorgantes — cada um operava como se os outros não existissem.
- **S3 fraco**: a Naturatins (agência estadual) operava como S3 nominal, mas sem instrumentos de monitoramento em tempo real nem capacidade de resposta rápida.
- **S4 inexistente**: nenhuma instância monitorava cenário futuro de demanda hídrica vs. oferta climática.
- **S5**: política federal (ANA) e estadual conflitantes — o "sistema" tinha duas identidades.

A criação do GAN supre parcialmente S2; ainda assim, S4 permanece lacuna central até hoje.

## Modelagem-como-governança

@alvesschwaninger2025 retoma o caso e propõe uma camada adicional: modelagem dinâmica do balanço hídrico como **órgão regulador adicional** — não para prever, mas para ampliar $H(R)$ dos atores. O modelo passa a ser instrumento de variedade requisita.

## Lições para análogos institucionais

A estrutura do caso BHRF é genérica: sistema com múltiplos S1 autônomos, S2/S4 ausentes, conflito que escala até envolver Ministério Público, criação reativa de instância de coordenação. Essa estrutura aparece em rede educacional pública (UAB-UNITINS, redes federais), saúde (SUS), saneamento, e várias políticas finalísticas brasileiras. **O valor pedagógico do caso é a sua transferibilidade**.

## Conexão com a pesquisa-cenário (Joana)

A coordenação de curso UAB-UNITINS que Joana analisa é estruturalmente análoga à governança hídrica da BHRF em recursão tripla (UAB nacional / UNITINS estadual / polo municipal), com as mesmas ausências sistemáticas previstas pelo modelo de Alves. Seria possível um GAN educacional? Seria útil?

## Pergunta de verificação

Para a BHRF descrita acima: identifique a função VSM dominante em cada conflito específico (uso humano vs. agrícola, uso agrícola montante vs. jusante, uso atual vs. futuro). Em cada caso, qual intervenção de variedade — atenuar $H(D)$, ampliar $H(R)$, alargar $H(O)$ — seria mais barata?

::: {.callout-tip}
Para Joana: aplique a estrutura BHRF a um curso UAB-UNITINS específico. Quais S1, S2, S3, S4, S5? Onde estão as ausências?
:::
EOF

cat > fase-04-sintese/03-aplicacao-propria/intro.qmd <<'EOF'
---
title: "Aplicação própria: diagnóstico VSM de uma coordenação de curso"
subtitle: "Fase 4 — Capítulo 3 (síntese final)"
bibliography: ../../bibliografia.bib
format: html
---

## A pergunta operacional

Capítulo final. Tudo se converge aqui: as três fases técnicas (Strogatz, Markov, Sterman) viram instrumental para diagnóstico VSM concreto de uma coordenação de curso de graduação à escolha do(a) leitor(a). A persona-andaime Joana usa coordenação de Sistemas de Informação UNITINS-Palmas ou Computação UNIFAL-MG; quem lê pode usar a própria experiência institucional, ou seguir Joana como caso.

## Roteiro

1. **Definir o sistema** (recursão escolhida, fronteiras, função-fim).
2. **Identificar os cinco subsistemas** S1–S5 em recursão única.
3. **Aplicar fase técnica relevante** a cada subsistema:
   - S1: Strogatz (ponto fixo de operação, bacia, estabilidade).
   - S2: Markov (cadeia de estados de coordenação, distribuição estacionária).
   - S3: Sterman (estoques, fluxos, atrasos, bullwhip).
   - S4: análise prospectiva (Lyapunov, Fourier, modelagem espectral).
   - S5: identidade institucional (regimentos, missão, identidade declarada vs. observada).
4. **Calcular variedades** $H(D)$, $H(R)$, $H(O)$ qualitativamente.
5. **Identificar ausências sistemáticas** (tipicamente S2 e S4).
6. **Propor intervenção** do tipo atenuação/ampliação/alargamento.

## Critérios de qualidade

@alves2022 oferece o standard duplo: rigor VSM (recursão explícita, identificação nominal das funções, proposta de redesenho); inserção dialógica em literatura internacional revisada por pares (ASC, Metaphorum, *Constructivist Foundations*). O diagnóstico bom é o que pode ser submetido a essa comunidade.

## Comunicação ao colegiado

Saída final do projeto: documento de diagnóstico (~5.000 palavras) + apresentação ao colegiado interinstitucional (UNIFAL ou UNITINS). Estrutura sugerida: contexto → recursão escolhida → diagnóstico VSM → variedades → intervenção → roadmap. Tom: rigoroso mas acessível ao leitor não-cibernético.

## Conexão com a pesquisa-cenário

Joana entrega a comunicação como capítulo da tese. Quem segue o curso entrega a comunicação como produto final do projeto pessoal. O standard duplo é o mesmo.

## Pergunta de verificação

Escolha um sistema concreto (curso, coordenação, instituição) e responda em um parágrafo: (i) recursão; (ii) S1-S5 presentes/ausentes; (iii) variedades qualitativas; (iv) intervenção proposta; (v) por que esta intervenção é Conant-Ashby (modelo-como-regulador) e não apenas modelo-descrição.

::: {.callout-important}
Este capítulo não tem solução pronta. É o lugar onde o curso entrega o aparato e o(a) aluno(a) entrega a aplicação própria.
:::
EOF

echo "---DONE---"
ls fase-*/0*/intro.qmd | wc -l
