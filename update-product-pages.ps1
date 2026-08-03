# Get all product subpages
$files = Get-ChildItem -Path 'd:\chinabuyingteam' -Filter 'products-*.html' | Select-Object -ExpandProperty FullName
Write-Host "Found $($files.Count) product subpages to update"

$count = 0
foreach ($file in $files) {
    $content = Get-Content -Path $file -Raw
    
    # 1. CSS: Add services dropdown styles
    $content = $content -replace [regex]::Escape('.solutions-option.active {
    background: #eff6ff;
    color: #1e3a5f;
    font-weight: 600;
}
.lang-dropdown {'), '/* Services dropdown */
.services-dropdown {
    position: relative;
    cursor: pointer;
}
.services-dropdown-menu {
    position: absolute;
    top: 100%;
    left: 0;
    min-width: 220px;
    background: white;
    border: 1px solid #e5e7eb;
    border-radius: 12px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.1);
    opacity: 0;
    visibility: hidden;
    transform: translateY(8px);
    transition: all 0.2s ease;
    z-index: 60;
    overflow: hidden;
}
.services-dropdown-menu.open {
    opacity: 1;
    visibility: visible;
    transform: translateY(0);
}
.services-option {
    padding: 10px 16px;
    font-size: 0.875rem;
    color: #374151;
    display: block;
    width: 100%;
    text-align: left;
    background: none;
    border: none;
    cursor: pointer;
    transition: background 0.15s;
    text-decoration: none;
}
.services-option:hover {
    background: #f3f4f6;
    color: #1e3a5f;
}
.services-option.active {
    background: #eff6ff;
    color: #1e3a5f;
    font-weight: 600;
}
.lang-dropdown {'
    
    # 2. Desktop nav: Replace Services link
    $oldDesktop = '<a href="index.html#services" class="text-sm font-medium text-gray-600 hover:text-[#1e3a5f] transition-colors" data-lang="nav-services">Services</a>'
    $newDesktop = '<div class="services-dropdown" id="servicesDropdown">
                        <button id="servicesToggle" class="flex items-center gap-1.5 text-sm font-medium text-gray-600 hover:text-[#1e3a5f] transition-colors" aria-haspopup="true">
                            <span data-lang="nav-services">Services</span>
                            <i class="fas fa-chevron-down text-[10px]"></i>
                        </button>
                        <div class="services-dropdown-menu" id="servicesMenu" role="menu">
                            <a href="services.html#sourcing-purchasing" class="services-option" data-lang="sv-sourcing">Sourcing &amp; Purchasing</a>
                            <a href="services.html#dropshipping" class="services-option" data-lang="sv-dropshipping">Dropshipping Service</a>
                            <a href="services.html#photos-designs" class="services-option" data-lang="sv-photos">Photos &amp; Designs</a>
                            <a href="services.html#extra-service" class="services-option" data-lang="sv-extra">Extra Service</a>
                        </div>
                    </div>'
    $content = $content -replace [regex]::Escape($oldDesktop), $newDesktop
    
    # 3. Mobile nav: Replace Services link
    $oldMobile = '<a href="index.html#services" class="block py-2 text-sm font-medium text-gray-600 hover:text-[#1e3a5f]" data-lang="nav-services">Services</a>'
    $newMobile = '<div>
                    <button id="mobileServicesToggle" class="flex items-center justify-between w-full py-2 text-sm font-medium text-gray-600 hover:text-[#1e3a5f]">
                        <span data-lang="nav-services">Services</span>
                        <i class="fas fa-chevron-down text-[10px] transition-transform duration-200" id="mobileServicesArrow"></i>
                    </button>
                    <div id="mobileServicesSubmenu" class="hidden pl-4 pb-2 space-y-1">
                        <a href="services.html#sourcing-purchasing" class="block py-1.5 text-sm text-gray-500 hover:text-[#1e3a5f]" data-lang="sv-sourcing">Sourcing &amp; Purchasing</a>
                        <a href="services.html#dropshipping" class="block py-1.5 text-sm text-gray-500 hover:text-[#1e3a5f]" data-lang="sv-dropshipping">Dropshipping Service</a>
                        <a href="services.html#photos-designs" class="block py-1.5 text-sm text-gray-500 hover:text-[#1e3a5f]" data-lang="sv-photos">Photos &amp; Designs</a>
                        <a href="services.html#extra-service" class="block py-1.5 text-sm text-gray-500 hover:text-[#1e3a5f]" data-lang="sv-extra">Extra Service</a>
                    </div>
                </div>'
    $content = $content -replace [regex]::Escape($oldMobile), $newMobile
    
    # 4. Translation keys for each language
    # en
    $content = $content -replace '"nav-services": "Services","nav-products": "Products","nav-solutions": "Solutions"', '"nav-services": "Services","sv-sourcing": "Sourcing & Purchasing","sv-dropshipping": "Dropshipping Service","sv-photos": "Photos & Designs","sv-extra": "Extra Service","nav-products": "Products","nav-solutions": "Solutions"'
    # zh
    $content = $content -replace '"nav-services": "Services","nav-products": "Products","nav-solutions": "', '"nav-services": "Services","sv-sourcing": "Sourcing & Purchasing","sv-dropshipping": "Dropshipping Service","sv-photos": "Photos & Designs","sv-extra": "Extra Service","nav-products": "Products","nav-solutions": "'
    # ja
    $content = $content -replace '"nav-services": "サービス","nav-products": "製品","nav-solutions": "ソリューション"', '"nav-services": "サービス","sv-sourcing": "ソーシングと購入","sv-dropshipping": "ドロップシッピングサービス","sv-photos": "写真とデザイン","sv-extra": "追加サービス","nav-products": "製品","nav-solutions": "ソリューション"'
    # ko
    $content = $content -replace '"nav-services": "서비스","nav-products": "제품","nav-solutions": "솔루션"', '"nav-services": "서비스","sv-sourcing": "소싱 및 구매","sv-dropshipping": "드롭시핑 서비스","sv-photos": "사진 및 디자인","sv-extra": "추가 서비스","nav-products": "제품","nav-solutions": "솔루션"'
    # es
    $content = $content -replace '"nav-services": "Servicios","nav-products": "Productos","nav-solutions": "Soluciones"', '"nav-services": "Servicios","sv-sourcing": "Sourcing y Compras","sv-dropshipping": "Servicio de Dropshipping","sv-photos": "Fotos y Diseños","sv-extra": "Servicio Extra","nav-products": "Productos","nav-solutions": "Soluciones"'
    
    # 5. JavaScript: Add desktop services toggle before Solutions dropdown toggle
    $jsDesktop = '// Services dropdown toggle (Desktop)
            const servicesToggle = document.getElementById(''servicesToggle'');
            const servicesMenu = document.getElementById(''servicesMenu'');
            if (servicesToggle && servicesMenu) {
                servicesToggle.addEventListener(''click'', function(e) {
                    e.stopPropagation();
                    document.getElementById(''langMenu'').classList.remove(''open'');
                    servicesMenu.classList.toggle(''open'');
                });
                document.addEventListener(''click'', function() {
                    servicesMenu.classList.remove(''open'');
                });
            }

            // Solutions dropdown toggle'
    $content = $content -replace '// Solutions dropdown toggle', $jsDesktop
    
    # 6. JavaScript: Add mobile services submenu toggle before Mobile solutions submenu toggle
    $jsMobile = '// Mobile services submenu toggle
            const mobileServicesToggle = document.getElementById(''mobileServicesToggle'');
            const mobileServicesSubmenu = document.getElementById(''mobileServicesSubmenu'');
            const mobileServicesArrow = document.getElementById(''mobileServicesArrow'');
            if (mobileServicesToggle && mobileServicesSubmenu) {
                mobileServicesToggle.addEventListener(''click'', function() {
                    mobileServicesSubmenu.classList.toggle(''hidden'');
                    if (mobileServicesArrow) {
                        mobileServicesArrow.style.transform = mobileServicesSubmenu.classList.contains(''hidden'') ? ''rotate(0deg)'' : ''rotate(180deg)'';
                    }
                });
            }

            // Mobile solutions submenu toggle'
    $content = $content -replace '// Mobile solutions submenu toggle', $jsMobile
    
    Set-Content -Path $file -Value $content -NoNewline
    $count++
    Write-Host "Updated: $file"
}

Write-Host "`nDone! Updated $count files."