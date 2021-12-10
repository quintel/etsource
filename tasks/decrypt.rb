desc <<-DESC
  Decrypts the energy balance for every area.
DESC
task decrypt: :environment do
  passphrase = ENV['ETSOURCE_KEY']
  passphrase = File.read('.password').strip if passphrase.nil? && File.exists?('.password')

  if passphrase.nil?
    puts "ERROR: File .password not found in current directory!"
    exit(1)
  end

  puts "Start Decrypting..."

  Dir.glob("#{ Atlas.data_dir }/datasets/*").each do |area|
    if File.exists?("#{ area }/energy_balance.gpg")
      puts "* #{ area }"
      cmd = "gpg --batch --yes --no-use-agent --passphrase '#{passphrase}'" +
            " --output #{area}/energy_balance.csv --decrypt #{area}/energy_balance.gpg"
      puts `#{cmd}`
    end
  end

  puts "Done!"
end

