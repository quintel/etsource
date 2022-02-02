desc <<-DESC
  Decrypts the energy balance for every area.
DESC
task decrypt: :environment do
  puts '+-----------------------------------------------------------------+'
  puts '| MANUAL DECRYPTION IS NO LONGER NEEDED                           |'
  puts '| - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |'
  puts '| The latest versions of ETEngine and ETLocal master branches do  |'
  puts '| not require manual decryption of energy balance files. Atlas    |'
  puts '| will perform the decryption on-demand, whenever an application  |'
  puts '| wants to read the file.                                         |'
  puts '|                                                                 |'
  puts '| You only need to decrypt manually if you want to run an old     |'
  puts '| application or branch.                                          |'
  puts '+-----------------------------------------------------------------+'
  puts
  print 'Do you with to decrypt the balances anyway? (y/N): '

  if $stdin.gets.strip.downcase != 'y'
    puts '=> Exiting without decrypting.'
    exit
  end

  passphrase = ENV['ETSOURCE_KEY'] || ENV['ETSOURCE_PASSWORD']
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

