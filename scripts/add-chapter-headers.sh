#!/usr/bin/env bash
# Adiciona um chapter-header-card no topo de cada intro.qmd dos 18 capítulos.
# O bloco é inserido logo após o fechamento do YAML front matter (segundo "---").
set -euo pipefail

add_header() {
  local FILE="$1" SEM="$2" FASE="$3" TEMPO="$4" DEPENDE="$5"
  python3 - "$FILE" "$SEM" "$FASE" "$TEMPO" "$DEPENDE" <<'PY'
import sys, re, pathlib
file, sem, fase, tempo, depende = sys.argv[1:]
p = pathlib.Path(file)
src = p.read_text()

# Remove header-card existente se já houver
src = re.sub(r':::\s*\{\.chapter-header-card\}.*?:::\n\n?', '', src, flags=re.DOTALL)

# Encontra fim do YAML front matter (segundo ---)
m = re.match(r'^(---\n.*?\n---\n)', src, flags=re.DOTALL)
if not m:
    print(f"NO YAML in {file}", file=sys.stderr); sys.exit(1)
front = m.group(1)
rest = src[len(front):]

depende_line = f"\n\n[Dependências: {depende}]{{.chapter-meta}}" if depende else ""
header = f""":::: {{.chapter-header-card}}
[Semana {sem} · {fase}]{{.chapter-week}}

Tempo estimado de leitura: **{tempo}**.{depende_line}
::::

"""

p.write_text(front + "\n" + header + rest.lstrip("\n"))
print(f"ok: {file}")
PY
}

# Fase 1
add_header fase-01-strogatz/01-fluxos-1d/intro.qmd               "1"  "Fase 1 — Strogatz"   "60–90 min" "nenhuma"
add_header fase-01-strogatz/02-bifurcacoes-1d/intro.qmd          "2"  "Fase 1 — Strogatz"   "60–90 min" "Sem 1"
add_header fase-01-strogatz/03-fluxos-2d/intro.qmd               "3"  "Fase 1 — Strogatz"   "60–90 min" "Sem 1, 2"
add_header fase-01-strogatz/04-ciclos-limite/intro.qmd           "4"  "Fase 1 — Strogatz"   "60–90 min" "Sem 3"
add_header fase-01-strogatz/05-bifurcacoes-2d/intro.qmd          "5"  "Fase 1 — Strogatz"   "60–90 min" "Sem 2, 4"
add_header fase-01-strogatz/06-caos-lorenz/intro.qmd             "6"  "Fase 1 — Strogatz"   "60–90 min" "Sem 3, 5"

# Fase 2
add_header fase-02-markov/01-cadeias-finitas/intro.qmd           "7"  "Fase 2 — Markov"     "60–90 min" "Fase 1 (cap. 1, 4)"
add_header fase-02-markov/02-distribuicoes-estacionarias/intro.qmd "8" "Fase 2 — Markov"   "60–90 min" "Sem 7"
add_header fase-02-markov/03-reversibilidade-mcmc/intro.qmd      "9"  "Fase 2 — Markov"     "75–105 min" "Sem 8"
add_header fase-02-markov/04-tempo-continuo/intro.qmd            "10" "Fase 2 — Markov"     "60–90 min" "Sem 7, 8"
add_header fase-02-markov/05-aplicacoes-algoritmicas/intro.qmd   "11" "Fase 2 — Markov"     "60–90 min" "Sem 9, 10"

# Fase 3
add_header fase-03-sterman/01-fundamentos-sd/intro.qmd           "13" "Fase 3 — Sterman"    "60–90 min" "Fase 1 cap. 1; Fase 2 cap. 1"
add_header fase-03-sterman/02-feedback-loops/intro.qmd           "14" "Fase 3 — Sterman"    "60–90 min" "Sem 13"
add_header fase-03-sterman/03-modelagem-formal/intro.qmd         "15" "Fase 3 — Sterman"    "75–105 min" "Sem 14"
add_header fase-03-sterman/04-validacao/intro.qmd                "16" "Fase 3 — Sterman"    "60–90 min" "Sem 15"

# Fase 4
add_header fase-04-sintese/01-vsm-ashby-beer/intro.qmd           "18" "Fase 4 — Síntese"    "90–120 min" "todo o curso anterior; capítulo-âncora"
add_header fase-04-sintese/02-bacia-formoso-caso/intro.qmd       "19" "Fase 4 — Síntese"    "75–105 min" "Sem 18"
add_header fase-04-sintese/03-aplicacao-propria/intro.qmd        "20" "Fase 4 — Síntese"    "abre as semanas 21–24" "todo o curso"

echo "---DONE---"
