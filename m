From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Futex problems with firebird3.0 and openjdk-8 on m68k
Date: Sat, 20 May 2017 16:53:30 +1000 (AEST)
Message-ID: <alpine.LNX.2.00.1705201604460.2137@nippy.intranet>
References: <1628e911-c94f-2cdd-6c48-5a54829a032f@physik.fu-berlin.de> <Pine.BSM.4.64L.1705102120080.22216@herc.mirbsd.org> <3adce84b-790a-9e6f-724d-d8e873632aef@physik.fu-berlin.de> <alpine.LNX.2.00.1705111246370.21370@nippy.intranet>
 <57267999-aa42-3478-9527-8d3c6fcba004@physik.fu-berlin.de> <alpine.LNX.2.00.1705111610410.23897@nippy.intranet> <97dd75af-d1da-5cb6-ef73-e1f968be3d61@physik.fu-berlin.de> <20170511082001.GA10826@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:38604 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753067AbdETGxl (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 20 May 2017 02:53:41 -0400
In-Reply-To: <20170511082001.GA10826@physik.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Thorsten Glaser <tg@mirbsd.de>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Thu, 11 May 2017, John Paul Adrian Glaubitz wrote:

> On Thu, May 11, 2017 at 08:38:42AM +0200, John Paul Adrian Glaubitz 
> wrote:
> > Mmh, it doesn't work at the moment because I uploaded a patched glibc 
> > package to "unreleased" and debootstrap doesn't support that. You need 
> > a patched version of debootstrap to make this work.
> 
> FWIW, you can just download this older chroot I created in 2015 [1], 
> unpack it, copy qemu-m68k-static into the usr/bin sub-directory and 
> perform a dist-upgrade.
> 

OK.

I'm using Laurent's QEMU in Quadra 800 system mode (not user mode) which 
is a bit inefficient. But it performs well and it will exercise kernel 
code which is of interest to me.

> Use this updated sources.list [2], the old one doesn't work anymore.
> 

Done.

> Btw, if you build firebird3.0 in this chroot without updating the glibc, 
> the problem will actually go away.

OK, I will try that too. But first I will try to reproduce the bug.

What's the quickest way to reproduce the build failure for the firebird3.0 
deb?

> However, since there are a lot of other packages tied to the version of 
> glibc, especially Perl, I cannot rule out it's not some other package 
> causing the issue.
> 

The dist-upgrade finished without any problems. Thanks!

root@panmac:~# dpkg-query -W
acl     2.2.52-3
adduser 3.115
apt     1.4.4
apt-utils       1.4.4
aptitude        0.8.7-1
aptitude-common 0.8.7-1
base-files      9.9
base-passwd     3.5.43
bash    4.4-5
bsd-mailx       8.1.2-0.20160123cvs-4
bsdmainutils    9.0.12+nmu1
bsdutils        1:2.29.2-1
coreutils       8.26-3
cpio    2.11+dfsg-6
cron    3.0pl1-128
dash    0.5.8-2.4
debconf 1.5.60
debconf-i18n    1.5.60
debian-archive-keyring  2014.3
debianutils     4.8.1.1
delo    0.8-2.6
diffutils       1:3.5-3
dirmngr 2.1.18-8
dmsetup 2:1.02.137-2
dpkg    1.18.24
e2fslibs:m68k   1.43.4-2
e2fsprogs       1.43.4-2
exim4-base      4.89-2
exim4-config    4.89-2
exim4-daemon-light      4.89-2
findutils       4.6.0+git+20161106-2
gcc-4.7-base:m68k       4.7.4-3
gcc-4.8-base:m68k       4.8.4-1
gcc-4.9-base:m68k       4.9.2-10
gcc-6-base:m68k 6.3.0-18
gnupg   2.1.18-8
gnupg-agent     2.1.18-8
gnupg-l10n      2.1.18-8
gpgv    2.1.18-8
grep    2.27-2
groff-base      1.22.3-9
gzip    1.6-5
hostname        3.18
ifupdown        0.8.19
init    1.48
init-system-helpers     1.48
initscripts     2.88dsf-59.9
insserv 1.14.0-5.4
iproute2        4.9.0-1
iptables        1.6.0+snapshot20161117-6
iputils-ping    3:20161105-1
isc-dhcp-client 4.3.5-3
isc-dhcp-common 4.3.5-3
kmod    24-1
less    481-2.1
libacl1:m68k    2.2.52-3
libapparmor1:m68k       2.11.0-3
libapt-inst1.5:m68k     1.0.9.7
libapt-inst2.0:m68k     1.4.4
libapt-pkg4.12:m68k     1.0.9.7
libapt-pkg5.0:m68k      1.4.4
libassuan0:m68k 2.4.3-2
libattr1:m68k   1:2.4.47-2
libaudit-common 1:2.6.7-2
libaudit1:m68k  1:2.6.7-2
libblkid1:m68k  2.29.2-1
libboost-filesystem1.62.0:m68k  1.62.0+dfsg-4
libboost-iostreams1.49.0        1.49.0-4+b1
libboost-iostreams1.62.0:m68k   1.62.0+dfsg-4
libboost-system1.62.0:m68k      1.62.0+dfsg-4
libbsd0:m68k    0.8.3-1
libbz2-1.0:m68k 1.0.6-8.1
libc-bin        2.24-10+m68k
libc6:m68k      2.24-10+m68k
libcap-ng0:m68k 0.7.7-3
libcap2:m68k    1:2.25-1
libcap2-bin     1:2.25-1
libcomerr2:m68k 1.43.4-2
libcryptsetup4:m68k     2:1.7.3-4
libcwidget3:m68k        0.5.17-2
libcwidget3v5:m68k      0.5.17-4+b1
libdb5.3:m68k   5.3.28-12+b1
libdebconfclient0:m68k  0.227
libdevmapper1.02.1:m68k 2:1.02.137-2
libdns-export100        1:9.9.5.dfsg-9
libdns-export162        1:9.10.3.dfsg.P4-12.3
libelf1:m68k    0.168-0.2
libestr0        0.1.10-2
libfastjson4:m68k       0.99.4-1
libfdisk1:m68k  2.29.2-1
libffi6:m68k    3.2.1-6
libgcc2:m68k    1:6.3.0-18
libgcrypt20:m68k        1.7.6-1
libgdbm3:m68k   1.8.3-14
libgmp10:m68k   2:6.1.2+dfsg-1
libgnutls-deb0-28:m68k  3.3.8-2
libgnutls-openssl27:m68k        3.5.8-5
libgnutls30:m68k        3.5.8-5
libgpg-error0:m68k      1.26-2
libgpm2:m68k    1.20.4-6.2
libhogweed2:m68k        2.7.1-5
libhogweed4:m68k        3.3-1
libicu52:m68k   52.1-4
libidn11:m68k   1.33-1
libidn2-0:m68k  0.16-1
libip4tc0:m68k  1.6.0+snapshot20161117-6
libip6tc0:m68k  1.6.0+snapshot20161117-6
libiptc0:m68k   1.6.0+snapshot20161117-6
libirs-export91 1:9.9.5.dfsg-9
libisc-export160        1:9.10.3.dfsg.P4-12.3
libisc-export95 1:9.9.5.dfsg-9
libisccfg-export90      1:9.9.5.dfsg-9
libjson-c2:m68k 0.11-4
libkmod2:m68k   24-1
libksba8:m68k   1.3.5-2
libldap-2.4-2:m68k      2.4.44+dfsg-4+b1
libldap-common  2.4.44+dfsg-4
liblocale-gettext-perl  1.07-3+b1
liblockfile-bin 1.14-1
liblockfile1:m68k       1.14-1
liblogging-stdlog0:m68k 1.0.6-1
liblognorm1:m68k        1.0.1-3
liblognorm5:m68k        2.0.1-1.1
liblz4-1:m68k   0.0~r131-2
liblzma5:m68k   5.2.2-1.2
libmnl0:m68k    1.0.4-2
libmount1:m68k  2.29.2-1
libncurses5:m68k        6.0+20161126-1
libncursesw5:m68k       6.0+20161126-1
libnetfilter-acct1:m68k 1.0.2-1.1
libnetfilter-conntrack3:m68k    1.0.6-2
libnettle4:m68k 2.7.1-5
libnettle6:m68k 3.3-1
libnewt0.52:m68k        0.52.20-1
libnfnetlink0:m68k      1.0.1-3
libnpth0:m68k   1.3-1
libp11-kit0:m68k        0.23.3-5
libpam-modules:m68k     1.1.8-3.5
libpam-modules-bin      1.1.8-3.5
libpam-runtime  1.1.8-3.5
libpam0g:m68k   1.1.8-3.5
libpcre3:m68k   2:8.39-3
libpipeline1:m68k       1.4.1-2
libpopt0:m68k   1.16-10+b2
libprocps3:m68k 2:3.3.9-8
libprocps6:m68k 2:3.3.12-3
libpsl0:m68k    0.5.1-1
libpsl5:m68k    0.17.0-4
libreadline6:m68k       6.3-9
libreadline7:m68k       7.0-3
libsasl2-2:m68k 2.1.27~101-g0780600+dfsg-3
libsasl2-modules:m68k   2.1.27~101-g0780600+dfsg-3
libsasl2-modules-db:m68k        2.1.27~101-g0780600+dfsg-3
libselinux1:m68k        2.6-3
libsemanage-common      2.6-2
libsemanage1:m68k       2.6-2
libsepol1:m68k  2.6-2
libsigc++-2.0-0c2a:m68k 2.4.0-1
libsigc++-2.0-0v5:m68k  2.10.0-1
libslang2:m68k  2.3.1-5
libsmartcols1:m68k      2.29.2-1
libsqlite3-0:m68k       3.16.2-3
libss2:m68k     1.43.4-2
libssl1.0.0:m68k        1.0.1k-1
libssl1.0.2:m68k        1.0.2k-1
libssl1.1:m68k  1.1.0e-2
libstdc++6:m68k 6.3.0-18
libsystemd0:m68k        232-23
libtasn1-6:m68k 4.10-1
libtext-charwidth-perl  0.04-7+b5
libtext-iconv-perl      1.7-5+b5
libtext-wrapi18n-perl   0.06-7.1
libtinfo5:m68k  6.0+20161126-1
libudev0:m68k   175-7.2
libudev1:m68k   232-23
libunistring0:m68k      0.9.6+really0.9.3-0.1
libusb-0.1-4:m68k       2:0.1.12-31
libustr-1.0-1:m68k      1.0.4-6
libuuid1:m68k   2.29.2-1
libxapian22     1.2.18-1
libxapian30:m68k        1.4.3-2
libxtables10    1.4.21-2
libxtables12:m68k       1.6.0+snapshot20161117-6
login   1:4.4-4
logrotate       3.11.0-0.1
lsb-base        9.20161125
mac-fdisk       0.1-16+b1
man-db  2.7.6.1-2
manpages        4.10-2
mawk    1.3.3-17
mount   2.29.2-1
multiarch-support       2.24-10+m68k
nano    2.7.4-1
ncurses-base    6.0+20161126-1
ncurses-bin     6.0+20161126-1
net-tools       1.60+git20161116.90da8a0-1
netbase 5.4
netcat-traditional      1.10-41.1
nfacct  1.0.1-1.1
passwd  1:4.4-4
perl-base       5.24.1-2
pinentry-curses 1.0.0-2
procps  2:3.3.12-3
psmisc  22.21-2.1
publicsuffix    20170424.0717-1
readline-common 7.0-3
rsyslog 8.24.0-1
sed     4.4-1
sensible-utils  0.0.9
startpar        0.59-3.1
systemd 232-23
systemd-sysv    232-23
sysv-rc 2.88dsf-59.9
sysvinit-utils  2.88dsf-59.9
tar     1.29b-1.1
tasksel 3.39
tasksel-data    3.39
traceroute      1:2.1.0-2
tzdata  2017b-1
udev    232-23
util-linux      2.29.2-1
vim     2:8.0.0197-4
vim-common      2:8.0.0197-4
vim-runtime     2:8.0.0197-4
vim-tiny        2:8.0.0197-4
wget    1.19.1-3
whiptail        0.52.20-1
xxd     2:8.0.0197-4
zlib1g:m68k     1:1.2.8.dfsg-5

-- 

> Adrian
> 
> > [1] https://people.debian.org/~glaubitz/chroots/unstable-m68k-20150315.tar.gz
> > [2] https://people.debian.org/~glaubitz/sources.list
> 
> 
