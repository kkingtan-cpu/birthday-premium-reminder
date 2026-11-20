# Builds index.html (the GitHub Pages web page) from reminder-app.html.
# Run this after every change to reminder-app.html, then commit both files.
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$app = [IO.File]::ReadAllText((Join-Path $here 'reminder-app.html'), [Text.Encoding]::UTF8)
$head = '<!doctype html><html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover"><style>:root{color-scheme:light;padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0}img{max-width:100%}[hidden]{display:none!important}</style></head><body>'
$html = $head + "`n" + $app + "`n</body></html>`n"
[IO.File]::WriteAllText((Join-Path $here 'index.html'), $html, (New-Object Text.UTF8Encoding $false))
"index.html built"
