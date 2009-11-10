From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Add private syscalls to support NPTL
Date: Tue, 10 Nov 2009 15:07:28 +1100 (EST)
Message-ID: <alpine.OSX.2.00.0911101451040.369@silk.local>
References: <4A89D037.7090807@codesourcery.com> <m27hx2um3t.fsf@igel.home>  <4A8A54F9.3080100@codesourcery.com> <m3d46tpmue.fsf@hase.home>  <4A8A6CA2.4040806@codesourcery.com> <10f740e80908180222p4d95b19bp3069e037a6bc590e@mail.gmail.com> <4A91A4C8.5040803@codesourcery.com>
 <4A943ECC.80607@codesourcery.com> <4A97B69F.4000306@codesourcery.com> <4AC5CF12.8000200@codesourcery.com> <4AE5B9B7.7000106@codesourcery.com> <alpine.OSX.2.00.0910281209160.394@silk.local> <4AE7EAC2.8050409@codesourcery.com> <alpine.OSX.2.00.0911052033380.497@silk.local>
 <4AF3E55D.8060603@codesourcery.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:60316 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752430AbZKJEHZ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 9 Nov 2009 23:07:25 -0500
In-Reply-To: <4AF3E55D.8060603@codesourcery.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Maxim Kuvyrkov <maxim@codesourcery.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>, linux-m68k@vger.kernel.org, debian-68k@lists.debian.org



On Fri, 6 Nov 2009, Maxim Kuvyrkov wrote:

> Finn Thain wrote:
> > On Wed, 28 Oct 2009, Maxim Kuvyrkov wrote:
> > 
> > > ...
> > > 
> > > We [CodeSourcery] have just updated all of our toolchains, and the 
> > > GNU/Linux toolchain is based on EGLIBC 2.10 and has well tested 
> > > TLS/NPTL support.  If you are targeting ColdFire you can simply 
> > > download the toolchain at 
> > > <http://www.codesourcery.com/sgpp/lite/coldfire>.
> ...
> > I did run into a problem with this second patch. It doesn't apply to 
> > the eglibc_2.10 branch in svn as of yesterday. The following hunk is 
> > the problem:
> 
> The patches posted are all against FSF GLIBC, not EGLIBC, so some 
> conflicts are expected. ...

OK. I suppose that means no back-porting of other patches is required.

> > Using the above patches, I am almost able to compile eglibc_2.10. But 
> > there is an old build failure (since glibc-2.4 I think) when linking 
> > libc.so:
> > 
> > /tmp/build/glibc-m68k-linux-gnu-3/libc_pic.os: In function `fchownat':
> > (.text+0x911c2): undefined reference to `__atfct_seterrno'
> > /tmp/gcc-4.4.1/lib/gcc/m68k-linux-gnu/4.4.1/../../../../m68k-linux-gnu/bin/ld:
> > /tmp/build/glibc-m68k-linux-gnu-3/libc.so: hidden symbol `__atfct_seterrno'
> > isn't defined
> > /tmp/gcc-4.4.1/lib/gcc/m68k-linux-gnu/4.4.1/../../../../m68k-linux-gnu/bin/ld:
> > final link failed: Nonrepresentable section on output
> > collect2: ld returned 1 exit status
> > make[1]: *** [/tmp/build/glibc-m68k-linux-gnu-3/libc.so] Error 1
> > make[1]: Leaving directory `/tmp/build/glibc-2.10.1'
> > make: *** [all] Error 2
> > 
> > To try to fix this issue, I've basically copied this patch:
> >   http://sources.redhat.com/ml/libc-hacker/2006-08/msg00004.html 
> > An m68k version is attached. Can someone have a look at it and tell 
> > whether this is the correct fix or not?
> 
> I don't really know, this is the first time I see this failure.

I found out why it happens.

If you build eglibc with "--enable-kernel=2.6.31" it fails as above.
If you omit that option, it works.

Do you think my patch is a reasonable solution? I don't understand it, I 
just copied it from x86 -- "monkey see, monkey do."

I used the eglibc-2.10/EGLIBC.cross-building script to test this. I 
configured eglibc with "--enable-add-ons=ports,nptl" to prevent localedef 
from breaking the configure step. Package versions were binutils-2.19.51, 
gcc-4.4.1 (patched), linux-2.6.31 (patched), eglibc 2_10 branch (patched).

I also tried eglibc trunk but the build failed elsewhere:

../sysdeps/unix/sysv/linux/i386/fcntl.c: In function '__fcntl_nocancel':
../sysdeps/unix/sysv/linux/i386/fcntl.c:133: error: storage size of 'fex' isn't known
../sysdeps/unix/sysv/linux/i386/fcntl.c:134: error: 'F_GETOWN_EX' undeclared (first use in this function)
../sysdeps/unix/sysv/linux/i386/fcntl.c:134: error: (Each undeclared identifier is reported only once
../sysdeps/unix/sysv/linux/i386/fcntl.c:134: error: for each function it appears in.)
../sysdeps/unix/sysv/linux/i386/fcntl.c:136: error: 'F_OWNER_GID' undeclared (first use in this function)
../sysdeps/unix/sysv/linux/i386/fcntl.c:133: warning: unused variable 'fex'
make[2]: *** [/home/fthain/cross-build/m68k/obj/eglibc/io/fcntl.o] Error 1
make[2]: Leaving directory `/home/fthain/cross-build/src/eglibc-trunk-r9191/io'
make[1]: *** [io/subdir_lib] Error 2
make[1]: Leaving directory `/home/fthain/cross-build/src/eglibc-trunk-r9191'
make: *** [all] Error 2

For now I'm content with eglibc-2.10, since that is the version in the 
debian archive.

> 
> > The end result is that I now have a NPTL/TLS m68k toolchain 
> > (binutils-2.19.51 and patched gcc-4.4.1). Thank you for making that 
> > possible. I've not run the test suites yet, but so far it seems to 
> > work.
> > 
> > Only, I did find that a statically linked binary (pccardctl) built 
> > with this toolchain segfaults ("unknown errorSegmentation fault") when 
> > run under a linux-2.6.31 kernel that lacks your patches. Is this 
> > expected?
> 
> The binary will certainly not work,

Right. I see that this is documented in the CodeSourcery G++ Lite m68k 
docs.

Finn

> but I remember run-time linker gracefully exiting with a proper error 
> message when invoked on a system with unpatched kernel.  I don't think I 
> tested statically linked binaries on such system.
> 
> 
