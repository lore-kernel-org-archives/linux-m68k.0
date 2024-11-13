Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8186193403
	for <linux-m68k@vger.kernel.org>; Wed, 13 Nov 2024 21:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731531669; cv=none; b=ixNT0LUmLKZ8IU9+5doATp8dq7ZdxxK2Nc46hzfOGqMem2x7giFndzeaCQeM6T1hBkMeH2PMZSB9lx/RawqVDKpFHe9954kmFhL0qdirVoFegiHpWT7QycAuh0g963V+qkVyhR9VH+3im0TI5M16oyGSDWB3xDv8JZJ55POI6Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731531669; c=relaxed/simple;
	bh=jV4PD5fyUAk9k79g5bGU6flvIeUTAf90+GHh0/paXLQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pn2dYvtZ3UqzRgYtvoTXZSjUvN1TXz4LtpSjfJ5ZDucbgWgC+aD1WWjbc093ddhd7sbm49cVjPyW19YNGW2gbueUzMgtVEfeObtF7CLkzd3U0VQIAKJm982trQjCcM0G9xoleXX2fpfBqVb6ZjDEkUtaJX58XhVaZw0cgu1jllg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=L64vBiAX; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="L64vBiAX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CDcEZMRL7l1DNRS04orG7cQ8Pq+MGO/AhPBEJDFjDrU=; t=1731531665; x=1732136465; 
	b=L64vBiAXIwXxxgQ4DMqF59DrAxtHAJqcFrqwhejjDAGSRt17m2WvljcwEfrEA2SPB1OCvOZrG2N
	H0kpu72C+1IOqWLaHOQBdTBrVt2qgWQg800l6Tu329gVVb5U2L1ztU1lUvXR4iI/GswIBVqE6HoFh
	xh/qkQNXFrepby4exk6Py7o8DF6lhsjCHNdKMYTkNbf9J++JTyuXuyt7fgFXfd8yF7qwWOSZM0sAv
	V9kz7pBLrEZhAsoDUMHVfat0qE7WycZ+Xrl6ILvRIIT8KXAeyLBrOTYPZ7lw9dtzjrl/YOzjz86fg
	2+/A3RNHPoySv8kPUnrxY9kd5Iqu1CpXRn1A==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1tBKU3-00000002J4i-2EyM; Wed, 13 Nov 2024 22:01:03 +0100
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1tBKU3-00000001alv-1F1j; Wed, 13 Nov 2024 22:01:03 +0100
Message-ID: <f5dd33186498e9ade40b5ffca45d8fabf04a3ec9.camel@physik.fu-berlin.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Stan Johnson <userm57@yahoo.com>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
 linux-m68k <linux-m68k@vger.kernel.org>, debian-68k
 <debian-68k@lists.debian.org>, James Le Cuirot	 <chewi@aura-online.co.uk>,
 Sam James <sam@gentoo.org>, Geert Uytterhoeven	 <geert@linux-m68k.org>,
 Andreas Schwab <schwab@linux-m68k.org>, Thorsten Glaser	 <tg@mirbsd.de>,
 Finn Thain <fthain@linux-m68k.org>
Date: Wed, 13 Nov 2024 22:01:02 +0100
In-Reply-To: <a8611762-5539-d6c7-8d99-2fdaa6a1caef@yahoo.com>
References: 
	<3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
	 <383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com>
	 <832d65f2-1796-4ac1-b49b-380bf64700f4@gmail.com>
	 <8ca13b4b1a3c2d8d2e6d99c29b901659bb4108e1.camel@physik.fu-berlin.de>
	 <f87a85b2-809a-44dc-9a61-24698d7888eb@gmail.com>
	 <31a04ef1ca569580d29ed09097766e385a23044b.camel@physik.fu-berlin.de>
	 <a8611762-5539-d6c7-8d99-2fdaa6a1caef@yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

