# Generated from g5k-checks-0.4.14.gem by gem2rpm -*- rpm-spec -*-
%global gemname g5k-checks

%global gemdir %(ruby -rubygems -e 'puts Gem::dir' 2>/dev/null)
%global geminstdir %{gemdir}/gems/%{gemname}-%{version}

Summary: Hardware verification tool for Grid'5000
Name: rubygem-%{gemname}
Version: 0.4.14
Release: 1%{?dist}
Group: Development/Languages
License: CeCILL-B
URL: https://github.com/grid5000/g5k-checks
Source0: %{gemname}-%{version}.gem
Requires: ruby(release)
Requires: ruby(rubygems)
Requires: rubygem(ohai)
Requires: rubygem(popen4)
Requires: rubygem(rest-client)
Requires: rubygem(rspec)
BuildRequires: ruby(release)
BuildRequires: ruby(rubygems)
BuildRequires: ruby
BuildArch: noarch
Provides: rubygem(%{gemname}) = %{version}

%description
g5k-checks verifies that a node is matching its Grid'5000 Reference API
description.


%package doc
Summary: Documentation for %{name}
Group: Documentation
Requires: %{name} = %{version}-%{release}
BuildArch: noarch

%description doc
Documentation for %{name}


%prep
%setup -q -c -T
mkdir -p .%{gemdir}
gem install --local --install-dir .%{gemdir} \
            --bindir .%{_bindir} \
            --force %{SOURCE0}

%build

%install
mkdir -p %{buildroot}%{gemdir}
cp -pa .%{gemdir}/* \
        %{buildroot}%{gemdir}/

mkdir -p %{buildroot}%{_bindir}
cp -pa .%{_bindir}/* \
        %{buildroot}%{_bindir}/

find %{buildroot}%{geminstdir}/bin -type f | xargs chmod a+x

install -p -D -m 644 %{buildroot}%{geminstdir}/conf/g5k-checks.conf %{buildroot}%{_sysconfdir}/g5k-checks.conf

%files
%dir %{geminstdir}
%{_bindir}/g5k-checks
%{_sysconfdir}/g5k-checks.conf
%{geminstdir}/bin
%{geminstdir}/conf
%{geminstdir}/lib
%exclude %{gemdir}/cache/%{gemname}-%{version}.gem
%{gemdir}/specifications/%{gemname}-%{version}.gemspec

%files doc
%doc %{gemdir}/doc/%{gemname}-%{version}


%changelog
* Fri Feb 27 2015 Chameleon Cloud User <cc@apigen-91a258b9-5ee9-4e88-900a-2a74ed21e69b> - 0.4.14-1
- Initial package
