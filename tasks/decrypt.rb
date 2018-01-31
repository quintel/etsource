desc <<-DESC
  Decrypts the energy balance for every area.
DESC
task decrypt: :environment do
  if File.exists?('.password')
    puts "Using password that is stored in .password..."
    puts "Start Decrypting..."
    Dir.glob("#{ Atlas.data_dir }/datasets/*").each do |area|
      if File.exists?("#{ area }/energy_balance.gpg")
        puts "* #{ area }"
        cmd = "gpg --batch --yes --no-use-agent --passphrase-file .password" +
              " --output #{ area }/energy_balance.csv --decrypt #{ area }/energy_balance.gpg"
        puts `#{ cmd }`
      end
    end
    puts "Done!"
  else
    puts "ERROR: File .password not found in current directory!"
  end
end

