# FaceDangerBot

## Setup

You can run this project with [Vagrant](https://www.vagrantup.com/) and
[Ansible 2.0.0](https://docs.ansible.com/ansible/) or higher.

To start, get the source on your machine:

```bash
git clone git@github.com:Boltmade/face-danger-bot.git
cd face-danger-bot
```

Next, you need to setup your environment:

```bash
cp .env.dist .env
```

Modify your `.env` appropriately for your setup. Any time you modify this file, you will need to
restart your application for the changes to take effect.

Once you've installed Vagrant and Ansible:

```bash
vagrant up
```

After that, any commands need to be run within the virtual machine via `vagrant ssh`. You can halt
the machine via `vagrant halt` when you're done working.

## Running

```bash
vagrant ssh
bundle exec rails s -b 0.0.0.0
```
