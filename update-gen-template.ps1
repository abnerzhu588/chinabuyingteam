$content = [System.IO.File]::ReadAllText("d:\chinabuyingteam\generate-pages.ps1", [System.Text.Encoding]::UTF8)

# Add sv-* keys to zh section - using literal .Replace()
$oldZh = '"nav-services": "Services","nav-products": "Products"'
$newZh = '"nav-services": "Services","sv-sourcing": "Sourcing \u0026 Purchasing","sv-dropshipping": "Dropshipping Service","sv-photos": "Photos \u0026 Designs","sv-extra": "Extra Service","nav-products": "Products"'
$content = $content.Replace($oldZh, $newZh)

# Add sv-* keys to ja section - literal backslash-u sequences
$oldJa = '"nav-services": "\u30b5\u30fc\u30d3\u30b9","nav-products": "\u88fd\u54c1"'
$newJa = '"nav-services": "\u30b5\u30fc\u30d3\u30b9","sv-sourcing": "\u30bd\u30fc\u30b7\u30f3\u30b0\u3068\u8cfc\u5165","sv-dropshipping": "\u30c9\u30ed\u30c3\u30d7\u30b7\u30c3\u30d4\u30f3\u30b0\u30b5\u30fc\u30d3\u30b9","sv-photos": "\u5199\u771f\u3068\u30c7\u30b6\u30a4\u30f3","sv-extra": "\u8ffd\u52a0\u30b5\u30fc\u30d3\u30b9","nav-products": "\u88fd\u54c1"'
$content = $content.Replace($oldJa, $newJa)

# Add sv-* keys to ko section - literal backslash-u sequences
$oldKo = '"nav-services": "\uc11c\ube44\uc2a4","nav-products": "\uc81c\ud488"'
$newKo = '"nav-services": "\uc11c\ube44\uc2a4","sv-sourcing": "\uc18c\uc2f1 \ubc0f \uad6c\ub9e4","sv-dropshipping": "\ub4dc\ub86d\uc2dc\ud551 \uc11c\ube44\uc2a4","sv-photos": "\uc0ac\uc9c4 \ubc0f \ub514\uc790\uc778","sv-extra": "\ucd94\uac00 \uc11c\ube44\uc2a4","nav-products": "\uc81c\ud488"'
$content = $content.Replace($oldKo, $newKo)

# Add sv-* keys to es section
$oldEs = '"nav-services": "Servicios","nav-products": "Productos"'
$newEs = '"nav-services": "Servicios","sv-sourcing": "Sourcing y Compras","sv-dropshipping": "Servicio de Dropshipping","sv-photos": "Fotos y Dise\u00f1os","sv-extra": "Servicio Extra","nav-products": "Productos"'
$content = $content.Replace($oldEs, $newEs)

[System.IO.File]::WriteAllText("d:\chinabuyingteam\generate-pages.ps1", $content, [System.Text.Encoding]::UTF8)
Write-Host "Done updating generate-pages.ps1"