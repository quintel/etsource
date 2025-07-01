def encrypt_balance(directory)
  if File.exist?('.password')
    password = File.read('.password').strip
  else
    puts "File .password not found in root. Cannot encrypt energy balance CSV"
    exit(1)
  end

  csv  = directory.join('energy_balance.csv')
  dest = directory.join('energy_balance.gpg')

  if csv.file?
    dest = csv.dirname.join('energy_balance.gpg')
    system("gpg --batch --yes --passphrase '#{ password }' -c --output '#{ dest }' '#{ csv }'")
    puts "  - Encrypted energy balance"
  end
end

