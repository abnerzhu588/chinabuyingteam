function Write-HtmlFile {
    param($FilePath, $Content)
    [System.IO.File]::WriteAllText($FilePath, $Content, [System.Text.Encoding]::UTF8)
    Write-Host "Created: $FilePath"
}

$nav = @'
    <header class="nav-glass fixed top-0 left-0 w-full z-50" role="banner">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex items-center justify-between h-16 lg:h-20">
                <a href="index.html" class="flex items-center gap-2.5 group" aria-label="abnerchinasourcing home">
                    <img src="logo.png" alt="abnerchinasourcing - China Sourcing Agent" class="h-20 w-auto" width="160" height="80" decoding="async" fetchpriority="high" />
                </a>
                <nav class="hidden lg:flex items-center gap-8" aria-label="Main navigation">
                    <div class="services-dropdown" id="servicesDropdown">
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
                    </div>
                    <a href="products.html" class="text-sm font-semibold text-[#1e3a5f] transition-colors" data-lang="nav-products">Products</a>
                    <div class="solutions-dropdown" id="solutionsDropdown">
                        <button id="solutionsToggle" class="flex items-center gap-1.5 text-sm font-medium text-gray-600 hover:text-[#1e3a5f] transition-colors" aria-haspopup="true">
                            <span data-lang="nav-solutions">Solutions</span>
                            <i class="fas fa-chevron-down text-[10px]"></i>
                        </button>
                        <div class="solutions-dropdown-menu" id="solutionsMenu" role="menu">
                            <a href="solutions.html#private-label" class="solutions-option" data-lang="sol-private-label">Private Label</a>
                            <a href="solutions.html#product-development" class="solutions-option" data-lang="sol-product-development">Product Development</a>
                            <a href="solutions.html#shipping-solution" class="solutions-option" data-lang="sol-shipping">Shipping Solution</a>
                            <a href="solutions.html#amazon-fba" class="solutions-option" data-lang="sol-amazon-fba">Amazon FBA</a>
                            <a href="solutions.html#quality-control" class="solutions-option" data-lang="sol-quality-control">Quality Control</a>
                            <a href="solutions.html#credit-payment" class="solutions-option" data-lang="sol-credit-payment">Credit Payment Terms</a>
                            <a href="solutions.html#affiliate-program" class="solutions-option" data-lang="sol-affiliate">Affiliate Program</a>
                        </div>
                    </div>
                    <a href="index.html#why-agent" class="text-sm font-medium text-gray-600 hover:text-[#1e3a5f] transition-colors" data-lang="nav-agent">Why Agent</a>
                    <a href="index.html#how-it-works" class="text-sm font-medium text-gray-600 hover:text-[#1e3a5f] transition-colors" data-lang="nav-how">How It Works</a>
                    <a href="faq.html" class="text-sm font-medium text-gray-600 hover:text-[#1e3a5f] transition-colors" data-lang="nav-faq">FAQ</a>
                    <a href="contact.html" class="text-sm font-medium text-gray-600 hover:text-[#1e3a5f] transition-colors" data-lang="nav-contact">Contact</a>
                </nav>
                <div class="hidden lg:flex items-center gap-3">
                    <div class="lang-dropdown" id="langDropdown">
                        <button id="langToggle" class="flex items-center gap-1.5 px-3 py-2 rounded-lg text-sm font-medium text-gray-500 hover:text-[#1e3a5f] hover:bg-gray-100 transition-colors" aria-label="Select language" aria-haspopup="true">
                            <i class="fas fa-globe text-xs"></i>
                            <span id="currentLangLabel">EN</span>
                            <i class="fas fa-chevron-down text-[10px]"></i>
                        </button>
                        <div class="lang-dropdown-menu" id="langMenu" role="menu">
                            <button class="lang-option active" data-lang-code="en" role="menuitem">English</button>
                            <button class="lang-option" data-lang-code="zh" role="menuitem">Chinese</button>
                            <button class="lang-option" data-lang-code="ja" role="menuitem">Japanese</button>
                            <button class="lang-option" data-lang-code="ko" role="menuitem">Korean</button>
                            <button class="lang-option" data-lang-code="es" role="menuitem">Espa?ol</button>
                        </div>
                    </div>
                    <a href="contact.html" class="inline-flex items-center gap-2 px-5 py-2.5 rounded-full text-sm font-semibold text-white btn-primary shadow-md">
                        <span data-lang="nav-cta">Get Started</span>
                        <i class="fas fa-arrow-right text-xs"></i>
                    </a>
                </div>
                <button id="menuBtn" class="lg:hidden w-10 h-10 flex items-center justify-center rounded-lg text-gray-600 hover:bg-gray-100 transition-colors" aria-label="Toggle menu">
                    <i id="menuIcon" class="fas fa-bars text-xl"></i>
                </button>
            </div>
        </div>
        <div id="mobileMenu" class="mobile-menu lg:hidden bg-white border-t border-gray-100">
            <div class="px-4 py-5 space-y-3">
                <div>
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
                </div>
                <a href="products.html" class="block py-2 text-sm font-semibold text-[#1e3a5f]" data-lang="nav-products">Products</a>
                <div>
                    <button id="mobileSolutionsToggle" class="flex items-center justify-between w-full py-2 text-sm font-medium text-gray-600 hover:text-[#1e3a5f]">
                        <span data-lang="nav-solutions">Solutions</span>
                        <i class="fas fa-chevron-down text-[10px] transition-transform duration-200" id="mobileSolutionsArrow"></i>
                    </button>
                    <div id="mobileSolutionsSubmenu" class="hidden pl-4 pb-2 space-y-1">
                        <a href="solutions.html#private-label" class="block py-1.5 text-sm text-gray-500 hover:text-[#1e3a5f]" data-lang="sol-private-label">Private Label</a>
                        <a href="solutions.html#product-development" class="block py-1.5 text-sm text-gray-500 hover:text-[#1e3a5f]" data-lang="sol-product-development">Product Development</a>
                        <a href="solutions.html#shipping-solution" class="block py-1.5 text-sm text-gray-500 hover:text-[#1e3a5f]" data-lang="sol-shipping">Shipping Solution</a>
                        <a href="solutions.html#amazon-fba" class="block py-1.5 text-sm text-gray-500 hover:text-[#1e3a5f]" data-lang="sol-amazon-fba">Amazon FBA</a>
                        <a href="solutions.html#quality-control" class="block py-1.5 text-sm text-gray-500 hover:text-[#1e3a5f]" data-lang="sol-quality-control">Quality Control</a>
                        <a href="solutions.html#credit-payment" class="block py-1.5 text-sm text-gray-500 hover:text-[#1e3a5f]" data-lang="sol-credit-payment">Credit Payment Terms</a>
                        <a href="solutions.html#affiliate-program" class="block py-1.5 text-sm text-gray-500 hover:text-[#1e3a5f]" data-lang="sol-affiliate">Affiliate Program</a>
                    </div>
                </div>
                <a href="index.html#why-agent" class="block py-2 text-sm font-medium text-gray-600 hover:text-[#1e3a5f]" data-lang="nav-agent">Why Agent</a>
                <a href="index.html#how-it-works" class="block py-2 text-sm font-medium text-gray-600 hover:text-[#1e3a5f]" data-lang="nav-how">How It Works</a>
                <a href="faq.html" class="block py-2 text-sm font-medium text-gray-600 hover:text-[#1e3a5f]" data-lang="nav-faq">FAQ</a>
                <a href="contact.html" class="block py-2 text-sm font-medium text-gray-600 hover:text-[#1e3a5f]" data-lang="nav-contact">Contact</a>
                <div class="pt-2 border-t border-gray-100">
                    <p class="text-xs font-semibold text-gray-400 uppercase tracking-wider mb-2">Language</p>
                    <div class="flex flex-wrap gap-2">
                        <button class="lang-mobile-btn px-3 py-1.5 rounded-lg text-sm border border-gray-200 text-gray-600 hover:bg-gray-50 active" data-lang-code="en">EN</button>
                        <button class="lang-mobile-btn px-3 py-1.5 rounded-lg text-sm border border-gray-200 text-gray-600 hover:bg-gray-50" data-lang-code="zh">Chinese</button>
                        <button class="lang-mobile-btn px-3 py-1.5 rounded-lg text-sm border border-gray-200 text-gray-600 hover:bg-gray-50" data-lang-code="ja">Japanese</button>
                        <button class="lang-mobile-btn px-3 py-1.5 rounded-lg text-sm border border-gray-200 text-gray-600 hover:bg-gray-50" data-lang-code="ko">Korean</button>
                        <button class="lang-mobile-btn px-3 py-1.5 rounded-lg text-sm border border-gray-200 text-gray-600 hover:bg-gray-50" data-lang-code="es">Espa?ol</button>
                    </div>
                </div>
                <div class="pt-3">
                    <a href="contact.html" class="inline-flex items-center gap-2 px-5 py-2.5 rounded-full text-sm font-semibold text-white btn-primary shadow-md">
                        <span data-lang="nav-cta">Get Started</span>
                        <i class="fas fa-arrow-right text-xs"></i>
                    </a>
                </div>
            </div>
        </div>
    </header>
    <div class="h-16 lg:h-20"></div>
'@

