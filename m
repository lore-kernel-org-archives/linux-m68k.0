Received: from evolvis.org (evolvis.org [217.144.135.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14291FCC66
	for <linux-m68k@vger.kernel.org>; Fri, 25 Oct 2024 23:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.144.135.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729899728; cv=none; b=sDWegFYzQykjWPJcRgrPGSDTa5SJ9FtDCJ6n2Bawdfrcv+7hZX1hXXPWrC5QZfz774um+QLJ0pij72Q7SgEAUTbuhVw5R4qahPLSI433Q3OOiCVe7OWo3pK4VstSPO97H0tV+8XCAxRz/YwnK8+FFTP2vsizAGxVGLfcegGlJQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729899728; c=relaxed/simple;
	bh=fciOsvFu7QkMKl/UostKUZqh1b4giA/UC5RRwNr2tQU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GgcD5kFAsAXQtdo334jHicKdHitjHnMdar3Bd8el2tlcCUy94Rn6v5yqgXfEJvVlDzk99/7fN17xnOmh/Y8Bef8vsc85fbt5Z9X9VUtGtnqbqUd+cUWKQSdKVyW8/4FI5o8jI7QSkbmaCLIZryf18PXNECNU0TisoI5S80kpxf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; arc=none smtp.client-ip=217.144.135.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Received: from x61p.mirbsd.org (xdsl-78-35-214-175.nc.de [78.35.214.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X448 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: x61p@relay.evolvis.org)
	by evolvis.org (Postfix) with ESMTPSA id 97A471001A7;
	Fri, 25 Oct 2024 23:42:03 +0000 (UTC)
Received: by x61p.mirbsd.org (Postfix, from userid 1000)
	id 1151B143471; Sat, 26 Oct 2024 01:42:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by x61p.mirbsd.org (Postfix) with ESMTP id 0B38F143275;
	Sat, 26 Oct 2024 01:42:02 +0200 (CEST)
Date: Sat, 26 Oct 2024 01:42:01 +0200 (CEST)
From: Thorsten Glaser <tg@debian.org>
To: Andreas Schwab <schwab@linux-m68k.org>
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@vger.kernel.org>, 
    debian-68k <debian-68k@lists.debian.org>, 
    James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
In-Reply-To: <874j4z253e.fsf@igel.home>
Message-ID: <78d35395-2ef6-e55e-31f8-69cff5e47cdf@debian.org>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de> <383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com> <bfc235822cf8f773689abfefe1a75abfcf860c93.camel@physik.fu-berlin.de> <97b0a5de-885f-ffde-3739-f7f29b16d3bd@mirbsd.de>
 <874j4z253e.fsf@igel.home>
Content-Language: de-Zsym-DE-1901-u-em-text-rg-denw-tz-utc, en-Zsym-GB-u-cu-eur-em-text-fw-mon-hc-h23-ms-metric-mu-celsius-rg-denw-tz-utc-va-posix
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 26 Oct 2024, Andreas Schwab wrote:

>Already basic things like struct stat64 will break.

OK. Then, flag day, I guess.

How do we model this in Debian. Rename libc to libc6.1 and
conflict with libc6 to force no co=C3=AFnstallability, rename the
architecture from m68k to=E2=80=A6 something else, or=E2=80=A6?

But then, this does give the kernel side a chance to clean
it up, even to model it like a completely new ILP32 port with
no historical things to account for. And no kernel then needs
to support both at the same time. (Or the new syscall ABI
could use something different than trap #0, if that is even
possible.)

How do we model this on the ELF side? (How do ARM and MIPS
distinguish between their different same-bitness ABIs there?)
Or do we just keep everything and old programs will just fail
on their first syscall? (Another point in favour of not using
the same trap.) Less toolchain changes. This also impacts how
distros can handle this. From what mgorny writes Gentoo also
doesn=E2=80=99t like rebootstrap-everything flag days with no simple
upgradability, but it looks like this can=E2=80=99t be avoided with
justifiable effort=E2=80=A6 unless the new ABI uses a different trap,
the kernel supports both at the same time, and ELF mechanisms
*and* paths (e.g. Multi-Arch) are used to distinguish them,
so they can co=C3=ABxist in the same system. (Although different
M-A path would (I think) mean different Debian architecture,
so it=E2=80=99d not be a clean upgrade either; crossgrades do work in
theory these days, but only if the package versions are
exactly identical, so this is very much not going to happen
for m68k.)

So I think we need a rebootstrap with requiring users to
reinstall (and then need no coexistence within the same
running system).

Can we cheat and just not change the dpkg arch, GNU triplet,
ELF headers etc. and just make sure that old syscalls won=E2=80=99t
continue to work? (Or, some could even continue to work.)
The danger of this is that if someone has an old .a lying
around and links to it, they can get misbehaviour *if* it
is affected by the ABI change.

Otherwise, I think we at least need something ELFy that
binutils will refuse to link with older ELFs and go from
there.

Looking at binutils=E2=80=A6 ARM has special code like:

      /* Cannot mix APCS26 and APCS32 code.  */
      if ((in_flags & EF_ARM_APCS_26) !=3D (out_flags & EF_ARM_APCS_26))
        return FALSE;

      /* Cannot mix float APCS and non-float APCS code.  */
      if ((in_flags & EF_ARM_APCS_FLOAT) !=3D (out_flags & EF_ARM_APCS_FLOA=
T))
        return FALSE;

But m68k doesn=E2=80=99t, so old binutils would link against new
objects if we just add something like EF_* there. Again,
the question is how much we can =E2=80=9Ccheat=E2=80=9D for a low-user-
count arch vs. how correct we want to do this. I=E2=80=99m not
sure allocating a new EM_* distinct from EM_68K would be
globally welcomed. (On that note, there=E2=80=99s EM_COLDFIRE, but
Linux/coldfire never took off, did it?) No EI_OSABI use,
either. So, besides new EM_*, I can=E2=80=99t think of a way that
old binutils won=E2=80=99t mix objects (and old kernels won=E2=80=99t try
to execute new binaries), unless making things fail at the
first syscall is an option, but getting one will mean more
delays and more to change.

So many ways=E2=80=A6

bye,
//mirabilos
--=20
=E2=80=9ECool, /usr/share/doc/mksh/examples/uhr.gz ist ja ein Grund,
mksh auf jedem System zu installieren.=E2=80=9C
=09-- XTaran auf der OpenRheinRuhr, ganz begeistert
(EN: =E2=80=9C[=E2=80=A6]uhr.gz is a reason to install mksh on every system=
=2E=E2=80=9D)
