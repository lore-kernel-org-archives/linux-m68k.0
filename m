Received: from mail.duskware.de (mail.duskware.de [91.199.88.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C551E412A
	for <linux-m68k@vger.kernel.org>; Sun,  8 Jun 2025 11:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.199.88.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749383249; cv=none; b=PYQwO/HuFoorlXZ2kNH+AKwyA0qKmndnW+174A2KTFRu68TJ1JIfJXzRHsYwsbJYWDFfJ4gOKtI07quisv6Rs3Zgt+Ew++7/M1/2dO7EKNSe2pBCrw5AGiZRWfryFJV1wIHcxyKLDGcoDVYBnPfOqtBHJ/i5ZmyD4RvF0zMW9IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749383249; c=relaxed/simple;
	bh=qDMpk7VsH0RqDEoTebW66YTeJ9V8K8DlId4GfI8EAd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KIXsl1DHQu8RbkFJbp/05ljfy1ieqAddIiLaLMV0vzspzfG3gNC3eUhHDtFFk3VEm28A/1G7tUAD14ufJuWrIrnjYXCPq+z73R6vylNDLBTrxBSjDlIxBpXyfHKjfFLfSEllWU5q66KVGteZ3eSRTu3U0BIcBOBaeA1CbBEh0NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=duskware.de; spf=pass smtp.mailfrom=duskware.de; arc=none smtp.client-ip=91.199.88.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=duskware.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duskware.de
Received: by mail.duskware.de (Postfix, from userid 205)
	id 1CF6CA7DFF; Sun,  8 Jun 2025 13:47:18 +0200 (CEST)
Date: Sun, 8 Jun 2025 13:47:18 +0200
From: Martin Husemann <martin@duskware.de>
To: Finn Thain <fthain@linux-m68k.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	port-m68k <port-m68k@netbsd.org>,
	debian-68k <debian-68k@lists.debian.org>,
	linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
Message-ID: <20250608114717.GB1644@mail.duskware.de>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>
 <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>
 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org>
 <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
 <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org>
 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
 <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org>
User-Agent: Mutt/1.7.2 (2016-11-26)

On Sun, Jun 08, 2025 at 11:10:38AM +1000, Finn Thain wrote:
>=20
> On Sat, 7 Jun 2025, John Paul Adrian Glaubitz wrote:
>=20
> > On Fri, 2025-06-06 at 20:20 +1000, Finn Thain wrote:
> > > Whereas, the ability to use old binaries is proof that we care about=
=20
> > > rule #1 don't break userspace.
> >=20
> > Who is "we"?
>=20
> AFAICT, it's essentially everyone who contributes patches at the userspac=
e=20
> interfaces.

Since this thread also hit a non-Linux lists I just want to point
out that we (as in: NetBSD) did not break userland when adapting the
SVR4 ABI including different alignment for ELF.

I just tested it with some original 1994 NetBSD 1.0 / amiga binaries
on an amiga running NetBSD-current as of earlier today.

I started with an empty ~/aout_test directory.

I slightly shortened the lengthy and boring download sequence in the log
(back then distributions were optimized for transport via floopies - duh!)

--8<--
[~/aout_test] martin@amiga > uname -a
NetBSD amiga.aprisoft.de 10.99.14 NetBSD 10.99.14 (GENERIC) #6: Sun Jun  8 =
08:11:46 CEST 2025  martin@seven-days-to-the-wolves.aprisoft.de:/work/src/s=
ys/arch/amiga/compile/GENERIC amiga
[~/aout_test] martin@amiga > file /bin/ls
/bin/ls: ELF 32-bit MSB pie executable, Motorola m68k, 68020, version 1 (SY=
SV), dynamically linked, interpreter /libexec/ld.elf_so, for NetBSD 10.99.1=
4, not stripped
[~/aout_test] martin@amiga > ftp http://archive.netbsd.org/pub/NetBSD-archi=
ve/Ne =08tBSD-1.0/amiga/binary/base10/base10.aa
Trying [2a04:4e42:8e::262]:80 ...
ftp: Can't connect to `2a04:4e42:8e::262:80': No route to host
Trying 146.75.117.6:80 ...
Requesting http://archive.netbsd.org/pub/NetBSD-archive/NetBSD-1.0/amiga/bi=
nary/base10/base10.aa
[..]
[~/aout_test] martin@amiga > ftp http://archive.netbsd.org/pub/NetBSD-archi=
ve/Ne =0DtBSD-1.0/amiga/binary/base10/base10.ag=08=1B[Kh
Trying [2a04:4e42:8e::262]:80 ...
ftp: Can't connect to `2a04:4e42:8e::262:80': No route to host
Trying 146.75.117.6:80 ...
Requesting http://archive.netbsd.org/pub/NetBSD-archive/NetBSD-1.0/amiga/bi=
nary/base10/base10.ah
[..]
142449 bytes retrieved in 00:00 (818.21 KiB/s)
[~/aout_test] martin@amiga > su
Password:
[/data/home/martin/aout_test] amiga # cat base10.a* | tar xzpzf -
[/data/home/martin/aout_test] amiga # file bin/ls
bin/ls: a.out NetBSD/m68k demand paged executable @0x2020+T=3D114688+D=3D81=
92+B=3D7992
[/data/home/martin/aout_test] amiga # chroot . /bin/sh
# pwd
/
# ls -l
total 6436
drwxr-xr-x   2 0    0       512 Oct 21  1994 altroot
-rw-r--r--   1 205  100  901120 Oct 28  1994 base10.aa
-rw-r--r--   1 205  100  901120 Oct 28  1994 base10.ab
-rw-r--r--   1 205  100  901120 Oct 28  1994 base10.ac
-rw-r--r--   1 205  100  901120 Oct 28  1994 base10.ad
-rw-r--r--   1 205  100  901120 Oct 28  1994 base10.ae
-rw-r--r--   1 205  100  901120 Oct 28  1994 base10.af
-rw-r--r--   1 205  100  901120 Oct 28  1994 base10.ag
-rw-r--r--   1 205  100  142449 Oct 28  1994 base10.ah
drwxr-xr-x   2 0    0       512 Oct 21  1994 bin
drwxr-xr-x   3 0    0       512 Oct 21  1994 dev
drwxr-xr-x   8 0    0       512 Oct 21  1994 etc
drwxr-xr-x   2 0    0       512 Oct 21  1994 home
drwxr-xr-x   2 0    0       512 Oct 21  1994 mnt
drwxr-xr-x   2 0    0       512 Oct 21  1994 root
drwxr-xr-x   2 0    0      1024 Oct 21  1994 sbin
drwxr-xr-x   2 0    0       512 Oct 21  1994 stand
drwxrwxrwt   2 0    0       512 Oct 21  1994 tmp
drwxr-xr-x  14 0    0       512 Oct 21  1994 usr
drwxr-xr-x  18 0    0       512 Oct 21  1994 var
# uname -a
NetBSD amiga.aprisoft.de 10.99.14 NetBSD 10.99.14 (GENERIC) #6: Sun Jun  8 =
08:11:46 CEST 2025  martin@seven-days-to-the-wolves.aprisoft.de:/work/src/s=
ys/arch/amiga/compile/GENERIC amiga
-->8--

So the 1.0 original release a.out binaries still work and a -current
kernel provides the right data (with old alignment and 32bit time_t)
for a stat(2) system call from 1994 using the a.out ABI.

Martin
