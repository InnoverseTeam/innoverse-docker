#!/usr/bin/env ruby

require 'open3'

def install_certbot
  puts "Mise à jour des paquets..."
  system("sudo apt update")

  puts "Installation de Certbot..."
  system("sudo apt install -y certbot python3-certbot-nginx") # Pour Nginx
  # system("sudo apt install -y certbot python3-certbot-apache") # Pour Apache
end

def create_ssl_cert(domain, email)
  puts "Création du certificat SSL pour #{domain}..."
  cmd = "sudo certbot --nginx -d #{domain} --non-interactive --agree-tos --email #{email}"
  stdout, stderr, status = Open3.capture3(cmd)

  if status.success?
    puts stdout
  else
    puts "Erreur lors de la création du certificat SSL : #{stderr}"
    exit 1
  end

  puts "Configuration du renouvellement automatique du certificat..."
  system("sudo systemctl enable certbot.timer")
  system("sudo systemctl start certbot.timer")
end

if ARGV.length != 2
  puts "Usage: ruby create_ssl_cert.rb <votre_domaine> <votre_email>"
  exit 1
end

domain = ARGV[0]
email = ARGV[1]

install_certbot
create_ssl_cert(domain, email)

puts "Certificat SSL créé pour #{domain} !"