$footer = @'
    <footer class="bg-[#0f1a2e] text-gray-400" role="contentinfo">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-14 lg:py-20">
            <div class="grid sm:grid-cols-2 lg:grid-cols-4 gap-10 lg:gap-12">
                <div class="sm:col-span-2 lg:col-span-1">
                    <div class="flex items-center gap-2.5">
                        <img src="logo.png" alt="abnerchinasourcing" class="h-20 w-auto" width="160" height="80" loading="lazy" decoding="async" />
                    </div>
                    <p class="mt-4 text-sm text-gray-500 leading-relaxed" data-lang="footer-desc">Your trusted sourcing, quality control, and logistics partner in China. We help overseas buyers source products with confidence.</p>
                    <div class="mt-5 flex gap-3">
                        <a href="https://www.facebook.com/profile.php?id=61592626531919" target="_blank" rel="noopener noreferrer" class="w-9 h-9 rounded-full bg-white/5 hover:bg-white/10 flex items-center justify-center text-gray-400 hover:text-white transition-all" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="w-9 h-9 rounded-full bg-white/5 hover:bg-white/10 flex items-center justify-center text-gray-400 hover:text-white transition-all" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#" class="w-9 h-9 rounded-full bg-white/5 hover:bg-white/10 flex items-center justify-center text-gray-400 hover:text-white transition-all" aria-label="Twitter"><i class="fab fa-x-twitter"></i></a>
                        <a href="#" class="w-9 h-9 rounded-full bg-white/5 hover:bg-white/10 flex items-center justify-center text-gray-400 hover:text-white transition-all" aria-label="YouTube"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
                <div>
                    <h4 class="text-sm font-bold text-white uppercase tracking-wider" data-lang="footer-links-title">Quick Links</h4>
                    <ul class="mt-4 space-y-2.5">
                        <li><a href="index.html#services" class="text-sm text-gray-400 hover:text-white transition-colors" data-lang="footer-link-services">Services</a></li>
                        <li><a href="index.html#how-it-works" class="text-sm text-gray-400 hover:text-white transition-colors" data-lang="footer-link-how">How It Works</a></li>
                        <li><a href="faq.html" class="text-sm text-gray-400 hover:text-white transition-colors" data-lang="footer-link-faq">FAQ</a></li>
                        <li><a href="contact.html" class="text-sm text-gray-400 hover:text-white transition-colors" data-lang="footer-link-contact">Contact Us</a></li>
                    </ul>
                </div>
                <div>
                    <h4 class="text-sm font-bold text-white uppercase tracking-wider" data-lang="footer-services-title">Services</h4>
                    <ul class="mt-4 space-y-2.5">
                        <li><a href="index.html#services" class="text-sm text-gray-400 hover:text-white transition-colors" data-lang="footer-service1">Factory Audit</a></li>
                        <li><a href="index.html#services" class="text-sm text-gray-400 hover:text-white transition-colors" data-lang="footer-service2">Quality Control</a></li>
                        <li><a href="index.html#services" class="text-sm text-gray-400 hover:text-white transition-colors" data-lang="footer-service3">Cost Analysis</a></li>
                        <li><a href="index.html#services" class="text-sm text-gray-400 hover:text-white transition-colors" data-lang="footer-service4">Price Negotiation</a></li>
                    </ul>
                </div>
                <div>
                    <h4 class="text-sm font-bold text-white uppercase tracking-wider" data-lang="footer-contact-title">Contact</h4>
                    <ul class="mt-4 space-y-3">
                        <li class="flex items-start gap-3"><i class="fas fa-envelope mt-0.5 text-[#f7b733] text-sm" aria-hidden="true"></i><a href="mailto:abnerzhu588@gmail.com" class="text-sm text-gray-400 hover:text-white transition-colors">abnerzhu588@gmail.com</a></li>
                        <li class="flex items-start gap-3"><i class="fab fa-whatsapp mt-0.5 text-[#25D366] text-sm" aria-hidden="true"></i><a href="https://wa.me/8617828191008?text=Hi%20abnerchinasourcing%2C%20I%27m%20interested%20in%20your%20sourcing%20services." target="_blank" rel="noopener noreferrer" class="text-sm text-gray-400 hover:text-white transition-colors">+86 17828191008 (WhatsApp)</a></li>
                        <li class="flex items-start gap-3"><i class="fas fa-location-dot mt-0.5 text-[#f7b733] text-sm" aria-hidden="true"></i><span class="text-sm text-gray-400" data-lang="footer-address">Shenzhen, Guangdong, China</span></li>
                        <li class="flex items-start gap-3"><i class="fas fa-clock mt-0.5 text-[#f7b733] text-sm" aria-hidden="true"></i><span class="text-sm text-gray-400" data-lang="footer-hours">Mon&ndash;Sat 9:00&ndash;24:00 (CST)</span></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="border-t border-white/5">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-5 flex flex-col sm:flex-row items-center justify-between gap-3">
                <p class="text-xs text-gray-500" data-lang="footer-copyright">&copy; 2026 abnerchinasourcing. All rights reserved.</p>
                <div class="flex items-center gap-4 text-xs text-gray-500">
                    <a href="#" class="hover:text-gray-300 transition-colors" data-lang="footer-privacy">Privacy Policy</a>
                    <a href="#" class="hover:text-gray-300 transition-colors" data-lang="footer-terms">Terms of Service</a>
                </div>
            </div>
        </div>
    </footer>
'@

