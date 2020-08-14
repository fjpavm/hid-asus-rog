%if %{defined fedora}
%global debug_package %{nil}
%endif

%define modname	hid-asus-rog

Name:           dkms-%{modname}
Version:        0.1.0
Release:        0
Summary:        Asus N-Key device driver
License:        GPL-2.0
Group:          System Environment/Kernel
URL:            https://gitlab.com/asus-linux/hid-asus-rog
Source:         https://gitlab.com/asus-linux/hid-asus-rog/-/archive/%version/%{modname}-%{version}.tar.gz
Requires:       binutils
Requires:       gcc
Requires:       make
Requires:       dkms
BuildRequires:  kernel-devel
BuildArch:      noarch

%description
Asus N-Key device driver

%prep
%setup -q -n %{modname}-%{version}

%build

%install
rm -rf %{buildroot}

install -d -m 755 %{buildroot}/usr/src/%{modname}-%{version}-%{release}/src
install -m 644 Makefile %{buildroot}/usr/src/%{modname}-%{version}-%{release}/Makefile
install -m 644 src/hid-asus-rog.c %{buildroot}/usr/src/%{modname}-%{version}-%{release}/src/hid-asus-rog.c
install -m 644 src/hid-ids.h %{buildroot}/usr/src/%{modname}-%{version}-%{release}/src/hid-ids.h

#
cat > %{buildroot}/usr/src/%{modname}-%{version}-%{release}/dkms.conf << EOF
PACKAGE_NAME=%{modname}
PACKAGE_VERSION=%{version}-%{release}
MAKE[0]="make KVERSION=\$kernelver"
DEST_MODULE_LOCATION[0]="/updates/"
BUILT_MODULE_LOCATION[0]="src/"
BUILT_MODULE_NAME[0]=%{modname}
AUTOINSTALL="yes"
NO_WEAK_MODULES="yes"
EOF
#
install -d -m 755 %{buildroot}/etc/modprobe.d
echo "blacklist hid-asus" > %{buildroot}%{_sysconfdir}/modprobe.d/asus-rog.conf

%files
%dir /etc/modprobe.d
%dir /usr/src/%{modname}-%{version}-%{release}
/usr/src/%{modname}-%{version}-%{release}/*
%{_sysconfdir}/modprobe.d/asus-rog.conf

%changelog
