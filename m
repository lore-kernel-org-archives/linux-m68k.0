From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Add private syscalls to support NPTL
Date: Wed, 11 Nov 2009 03:11:19 +1100 (EST)
Message-ID: <alpine.OSX.2.00.0911110231050.908@silk.local>
References: <4A89D037.7090807@codesourcery.com> <m27hx2um3t.fsf@igel.home>  <4A8A54F9.3080100@codesourcery.com> <m3d46tpmue.fsf@hase.home>  <4A8A6CA2.4040806@codesourcery.com> <10f740e80908180222p4d95b19bp3069e037a6bc590e@mail.gmail.com> <4A91A4C8.5040803@codesourcery.com>
 <4A943ECC.80607@codesourcery.com> <4A97B69F.4000306@codesourcery.com> <4AC5CF12.8000200@codesourcery.com> <4AE5B9B7.7000106@codesourcery.com> <alpine.OSX.2.00.0910281209160.394@silk.local> <4AE7EAC2.8050409@codesourcery.com> <alpine.OSX.2.00.0911052033380.497@silk.local>
 <4AF3E55D.8060603@codesourcery.com> <alpine.OSX.2.00.0911101451040.369@silk.local> <4AF94594.4060708@codesourcery.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:36629 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756736AbZKJQLL (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 10 Nov 2009 11:11:11 -0500
In-Reply-To: <4AF94594.4060708@codesourcery.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Maxim Kuvyrkov <maxim@codesourcery.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>, linux-m68k@vger.kernel.org, debian-68k@lists.debian.org



On Tue, 10 Nov 2009, Maxim Kuvyrkov wrote:

> Finn Thain wrote:
>
> > 
> > Do you think my patch is a reasonable solution? I don't understand it, I
> > just copied it from x86 -- "monkey see, monkey do."
> 
> I can't spot anything wrong in it.

Thanks for looking it over. I'll send it upstream.

> > 
> > I used the eglibc-2.10/EGLIBC.cross-building script to test this. I 
> > configured eglibc with "--enable-add-ons=ports,nptl" to prevent 
> > localedef from breaking the configure step. Package versions were 
> > binutils-2.19.51, gcc-4.4.1 (patched), linux-2.6.31 (patched), eglibc 
> > 2_10 branch (patched).
> 
> What hardware / emulator do you use to test the result?  I tested all 
> the work on ColdFire systems, but I also would like to run some tests on 
> a usual m68k.

I've been testing on 68040 machines. I've not yet tried the test suites.

The latest random test I did was to build the cross toolchain using 
patched debian sid source packages. Then I copied sshd and its supporting 
libraries etc from an etch-m68k system into the toolchain sysroot, along 
with a few old busybox bits and pieces that I had lying around. I then 
exported the sysroot with NFS and booted that. After some messing around I 
was able to log in with ssh and gather the info below.

So far, so good!

Finn


# cat /proc/cpuinfo 
CPU:            68040
MMU:            68040
FPU:            68040
Clocking:       24.6MHz
BogoMips:       16.43
Calibration:    82176 loops
# cat /proc/version
Linux version 2.6.31.5-mac (fthain@nippy) (gcc version 4.4.1 (GCC) ) #2 Wed Nov 11 00:52:38 EST 2009
# /lib/libc.so.6 
GNU C Library (EGLIBC) stable release version 2.10.1, by Roland McGrath et al.
Copyright (C) 2009 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.
Compiled by GNU CC version 4.4.1.
Compiled on a Linux >>2.6.31.5<< system on 2009-11-10.
Available extensions:
        crypt add-on version 2.1 by Michael Glad and others
        GNU Libidn by Simon Josefsson
        Native POSIX Threads Library by Ulrich Drepper et al
        Support for some architectures added on, not maintained in glibc core.
        BIND-8.2.3-T5B
For bug reporting instructions, please see:
<http://www.eglibc.org/issues/>.
# cat /proc/649/maps
80000000-80047000 r-xp 00000000 00:0c 84898      /etch-m68k-root/usr/sbin/sshd
80048000-80049000 rw-p 00046000 00:0c 84898      /etch-m68k-root/usr/sbin/sshd
80049000-8006f000 rwxp 00000000 00:00 0          [heap]
c0000000-c0018000 r-xp 00000000 00:0c 115132     /lib/ld-2.10.1.so
c0018000-c0019000 rw-p 00000000 00:00 0 
c0019000-c001a000 r--p 00019000 00:0c 115132     /lib/ld-2.10.1.so
c001a000-c001b000 rw-p 0001a000 00:0c 115132     /lib/ld-2.10.1.so
c001b000-c0022000 r-xp 00000000 00:0c 442806     /usr/local/lib/libwrap.so.0.7.6
c0022000-c0023000 ---p 00007000 00:0c 442806     /usr/local/lib/libwrap.so.0.7.6
c0023000-c0024000 rw-p 00006000 00:0c 442806     /usr/local/lib/libwrap.so.0.7.6
c0024000-c0025000 rw-p 00000000 00:00 0 
c0025000-c002c000 r-xp 00000000 00:0c 442808     /usr/local/lib/libpam.so.0.79
c002c000-c002d000 ---p 00007000 00:0c 442808     /usr/local/lib/libpam.so.0.79
c002d000-c002f000 rw-p 00006000 00:0c 442808     /usr/local/lib/libpam.so.0.79
c002f000-c0030000 rw-p 00000000 00:00 0 
c0030000-c0032000 r-xp 00000000 00:0c 115080     /lib/libdl-2.10.1.so
c0032000-c0033000 ---p 00002000 00:0c 115080     /lib/libdl-2.10.1.so
c0033000-c0034000 r--p 00001000 00:0c 115080     /lib/libdl-2.10.1.so
c0034000-c0035000 rw-p 00002000 00:0c 115080     /lib/libdl-2.10.1.so
c0035000-c0046000 r-xp 00000000 00:0c 442809     /usr/local/lib/libselinux.so.1
c0046000-c0047000 ---p 00011000 00:0c 442809     /usr/local/lib/libselinux.so.1
c0047000-c0048000 rw-p 00010000 00:0c 442809     /usr/local/lib/libselinux.so.1
c0048000-c0049000 rw-p 00000000 00:00 0 
c0049000-c0058000 r-xp 00000000 00:0c 115096     /lib/libresolv-2.10.1.so
c0058000-c005a000 ---p 0000f000 00:0c 115096     /lib/libresolv-2.10.1.so
c005a000-c005b000 r--p 0000f000 00:0c 115096     /lib/libresolv-2.10.1.so
c005b000-c005c000 rw-p 00010000 00:0c 115096     /lib/libresolv-2.10.1.so
c005c000-c005e000 rw-p 00000000 00:00 0 
c005e000-c016b000 r-xp 00000000 00:0c 442810     /usr/local/lib/libcrypto.so.0.9.8
c016b000-c016c000 ---p 0010d000 00:0c 442810     /usr/local/lib/libcrypto.so.0.9.8
c016c000-c0180000 rw-p 0010c000 00:0c 442810     /usr/local/lib/libcrypto.so.0.9.8
c0180000-c0184000 rw-p 00000000 00:00 0 
c0184000-c0186000 r-xp 00000000 00:0c 115130     /lib/libutil-2.10.1.so
c0186000-c0187000 ---p 00002000 00:0c 115130     /lib/libutil-2.10.1.so
c0187000-c0188000 r--p 00001000 00:0c 115130     /lib/libutil-2.10.1.so
c0188000-c0189000 rw-p 00002000 00:0c 115130     /lib/libutil-2.10.1.so
c0189000-c019a000 r-xp 00000000 00:0c 442812     /usr/local/lib/libz.so.1.2.3
c019a000-c019b000 ---p 00011000 00:0c 442812     /usr/local/lib/libz.so.1.2.3
c019b000-c019c000 rw-p 00010000 00:0c 442812     /usr/local/lib/libz.so.1.2.3
c019c000-c019d000 rw-p 00000000 00:00 0 
c019d000-c01af000 r-xp 00000000 00:0c 115120     /lib/libnsl-2.10.1.so
c01af000-c01b0000 ---p 00012000 00:0c 115120     /lib/libnsl-2.10.1.so
c01b0000-c01b1000 r--p 00011000 00:0c 115120     /lib/libnsl-2.10.1.so
c01b1000-c01b2000 rw-p 00012000 00:0c 115120     /lib/libnsl-2.10.1.so
c01b2000-c01b4000 rw-p 00000000 00:00 0 
c01b4000-c01bd000 r-xp 00000000 00:0c 115088     /lib/libcrypt-2.10.1.so
c01bd000-c01bf000 ---p 00009000 00:0c 115088     /lib/libcrypt-2.10.1.so
c01bf000-c01c0000 r--p 00009000 00:0c 115088     /lib/libcrypt-2.10.1.so
c01c0000-c01c1000 rw-p 0000a000 00:0c 115088     /lib/libcrypt-2.10.1.so
c01c1000-c01e8000 rw-p 00000000 00:00 0 
c01e8000-c01ff000 r-xp 00000000 00:0c 442814     /usr/local/lib/libgssapi_krb5.so.2.2
c01ff000-c0200000 ---p 00017000 00:0c 442814     /usr/local/lib/libgssapi_krb5.so.2.2
c0200000-c0201000 rw-p 00016000 00:0c 442814     /usr/local/lib/libgssapi_krb5.so.2.2
c0201000-c0269000 r-xp 00000000 00:0c 442816     /usr/local/lib/libkrb5.so.3.2
c0269000-c026a000 ---p 00068000 00:0c 442816     /usr/local/lib/libkrb5.so.3.2
c026a000-c026d000 rw-p 00067000 00:0c 442816     /usr/local/lib/libkrb5.so.3.2
c026d000-c028d000 r-xp 00000000 00:0c 442822     /usr/local/lib/libk5crypto.so.3.0
c028d000-c028e000 ---p 00020000 00:0c 442822     /usr/local/lib/libk5crypto.so.3.0
c028e000-c0290000 rw-p 0001f000 00:0c 442822     /usr/local/lib/libk5crypto.so.3.0
c0290000-c0292000 r-xp 00000000 00:0c 442818     /usr/local/lib/libcom_err.so.2.1
c0292000-c0293000 ---p 00002000 00:0c 442818     /usr/local/lib/libcom_err.so.2.1
c0293000-c0294000 rw-p 00001000 00:0c 442818     /usr/local/lib/libcom_err.so.2.1
c0294000-c0295000 rw-p 00000000 00:00 0 
c0295000-c0298000 r-xp 00000000 00:0c 442820     /usr/local/lib/libkrb5support.so.0.0
c0298000-c0299000 ---p 00003000 00:0c 442820     /usr/local/lib/libkrb5support.so.0.0
c0299000-c029b000 rw-p 00002000 00:0c 442820     /usr/local/lib/libkrb5support.so.0.0
c029b000-c03b7000 r-xp 00000000 00:0c 114361     /lib/libc-2.10.1.so
c03b7000-c03b9000 r--p 0011c000 00:0c 114361     /lib/libc-2.10.1.so
c03b9000-c03bc000 rw-p 0011e000 00:0c 114361     /lib/libc-2.10.1.so
c03bc000-c03bf000 rw-p 00000000 00:00 0 
c03bf000-c03f1000 r-xp 00000000 00:0c 442823     /usr/local/lib/libsepol.so.1
c03f1000-c03f2000 ---p 00032000 00:0c 442823     /usr/local/lib/libsepol.so.1
c03f2000-c03f4000 rw-p 00031000 00:0c 442823     /usr/local/lib/libsepol.so.1
c03f4000-c0401000 rw-p 00000000 00:00 0 
c0401000-c0407000 r-xp 00000000 00:0c 115126     /lib/libnss_compat-2.10.1.so
c0407000-c0408000 ---p 00006000 00:0c 115126     /lib/libnss_compat-2.10.1.so
c0408000-c0409000 r--p 00005000 00:0c 115126     /lib/libnss_compat-2.10.1.so
c0409000-c040a000 rw-p 00006000 00:0c 115126     /lib/libnss_compat-2.10.1.so
c040a000-c0412000 r-xp 00000000 00:0c 115122     /lib/libnss_nis-2.10.1.so
c0412000-c0413000 ---p 00008000 00:0c 115122     /lib/libnss_nis-2.10.1.so
c0413000-c0414000 r--p 00007000 00:0c 115122     /lib/libnss_nis-2.10.1.so
c0414000-c0415000 rw-p 00008000 00:0c 115122     /lib/libnss_nis-2.10.1.so
c0415000-c041e000 r-xp 00000000 00:0c 115108     /lib/libnss_files-2.10.1.so
c041e000-c0420000 ---p 00009000 00:0c 115108     /lib/libnss_files-2.10.1.so
c0420000-c0421000 r--p 00009000 00:0c 115108     /lib/libnss_files-2.10.1.so
c0421000-c0422000 rw-p 0000a000 00:0c 115108     /lib/libnss_files-2.10.1.so
efcb7000-efccc000 rw-p 00000000 00:00 0          [stack]
