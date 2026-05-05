#!/usr/bin/env bash
# Substitui o placeholder "Para o projeto." em cada carta-luiz-eduardo.qmd
# por uma frase concreta conectando o conceito do capítulo à pesquisa-cenário
# UNITINS↔UNIFAL-MG de Joana Beraldo.
set -euo pipefail

write_projeto() {
  local FILE="$1" TEXTO="$2"
  python3 -c "
import re, sys
p, texto = sys.argv[1], sys.argv[2]
with open(p) as f: s = f.read()
def repl(_): return '**Para o projeto.** ' + texto
new = re.sub(r'\*\*Para o projeto\.\*\*[^\n]*', repl, s)
with open(p, 'w') as f: f.write(new)
" "$FILE" "$TEXTO"
  echo "ok: $FILE"
}

write_projeto fase-01-strogatz/01-fluxos-1d/carta-luiz-eduardo.qmd \
  "Joana mapeia a *taxa de aprovação em Cálculo I* da UNIFAL-MG (presencial, Alfenas) e do polo UAB-UNITINS de Augustinópolis como mapas iterados \$T\$ aplicados à coorte: pontos fixos atratores correspondem a regimes pedagógicos estáveis (\$|T'|<1\$); a comparação revela que estabilidade local não é a mesma coisa que sucesso pedagógico — um regime pode ser estável e ruim."

write_projeto fase-01-strogatz/02-bifurcacoes-1d/carta-luiz-eduardo.qmd \
  "No campus UNITINS-Palmas, a definição da *nota de corte* para monitoria em Programação I tem histograma bimodal de notas; a metáfora Otsu-bifurcação serve para Joana mostrar quando uma pequena mudança no calendário acadêmico desloca o argmax descontinuamente — um efeito-bifurcação institucional sobre o critério de seleção."

write_projeto fase-01-strogatz/03-fluxos-2d/carta-luiz-eduardo.qmd \
  "Joana modela em 2D a dinâmica conjunta de *engajamento* (acessos à plataforma) e *desempenho* (nota corrente) de um estudante UAB-UNITINS ao longo de um semestre; cada coorte gera um retrato de fase, e os filtros gaussianos de Luiz Eduardo entram como suavização espacial do mapa de calor por polo."

write_projeto fase-01-strogatz/04-ciclos-limite/carta-luiz-eduardo.qmd \
  "A oscilação ano-letiva da UNIFAL — picos de matrícula em fevereiro/agosto, vales em junho/dezembro — é candidata a ciclo-limite estrutural; Joana testa a idempotência da *política de oferta de vagas*: aplicar a mesma regra duas vezes seguidas modifica o sistema, ou ele já está no ciclo invariante?"

write_projeto fase-01-strogatz/05-bifurcacoes-2d/carta-luiz-eduardo.qmd \
  "Watershed segmenta polos UAB-UNITINS por bacia de atração no plano (acesso médio, taxa de conclusão); polos próximos coalescem em bacias maiores conforme se eleva o limiar de corte — Joana usa a sequência de bifurcações topológicas para identificar agrupamentos regionais sem assumir ex-ante quais municípios pertencem a qual cluster."

write_projeto fase-01-strogatz/06-caos-lorenz/carta-luiz-eduardo.qmd \
  "Pequenas mudanças nas condições iniciais de uma coorte UAB-UNITINS (data de matrícula, polo de origem) podem produzir trajetórias de conclusão muito diferentes; Joana investiga se o sistema-curso exibe *expoente de Lyapunov* positivo na dimensão tempo-de-integralização, e se descritores robustos à la Hu-momentos sobrevivem a essa sensibilidade."

write_projeto fase-02-markov/01-cadeias-finitas/carta-luiz-eduardo.qmd \
  "O estado de um estudante UAB-UNITINS num semestre — *matriculado*, *trancado*, *evadido*, *concluído*, *jubilado* — forma cadeia finita; a quantização das modalidades de matrícula pelo SisU (UNIFAL) ou vestibular EaD (UNITINS) define o alfabeto sobre o qual Joana monta a matriz \$P\$ comparada."

write_projeto fase-02-markov/02-distribuicoes-estacionarias/carta-luiz-eduardo.qmd \
  "A política de cotas e bonificações da UNITINS deveria, no longo prazo, levar a uma distribuição estacionária \$\\pi\$ específica do alunado por origem socioeconômica; Joana confronta \$\\pi\$ teórico (objetivo da política) com o histórico observado (estimador empírico) — e o desvio é diagnóstico de S2 e S3 da pró-reitoria."

