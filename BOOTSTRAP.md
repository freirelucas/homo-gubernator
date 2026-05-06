# Bootstrap

## 1. Pré-requisitos
- Quarto >= 1.4 (`quarto --version`)
- Python 3.11+ com `pip`
- Git
- (opcional) Anki Desktop

## 2. Clonar e instalar
```bash
git clone <seu-repo>.git && cd homo-gubernator-curriculum
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
```

## 3. Primeira renderização
```bash
quarto preview
```
Abre em `localhost:4444` por padrão.

## 4. Importar deck Anki
No Anki: `Arquivo > Importar > revisao/anki/deck-cibernetica.csv`. Separador: vírgula. Mapear: campo 1 → Front, campo 2 → Back, campo 3 → Tags.

## 5. Configurar Claude Code
Os subagents em `.claude/agents/` e skills em `.claude/skills/` são detectados automaticamente quando o repositório é aberto pelo Claude Code.

## 6. Publicar no GitHub Pages
`git push` na branch `main` aciona `.github/workflows/publish.yml`, que renderiza e publica na branch `gh-pages`.

Primeira configuração (uma vez): em `Settings > Pages` do repositório no GitHub, definir `Source = Deploy from a branch`, `Branch = gh-pages`, `Folder = / (root)`. Após o primeiro `push` em `main`, a action criará a branch `gh-pages` e o site ficará disponível em `https://<user>.github.io/<repo>/`.

Para acionar manualmente sem push: aba `Actions > Render and Publish > Run workflow`.

## 7. Extrair o bundle textual
Se você recebeu o curso como arquivo único `compass_artifact_*.md`, rode `scripts/unpack.sh <bundle.md>` para reconstruir a árvore de arquivos.
