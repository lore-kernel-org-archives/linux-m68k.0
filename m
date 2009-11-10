From: Brad Boyer <flar@allandria.com>
Subject: Re: Add private syscalls to support NPTL
Date: Mon, 9 Nov 2009 20:20:32 -0800
Message-ID: <20091110042032.GA28371@cynthia.pants.nu>
References: <4A91A4C8.5040803@codesourcery.com> <4A943ECC.80607@codesourcery.com> <4A97B69F.4000306@codesourcery.com> <4AC5CF12.8000200@codesourcery.com> <4AE5B9B7.7000106@codesourcery.com> <alpine.OSX.2.00.0910281209160.394@silk.local> <4AE7EAC2.8050409@codesourcery.com> <alpine.OSX.2.00.0911052033380.497@silk.local> <4AF3E55D.8060603@codesourcery.com> <alpine.OSX.2.00.0911101451040.369@silk.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from [76.245.85.235] ([76.245.85.235]:41141 "EHLO cynthia.pants.nu"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1755951AbZKJEVB (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Mon, 9 Nov 2009 23:21:01 -0500
Content-Disposition: inline
In-Reply-To: <alpine.OSX.2.00.0911101451040.369@silk.local>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Maxim Kuvyrkov <maxim@codesourcery.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>, linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

On Tue, Nov 10, 2009 at 03:07:28PM +1100, Finn Thain wrote:
> I also tried eglibc trunk but the build failed elsewhere:
> 
> ../sysdeps/unix/sysv/linux/i386/fcntl.c: In function '__fcntl_nocancel':
> ../sysdeps/unix/sysv/linux/i386/fcntl.c:133: error: storage size of 'fex' isn't known
> ../sysdeps/unix/sysv/linux/i386/fcntl.c:134: error: 'F_GETOWN_EX' undeclared (first use in this function)
> ../sysdeps/unix/sysv/linux/i386/fcntl.c:134: error: (Each undeclared identifier is reported only once
> ../sysdeps/unix/sysv/linux/i386/fcntl.c:134: error: for each function it appears in.)
> ../sysdeps/unix/sysv/linux/i386/fcntl.c:136: error: 'F_OWNER_GID' undeclared (first use in this function)
> ../sysdeps/unix/sysv/linux/i386/fcntl.c:133: warning: unused variable 'fex'
> make[2]: *** [/home/fthain/cross-build/m68k/obj/eglibc/io/fcntl.o] Error 1
> make[2]: Leaving directory `/home/fthain/cross-build/src/eglibc-trunk-r9191/io'
> make[1]: *** [io/subdir_lib] Error 2
> make[1]: Leaving directory `/home/fthain/cross-build/src/eglibc-trunk-r9191'
> make: *** [all] Error 2
> 
> For now I'm content with eglibc-2.10, since that is the version in the 
> debian archive.

It looks like this needs a newer version of the kernel headers. That stuff
was added relatively recently:

http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=ba0a6c9f6fceed11c6a99e8326f0477fe383e6b5

If I'm reading the dates correctly, this commit wasn't in 2.6.31.

As a side note, there is already a patch floating around to fix that commit,
which apparently broke stuff.

http://patchwork.kernel.org/patch/56568/

	Brad Boyer
	flar@allandria.com