$css = @'
        * { font-family: 'Inter', sans-serif; }
        html { scroll-behavior: smooth; }
        body { overflow-x: hidden; }
        .nav-glass { background: rgba(255, 255, 255, 0.85); backdrop-filter: blur(16px); -webkit-backdrop-filter: blur(16px); border-bottom: 1px solid rgba(255, 255, 255, 0.3); }
        .nav-glass.scrolled { background: rgba(255, 255, 255, 0.95); box-shadow: 0 1px 3px rgba(0,0,0,0.08); }
        .card-hover { transition: all 0.35s cubic-bezier(0.25, 0.46, 0.45, 0.94); }
        .card-hover:hover { transform: translateY(-8px); box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.15); }
        .btn-primary { background: linear-gradient(135deg, #1e3a5f 0%, #2d6a9f 100%); transition: all 0.3s ease; }
        .btn-primary:hover { background: linear-gradient(135deg, #152d4a 0%, #1e5a8f 100%); transform: translateY(-1px); box-shadow: 0 12px 28px -8px rgba(30, 58, 95, 0.4); }
        .mobile-menu { transition: max-height 0.4s ease, opacity 0.3s ease; max-height: 0; opacity: 0; overflow: hidden; }
        .mobile-menu.open { max-height: 32rem; opacity: 1; }
        /* Solutions dropdown */
        .solutions-dropdown {
            position: relative;
            cursor: pointer;
        }
        .solutions-dropdown-menu {
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
        .solutions-dropdown-menu.open {
            opacity: 1;
            visibility: visible;
            transform: translateY(0);
        }
        .solutions-option {
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
        .solutions-option:hover {
            background: #f3f4f6;
            color: #1e3a5f;
        }
        .solutions-option.active {
            background: #eff6ff;
            color: #1e3a5f;
            font-weight: 600;
        }
        /* Services dropdown */
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
        .lang-dropdown { position: relative; }
        .lang-dropdown-menu { position: absolute; top: calc(100% + 0.5rem); right: 0; background: white; border: 1px solid #e5e7eb; border-radius: 0.75rem; box-shadow: 0 12px 40px rgba(0,0,0,0.12); min-width: 140px; padding: 0.5rem; opacity: 0; visibility: hidden; transform: translateY(-6px); transition: all 0.2s ease; z-index: 100; }
        .lang-dropdown-menu.open { opacity: 1; visibility: visible; transform: translateY(0); }
        .lang-option { display: block; width: 100%; padding: 0.5rem 0.75rem; text-align: left; border-radius: 0.5rem; font-size: 0.875rem; color: #374151; background: none; cursor: pointer; transition: background 0.15s; }
        .lang-option:hover { background: #f3f4f6; }
        .lang-option.active { background: #eef2ff; color: #1e3a5f; font-weight: 600; }
        .section-divider { width: 60px; height: 4px; background: linear-gradient(90deg, #f7b733, #fc4a1a); border-radius: 2px; }
'@

$js = @'
    <script>
        const menuBtn = document.getElementById('menuBtn');
        const mobileMenu = document.getElementById('mobileMenu');
        const menuIcon = document.getElementById('menuIcon');
        let menuOpen = false;
        menuBtn.addEventListener('click', () => {
            menuOpen = !menuOpen;
            mobileMenu.classList.toggle('open', menuOpen);
            menuIcon.className = menuOpen ? 'fas fa-xmark text-xl' : 'fas fa-bars text-xl';
        });
        document.querySelectorAll('#mobileMenu a').forEach(link => {
            link.addEventListener('click', () => {
                menuOpen = false;
                mobileMenu.classList.remove('open');
                menuIcon.className = 'fas fa-bars text-xl';
            });
        });
    </script>
    <script>
        (function() {
            const translations = {
                en: {
                    "nav-services": "Services","sv-sourcing": "Sourcing & Purchasing","sv-dropshipping": "Dropshipping Service","sv-photos": "Photos & Designs","sv-extra": "Extra Service","nav-products": "Products","nav-solutions": "Solutions","sol-private-label": "Private Label","sol-product-development": "Product Development","sol-shipping": "Shipping Solution","sol-amazon-fba": "Amazon FBA","sol-quality-control": "Quality Control","sol-credit-payment": "Credit Payment Terms","sol-affiliate": "Affiliate Program","nav-agent": "Why Agent","nav-how": "How It Works","nav-faq": "FAQ","nav-contact": "Contact","nav-cta": "Get Started",
                    "footer-desc": "Your trusted sourcing, quality control, and logistics partner in China. We help overseas buyers source products with confidence.",
                    "footer-links-title": "Quick Links","footer-link-services": "Services","footer-link-how": "How It Works","footer-link-faq": "FAQ","footer-link-contact": "Contact Us",
                    "footer-services-title": "Services","footer-service1": "Factory Audit","footer-service2": "Quality Control","footer-service3": "Cost Analysis","footer-service4": "Price Negotiation",
                    "footer-contact-title": "Contact","footer-address": "Shenzhen, Guangdong, China","footer-hours": "Mon\u2013Sat 9:00\u201324:00 (CST)","footer-copyright": "\u00a9 2026 abnerchinasourcing. All rights reserved.","footer-privacy": "Privacy Policy","footer-terms": "Terms of Service"
                },
                zh: {
                    "nav-services": "Services","sv-sourcing": "Sourcing \u0026 Purchasing","sv-dropshipping": "Dropshipping Service","sv-photos": "Photos \u0026 Designs","sv-extra": "Extra Service","nav-products": "Products","nav-solutions": "�������","sol-private-label": "����Ʒ��","sol-product-development": "��Ʒ����","sol-shipping": "����������","sol-amazon-fba": "Amazon FBA","sol-quality-control": "��������","sol-credit-payment": "���ø�������","sol-affiliate": "���˼ƻ�","nav-agent": "Why Agent","nav-how": "How It Works","nav-faq": "FAQ","nav-contact": "Contact Us","nav-cta": "Get Started",
                    "footer-desc": "Your trusted sourcing, quality control, and logistics partner in China. We help overseas buyers source products with confidence.",
                    "footer-links-title": "Quick Links","footer-link-services": "Services","footer-link-how": "How It Works","footer-link-faq": "FAQ","footer-link-contact": "Contact Us",
                    "footer-services-title": "Services","footer-service1": "Factory Audit","footer-service2": "Quality Control","footer-service3": "Cost Analysis","footer-service4": "Price Negotiation",
                    "footer-contact-title": "Contact","footer-address": "Shenzhen, Guangdong, China","footer-hours": "Mon\u2013Sat 9:00\u201324:00 (CST)","footer-copyright": "\u00a9 2026 abnerchinasourcing. All rights reserved.","footer-privacy": "Privacy Policy","footer-terms": "Terms of Service"
                },
                ja: {
                    "nav-services": "\u30b5\u30fc\u30d3\u30b9","sv-sourcing": "\u30bd\u30fc\u30b7\u30f3\u30b0\u3068\u8cfc\u5165","sv-dropshipping": "\u30c9\u30ed\u30c3\u30d7\u30b7\u30c3\u30d4\u30f3\u30b0\u30b5\u30fc\u30d3\u30b9","sv-photos": "\u5199\u771f\u3068\u30c7\u30b6\u30a4\u30f3","sv-extra": "\u8ffd\u52a0\u30b5\u30fc\u30d3\u30b9","nav-products": "\u88fd\u54c1","nav-solutions": "\u30bd\u30ea\u30e5\u30fc\u30b7\u30e7\u30f3","sol-private-label": "\u30d7\u30e9\u30a4\u30d9\u30fc\u30c8\u30e9\u30d9\u30eb","sol-product-development": "\u88fd\u54c1\u958b\u767a","sol-shipping": "\u914d\u9001\u30bd\u30ea\u30e5\u30fc\u30b7\u30e7\u30f3","sol-amazon-fba": "Amazon FBA","sol-quality-control": "\u54c1\u8cea\u7ba1\u7406","sol-credit-payment": "\u4e0e\u4fe1\u6c7a\u6e08\u6761\u4ef6","sol-affiliate": "\u30a2\u30d5\u30a3\u30ea\u30a8\u30a4\u30c8\u30d7\u30ed\u30b0\u30e9\u30e0","nav-agent": "\u4ee3\u7406\u5e97\u3092\u9078\u3076\u7406\u7531","nav-how": "\u6d41\u308c","nav-faq": "\u3088\u304f\u3042\u308b\u8cea\u554f","nav-contact": "\u304a\u554f\u3044\u5408\u308f\u305b","nav-cta": "\u59cb\u3081\u308b",
                    "footer-desc": "\u4e2d\u56fd\u306b\u304a\u3051\u308b\u4fe1\u983c\u3067\u304d\u308b\u8abf\u9054\u3001\u54c1\u8cea\u7ba1\u7406\u3001\u7269\u6d41\u30d1\u30fc\u30c8\u30ca\u30fc\u3002\u6d77\u5916\u30d0\u30a4\u30e4\u30fc\u306e\u88fd\u54c1\u8abf\u9054\u3092\u30b5\u30dd\u30fc\u30c8\u3057\u307e\u3059\u3002",
                    "footer-links-title": "\u30af\u30a4\u30c3\u30af\u30ea\u30f3\u30af","footer-link-services": "\\u30b5\\u30fc\\u30d3\\u30b9","footer-link-how": "\\u6d41\\u308c","footer-link-faq": "\u3088\u304f\u3042\u308b\u8cea\u554f","footer-link-contact": "\u304a\u554f\u3044\u5408\u308f\u305b",
                    "footer-services-title": "\u30b5\u30fc\u30d3\u30b9","footer-service1": "\u5de5\u5834\u76e3\u67fb","footer-service2": "\u54c1\u8cea\u7ba1\u7406","footer-service3": "\u30b3\u30b9\u30c8\u5206\u6790","footer-service4": "\u4fa1\u683c\u4ea4\u6e09",
                    "footer-contact-title": "\u9023\u7d61\u5148","footer-address": "\u4e2d\u56fd\u5e83\u6771\u7701\u6df1\u5733\u5e02","footer-hours": "\u6708\u2013\u571f 9:00\u201324:00 (CST)","footer-copyright": "\u00a9 2026 abnerchinasourcing. All rights reserved.","footer-privacy": "\u30d7\u30e9\u30a4\u30d0\u30b7\u30fc\u30dd\u30ea\u30b7\u30fc","footer-terms": "\u5229\u7528\u898f\u7d04"
                },
                ko: {
                    "nav-services": "\uc11c\ube44\uc2a4","sv-sourcing": "\uc18c\uc2f1 \ubc0f \uad6c\ub9e4","sv-dropshipping": "\ub4dc\ub86d\uc2dc\ud551 \uc11c\ube44\uc2a4","sv-photos": "\uc0ac\uc9c4 \ubc0f \ub514\uc790\uc778","sv-extra": "\ucd94\uac00 \uc11c\ube44\uc2a4","nav-products": "\uc81c\ud488","nav-solutions": "\uc194\ub8e8\uc158","sol-private-label": "\uc790\uccb4 \ube0c\ub79c\ub4dc","sol-product-development": "\uc81c\ud488 \uac1c\ubc1c","sol-shipping": "\ubc30\uc1a1 \uc194\ub8e8\uc158","sol-amazon-fba": "Amazon FBA","sol-quality-control": "\ud488\uc9c8 \uad00\ub9ac","sol-credit-payment": "\uc2e0\uc6a9 \uacb0\uc81c \uc870\uac74","sol-affiliate": "\uc81c\ud734 \ud504\ub85c\uadf8\ub7a8","nav-agent": "\uc5d0\uc774\uc804\ud2b8\ub97c \uc120\ud0dd\ud558\ub294 \uc774\uc720","nav-how": "\ud504\ub85c\uc138\uc2a4","nav-faq": "\uc790\uc8fc \ubb3b\ub294 \uc9c8\ubb38","nav-contact": "\ubb38\uc758\ud558\uae30","nav-cta": "\uc2dc\uc791\ud558\uae30",
                    "footer-desc": "\uc911\uad6d\uc5d0\uc11c \uc2e0\ub8b0\ud560 \uc218 \uc788\ub294 \uc870\ub2ec, \ud488\uc9c8 \uad00\ub9ac, \ubb3c\ub958 \ud30c\ud2b8\ub108. \ud574\uc678 \ubc14\uc774\uc5b4\uc758 \uc81c\ud488 \uc870\ub2ec\uc744 \uc9c0\uc6d0\ud569\ub2c8\ub2e4.",
                    "footer-links-title": "\ubc14\ub85c\uac00\uae30","footer-link-services": "\\uc11c\\ube44\\uc2a4","footer-link-how": "\\ud504\\ub85c\\uc138\\uc2a4","footer-link-faq": "\uc790\uc8fc \ubb3b\ub294 \uc9c8\ubb38","footer-link-contact": "\ubb38\uc758\ud558\uae30",
                    "footer-services-title": "\uc11c\ube44\uc2a4","footer-service1": "\uacf5\uc7a5 \uac10\uc0ac","footer-service2": "\ud488\uc9c8 \uad00\ub9ac","footer-service3": "\ube44\uc6a9 \ubd84\uc11d","footer-service4": "\uac00\uaca9 \ud611\uc0c1",
                    "footer-contact-title": "\uc5f0\ub77d\ucc98","footer-address": "\uc911\uad6d \uad11\ub465\uc131 \uc2ec\ucc9c\uc2dc","footer-hours": "\uc6d4\u2013\ud1a0 9:00\u201324:00 (CST)","footer-copyright": "\u00a9 2026 abnerchinasourcing. All rights reserved.","footer-privacy": "\uac1c\uc778\uc815\ubcf4\ucc98\ub9ac\ubc29\uce68","footer-terms": "\uc774\uc6a9\uc57d\uad00"
                },
                es: {
                    "nav-services": "Servicios","sv-sourcing": "Sourcing y Compras","sv-dropshipping": "Servicio de Dropshipping","sv-photos": "Fotos y Dise\u00f1os","sv-extra": "Servicio Extra","nav-products": "Productos","nav-solutions": "Soluciones","sol-private-label": "Marca Privada","sol-product-development": "Desarrollo de Productos","sol-shipping": "Soluci\u00f3n de Env\u00edo","sol-amazon-fba": "Amazon FBA","sol-quality-control": "Control de Calidad","sol-credit-payment": "T\u00e9rminos de Pago","sol-affiliate": "Programa de Afiliados","nav-agent": "Por qu\u00e9 un agente","nav-how": "Proceso","nav-faq": "Preguntas Frecuentes","nav-contact": "Contacto","nav-cta": "Comenzar",
                    "footer-desc": "Su socio de confianza en China para abastecimiento, control de calidad y log\u00edstica. Ayudamos a compradores internacionales a obtener productos con confianza.",
                    "footer-links-title": "Enlaces R\u00e1pidos","footer-link-services": "Servicios","footer-link-how": "Proceso","footer-link-faq": "Preguntas Frecuentes","footer-link-contact": "Contacto",
                    "footer-services-title": "Servicios","footer-service1": "Auditor\u00eda de F\u00e1brica","footer-service2": "Control de Calidad","footer-service3": "An\u00e1lisis de Costos","footer-service4": "Negociaci\u00f3n de Precios",
                    "footer-contact-title": "Contacto","footer-address": "Shenzhen, Guangdong, China","footer-hours": "Lun\u2013S\u00e1b 9:00\u201324:00 (CST)","footer-copyright": "\u00a9 2026 abnerchinasourcing. Todos los derechos reservados.","footer-privacy": "Pol\u00edtica de Privacidad","footer-terms": "T\u00e9rminos del Servicio"
                }
            };
            function setLanguage(lang) {
                if (lang === 'es') {
                    window.location.href = 'https://chinabuyingteam.com/es/';
                    return;
                }
                const t = translations[lang]; if (!t) return;
                try { localStorage.setItem('preferredLang', lang); } catch(e) {}
                document.querySelectorAll('[data-lang]').forEach(el => {
                    const key = el.dataset.lang;
                    if (t[key]) { if (el.tagName === 'INPUT' || el.tagName === 'TEXTAREA') { el.placeholder = t[key]; } else { el.innerHTML = t[key]; } }
                });
                document.querySelectorAll('.lang-option').forEach(btn => { btn.classList.toggle('active', btn.dataset.langCode === lang); });
                document.querySelectorAll('.lang-mobile-btn').forEach(btn => { btn.classList.toggle('active', btn.dataset.langCode === lang); });
                document.getElementById('currentLangLabel').textContent = lang.toUpperCase();
                document.getElementById('langMenu').classList.remove('open');
            }
            document.getElementById('langToggle').addEventListener('click', function(e) { e.stopPropagation(); document.getElementById('langMenu').classList.toggle('open'); });
            // Solutions dropdown toggle
            const solutionsToggle = document.getElementById('solutionsToggle');
            const solutionsMenu = document.getElementById('solutionsMenu');
            if (solutionsToggle && solutionsMenu) {
                solutionsToggle.addEventListener('click', function(e) {
                    e.stopPropagation();
                    document.getElementById('langMenu').classList.remove('open');
                    solutionsMenu.classList.toggle('open');
                });
                document.addEventListener('click', function() {
                    solutionsMenu.classList.remove('open');
                });
            }

            // Mobile solutions submenu toggle
            const mobileSolutionsToggle = document.getElementById('mobileSolutionsToggle');
            const mobileSolutionsSubmenu = document.getElementById('mobileSolutionsSubmenu');
            const mobileSolutionsArrow = document.getElementById('mobileSolutionsArrow');
            if (mobileSolutionsToggle && mobileSolutionsSubmenu) {
                mobileSolutionsToggle.addEventListener('click', function() {
                    mobileSolutionsSubmenu.classList.toggle('hidden');
                    if (mobileSolutionsArrow) {
                        mobileSolutionsArrow.style.transform = mobileSolutionsSubmenu.classList.contains('hidden') ? 'rotate(0deg)' : 'rotate(180deg)';
                    }
                });
            }

            document.querySelectorAll('.lang-option').forEach(btn => { btn.addEventListener('click', function() { setLanguage(this.dataset.langCode); }); });
            document.querySelectorAll('.lang-mobile-btn').forEach(btn => { btn.addEventListener('click', function() { setLanguage(this.dataset.langCode); }); });
            document.addEventListener('click', function() { document.getElementById('langMenu').classList.remove('open'); });
            (function initLang() {
                const urlParams = new URLSearchParams(window.location.search);
                const langFromUrl = urlParams.get('lang');
                let langFromStorage; try { langFromStorage = localStorage.getItem('preferredLang'); } catch(e) {}
                const lang = langFromUrl || langFromStorage || 'en';
                if (translations[lang]) setLanguage(lang);
            })();
        })();
    </script>
    <a href="https://wa.me/8617828191008?text=Hi%20abnerchinasourcing%2C%20I%27m%20interested%20in%20your%20sourcing%20services."
       target="_blank" rel="noopener noreferrer"
       class="fixed bottom-6 right-6 z-50 w-14 h-14 rounded-full bg-[#25D366] shadow-lg hover:shadow-xl hover:scale-105 flex items-center justify-center text-white text-2xl transition-all duration-300"
       aria-label="Chat on WhatsApp">
        <i class="fab fa-whatsapp"></i>
    </a>
'@

$head = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>{TITLE}</title>
    <meta name="description" content="{DESC}" />
    <meta name="keywords" content="{KEYWORDS}" />
    <meta name="robots" content="index, follow, max-snippet:-1, max-image-preview:large" />
    <meta name="author" content="abnerchinasourcing" />
    <link rel="canonical" href="{CANONICAL}" />
    <link rel="icon" type="image/png" href="logo.png" />
    <link rel="apple-touch-icon" href="logo.png" />
    <meta name="msapplication-TileImage" content="logo.png" />
    <meta name="msapplication-TileColor" content="#1e3a5f" />
    <meta property="og:type" content="website" />
    <meta property="og:url" content="{CANONICAL}" />
    <meta property="og:title" content="{TITLE}" />
    <meta property="og:description" content="{DESC}" />
    <meta property="og:site_name" content="abnerchinasourcing" />
    <meta property="og:locale" content="en_US" />
    <meta property="og:image" content="https://chinabuyingteam.com/logo.png" />
    <meta property="og:image:width" content="160" />
    <meta property="og:image:height" content="80" />
    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:title" content="{TITLE}" />
    <meta name="twitter:description" content="{DESC}" />
    <meta name="twitter:image" content="https://chinabuyingteam.com/logo.png" />
    <meta name="geo.region" content="CN-44" />
    <meta name="geo.placename" content="Shenzhen" />
    <meta name="geo.position" content="22.5431;114.0579" />
    <meta name="ICBM" content="22.5431, 114.0579" />
    <meta name="theme-color" content="#1e3a5f" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="language" content="en, zh, ja, ko, es" />
    <link rel="alternate" hreflang="en" href="{CANONICAL}" />
    <link rel="alternate" hreflang="zh" href="{CANONICAL}?lang=zh" />
    <link rel="alternate" hreflang="ja" href="{CANONICAL}?lang=ja" />
    <link rel="alternate" hreflang="ko" href="{CANONICAL}?lang=ko" />
    <link rel="alternate" hreflang="es" href="https://chinabuyingteam.com/es/{CANONICAL_FILENAME}" />
    <link rel="alternate" hreflang="x-default" href="{CANONICAL}" />
'@

$orgSchema = @'
    <script type="application/ld+json">
    {
        "@context": "https://schema.org",
        "@type": "Organization",
        "name": "abnerchinasourcing",
        "url": "https://chinabuyingteam.com/",
        "logo": "https://chinabuyingteam.com/logo.png",
        "description": "Professional China sourcing agency providing factory audits, quality control inspections, landed cost analysis, and price negotiation for overseas buyers.",
        "contactPoint": {
            "@type": "ContactPoint",
            "telephone": "+86-17828191008",
            "contactType": "sales",
            "availableLanguage": ["English", "Chinese", "Japanese", "Korean", "Spanish"]
        },
        "sameAs": [
            "https://www.facebook.com/profile.php?id=61592626531919"
        ],
        "address": {
            "@type": "PostalAddress",
            "addressLocality": "Shenzhen",
            "addressRegion": "Guangdong",
            "addressCountry": "CN"
        },
        "aggregateRating": {
            "@type": "AggregateRating",
            "ratingValue": "4.9",
            "bestRating": "5",
            "ratingCount": "328",
            "reviewCount": "328"
        }
    }
    </script>
'@

$breadSchema = @'
    <script type="application/ld+json">
    {
        "@context": "https://schema.org",
        "@type": "BreadcrumbList",
        "itemListElement": [
            { "@type": "ListItem", "position": 1, "name": "Home", "item": "https://chinabuyingteam.com/" },
            { "@type": "ListItem", "position": 2, "name": "Products", "item": "https://chinabuyingteam.com/products.html" },
            { "@type": "ListItem", "position": 3, "name": "{BREADNAME}", "item": "{CANONICAL}" }
        ]
    }
    </script>
'@

$webSchema = @'
    <script type="application/ld+json">
    {
        "@context": "https://schema.org",
        "@type": "WebSite",
        "name": "abnerchinasourcing",
        "url": "https://chinabuyingteam.com/",
        "description": "Professional China sourcing agent and procurement intermediary.",
        "inLanguage": ["en", "zh", "ja", "ko", "es"],
        "potentialAction": {
            "@type": "SearchAction",
            "target": "https://chinabuyingteam.com/?q={search_term_string}",
            "query-input": "required name=search_term_string"
        }
    }
    </script>
'@

$headEnd = @'
    <link rel="preconnect" href="https://cdn.tailwindcss.com" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link rel="preconnect" href="https://cdnjs.cloudflare.com" />
    <link rel="dns-prefetch" href="https://images.unsplash.com" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <script src="https://cdn.tailwindcss.com"></script>
    <style>{CSS}</style>
</head>
<body>
{NAV}
'@

$heroSection = @'
    <section class="relative pt-28 pb-16 lg:pb-20 bg-gradient-to-br from-[#1e3a5f]/5 to-white overflow-hidden" aria-label="{CATEGORY} sourcing">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
            <h1 class="text-4xl sm:text-5xl font-extrabold text-[#1e3a5f] tracking-tight">{CATEGORY}</h1>
            <div class="section-divider mt-4 mx-auto" role="presentation"></div>
            <p class="mt-4 text-gray-500 text-lg max-w-2xl mx-auto">{SHORTDESC}</p>
            <div class="mt-8 flex flex-wrap justify-center gap-4">
                <span class="inline-flex items-center gap-2 px-5 py-2.5 rounded-full bg-emerald-50 text-emerald-700 text-sm font-semibold shadow-sm"><i class="fas fa-check-circle text-emerald-500"></i> 15% Cheaper than Alibaba</span>
                <span class="inline-flex items-center gap-2 px-5 py-2.5 rounded-full bg-blue-50 text-blue-700 text-sm font-semibold shadow-sm"><i class="fas fa-certificate text-blue-500"></i> OEM/ODM Available</span>
                <span class="inline-flex items-center gap-2 px-5 py-2.5 rounded-full bg-amber-50 text-amber-700 text-sm font-semibold shadow-sm"><i class="fas fa-search text-amber-500"></i> 1 by 1 Quality Inspection</span>
            </div>
        </div>
    </section>
'@

$subSectionStart = @'
    <section class="relative py-20 lg:py-24 bg-gray-50" aria-label="{CATEGORY} sub-categories">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="text-center max-w-3xl mx-auto">
                <span class="text-sm font-semibold text-[#f7b733] tracking-widest uppercase">Product Categories</span>
                <h2 class="mt-3 text-3xl sm:text-4xl font-extrabold text-[#1e3a5f] tracking-tight">We Have Abundant Product Categories Ready for You</h2>
                <div class="section-divider mt-4" role="presentation"></div>
                <p class="mt-4 text-gray-500 text-lg">Whether you want stock or customized products, we can offer them.</p>
            </div>
            <div class="mt-14 grid sm:grid-cols-2 lg:grid-cols-3 gap-6 lg:gap-8">
'@

$subSectionEnd = @'
            </div>
        </div>
    </section>
'@

$ctaSection = @'
    <section class="relative py-20 lg:py-24 bg-gradient-to-br from-[#1e3a5f] to-[#0f1a2e] overflow-hidden">
        <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center relative z-10">
            <h2 class="text-3xl sm:text-4xl font-extrabold text-white tracking-tight">Ready to Source {CTANAME}?</h2>
            <p class="mt-4 text-gray-300 text-lg">Contact us today and get a free quote from our team of sourcing experts.</p>
            <a href="contact.html" class="mt-8 inline-flex items-center gap-2 px-8 py-3.5 rounded-full text-base font-bold text-[#1e3a5f] bg-[#f7b733] hover:bg-[#e5a52e] transition-all shadow-lg shadow-black/20">
                Contact Us Now <i class="fas fa-arrow-right text-sm"></i>
            </a>
        </div>
    </section>
'@

function New-Card {
    param($Icon, $Title, $Desc, $Index)
    $color = if ($Index % 2 -eq 0) { "from-[#1e3a5f] to-[#2d6a9f]" } else { "from-[#f7b733] to-[#fc4a1a]" }
    return @"
                <article class="card-hover bg-white rounded-2xl p-6 lg:p-8 shadow-sm border border-gray-100 group">
                    <div class="w-14 h-14 rounded-xl bg-gradient-to-br $color flex items-center justify-center text-white text-xl shadow-md" aria-hidden="true">
                        <i class="fas fa-$Icon"></i>
                    </div>
                    <h3 class="mt-5 text-lg font-bold text-[#1e3a5f]">$Title</h3>
                    <p class="mt-2 text-sm text-gray-500 leading-relaxed">$Desc</p>
                    <a href="contact.html" class="mt-4 inline-flex items-center gap-2 px-5 py-2.5 bg-[#f7b733] text-white text-sm font-semibold rounded-xl hover:bg-[#e5a52e] transition-all shadow-sm">
                        Get A Quote <i class="fas fa-arrow-right text-xs"></i>
                    </a>
                </article>
"@
}

function New-Page {
    param($Canonical, $Title, $Description, $Keywords, $CategoryName, $ShortDesc, $BreadcrumbName, $CtaName, $SubCategories)

    $canonicalFilename = [System.IO.Path]::GetFileName($Canonical)
    $head1 = $head -replace "{TITLE}", $Title -replace "{DESC}", $Description -replace "{KEYWORDS}", $Keywords -replace "{CANONICAL}", $Canonical -replace "{CANONICAL_FILENAME}", $canonicalFilename
    $bread1 = $breadSchema -replace "{BREADNAME}", $BreadcrumbName -replace "{CANONICAL}", $Canonical
    $headEnd1 = $headEnd -replace "{CSS}", $css -replace "{NAV}", $nav
    $hero1 = $heroSection -replace "{CATEGORY}", $CategoryName -replace "{SHORTDESC}", $ShortDesc
    $subStart1 = $subSectionStart -replace "{CATEGORY}", $CategoryName

    $cards = ""
    for ($i = 0; $i -lt $SubCategories.Count; $i++) {
        $sc = $SubCategories[$i]
        $cards += New-Card -Icon $sc.icon -Title $sc.title -Desc $sc.desc -Index $i
    }

    $cta1 = $ctaSection -replace "{CTANAME}", $CtaName

    return $head1 + $orgSchema + $bread1 + $webSchema + $headEnd1 + $hero1 + $subStart1 + $cards + $subSectionEnd + $cta1 + $footer + $js + @'
</body>
</html>
'@
}

# ============================================================
# PAGE 1: Apparel
# ============================================================
$html = New-Page -Canonical "https://chinabuyingteam.com/products-apparel.html" -Title "Apparel Sourcing �� abnerchinasourcing | OEM/ODM Clothing, Accessories & More" -Description "Source apparel, fashion accessories, undergarments, jewelry, socks, and shoes from China. abnerchinasourcing offers OEM/ODM clothing manufacturing with factory-direct pricing." -Keywords "apparel sourcing China, clothing manufacturer, OEM clothing, fashion accessories wholesale, custom clothing China" -CategoryName "Apparel &amp; Fashion Accessories" -ShortDesc "Source OEM/ODM clothing, fashion accessories, undergarments, jewelry, socks, and shoes from China at factory-direct prices." -BreadcrumbName "Apparel" -CtaName "Apparel &amp; Fashion Accessories" -SubCategories @(
    @{icon="vest"; title="Apparel"; desc="China produces almost 60% of clothes in the world. We print logos and patterns to customize your clothes even with a low MOQ. We also offer different kinds of clothing in stock at factory-direct prices."},
    @{icon="hat-cowboy"; title="Clothes Accessories"; desc="We help you wholesale and customize all kinds of clothing accessories, like gloves, hats, belts, scarves, watches, sunglasses, ties, pins, etc. Tell us what you need if you can't find them in the list."},
    @{icon="tshirt"; title="Undergarments"; desc="We're experienced in producing and designing types of undergarments in diverse fabrics. No matter seamless fabric, daily wear, or sexy style, we help you wholesale or customize any you want."},
    @{icon="gem"; title="Jewelry"; desc="With 10+ years of experience in the jewelry business, we've got over 35 jewelry factories with long-term cooperation. We help create brand-new designs or improve existing styles as per your needs."},
    @{icon="socks"; title="Socks"; desc="We help you find several sock factories even with a low MOQ (only $500). You can get the latest styles like traditional knitted styles or custom 3D-printed ones from us."},
    @{icon="shoe-prints"; title="Shoes"; desc="Zhejiang is one of the shoe manufacturing centers in China. We've sourced a wide range of fashion shoes like casual shoes, kids' shoes, boots, and shoe accessories."}
)
Write-HtmlFile -FilePath "d:\chinabuyingteam\products-apparel.html" -Content $html

# ============================================================
# PAGE 2: Furniture
# ============================================================
$html = New-Page -Canonical "https://chinabuyingteam.com/products-furniture.html" -Title "Furniture Sourcing �� abnerchinasourcing | Home, Office & Outdoor Furniture" -Description "Source home, office, outdoor, kids, bathroom, and bedroom furniture from China. Custom designs and finishes available with factory-direct pricing." -Keywords "furniture sourcing China, home furniture wholesale, office furniture, outdoor furniture, custom furniture manufacturer" -CategoryName "Furniture" -ShortDesc "Source home, office, outdoor, kids, bathroom, and bedroom furniture from China. Custom designs and finishes available." -BreadcrumbName "Furniture" -CtaName "Furniture" -SubCategories @(
    @{icon="umbrella-beach"; title="Outdoor Furniture"; desc="We have a wide selection of outdoor options, from garden sets to outdoor dining sets, and pool furniture. We offer different materials including wooden, metal, plastic, stainless steel, etc."},
    @{icon="couch"; title="Home Furniture"; desc="Home furniture is a necessity in people's daily life. Whether you're selling high-end or low-cost, classic or contemporary, wood or synthetics, we offer a wide selection at competitive prices."},
    @{icon="briefcase"; title="Office Furniture"; desc="If you are in the office furniture market, importing from China will be wise. We offer a great diversity of office desks, storage, and tables in creative design."},
    @{icon="child"; title="Kid's Furniture"; desc="We offer children's furniture suites, school desks, etc. We provide relative certificates of kid's furniture, such as CPSIA in the USA, CE in the European market, etc."},
    @{icon="bath"; title="Bathroom Furniture"; desc="Well-designed bathroom furniture is aesthetical and functional. We have a wide selection of bathroom shelves, shower chairs, and cabinets, from traditional to modern styles."},
    @{icon="bed"; title="Bedroom Furniture"; desc="Bedroom furniture materials are increasingly rich. Wood, glass, metal, bamboo, and rattan furniture produced in China all have large export to the US and European countries."}
)
Write-HtmlFile -FilePath "d:\chinabuyingteam\products-furniture.html" -Content $html

# ============================================================
# PAGE 3: Bags & Cases
# ============================================================
$html = New-Page -Canonical "https://chinabuyingteam.com/products-bags-cases.html" -Title "Bags & Cases Sourcing �� abnerchinasourcing | Backpacks, Handbags, Luggage" -Description "Source handbags, backpacks, toiletry bags, travel bags, pouches, and specialty bags from China. Custom branding and low MOQ available." -Keywords "bag sourcing China, handbag manufacturer, backpack wholesale, luggage supplier, custom bags OEM" -CategoryName "Bags &amp; Cases" -ShortDesc "Source handbags, backpacks, toiletry bags, travel bags, pouches, and specialty bags from China. Custom branding and low MOQ available." -BreadcrumbName "Bags & Cases" -CtaName "Bags &amp; Cases" -SubCategories @(
    @{icon="bag-shopping"; title="Handbags"; desc="We help customize handbag styles that are very popular on Pinterest. We also offer stock handbags 10%-35% cheaper than Alibaba. PU leather is the most popular material among consumers."},
    @{icon="suitcase-rolling"; title="Backpacks"; desc="Common backpacks are made of cotton, polyester, PU leather, oxford. The materials determine the cost and durability. We provide private-label solutions to differentiate your product."},
    @{icon="kit-medical"; title="Toiletry Bags"; desc="Typically, toiletry bags are made of waterproof materials. Nylon, leather, or faux leather are durable fabrics; while plastic is a good option to produce clear bags."},
    @{icon="suitcase"; title="Travel Bags"; desc="Our travel bags include insulated bags for picnics, storage bags for luggage, etc. Popular fabrics are polyester, nylon, rattan, oxford, and cloth."},
    @{icon="bag-shopping"; title="Pouches"; desc="Most pouches are made of cotton, polyester, mesh, or plastic. They are made for different purposes, like for shopping, storage, or protection. They're low-cost and high-margin."},
    @{icon="cubes"; title="Special Bags"; desc="A bag can be used for different purposes. We also offer first aid bags, bicycle bags, storage bags, and more with specific functions."}
)
Write-HtmlFile -FilePath "d:\chinabuyingteam\products-bags-cases.html" -Content $html

# ============================================================
# PAGE 4: Beauty
# ============================================================
$html = New-Page -Canonical "https://chinabuyingteam.com/products-beauty.html" -Title "Beauty & Health Sourcing �� abnerchinasourcing | Cosmetics, Skincare, Personal Care" -Description "Source beauty products, makeup, personal care, medical supplies, hair supplies, and cosmetics packaging from China. OEM/ODM available." -Keywords "beauty sourcing China, cosmetics manufacturer, skincare OEM, personal care products, private label cosmetics" -CategoryName "Beauty &amp; Health" -ShortDesc "Source beauty products, makeup, personal care, medical supplies, hair supplies, and cosmetics packaging from China. OEM/ODM available." -BreadcrumbName "Beauty" -CtaName "Beauty &amp; Health" -SubCategories @(
    @{icon="magic"; title="Makeup"; desc="We've sourced and customized different makeups like eyeshadow, lipstick, mask, nail glue, eyelashes, etc., according to clients' needs."},
    @{icon="tools"; title="Tools & Accessories"; desc="There are many types of makeup tools for new or veteran importers. Cosmetic tools include brushes, mirrors, nail clippers, etc."},
    @{icon="hand-sparkles"; title="Personal Care"; desc="Our personal care tools mainly refer to oral, lips, skin, and body care tools, such as facial cleansers, electric toothbrushes, soap, ear candles, etc."},
    @{icon="stethoscope"; title="Medical Supplies"; desc="Due to the COVID-19 pandemic, medical supplies are still in high demand. Our supplies include detection devices, face masks, gloves, first aid kits, etc."},
    @{icon="hand-holding-heart"; title="Hair Supplies & Wigs"; desc="We offer products like wigs, hair bands, clips, electric hair curlers, combs, scissors, hair dryers, and more. Wigs are especially popular in the American and African markets."},
    @{icon="box-open"; title="Bags & Cases"; desc="We help wholesale cosmetics packaging, including jars, bottles, tubes, and bags in different materials like plastic, glass, fabrics, and acrylic. It's a good category for private labels."}
)
Write-HtmlFile -FilePath "d:\chinabuyingteam\products-beauty.html" -Content $html

# ============================================================
# PAGE 5: Toys
# ============================================================
$html = New-Page -Canonical "https://chinabuyingteam.com/products-toys.html" -Title "Toys & Games Sourcing �� abnerchinasourcing | Classic Toys, Outdoor, Educational" -Description "Source toys, outdoor toys, games, party supplies, novelty items, and educational toys from China. EN71, ASTM, CPSIA compliant." -Keywords "toy sourcing China, games wholesale, educational toys, outdoor toys, party supplies" -CategoryName "Toys &amp; Games" -ShortDesc "Source toys, outdoor toys, games, party supplies, novelty items, and educational toys from China. EN71, ASTM, CPSIA compliant." -BreadcrumbName "Toys & Games" -CtaName "Toys &amp; Games" -SubCategories @(
    @{icon="puzzle-piece"; title="Classic Toys"; desc="Classic toys always have great and stable demand every year. We gather the most complete toy categories in different materials like plush, wooden toys, puzzles, etc."},
    @{icon="futbol"; title="Outdoor Toys"; desc="Outdoor toys like flying balls, climbing rocks, bubble guns, and golf toys are trending in the US and European markets. We ensure safe and durable play equipment."},
    @{icon="dice"; title="Games"; desc="You can find kids' and family board games, card games, simple or complicated electronic games, and more here."},
    @{icon="balloons"; title="Party Supplies"; desc="Party supplies add fun to your parties. It's a profitable business to sell them because party goods are always needed."},
    @{icon="smile-wink"; title="Funny & Novelty"; desc="Cool and funny stuff attracts people. We can develop funny and unique toys from 0 to make you stand out from your competitors."},
    @{icon="book-open"; title="Educational Toys"; desc="Different from general toys, educational toys are designed to stimulate children's learning. They're usually suitable for toddlers."}
)
Write-HtmlFile -FilePath "d:\chinabuyingteam\products-toys.html" -Content $html

# ============================================================
# PAGE 6: Sports
# ============================================================
$html = New-Page -Canonical "https://chinabuyingteam.com/products-sports.html" -Title "Sports Products Sourcing �� abnerchinasourcing | Fitness, Apparel, Yoga, Games" -Description "Source sports equipment, fitness gear, clothing, yoga products, sports games, footwear, and accessories from China. Factory-direct pricing." -Keywords "sports sourcing China, fitness equipment, sportswear manufacturer, yoga products wholesale, athletic footwear" -CategoryName "Sports &amp; Entertainment" -ShortDesc "Source sports equipment, fitness gear, clothing, yoga products, sports games, footwear, and accessories from China. Factory-direct pricing." -BreadcrumbName "Sports" -CtaName "Sports &amp; Entertainment" -SubCategories @(
    @{icon="dumbbell"; title="Fitness Equipment"; desc="There are numerous items available for fitness enthusiasts. We offer fitness equipment for gyms or homes. Home exercise gear is hot, especially in the US market."},
    @{icon="vest"; title="Clothing"; desc="We provide all gym clothing like yoga suits, t-shirts, bike shorts, etc. If you have your own design, we also help make it a reality every step of the way."},
    @{icon="spa"; title="Yoga"; desc="Our yoga products include mats, yoga wears, exercise balls, and other accessories. We help you create private-label yoga products by printing a logo, customizing packaging, and more."},
    @{icon="table-tennis"; title="Sports & Games"; desc="There are sporting goods and outdoor games fun for both kids and adults, such as balls, climbing walls, kid's scooters, etc. People can enjoy themselves and exercise at the same time."},
    @{icon="shoe-prints"; title="Footwear"; desc="Athletic footwear is designed for exercising, sports, and some recreational activity. Different from general wear, they're usually more sweat-wicking, breathable, and more durable."},
    @{icon="hand-holding-heart"; title="Accessories"; desc="There are also some exercise accessories helping to protect people from hurt during exercise such as muscle tape, waist belts, massage guns, etc. It's a huge niche market."}
)
Write-HtmlFile -FilePath "d:\chinabuyingteam\products-sports.html" -Content $html

# ============================================================
# PAGE 7: Home Supplies
# ============================================================
$html = New-Page -Canonical "https://chinabuyingteam.com/products-home-supplies.html" -Title "Home Supplies Sourcing �� abnerchinasourcing | Decor, Appliances, Kitchen & More" -Description "Source home decor, appliances, lighting, sundries, bath, bedding, kitchen, and smoking accessories from China. Competitive factory pricing." -Keywords "home supplies sourcing, home decor wholesale, kitchenware, bedding supplier, home appliances China" -CategoryName "Home Supplies" -ShortDesc "Source home decor, appliances, lighting, sundries, bath, bedding, kitchen, and smoking accessories from China. Competitive factory pricing." -BreadcrumbName "Home Supplies" -CtaName "Home Supplies" -SubCategories @(
    @{icon="couch"; title="Home Decor"; desc="There is a wide variety of niches to choose from when it comes to selling home decor. Popular home decor categories are wall art, lamps, scented candles, etc."},
    @{icon="microchip"; title="Appliance"; desc="The margins of home and kitchen appliances are higher than the standard products. Make sure to meet the regulations in different countries before importing."},
    @{icon="lightbulb"; title="Lighting"; desc="We help source and customize household, outdoor, commercial, and smart lighting for you. Except for LED lighting, we also provide candles and accessories."},
    @{icon="cubes"; title="Sundries"; desc="There are hundreds of sundry categories to select from. Find a niche market from these general products to narrow your competition and make profits."},
    @{icon="bath"; title="Bath"; desc="This category ranges from sanitary supplies to shower products and small appliances. It's profitable to sell on private labels, like building your own brand."},
    @{icon="bed"; title="Bedding"; desc="Our bedding selections include pillows, blankets, sleeping masks, bed sheets, etc. Common materials include fiber, cotton, plush, polyester, wool, and more."},
    @{icon="utensils"; title="Kitchen & Dining"; desc="There is a wide selection of kitchen utensils. Popular materials include metal, silicone, wood, glass, and synthetic utensils. All passed required certificates."},
    @{icon="fire"; title="Smoking Accessories"; desc="Water pipes, Hookah are hot-selling especially in the Arab States, USA, and European markets. Customizing these tools in different shapes, colors, and patterns would boost sales."}
)
Write-HtmlFile -FilePath "d:\chinabuyingteam\products-home-supplies.html" -Content $html

# ============================================================
# PAGE 8: Garden & Tools
# ============================================================
$html = New-Page -Canonical "https://chinabuyingteam.com/products-garden-tools.html" -Title "Garden & Tools Sourcing �� abnerchinasourcing | Gardening, Plants, Pots, Accessories" -Description "Source gardening tools, fake plants, plant pots, growing supplies, garden wear, and accessories from China. Custom designs available." -Keywords "garden tools sourcing, gardening supplies, fake plants wholesale, plant pots, garden accessories" -CategoryName "Garden &amp; Tools" -ShortDesc "Source gardening tools, fake plants, plant pots, growing supplies, garden wear, and accessories from China. Custom designs available." -BreadcrumbName "Garden & Tools" -CtaName "Garden &amp; Tools" -SubCategories @(
    @{icon="trowel"; title="Gardening Tools"; desc="Essential tools include shovels, saws, buckets, blades, yard carts, etc. And nowadays, electrical equipment would be more efficient for gardeners."},
    @{icon="leaf"; title="Fake Plants & Flowers"; desc="We're in Yiwu, one of the artificial plants & flower clusters in China. The main materials are silk, velvet fabric, foam, plastic, etc."},
    @{icon="tree"; title="Plant Pots"; desc="We help you customize plant and flowerpots in different materials like ceramic, metal, wooden, plastic, cloth, and paper."},
    @{icon="lightbulb"; title="Growing Supplies"; desc="Growing supplies help indoor plants grow faster. They are designed with controllable lights so the plants can always be in the best environment."},
    @{icon="vest"; title="Garden Wear"; desc="Common clothing and footwear in the garden include cut-resistant gloves, boots, hooded shirts, etc. These products are made of waterproof, durable materials."},
    @{icon="camera"; title="Garden Accessories"; desc="Garden accessories are items to decorate, organize and protect your garden. We offer products like simulated birds, anti-insect nets, wooden pot shelves, etc."}
)
Write-HtmlFile -FilePath "d:\chinabuyingteam\products-garden-tools.html" -Content $html

# ============================================================
# PAGE 9: Electronics
# ============================================================
$html = New-Page -Canonical "https://chinabuyingteam.com/products-electronics.html" -Title "Electronics Sourcing �� abnerchinasourcing | Appliances, Speakers, Computers & More" -Description "Source electronics, small appliances, speakers, headphones, computers, phones, GPS devices, and components from China. FCC/CE/ROHS compliant." -Keywords "electronics sourcing China, consumer electronics, speaker manufacturer, computer accessories, phone accessories wholesale" -CategoryName "Electronics" -ShortDesc "Source electronics, small appliances, speakers, headphones, computers, phones, GPS devices, and components from China. FCC/CE/ROHS compliant." -BreadcrumbName "Electronics" -CtaName "Electronics" -SubCategories @(
    @{icon="blender"; title="Small Appliance"; desc="Electronic appliances have higher profit margins than consumer products generally. Cool and unique designs are a good marketing strategy to appeal to consumers."},
    @{icon="headphones"; title="Speaker & Headphone"; desc="Adding your logo, using unique patterns, or designing your own packaging are common ways of customization. Remember to meet the regulations like FCC, CE, ROHS."},
    @{icon="laptop"; title="Computer & Accessories"; desc="The computer industry is mainly concentrated in China's southern areas like Guangdong province. We help you find different suppliers of computers and accessories there."},
    @{icon="mobile-screen"; title="Phone & Accessories"; desc="Smartphones are essential for consumers in the world, which increases the demand for phone accessories. It can be a competitive and also profitable business."},
    @{icon="location-dot"; title="GPS Device"; desc="Major products are GPS trackers, device holders, etc. The devices require licenses like WPC and BIS."},
    @{icon="microchip"; title="Electronic Components"; desc="The components mainly include conductive slip rings, semiconductor laser diode, capacitor, fuses tubes."}
)
Write-HtmlFile -FilePath "d:\chinabuyingteam\products-electronics.html" -Content $html

# ============================================================
# PAGE 10: Pet Supplies
# ============================================================
$html = New-Page -Canonical "https://chinabuyingteam.com/products-pet-supplies.html" -Title "Pet Supplies Sourcing �� abnerchinasourcing | Toys, Grooming, Beds & Accessories" -Description "Source pet toys, grooming tools, accessories, collars, harnesses, beds, and carriers from China. Safe and certified pet products." -Keywords "pet supplies sourcing, pet toys wholesale, pet grooming, pet beds, pet accessories China" -CategoryName "Pet Supplies" -ShortDesc "Source pet toys, grooming tools, accessories, collars, harnesses, beds, and carriers from China. Safe and certified pet products." -BreadcrumbName "Pet Supplies" -CtaName "Pet Supplies" -SubCategories @(
    @{icon="bone"; title="Pet Toys"; desc="Toys for pets are always in high demand. All types of our pet toys are produced in hypoallergenic materials, safe for pets' health."},
    @{icon="scissors"; title="Grooming Tools"; desc="Gloves, shower heads, toothbrushes, combs, paw cleaners, and more are common supplies for pet grooming."},
    @{icon="paw"; title="Pet Accessories"; desc="We've sourced and customized types of pet beds, carriers, wearing, feeding bowls, etc. Our products are all certified based on different countries' policies."},
    @{icon="leash"; title="Collar & Harness"; desc="Collars and harnesses are must-have parts for pets to go out. The main materials are leather, nylon, canvas, and other water-repellent fabrics."},
    @{icon="house-chimney"; title="Pet Beds"; desc="Choosing comfortable and durable pet bed materials is a crucial consideration for pet owners. The commonly-used materials include faux fur, polyester, cotton, plush, leather, etc."},
    @{icon="suitcase-rolling"; title="Pet Carriers"; desc="Pet owners prefer to take their dogs or cats out of the house. Products like comfy car seats for dogs, and cat backpacks are all in high demand."}
)
Write-HtmlFile -FilePath "d:\chinabuyingteam\products-pet-supplies.html" -Content $html

# ============================================================
# PAGE 11: Mother & Kids
# ============================================================
$html = New-Page -Canonical "https://chinabuyingteam.com/products-mother-kids.html" -Title "Mother & Kids Sourcing �� abnerchinasourcing | Baby Feeding, Toys, Safety, Travel" -Description "Source baby feeding products, travel gear, bibs, diapering, safety items, toys, and accessories from China. Safety certified." -Keywords "baby products sourcing, kids supplies, mother and baby, stroller manufacturer, baby toys wholesale" -CategoryName "Mother &amp; Kids" -ShortDesc "Source baby feeding products, travel gear, bibs, diapering, safety items, toys, and accessories from China. Safety certified." -BreadcrumbName "Mother & Kids" -CtaName "Mother &amp; Kids" -SubCategories @(
    @{icon="bottle-water"; title="Baby Feeding"; desc="Baby feeding utensils, pacifiers, and bottles popularly come in food-grade materials like silicone, plastic, stainless steel, etc."},
    @{icon="stroller"; title="Travel Gear"; desc="Comfort and safety are important to design strollers for your brand. We also offer other custom gears like strap, umbrella, hanger, bags."},
    @{icon="hand-holding"; title="Bibs & Diapering"; desc="Baby care items are used to keep the baby stay clean. Usually, these items sell in sets. Using diverse colors or patterns helps make your products stand out."},
    @{icon="shield"; title="Baby Safety"; desc="Kids grow really fast so new safety problems can arise constantly. Corner guards, mosquito repellent things, anti-lost rope, and more are all beneficial items."},
    @{icon="drumstick-bite"; title="Baby Toys"; desc="Things infants can reach for, hold, suck on, shake, and make noise with are good toys for a baby. It's vital to focus on the toy design and regulations."},
    @{icon="heart"; title="Baby Accessories"; desc="Except for basic accessories like bibs and bottles, parents also love purchasing customized items like tooth boxes, footprint pads, and milestone blankets for memories."}
)
Write-HtmlFile -FilePath "d:\chinabuyingteam\products-mother-kids.html" -Content $html

# ============================================================
# PAGE 12: Hardware
# ============================================================
$html = New-Page -Canonical "https://chinabuyingteam.com/products-hardware.html" -Title "Hardware Sourcing �� abnerchinasourcing | Tools, Building Materials, Locks & More" -Description "Source hardware tools, electric tools, accessories, locks, building materials, and heating/cooling products from China. Competitive factory pricing." -Keywords "hardware sourcing China, building materials, tools wholesale, locks and keys, hardware accessories" -CategoryName "Hardware &amp; Building Materials" -ShortDesc "Source hardware tools, electric tools, accessories, locks, building materials, and heating/cooling products from China. Competitive factory pricing." -BreadcrumbName "Hardware" -CtaName "Hardware &amp; Building Materials" -SubCategories @(
    @{icon="wrench"; title="Basic Tools"; desc="There are hundreds of basic must-have tools such as tweezers, hammers, pliers, wrenches, etc. It's profitable to sell them in sets."},
    @{icon="gear"; title="Electric/Air Tools"; desc="This category covers drill brushes, electronic test pens, polishing brushes, cutting discs, drill bits, and foam pads."},
    @{icon="bolt"; title="Hardware Accessories"; desc="Hardware accessories are a broad category. General accessories include fasteners, bearings, springs, seals, rigging, gears, molds, and abrasives."},
    @{icon="lock"; title="Lock & Keys"; desc="Besides general locks and keys, we also customize accessories like keychains and no-touch door openers, usually made of stainless steel, zinc, silver, etc."},
    @{icon="house-chimney-window"; title="Building Materials"; desc="China is a good source of building materials, providing all kinds of items��from tiles and wood flooring to fixtures and furniture."},
    @{icon="fire"; title="Heating & Cooling"; desc="Heated products made in China like electric blankets and heated scarves are trending especially in the European market. They are usually affordable and energy-saving."}
)
Write-HtmlFile -FilePath "d:\chinabuyingteam\products-hardware.html" -Content $html

# ============================================================
# PAGE 13: Office Supplies
# ============================================================
$html = New-Page -Canonical "https://chinabuyingteam.com/products-office-supplies.html" -Title "Office Supplies Sourcing �� abnerchinasourcing | Stationery, Appliances, Storage" -Description "Source office supplies, appliances, collaboration tools, mail supplies, storage, and decor from China. Wholesale pricing available." -Keywords "office supplies sourcing, stationery wholesale, office appliances, office storage, office decor" -CategoryName "Office Supplies &amp; Appliance" -ShortDesc "Source office supplies, appliances, collaboration tools, mail supplies, storage, and decor from China. Wholesale pricing available." -BreadcrumbName "Office Supplies" -CtaName "Office Supplies &amp; Appliance" -SubCategories @(
    @{icon="pen-fancy"; title="General Supplies"; desc="Consumable office supplies like paper, pens, tapes, ink, and more are still needed daily. China offers lower prices and the latest production technology."},
    @{icon="camera"; title="Office Appliances"; desc="Office appliances get work done efficiently. We provide cameras, laser spirit level, projectors, laser engraving machines, and more with advanced technology."},
    @{icon="people-arrows"; title="Collaboration Tools"; desc="We offer a wide range of products, including paper products, writing instruments, envelopes, labels, folders, binders, staplers, scissors, tape, and more."},
    @{icon="mailbox"; title="Mail Supplies"; desc="Mail supplies mean the packaging and accessories to pack and ship documents, such as stamps, envelopes, boxes, etc."},
    @{icon="shelves"; title="Storage"; desc="To keep the office organized, desk organizers, bookends, shelves and more are needed. The commonly-used materials are wood or metal."},
    @{icon="paint-roller"; title="Decor"; desc="Office decorations can create a pleasant environment and promote productivity. Customized curtains, wall art, pictures, and plants are all trending."}
)
Write-HtmlFile -FilePath "d:\chinabuyingteam\products-office-supplies.html" -Content $html

# ============================================================
# PAGE 14: Automotive
# ============================================================
$html = New-Page -Canonical "https://chinabuyingteam.com/products-automotive.html" -Title "Automotive Sourcing �� abnerchinasourcing | Car Parts, Bicycle, Cleaning & More" -Description "Source automotive parts, bicycle accessories, cleaning items, security devices, exterior and interior accessories from China." -Keywords "automotive sourcing China, car parts, auto accessories, bicycle accessories, car cleaning" -CategoryName "Automotive Parts &amp; Accessories" -ShortDesc "Source automotive parts, bicycle accessories, cleaning items, security devices, exterior and interior accessories from China." -BreadcrumbName "Automotive" -CtaName "Automotive Parts &amp; Accessories" -SubCategories @(
    @{icon="engine"; title="Car Parts"; desc="Auto parts come in varying shapes, designs, and brands. We offer custom car parts that can be used in most modern cars. Most Chinese auto part makers can replicate branded auto parts."},
    @{icon="bicycle"; title="Bicycle Accessories"; desc="Proper supplies are vital for riders. Cycling bags, gloves, helmets, locks, and glasses are some essentials. Add special designs to make them more appealing."},
    @{icon="broom"; title="Cleaning Items"; desc="There are kinds of cleaning items for the car interior and exterior. We help you wholesale items like brushes and electrical cleaners like handheld vacuum cleaners."},
    @{icon="video"; title="Security Devices"; desc="Such products are related to the vehicle itself, drivers, and passengers. Products include anti-theft devices, alcohol breath testers, safety belts, etc."},
    @{icon="spray-can"; title="Exterior Accessories"; desc="Car stickers, sunshades, or wraps help improve cars' exterior look and functions. Adding unique and cool patterns would be welcome for consumers."},
    @{icon="chair"; title="Interior Accessories"; desc="These accessories are mainly for storage, decoration, and protection. Car owners like to personalize their vehicles from mats to covers to keychains."}
)
Write-HtmlFile -FilePath "d:\chinabuyingteam\products-automotive.html" -Content $html

# ============================================================
# PAGE 15: Adult Products
# ============================================================
$html = New-Page -Canonical "https://chinabuyingteam.com/products-adult-products.html" -Title "Adult Products Sourcing �� abnerchinasourcing | Discreet & Private Label" -Description "Discreet sourcing of adult toys, sexy apparel, bondage gear, sensual delights, novelties, and accessories from China. Private packaging available." -Keywords "adult products sourcing, adult toys wholesale, private label adult products, discreet sourcing" -CategoryName "Adult Products" -ShortDesc "Discreet sourcing of adult toys, sexy apparel, bondage gear, sensual delights, novelties, and accessories from China. Private packaging available." -BreadcrumbName "Adult Products" -CtaName "Adult Products" -SubCategories @(
    @{icon="heart-pulse"; title="Adult Toys"; desc="Hot-selling sex toys are sucking eggs, massage vibrators, exercise balls, etc. You can customize them in different shapes and colors."},
    @{icon="tshirt"; title="Sexy Apparel"; desc="The common types of costumes are night dresses and lingerie. Usually, the popular styles are made of silk, nylon mesh, and sheer fabrics."},
    @{icon="handcuffs"; title="Bondage Gear"; desc="Popular bondage gears include restraints, chastity devices, gags and muzzles, etc."},
    @{icon="hand-sparkles"; title="Sensual Delights"; desc="Such sensual delight items include erotic massage, bath items, and edible items."},
    @{icon="gift"; title="Novelties"; desc="Some items made in shapes of sex elements are trending. For example, a vase of a female body looks very elegant and attractive to consumers."},
    @{icon="bed"; title="Sex Accessories"; desc="The accessories include ramps, cushions, swings, and bedding. Such items add more fun for users and are popular in the market."}
)
Write-HtmlFile -FilePath "d:\chinabuyingteam\products-adult-products.html" -Content $html

# ============================================================
# PAGE 16: Industrial
# ============================================================
$html = New-Page -Canonical "https://chinabuyingteam.com/products-industrial.html" -Title "Industrial Supplies Sourcing �� abnerchinasourcing | Tools, Equipment, Storage" -Description "Source industrial electric tools, equipment, storage, measurement, shipping supplies, and parts/components from China." -Keywords "industrial sourcing China, industrial supplies, equipment wholesale, measurement tools, shipping supplies" -CategoryName "Industrial Supplies" -ShortDesc "Source industrial electric tools, equipment, storage, measurement, shipping supplies, and parts/components from China." -BreadcrumbName "Industrial" -CtaName "Industrial Supplies" -SubCategories @(
    @{icon="bolt"; title="Electric Tools"; desc="Our electric tools include small items like angle clamps, wheels, and detectors for testing in different industries."},
    @{icon="gear"; title="Equipment"; desc="There are different machines like compost turner machines, juice grind machines, etc. They're available for household or commercial usage."},
    @{icon="warehouse"; title="Storage"; desc="For businesses that store their cargo, pallets would be a necessity. Such storage products usually feature in wooden and plastic."},
    @{icon="ruler-combined"; title="Measurement"; desc="There are different measurement tools for calculating the distance, length, angle, speed, etc. They're available for different industries."},
    @{icon="truck"; title="Shipping"; desc="These supplies in the warehouse or office are used to ship and organize packages or heavy items, such as pedal-lifting platforms, foldable fences, etc."},
    @{icon="puzzle-piece"; title="Parts and Components"; desc="Except for general tools and machines, parts like warning tapes, plastic tubes, PVC sheets, and wooden pallets are good sellers."}
)
Write-HtmlFile -FilePath "d:\chinabuyingteam\products-industrial.html" -Content $html

# ============================================================
# PAGE 17: Packaging
# ============================================================
$html = New-Page -Canonical "https://chinabuyingteam.com/products-packaging.html" -Title "Packaging Sourcing �� abnerchinasourcing | Paper, Glass, Plastic, Metal & Custom" -Description "Source paper, glass, plastic, metal packaging, corrugated boxes, and gift boxes from China. Custom packaging solutions available." -Keywords "packaging sourcing China, custom packaging, paper packaging, corrugated boxes, gift box manufacturer" -CategoryName "Packaging" -ShortDesc "Source paper, glass, plastic, metal packaging, corrugated boxes, and gift boxes from China. Custom packaging solutions available." -BreadcrumbName "Packaging" -CtaName "Packaging" -SubCategories @(
    @{icon="box-open"; title="Paper Packaging"; desc="The price of our custom paper packaging will be lower than your local packaging factory's. They're made of ordinary paperboard, designed in variable shapes and patterns."},
    @{icon="bottle-water"; title="Glass Packaging"; desc="Many industries require glass packaging for their products, such as the beverage or food industry. We help customize different types of glass containers."},
    @{icon="cube"; title="Plastic Packaging"; desc="Plastic packaging is used in a wide range of products. There are many forms �� rigid or flexible. PET is a common plastic, recyclable and BPA-free."},
    @{icon="oil-can"; title="Metal Packaging"; desc="Aluminum, tinplate, and stainless steel are the main materials for metal packaging. They're good for preserving food or cosmetic products."},
    @{icon="truck-loading"; title="Corrugated Boxes"; desc="Corrugated cartons are made up of a few layers of material rather than just a single sheet like cardboard. They're stronger and more durable for packing and shipping."},
    @{icon="gift"; title="Exquisite Gift Box"; desc="These gift boxes are made of expensive cardboard with multiple inserts inside, processed with more complicated printing techniques. Available for high-end products."}
)
Write-HtmlFile -FilePath "d:\chinabuyingteam\products-packaging.html" -Content $html

# ============================================================
# PAGE 18: Outdoors
# ============================================================
$html = New-Page -Canonical "https://chinabuyingteam.com/products-outdoors.html" -Title "Outdoor Products Sourcing �� abnerchinasourcing | Camping, Fishing, Hiking & More" -Description "Source outdoor products, fishing, cycling, emergency kits, camping, hiking, traveling, and umbrella/sunshade from China." -Keywords "outdoor sourcing China, camping gear wholesale, fishing equipment, hiking supplies, travel accessories" -CategoryName "Outdoors" -ShortDesc "Source outdoor products, fishing, cycling, emergency kits, camping, hiking, traveling, and umbrella/sunshade from China." -BreadcrumbName "Outdoors" -CtaName "Outdoors" -SubCategories @(
    @{icon="fish-fins"; title="Fishing"; desc="Fishing equipment is a niche product that serves fishing lovers. Generally, consumers will pay attention to the appearance and function of products."},
    @{icon="bicycle"; title="Cycling"; desc="The vital supplies for cyclists are the bike itself, a helmet, proper shoes, and clothing. These products aim to improve comfort and performance."},
    @{icon="suitcase-medical"; title="Emergency Kits"; desc="Emergency supplies are a must for outdoor enthusiasts. These items are sold in a set �� usually consisting of an emergency blanket, a compass, a knife, etc."},
    @{icon="tent"; title="Camping & Hiking"; desc="From a sleeping pad to a headlamp to trekking poles, there is a wide assortment of camping products for adventurers. The US camping market is rapidly increasing."},
    @{icon="luggage-cart"; title="Traveling"; desc="Travel items make trips easier and more comfortable. Things like tents, storage bags, and pillows are all in high demand for travelers."},
    @{icon="umbrella"; title="Umbrella/Sunshade"; desc="We offer custom and tailor-made umbrellas and sun caps. There are golf umbrellas, transparent umbrellas, and folding umbrellas."}
)
Write-HtmlFile -FilePath "d:\chinabuyingteam\products-outdoors.html" -Content $html

# ============================================================
# PAGE 19: Jewelry
# ============================================================
$html = New-Page -Canonical "https://chinabuyingteam.com/products-jewelry.html" -Title "Jewelry Sourcing �� abnerchinasourcing | Gold, Silver, Stainless Steel, Pearl & Gemstone" -Description "Source gold plated, stainless steel, copper, pearl, silver, and gemstone jewelry from China. Custom designs available." -Keywords "jewelry sourcing China, fashion jewelry, gold plated jewelry, silver jewelry, gemstone jewelry" -CategoryName "Jewelry &amp; Accessories" -ShortDesc "Source gold plated, stainless steel, copper, pearl, silver, and gemstone jewelry from China. Custom designs available." -BreadcrumbName "Jewelry" -CtaName "Jewelry &amp; Accessories" -SubCategories @(
    @{icon="ring"; title="Gold Plated Jewelry"; desc="Cheap base metals plated with 14k or 18k gold are trending due to their low-cost and elegant appearance. Commonly-used base metals are stainless steel, silver, copper, and brass."},
    @{icon="gem"; title="Stainless Steel Jewelry"; desc="Stainless steel jewelry is tarnish-resistant, durable, and unisex. 304 and 316L stainless steel are the most commonly used."},
    @{icon="bolt"; title="Copper Jewelry"; desc="Compared to gold or silver jewelry, copper jewelry has a vintage style. Copper is soft and durable. Copper alloys like brass and bronze are also popular."},
    @{icon="droplet"; title="Pearl Jewelry"; desc="Pearls are popular elements for fashion jewelry. Freshwater and baroque pearl jewelry matched with gold plating or stainless steel elements are especially favored."},
    @{icon="star-of-david"; title="Silver Jewelry"; desc="Sterling silver jewelry in the market is usually made of 925 silver. It looks high-graded and is affordable for consumers."},
    @{icon="gem"; title="Gemstone Jewelry"; desc="K-gold jewelry inlaid with various gemstones and zircon is suitable for many occasions. Different gem-setting crafts can make different styles."}
)
Write-HtmlFile -FilePath "d:\chinabuyingteam\products-jewelry.html" -Content $html

# ============================================================
# PAGE 20: Lighting
# ============================================================
$html = New-Page -Canonical "https://chinabuyingteam.com/products-lighting.html" -Title "Lighting Sourcing �� abnerchinasourcing | Indoor, Outdoor, Decorative & Smart Lighting" -Description "Source indoor lighting, decorative lights, special lighting, outdoor lighting, candles, and smart lighting from China. LED and energy-saving." -Keywords "lighting sourcing China, LED lighting, decorative lights, smart lighting, candle wholesale" -CategoryName "Lights &amp; Lighting" -ShortDesc "Source indoor lighting, decorative lights, special lighting, outdoor lighting, candles, and smart lighting from China. LED and energy-saving." -BreadcrumbName "Lighting" -CtaName "Lights &amp; Lighting" -SubCategories @(
    @{icon="lightbulb"; title="Indoor Lighting"; desc="Lighting is one of the most important elements of your home's design. Indoor lighting comes in different forms like ceiling lighting, wall sconces, pendants, etc."},
    @{icon="star"; title="Decorative Lights"; desc="Besides brightening functions, decorative lights are usually designed in changeable colors and styles. Festival lights are popular during the holiday season."},
    @{icon="microscope"; title="Special Lighting"; desc="We provide some special lighting equipment like UV sterilization lamps, grow lights for cultivation, etc. Different from traditional LED bulbs, they have specific functions."},
    @{icon="tree"; title="Outdoor Lighting"; desc="Outdoor lighting includes wall wash lights, lawn lights, garden lights, floodlights, underwater lights, street lights, etc. These should be waterproof and dustproof."},
    @{icon="fire-flame-simple"; title="Candle"; desc="Scented candles are niche products with low production costs and high profits. Popular ones include jar candles and special-shaped candles. Custom packaging is a good marketing strategy."},
    @{icon="mobile-screen"; title="Smart Lighting"; desc="Smart lighting devices connect to the internet, enabling consumers to save energy and control lighting remotely or by voice. They have higher material requirements."}
)
Write-HtmlFile -FilePath "d:\chinabuyingteam\products-lighting.html" -Content $html

Write-Host "All 20 files created successfully!"