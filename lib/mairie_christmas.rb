require 'nokogiri'
require 'open-uri'
require 'csv'

# 1. Récupérer les URLs des mairies du Val d'Oise
def get_townhall_urls
  url = 'https://lannuaire.service-public.fr/navigation/ile-de-france/val-d-oise/mairie'
  html = URI.open(url, 'User-Agent' => 'Mozilla/5.0').read
  doc = Nokogiri::HTML(html)

  townhall_urls = []

  # On cible les liens des mairies dans la page
  doc.css('a.fr-link[data-test="href-link-annuaire"]').each do |link|
    href = link['href']
    if href.include?('/ile-de-france/val-d-oise/')
      name = link.text.strip
      townhall_urls << { name: name, url: href }
    end
  end

  townhall_urls
end

# 2. Récupérer l'email d'une mairie via son URL
def get_townhall_email(townhall_url)
  begin
    html = URI.open(townhall_url, 'User-Agent' => 'Mozilla/5.0').read
    doc = Nokogiri::HTML(html)

    # L'email est dans un lien mailto: avec class 'send-mail'
    email_link = doc.at_css('a.send-mail')
    if email_link
      email_link.text.strip
    else
      'Email non trouvé'
    end
  rescue
    'Erreur lors de la récupération'
  end
end

# 3. Récupérer toutes les mairies avec leur email
def scrape_all_emails
  townhalls = get_townhall_urls
  results = []

  townhalls.each do |townhall|
    email = get_townhall_email(townhall[:url])
    puts "#{townhall[:name]} => #{email}"
    results << { townhall[:name] => email }
  end

  results
end

# 4. Écrire le résultat dans un fichier CSV
def write_results_to_csv(results, filename = 'mairies_valdoise.csv')
  CSV.open(filename, 'w', col_sep: ';') do |csv|
    csv << ['Ville', 'Email']
    results.each do |hash|
      hash.each do |ville, email|
        csv << [ville, email]
      end
    end
  end
  puts "✅ Résultats écrits dans #{filename}"
end

# 5. Exécution complète
results = scrape_all_emails
write_results_to_csv(results)