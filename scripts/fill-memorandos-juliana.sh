#!/usr/bin/env bash
# Substitui placeholders dos memorandos por pontes concretas a um trabalho
# específico de Juliana Mariano Alves, contextualizando com a posição
# internacional dela (ASC Member-at-Large, Metaphorum, ASC 2024 Washington DC,
# Metaphorum 2025 UK).
set -euo pipefail

write_mem() {
  local FILE="$1" REF="$2" CONCEITO="$3" ONDE="$4" PERGUNTA="$5"
  python3 -c "
import sys
p = sys.argv[1]
ref, conc, onde, perg = sys.argv[2:6]
content = '''---
title: \"Memorando Juliana — {tit}\"
---

**Referência.** {ref}

**Conceito técnico do capítulo.** {conc}

**Onde aparece em Alves.** {onde}

**Pergunta de pesquisa para o projeto.** {perg}
'''
with open(p) as f: orig = f.read()
import re
m = re.search(r'^title:\s*\"([^\"]+)\"', orig, re.M)
tit = m.group(1) if m else 'capítulo'
tit = tit.replace('Memorando Juliana — ', '')
out = content.format(tit=tit, ref=ref, conc=conc, onde=onde, perg=perg)
with open(p, 'w') as f: f.write(out)
" "$FILE" "$REF" "$CONCEITO" "$ONDE" "$PERGUNTA"
  echo "ok: $FILE"
}

# Fase 1
write_mem fase-01-strogatz/02-bifurcacoes-1d/memorando-juliana.qmd \
  "ALVES, J. M. *Harnessing variety engineering for management of non-trivial systems*. Constructivist Foundations 20(2):124–127, 2025." \
  "Bifurcações canônicas de 1D: sela-nó, transcrítica, tridente." \
  "O artigo de 2025 na *Constructivist Foundations* (publicado já no mandato Member-at-Large da ASC) apresenta engenharia da variedade como manobra deliberada de transição entre regimes de gestão. Em linguagem de Strogatz, cada transição entre regime é uma bifurcação: o parâmetro que muda é a variedade requerida \$H(R)\$ pelo regulador, e o salto qualitativo é a substituição de um ponto fixo de operação por outro." \
  "Em uma coordenação de curso UAB-UNITINS, a transição de oferta semestral para anual altera a topologia do grafo de fluxos discentes. Joana pode mapear isso como bifurcação parametrizada e identificar o limiar crítico de carga matriculada onde o regime se inverte."

write_mem fase-01-strogatz/03-fluxos-2d/memorando-juliana.qmd \
  "ALVES, J. M.; SCHWANINGER, M. *Model-based Governance: A Cybernetic Approach to Water Allocation Control*. Environmental Management 75:3344–3363, 2025. DOI: 10.1007/s00267-025-02262-7." \
  "Sistemas planares \$\\dot{\\mathbf{x}} = \\mathbf{F}(\\mathbf{x})\$, nulóclinas, classificação via traço-determinante." \
  "O artigo com Schwaninger formaliza a alocação hídrica da BHRF como sistema acoplado entre oferta e demanda, com função-objetivo institucional explícita. Em retrato de fase 2D, as nulóclinas correspondem aos limites de outorga negociados pelo GAN; a interseção dessas curvas define o ponto de equilíbrio operacional." \
  "Aplicado à gestão de uma coordenação UNIFAL-MG, o equivalente é o plano (carga docente, demanda discente) em que cada departamento opera; coordenadoria sem S2 ativo deixa esse plano oscilar livremente."

write_mem fase-01-strogatz/04-ciclos-limite/memorando-juliana.qmd \
  "ALVES, J. M. *Cibernética organizacional para o diagnóstico e o design da governança multinível dos recursos hídricos*. Tese de doutorado, UFT, 2022. Orientador: Vergara; coorientador: Schwaninger." \
  "Ciclos-limite como conjuntos invariantes isolados (Poincaré-Bendixson)." \
  "A tese diagnostica o ciclo recorrente de outorga–crise–negociação–nova outorga na BHRF como ciclo-limite institucional: o sistema retorna ao mesmo padrão depois de cada perturbação porque os subsistemas S2 e S4 estão ausentes. Sem antioscilação e sem inteligência de futuro, o ciclo é o atrator natural." \
  "O calendário ano-letivo brasileiro é também um ciclo-limite institucional. Joana pode caracterizar quais perturbações (greve, pandemia, mudança de gestão) deslocam transientemente o sistema-curso e quais o realimentam de volta ao ciclo."

