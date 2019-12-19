
# Retrive a key to download off the machine
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927

# Creating a list file for MongoDB
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

sudo apt-get update -y
sudo apt-get upgrade -y

# Specifying specific version
sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20

# Removes original config file
sudo rm /etc/mongod.conf

# Updates it with the system path to the vm
  # The in makes the links between files
  # -s overwrites the suffix file
sudo ln -s /home/ubuntu/environment/mongod.conf /etc/mongod.conf

# Updates changes made
sudo systemctl restart mongod
sudo systemctl enable mongod