On Wed, 2024-11-13 at 13:48 -0700, Stan Johnson wrote:
> > But we're not really suffering from bloat. On the contrary, both softwa=
re
> > like systemd or Rust-compiled software actually use less memory, not mo=
re.
>=20
>=20
> Well, systemd is completely useless on every 68030 and 68040 Mac that I
> own, even ones that have enough memory to run it (e.g. SE/30, IIfx and
> Centris 650). It takes most of its time just telling me about all of the
> things that are timing out. It fires off too many concurrrent processes
> that overwhelm slow CPUs. Whenever systemd becomes a hard requirement in
> Debian, I won't be using Debian at all (there are still GNU/Linux
> distributions such as Gentoo that do not require systemd).

If you really do not want to use systemd and need something small, you can
just build yourself a chroot using Buildroot or Toybox.

> > SysVInit uses a huge set of bash scripts where every action involves sp=
awning
> > a new shell while systemd does all of that in C. Compiled C code is def=
initely
> > faster on an m68k machine than hundreds of shell scripts.
>=20
>=20
> Yes, compiled C code is faster than an equivalent script, but scripts
> are much easier (for some of us) to edit and turn on and off than
> systemd components.

systemctl disable foo.service is too hard?

> Plus systemd has lots of components and does lots of things that arguably
> an init system shouldn't even be doing, things that aren't needed at all
> on old systems, such as managing logins, setting the time and managing DN=
S.

Old systems don't need user management or networking?

FWIW, these components can be turned off if you insist using a separate pac=
kage
for each and every standard service that's part of the standard Linux userl=
and.

You are not forced to use systemd components.

> Systemd even complains if I manually edit /etc/fstab.

Which is a good thing. SysVInit systems would just silently fail when you a=
dded
an entry to /etc/fstab which didn't work properly so that you could end up =
with
something not being mounted where it should be or vice versa.

Ignoring such failures provokes data loss. That's *not* a good thing.

> Perhaps there are ways to tune systemd for small systems,
> but I haven't seen any distribution that does that. On small, static
> systems that don't have USB, Firewire, PC-Cards, etc., udevd and
> sometimes dbus aren't even needed, and systemd is certainly overkill for
> such systems.

I'm using systemd on my Amiga and any other embedded system I have and it w=
orks.

> I'm not trying to rehash old systemd/sysvinit discussions; I realize
> that Debian has chosen systemd as its default init system. That's fine;
> Debian can do whatever they want, but no one can tell me that systemd,
> at least in the configuration as it is distributed by Debian, is better
> than sysvinit for small, mostly static systems. That's why there are
> entire distributions that are dedicated specifically to not forcing
> their users to use systemd.

You mean "professional" distributions like Devuan?

> https://lwn.net/Articles/786593/

> > > What such hardware would benefit from is low memory optimized user=
=20
> > > space. That's hard to do with Debian, as bloat appears to have crept=
=20
> > > into the build dependencies chain (if I understand you correctly).
> >=20
> > The build dependencies don't end up on the installed system. For exampl=
e, if
> > Java code is used to generate documentation, the Java runtime won't hav=
e to
> > be installed on the target machine. But you still need a working OpenJD=
K
> > to be able to build such packages.
> >=20
> > > While Debian was the first Linux distribution to support m68k, these =
days=20
> > > there are other options, maybe some better suited to low memory syste=
ms=20
> > > (and I'd consider even 256 MB on Amiga 'low memory' ...).
>=20
>=20
> Well, I'd consider 16 MiB to be "low memory" for 68030 Macs, but you are
> the Debian m68k port maintainer so you can consider whatever you want to
> be low memory. Hopefully the bloat (Linux kernel and applications) will
> be minimized so that old Macs, such as 68030 PowerBooks and desktops
> that can have no more than 36 MiB, will be able to continue running, not
> just Amigas that have 256 MiB memory. If we're headed toward Linux
> distributions that can only run well enough in QEMU or Aranym, what's
> the point in having old systems at all?

First of all, you can still and will always be able to build yourself a tin=
y
chroot using Buildroot or Toybox. And, secondly, what's the point of runnin=
g
the latest and greatest kernel on a system which can't make use of any mode=
rn
kernel features anyway?


Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