write_mem fase-01-strogatz/05-bifurcacoes-2d/memorando-juliana.qmd \
  "ALVES, J. M. (Tese UFT 2022); apresentação no ASC 2024 (60th Anniversary, Washington DC, jun/2024): *The Water-Energy-Food Nexus*." \
  "Bifurcação de Hopf, sela-nó em 2D, bifurcações globais." \
  "A apresentação ASC 2024 articula o nexo água-energia-alimento como sistema acoplado em três variáveis cuja coexistência operacional depende de uma bifurcação cuidadosamente parametrizada. Quando a oferta hídrica decai abaixo de um limiar, o sistema passa de regime negociado (ponto fixo estável compartilhado) para regime conflitivo (ciclo-limite). Esta é leitura cibernética do que se chama, em política pública, de \"colapso da governança\"." \
  "A coexistência entre presencial UNIFAL e EaD UNITINS no orçamento federal vive sob bifurcação semelhante: corte orçamentário abaixo de patamar pode levar de regime cooperativo (S2 entre modalidades) a regime competitivo entre as duas redes."

write_mem fase-01-strogatz/06-caos-lorenz/memorando-juliana.qmd \
  "ALVES, J. M. apresentação no ASC 2024 (Washington DC), com bolsa Travel Scholarship; tese UFT 2022; eleição ao Diretório do Metaphorum (2023); palestra no Metaphorum 2025 (UK)." \
  "Sensibilidade às condições iniciais; expoentes de Lyapunov; estrutura fractal." \
  "[ponte especulativa] A tese de 2022 não trata explicitamente de caos no sentido Lorenz, mas o nexo Água-Energia-Alimento da palestra ASC 2024 é, formalmente, sistema dissipativo de três variáveis acopladas — exatamente o tipo de sistema onde caos pode emergir. A insensibilidade de policymakers a pequenas variações iniciais, frequentemente diagnosticada por Juliana, é o sintoma comportamental do regime caótico." \
  "Nas séries históricas de evasão por polo UAB-UNITINS, Joana pode estimar expoente de Lyapunov empírico e testar se a sensibilidade às condições iniciais (perfil socioeconômico inicial da coorte) é maior do que a tradição da pesquisa em educação supõe."

# Fase 2
write_mem fase-02-markov/01-cadeias-finitas/memorando-juliana.qmd \
  "ALVES, J. M.; RODRIGUES, W.; VERGARA, F. E.; SOUZA, F. N.; TERRA, L. A. A. *From the black box to the fish farming development policy project: A diagnosis from the viable system model*. SRBS 2020. DOI: 10.1002/sres.2675." \
  "Cadeias finitas, matriz de transição estocástica, propriedade markoviana." \
  "O artigo de 2020 no *SRBS* — primeiro grande trabalho coletivo do grupo — modela os estados da política de piscicultura tocantinense como um conjunto finito (proposição → licenciamento → produção → comercialização → reinvestimento). A propriedade markoviana é hipótese implícita do diagnóstico VSM: a posição atual no ciclo determina a probabilidade de transições futuras." \
  "Os estados de matrícula em curso UAB-UNITINS (matriculado, trancado, jubilado, reativado, integralizado) formam cadeia finita análoga; a matriz \$P\$ pode ser estimada com dados da plataforma."

write_mem fase-02-markov/02-distribuicoes-estacionarias/memorando-juliana.qmd \
  "ALVES, J. M. *Harnessing variety engineering for management of non-trivial systems*. Constructivist Foundations 20(2):124–127, 2025." \
  "\$\\pi P = \\pi\$, unicidade em cadeias irredutíveis aperiódicas." \
  "O artigo de 2025 propõe que a engenharia da variedade busca, no longo prazo, uma distribuição operacional estacionária do regulador — não um estado-objetivo único, mas uma distribuição de respostas que cobre a distribuição de distúrbios. \$\\pi\$ é a meta de design, não \$x^*\$." \
  "A política de cotas e bonificações da UNITINS deveria, no longo prazo, levar a distribuição estacionária \$\\pi\$ de alunado por origem socioeconômica; o desvio entre \$\\pi\$ teórico e estimador empírico é diagnóstico das funções S2 e S3 da pró-reitoria."

