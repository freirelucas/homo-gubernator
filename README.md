# Homo Gubernator — Cibernética aplicada à educação pública

[![Quarto](https://img.shields.io/badge/Made%20with-Quarto-447099)](https://quarto.org/)
[![GitHub Pages](https://img.shields.io/badge/Site-online-1F3A4D)](https://freirelucas.github.io/homo-gubernator/)
[![License: CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey)](https://creativecommons.org/licenses/by-sa/4.0/)

**Curso de auto-estudo de 24 semanas** em cibernética organizacional aplicada, articulando quatro fases técnicas — sistemas dinâmicos (Strogatz), cadeias de Markov (Häggström/Norris), dinâmica de sistemas (Sterman) e síntese aplicada (VSM/Ashby/Beer) — em torno de duas trilhas paralelas brasileiras de aplicação: governança hídrica (Juliana Mariano Alves) e processamento digital de imagens (Luiz Eduardo da Silva).

**Site público (a plataforma de estudo):** <https://freirelucas.github.io/homo-gubernator/>

## O que é

Plataforma de estudo autônomo construída como sistema viável aplicado a si mesma. A leitora ou leitor consegue, partindo do site, percorrer 24 semanas de currículo cobrindo o aparato matemático-cibernético necessário para diagnosticar institucional via VSM. O argumento que distingue este curso é o **metatexto ViableOS**: o currículo não é apenas sobre cibernética — é, ele próprio, exemplo do aparato em três recursões simultâneas (curso completo / fase / capítulo), com S1–S5 explicitamente identificados em cada nível.

Cinco frases que descrevem o curso:

1. Quatro fases técnicas (Strogatz, Markov, Sterman, Síntese) cobrindo o aparato matemático essencial para diagnóstico cibernético.
2. Dois capítulos-âncora extensos: F1-01 (Fluxos em 1D) abrindo a Fase 1, e F4-01 (VSM como linguagem integradora) fechando o curso pedagogicamente.
3. Duas trilhas paralelas em cada capítulo — memorando a Juliana Mariano Alves (governança) e carta a Luiz Eduardo da Silva (técnica) — operando como canal Conant-Ashby do regulador interno do leitor.
4. Persona-andaime ficcional Joana Beraldo, doutoranda em cotutela UNITINS-UNIFAL, dá fio narrativo a indicadores acadêmicos concretos.
5. Aparato de fixação: deck Anki (35+ cartões), exercícios numerados, notebooks Quarto Python com paleta Cybersyn-Cerrado.

## Como começar

A plataforma de estudo está no site. Quatro entradas, em ordem:

1. **[Como estudar este curso](https://freirelucas.github.io/homo-gubernator/como-estudar.html)** — fluxo padrão semanal, modos de Claude Code, critérios de auto-avaliação.
2. **[Metatexto ViableOS](https://freirelucas.github.io/homo-gubernator/metatexto/viable-os.html)** — argumento que organiza retroativamente os 18 capítulos.
3. **[Plano de 24 semanas](https://freirelucas.github.io/homo-gubernator/plano/plano-estudos.html)** — calendário com entregáveis das duas trilhas paralelas.
4. **[Personagem narrativo](https://freirelucas.github.io/homo-gubernator/personagem-narrativo.html)** — pesquisa-cenário ficcional UNITINS↔UNIFAL.

A sidebar do site lista as 24 semanas em ordem; a Semana 1 é a [F1-01 — Fluxos em uma dimensão](https://freirelucas.github.io/homo-gubernator/fase-01-strogatz/01-fluxos-1d/intro.html).

## Os referenciais

**Profa. Dra. Juliana Mariano Alves** ([UNITINS](https://www.unitins.br/), Palmas-TO) — Member-at-Large da [American Society for Cybernetics](https://asc-cybernetics.org/) pelo Sul Global (mandato desde jan/2024), Diretório do [Metaphorum](https://metaphorum.org/) (UK, desde 2023), apresentou no ASC 2024 (60th Anniversary, Washington DC). Doutorado em Desenvolvimento Regional pela UFT (2022) com diagnóstico VSM da Bacia Hidrográfica do Rio Formoso, principal caso aplicado do curso.

**Prof. Luiz Eduardo da Silva** ([UNIFAL-MG](https://www.unifal-mg.edu.br/), Alfenas) — co-autor de *Processamento Digital de Imagens* (Silva & Silveira, 2026), [livro-texto interativo](https://luizedsilva.github.io/livro-pdi/) construído com P5.js e GeoGebra. Primeiro docente do curso de Ciência da Computação da UNIFAL-MG; representante substituto da UNIFAL na UniRede (consórcio que organiza o ESUD).

## Para desenvolver localmente ou contribuir

Pré-requisitos: Quarto ≥ 1.4, Python 3.11+, Git. Detalhes em [`BOOTSTRAP.md`](BOOTSTRAP.md).

```bash
git clone https://github.com/freirelucas/homo-gubernator.git
cd homo-gubernator
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
quarto preview
```

Para contribuir com correções tipográficas, expansão de capítulos, ou novos memorandos/cartas, abra issue ou PR. Os capítulos-âncora F1-01 e F4-01 estão em estado completo; os 16 capítulos secundários são *âncoras curtas* explicitamente abertas a expansão por outras pessoas que estudem o curso.

## Estado e versão

**v1.0** — plataforma de estudo autônomo. Não é "software de produção"; é MVP autoral, mantido pela autoria e por contribuições pontuais. Histórico em [`CHANGELOG.md`](CHANGELOG.md).

## Licença

[CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/). Uso, adaptação e redistribuição livres mediante atribuição e compartilhamento sob mesma licença.