write_projeto fase-02-markov/03-reversibilidade-mcmc/carta-luiz-eduardo.qmd \
  "A *acessibilidade reversa* — quanto custa, depois de jubilado, retornar ao curso — é a métrica de reversibilidade da cadeia. Joana testa se a UNITINS-EaD é mais reversível do que a UNIFAL-presencial e se o GAN de Alves (BHRF) tem análogo institucional num *grupo de acompanhamento* da coordenação acadêmica."

write_projeto fase-02-markov/04-tempo-continuo/carta-luiz-eduardo.qmd \
  "A difusão do conhecimento em uma sala virtual da UAB-UNITINS, modelada como processo markoviano em tempo contínuo, tem matriz geradora \$Q\$ cujos autovalores controlam o tempo característico — exatamente o paralelo do filtro gaussiano de Luiz Eduardo aplicado ao mapa de calor de respostas no fórum, com \$\\sigma^2 = 2t\$."

write_projeto fase-02-markov/05-aplicacoes-algoritmicas/carta-luiz-eduardo.qmd \
  "Joana aplica MCMC para estimar a distribuição posterior do *risco-de-evasão* de um estudante condicional a polo, modalidade e perfil — uma instância onde a entropia de Shannon do classificador é, simultaneamente, a métrica de variedade ashbyana \$H(R)\$ disponível à coordenação."

write_projeto fase-03-sterman/01-fundamentos-sd/carta-luiz-eduardo.qmd \
  "O pipeline UNIFAL-MG vestibular → matrícula → integralização → diplomação é literal cadeia de estoques-fluxos; Joana monta \$dS/dt = \\phi_{in}-\\phi_{out}\$ para cada estado da carreira e compara com a versão UAB-UNITINS, onde os atrasos entre os fluxos são sistematicamente maiores."

write_projeto fase-03-sterman/02-feedback-loops/carta-luiz-eduardo.qmd \
  "*Reforço de qualidade* na UNIFAL-MG (pesquisa atrai bons alunos → alunos publicam → reputação cresce → mais pesquisa) é laço R clássico; *erosão por evasão* na UAB-UNITINS é laço B com atraso. Joana usa o capítulo de Luiz Eduardo sobre filtros iterativos para entender como cada laço se comporta sob ruído de matrícula."

write_projeto fase-03-sterman/03-modelagem-formal/carta-luiz-eduardo.qmd \
  "A modelagem espectral via Fourier do calendário acadêmico (picos semestrais, eventos sazonais) revela o modo dominante; Joana identifica que UNITINS-EaD e UNIFAL-presencial têm espectros diferentes, e que a função de transferência \$H(s)\$ do sistema-curso é o que conecta esses modos aos KPIs de S3."

write_projeto fase-03-sterman/04-validacao/carta-luiz-eduardo.qmd \
  "Validar o modelo SD da coordenação (replicação histórica de matrícula 2010–2024) é estruturalmente análogo a validar JPEG por PSNR: ambos são testes de fidelidade comportamental sobre uma compressão (do real → modelo, da imagem → arquivo). Joana usa as duas métricas em paralelo no capítulo metodológico da tese."

write_projeto fase-04-sintese/01-vsm-ashby-beer/carta-luiz-eduardo.qmd \
  "A hierarquia baixo/médio/alto do PDI (filtragem → segmentação → interpretação) é o diagrama VSM-em-recursão que Joana usa para situar o pipeline de análise da própria tese: o nível baixo é o dado bruto da plataforma EaD; o médio, segmentação de coortes; o alto, interpretação cibernética em VSM."

write_projeto fase-04-sintese/02-bacia-formoso-caso/carta-luiz-eduardo.qmd \
  "Fechamento das duas trilhas: como a Bacia do Formoso (Juliana 2022) é sistema viável aplicado em governança hídrica, e o capítulo de OpenCV é sistema viável aplicado em visão computacional, Joana adota *coordenação de curso* como seu próprio sistema viável aplicado — terceira instância concreta do mesmo formalismo."

write_projeto fase-04-sintese/03-aplicacao-propria/carta-luiz-eduardo.qmd \
  "A síntese final de Joana é um diagnóstico VSM da coordenação de Sistemas de Informação da UNITINS-Palmas (ou Computação UNIFAL-MG), com pipelines de PDI alimentando a evidência empírica e o caso BHRF como referencial teórico-comparativo na discussão."

echo "---DONE---"
