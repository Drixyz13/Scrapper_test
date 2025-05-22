# Scrapper_test
# Scrapping Projects - Val d’Oise Mairies & Crypto Prices

## 📝 Description

Ce projet contient deux scripts Ruby qui réalisent du scraping web :

1. **Mairie Christmas (mairies du Val d’Oise)**  
   - Récupère les URLs des pages des mairies du Val d’Oise depuis l’annuaire officiel.  
   - Scrape les adresses e-mails de chaque mairie.  
   - Stocke les résultats dans un fichier CSV (`mairies_valdoise.csv`).  
   - Résultat sous forme d’un array de hashes `{ "ville" => "email" }`.

2. **Dark Trader (Crypto Scraper)**  
   - Récupère les 100 premières cryptomonnaies sur CoinMarketCap.  
   - Extrait le symbole et le prix de chaque crypto.  
   - Affiche les résultats dans la console et retourne un array de hashes `{ "symbole" => prix }`.

---

## 📂 Structure

/lib
dark_trader.rb # Script de scraping crypto
mairie_christmas.rb # Script de scraping mairies
/spec
coinmarketcap_scraper_spec.rb # Tests RSpec crypto
mairie_christmas_spec.rb # Tests RSpec mairies
spec_helper.rb # Configuration RSpec
mairies_valdoise.csv # Résultats scraping mairies
README.md # Ce fichier
Gemfile # Gems nécessaires
Gemfile.lock # Lock des gems

yaml
Copier

---

## 🚀 Installation & utilisation

1. Cloner le repo :

```bash
git clone https://github.com/Drixyz13/Scrapper_test.git
cd Scrapper_test
Installer les gems :

bash
Copier
bundle install
Lancer le script Mairie Christmas :

bash
Copier
ruby lib/mairie_christmas.rb
Lancer le script Dark Trader (crypto) :

bash
Copier
ruby lib/dark_trader.rb
Lancer les tests unitaires :

bash
Copier
bundle exec rspec
🛠️ Technologies
Ruby 3.4

Nokogiri (parsing HTML)

Open-URI (récupération pages web)

CSV (export des données)

RSpec (tests unitaires)

Auteur
Matt (Drixyz13)