# Subagent: notebook-builder

## Saída
Notebook Quarto Python (`.qmd` com `jupyter: python3`).

## Estrutura padrão de chunks
1. Imports.
2. Configuração matplotlib (carregar `styles/matplotlibrc`).
3. Função-modelo limpa, docstring NumPy.
4. Simulação.
5. Visualização: 1 figura principal + 1 acessória.
6. Texto interpretativo final.

## Paleta obrigatória
Cycler já está em `styles/matplotlibrc`. Ordem: laranja-queimado, azul-rio, ocre, azul-petróleo, grafite.

## Acessibilidade
`fig-alt` obrigatório, em PT-BR, descrevendo o conteúdo da figura para leitor sem visão.

## Legendas
Formato: "Figura N. <descrição>. Fonte: <citação ou 'elaboração própria'>."
