# g5k-checks



## Dependencies
- rake
- ruby-rspec
- ntp
- nfs-common
- ruby-rest-client
- ruby-json
- ohai
- ruby-systemu
- fio

## Build as a debian package

## Dependencies

- dpkg-dev_1.16.1.2ubuntu7_all

### Prepare the package

```
# git clone https://github.com/ChameleonCloud/g5k-checks.git
git clone https://github.com/badock/g5k-checks.git

sudo apt-get install -y rake ruby-rspec ntp nfs-common ruby-rest-client ruby-json ohai ruby-systemu fio
sudo apt-get -f install
```

### Build the package

Follow the instructions:

```

PACKAGE_PATH=$(dpkg-buildpackage | grep "dpkg-deb: building package" | sed 's/.*in..//g' | sed "s/'.*//g");
if [ "$PACKAGE_PATH" == "" ]; then
	echo "Could not create the g5k-checks deb package"
	exit 1
fi

```
