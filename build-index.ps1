# Builds index.html (the GitHub Pages web page) from reminder-app.html.
# Run this after every change to reminder-app.html, then commit both files.
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$app = [IO.File]::ReadAllText((Join-Path $here 'reminder-app.html'), [Text.Encoding]::UTF8)
$head = '<!doctype html><html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">' +
  '<link rel="manifest" href="manifest.webmanifest"><link rel="icon" type="image/png" sizes="32x32" href="icons/favicon-32.png"><link rel="icon" type="image/png" sizes="192x192" href="icons/icon-192.png">' +
  '<link rel="apple-touch-icon" href="icons/apple-touch-icon.png"><meta name="theme-color" content="#28317C"><meta name="mobile-web-app-capable" content="yes"><meta name="apple-mobile-web-app-capable" content="yes">' +
  '<meta name="apple-mobile-web-app-status-bar-style" content="default"><meta name="apple-mobile-web-app-title" content="&#29983;&#26085;&#20445;&#36153;&#25552;&#37266;"><style>:root{color-scheme:light;padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0}img{max-width:100%}[hidden]{display:none!important}</style></head><body>'
$html = $head + "`n" + $app + "`n</body></html>`n"
[IO.File]::WriteAllText((Join-Path $here 'index.html'), $html, (New-Object Text.UTF8Encoding $false))
"index.html built"