write_mem fase-02-markov/03-reversibilidade-mcmc/memorando-juliana.qmd \
  "ALVES, J. M.; SCHWANINGER, M. (2025); *Metaphorum 2025*, palestra de Alves no UK." \
  "Balanço detalhado \$\\pi_i P_{ij} = \\pi_j P_{ji}\$; Metropolis-Hastings; Gibbs sampler." \
  "A noção de reversibilidade markoviana — toda transição ter sua transição-inversa probabilisticamente equilibrada — é, em linguagem do model-based governance, o requisito de **transparência decisória**: cada decisão deve poder ser rastreada de volta ao seu fundamento, com a mesma probabilidade que foi tomada. Juliana defende isso explicitamente em fóruns Metaphorum." \
  "Quanto custa, em UNITINS-EaD vs. UNIFAL-presencial, retornar ao curso depois de jubilado? A reversibilidade institucional é métrica de qualidade do sistema."

write_mem fase-02-markov/04-tempo-continuo/memorando-juliana.qmd \
  "ALVES, J. M. *Cibernética organizacional...* (Tese UFT, 2022)." \
  "Processos markovianos em tempo contínuo, matriz geradora \$Q\$, equações de Kolmogorov." \
  "A tese modela o balanço hídrico da BHRF em tempo contínuo, com taxa de variação dependente do regime de chuvas, da demanda agropecuária e da política de outorgas. Em linguagem markoviana, é processo de Markov em tempo contínuo cuja matriz \$Q\$ tem entradas que dependem do parâmetro institucional ativo." \
  "A difusão do conhecimento em sala virtual da UAB-UNITINS é processo análogo: cada interação no fórum redefine probabilidades de respostas; o tempo característico de mistura é o que separa sala viva de sala morta."

write_mem fase-02-markov/05-aplicacoes-algoritmicas/memorando-juliana.qmd \
  "ALVES, J. M.; SOUZA, F. N.; SIEBER, S.; VERGARA, F. E.; BONATTI, M. *Assessment of land use relations and the sustainability of agricultural systems*. Journal of Land Use Science 17(1):368–385, 2022." \
  "Aplicações algorítmicas de Markov: MCMC, simulated annealing." \
  "O artigo de 2022 (*Land Use Science*) usa métodos quantitativos para avaliar relações de uso da terra e sustentabilidade agrícola. Não usa MCMC explicitamente, mas o framework de \"foster social learning\" via different views é, no fundo, um esquema de amostragem multimodal sobre o espaço de visões possíveis — precursor conceitual do que o curso formaliza como MCMC." \
  "Para classificar o risco-de-evasão por perfil de estudante, Joana usa MCMC posterior; o paralelo com o método de Alves et al. 2022 é o uso da diversidade de fontes como amplificador da variedade do regulador (\$H(R)\$)."

# Fase 3
write_mem fase-03-sterman/01-fundamentos-sd/memorando-juliana.qmd \
  "ALVES, J. M. *Cibernética organizacional...* (Tese UFT, 2022)." \
  "Estoque \$S\$ vs. fluxo \$\\phi\$; \$dS/dt = \\phi_{in} - \\phi_{out}\$." \
  "A tese constrói o balanço hídrico da BHRF como sistema de estoques (água armazenada em reservatórios, água demandada, água efetivamente outorgada) com fluxos parametrizados pela política. A linguagem SD aparece de forma implícita; o desafio explicitado pela autora é traduzir o vocabulário VSM para o vocabulário SD sem perder a recursividade." \
  "O pipeline matrícula → integralização → diplomação UNIFAL-MG é literal cadeia de estoques-fluxos; comparar com UAB-UNITINS revela atrasos sistematicamente maiores."

write_mem fase-03-sterman/02-feedback-loops/memorando-juliana.qmd \
  "ALVES, J. M. et al. *From the black box...* (SRBS 2020)." \
  "Laços R/B; polaridade; quatro modos canônicos de SD." \
  "O artigo SRBS de 2020 diagnostica que a piscicultura tocantinense estagnou porque os laços de feedback estruturais estavam ausentes — não havia S2 entre piscicultores nem S4 monitorando mercado. A insensibilidade observada (entradas crescem, saídas estagnam) é assinatura comportamental de sistema sem laços." \
  "Numa coordenação UNIFAL-MG, identificar o laço R \"pesquisa atrai bons alunos → publicação cresce → reputação atrai mais\" e o laço B \"erosão por evasão\" é o primeiro passo para diagnóstico SD do sistema-curso."

