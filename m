Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD021EE018
	for <linux-m68k@vger.kernel.org>; Wed, 13 Nov 2024 12:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731502727; cv=none; b=InJCYsgTEAYNQRWm4b+ujqkOwUk2iJLY4fJD0TfGMHO8Rtn2k/IHEmVQAgCvNoj3xhBXQbu3E4wx7xIYTHGGGNToQT5PxXkEWJFJhrzVGUT2QjSjQX7aT6jTLnxOjZbklCqNmS8WAIx4t765oO5CFDR2i75pOp8V1XZtVEN5zqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731502727; c=relaxed/simple;
	bh=6Ml6S8wAVERJwT3So5qragXnn2M5aQqO3OHqL52y/bc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ORRw45u5amv5sYqw0dcCxQf5umKrajAFz8TkLiJh8ZcA3CIX7DxFBL4ahiiWxD292b/bTKVcf09WTgkOHAt0Z+s3qtaHw7JY39+K0hOTvQu/+nZR2OjvgZFEMJZ8HVBQtYHpPpoADKXxmOy6TznHp2v/K7K7m/m0K6degdtXgtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=fyrfVjRp; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="fyrfVjRp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kAGtRW0vNShzCNavLLIZghZHDGYJac68jN1HXEuioNc=; t=1731502724; x=1732107524; 
	b=fyrfVjRpfNq5yV5KgCgzcX6LMtkyZ3Ku5QdJxdSFBrIcF0iGMsIipyiK68KbvDxP3hxwTAq/tq0
	aGkjcsSsRrApkpYNdX+RFTTeG7dt9l3ei5vt0GEopl2ooyD6m8b+PM6yPjpYrM21cF855N2lVJ1+E
	X8Yz5nJv3zlGFWnwxSff90h0qESKRQGNatgcv8etx8amtl5XHyfkGG72nYmmM2/4e6VSUGbegxGhg
	pUnQWOCM1in2grBgq2VC+2CJXy8BAzisypyQoppp6jWSoXYehRle/NSQhE7jAc8Frpu2eAdNYDl2N
	9vp1Lsysw/Dn2mh27Co/ygacfFWVrbcAGxIQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1tBCxG-00000003arT-44tk; Wed, 13 Nov 2024 13:58:42 +0100
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1tBCxG-00000000Chz-30ks; Wed, 13 Nov 2024 13:58:42 +0100
Message-ID: <50be1cf2bf065fbfd20d5b8c27cad4b9be9469fc.camel@physik.fu-berlin.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Finn Thain <fthain@linux-m68k.org>, Michael Schmitz
 <schmitzmic@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@vger.kernel.org>, 
 debian-68k <debian-68k@lists.debian.org>, James Le Cuirot
 <chewi@aura-online.co.uk>, Sam James	 <sam@gentoo.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Andreas Schwab	 <schwab@linux-m68k.org>, Thorsten
 Glaser <tg@mirbsd.de>
Date: Wed, 13 Nov 2024 13:58:42 +0100
In-Reply-To: <de1adc92-f1e9-81fd-9406-7148e8213e4c@linux-m68k.org>
References: 
	<3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
	 <383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com>
	 <832d65f2-1796-4ac1-b49b-380bf64700f4@gmail.com>
	 <de1adc92-f1e9-81fd-9406-7148e8213e4c@linux-m68k.org>
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

On Tue, 2024-10-29 at 14:39 +1100, Finn Thain wrote:
> On Tue, 29 Oct 2024, Michael Schmitz wrote:
>=20
> > On 25/10/24 22:55, Arnd Bergmann wrote:
> >=20
> > > I also expect that a lot of users (of m68k kernels) are never going t=
o=20
> > > get the benefits as they are already stuck on older userspace because=
=20
> > > of added bloat in new software releases. I assume you have better=20
> > > understanding than me of what m68k hardware is commonly used these=
=20
> > > days, and how constrained that is in practice.
> >=20
> > I second that - currently bisecting to find out what makes my extremely=
=20
> > RAM constrained m68k system fail to boot or run anything past 6.9-rc4=
=20
> > (sysvinit, not systemd).
> >=20
>=20
> As cloud instances multiply, that small quantity of lost RAM gets=20
> multiplied. So it appears that small systems aren't so strange, even afte=
r=20
> they become unprofitable...

Yes, who doesn't know the cloud instances with 64 MB RAM. Those are today's=
 standard.

> > Much as I appreciate Adrian's efforts to keep up with user space=20
> > development, I won't be in a position to help with an ABI change.
> >=20
>=20
> Bloated m68k packages will continue to work -- given emulators that run=
=20
> faster with every hardware upgrade. But how would such a distro add value=
?

You can easily upgrade Amigas to 256 MB or more these days. The aftermarket
provides a lot of affordable upgrades these days.

> I don't mind if Gentoo ships a separate profile for (downstream) ABI=20
> experimentation, leaving the default m68k profile on the standard ABI.

The Gentoo developers will be glad to hear that you don't mind. Do you thin=
k
they need a written permission from you?

> And if Debian wants to switch ABI entirely, I won't object further, I've=
=20
> said enough about the associated risks.
>=20
> So I'll just reiterate that I'd rather see more collaboration instead -
>=20
> 1) among all small systems ports, to try to alleviate Debian's package=
=20
>    dependency problem

That dependency chain comes from upstream, not from Debian.

> 2) among all developers working on non-commercial architectures, to=20
>    improve the GCC Rust frontend

GCC Rust uses parts of the upstream Rust code, so you can expect the same
problems there as well.

> 3) among all 680x0 developers interested in the NetBSD ABI

The alignment issue affects NetBSD as well.

> 4) among all users of EOL'd hardware, so that value may continue to be=
=20
>    extracted from it (thanks to the efforts of Debian and Gentoo devs,=
=20
>    among others).

Software will run faster with 32-bit alignment, not slower.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
