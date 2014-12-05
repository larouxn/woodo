# Get location for alias creation
print "Which bash file do you use? Leave blank for bash_profile. "
location = "~/." + $stdin.gets.chomp
if location == "~/."
  location += "bash_profile"
end

# Check for user agreement
puts "Press RETURN to install woodo, CTRL+C to cancel"
$stdin.gets

# Move woodo.sh to a hidden file in user's home directory
`cp woodo ~/.woodo.sh`

# Open bash file, specified by user and append aliases
bash_file = File.open(File.expand_path(location), 'a')
bash_file.write("\n" + "alias sudo='sudo '" + "\n" + "alias woodo='sh ~/.woodo.sh'" + "\n")
bash_file.close

# Closing messages
puts "Installation complete."
puts "Open a new terminal to use 'woodo' and 'sudo woodo' commands."