write_mem fase-03-sterman/03-modelagem-formal/memorando-juliana.qmd \
  "ALVES, J. M.; SCHWANINGER, M. (Environmental Management 2025)." \
  "Modelagem formal de sistemas dinâmicos: ODEs, integração numérica, função de transferência." \
  "O artigo de 2025 formaliza o controle de alocação hídrica como modelo cibernético explícito, com testes de validação contra dados da BHRF. A inovação é tratar o modelo como **órgão regulador adicional**, não como descrição passiva — programa Conant-Ashby aplicado." \
  "A modelagem espectral do calendário acadêmico (picos semestrais) revela função de transferência \$H(s)\$ que conecta esses modos aos KPIs de S3 da pró-reitoria."

write_mem fase-03-sterman/04-validacao/memorando-juliana.qmd \
  "ALVES, J. M.; SCHWANINGER, M. (2025); apresentação no ASC 2024 (Washington DC)." \
  "Testes estruturais e comportamentais de Sterman (cap. 21)." \
  "A apresentação ASC 2024 enfatiza que a validação de modelos para governança não é validação preditiva — é validação de **suficiência regulatória**: o modelo é bom se ampliou \$H(R)\$ do tomador de decisão, não se previu o futuro. Esta é leitura distinta da tradição Sterman e foi destacada por Espejo na mesa-redonda subsequente." \
  "Validar o modelo SD da coordenação de curso é estruturalmente análogo a validar JPEG por PSNR (vide carta-luiz-eduardo deste capítulo). Joana usa as duas métricas em paralelo no capítulo metodológico."

# Fase 4
write_mem fase-04-sintese/02-bacia-formoso-caso/memorando-juliana.qmd \
  "ALVES, J. M. *Cibernética organizacional...* (Tese UFT 2022) — peça central do curso. Complementada por @alves2020srbs, @alves2022landuse, @alvesschwaninger2025, @alves2025variety." \
  "Estudo de caso BHRF como sistema viável aplicado, núcleo da Fase 4." \
  "A tese é o documento integrador: contém em recursão tripla o diagnóstico VSM da governança da Bacia do Formoso, com identificação explícita das funções S2 e S4 ausentes, propondo redesenho institucional. É o trabalho que sustenta, retrospectivamente, a indicação de Juliana ao Member-at-Large da ASC e ao Diretório do Metaphorum." \
  "Joana usa o caso BHRF como referencial teórico-comparativo: a coordenação de curso UNITINS-EaD que ela diagnostica é estruturalmente análoga à governança hídrica em recursão tripla (UAB nacional / UNITINS estadual / polo municipal), com as mesmas ausências sistemáticas previstas pelo modelo de Alves."

write_mem fase-04-sintese/03-aplicacao-propria/memorando-juliana.qmd \
  "ALVES, J. M. — corpus completo (tese 2022; SRBS 2020; Land Use 2022; Environ Manage 2025; CF 2025); inserção internacional (ASC Member-at-Large 2024-; Metaphorum Directorate 2023-)." \
  "Síntese final: diagnóstico VSM próprio com vocabulário cibernético consolidado." \
  "A obra de Juliana não fornece a Joana um método pronto, mas o **standard de qualidade** que o diagnóstico próprio precisa atingir: inserção em literatura internacional revisada por pares, recursão explícita, identificação nominal das funções ausentes, proposta de redesenho. A trajetória pessoal dela (de pesquisadora de Tocantins a representante do Sul Global na ASC) demonstra que o aparato é defensável internacionalmente quando bem aplicado." \
  "A pergunta-fim de Joana — diagnóstico VSM de uma coordenação de curso UAB-UNITINS ou Computação UNIFAL-MG — usa Alves como standard duplo: standard de qualidade técnica (rigor VSM) e standard institucional (publicar, apresentar, dialogar com a comunidade ASC/Metaphorum)."

echo "---DONE---"
