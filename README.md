1. Make a new repo named multi-machine-env
2. ``cd`` into ``tests``
3. ``rake spec``
4. Should get 4 failures
5. Change your Vagrantfile so that the db config is added
    - ``config.vm.define`` is the method call that defines multiple machines within the same project Vagrantfile
    - This creates a vagrant configuration within a configuration
6. Vagrantfile should look like this:
    - ``config.vm.define "app" do |app|``
          ``app.vm.box = "ubuntu/xenial64"``
          ``app.vm.network "private_network", ip: "192.168.10.100"``
          ``app.hostsupdater.aliases = ["development.local"]``
          ``app.vm.synced_folder "app", "/home/ubuntu/app"``
          ``app.vm.provision "shell", path: "environment/app/provision.sh", privileged: false``
      ``end``
    - ``config.vm.define "db" do |db|``
          ``db.vm.box = "ubuntu/xenial64"``
          ``db.vm.network "private_network", ip: "192.168.10.100"``
          ``db.hostsupdater.aliases = ["database.local"]``
          ``db.vm.synced_folder "environment/db", "/home/ubuntu/environment/"``
          ``db.vm.provision "shell", path: "environment/db/provision.sh", privileged: false``
      ``end``
7. Add (copy) the provision.sh files for both the app and db
8. Add (copy) in the mongod.conf file
9. Run ``rake spec``, tests should all be passing
10. ``cd..`` back into ``multi-machine-env``
11. Run the command ``vagrant ssh app``, this allows you to go inside the vm
12. Locate the ``app`` file
13. Run ``npm install`` and ``npm start``
14. Go onto Google Chrome and type in ``develpment.local:3000`` into the search bar
  - You should be notified that "The app is running correctly"
