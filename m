Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E752066F7
	for <linux-m68k@vger.kernel.org>; Sat,  7 Jun 2025 09:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749289471; cv=none; b=KURTjYxVH9UMjiJf+hiwGzla84fbR1dKknThWi9hBiSaZq4DLoViG+AfF6llXmNYs/gMk6Pmi1jlpTjy6Y0V/X5OmHHXRyypju0I9lpWSHkRQzyj23bw+t+DHQA0WOdeQ+eHKD9hiqSrnCupOhhlIl8+9LWwcDYowoaThc46Fjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749289471; c=relaxed/simple;
	bh=/bVI2jW9Mn4JQl7QmNHXr20Wzn3nv1Kh9bht7+TLE4Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OCSlz8Ne4/wrNNrWIi2F0MI5rwmzGHg3PAr3wr3UVWmxYtPG0LVM9MnDmhFp08uPmBnJW97ghqmlx3NYLiUJJw8UIMpwPHdZaaeP3BCRkJEt4eLNJpsO185wSmcolRPsh2t26K9j/Rbxoy1cvaHUhJ2YJzm5PwDVHor5LRn+wnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=KeOgYXaY; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="KeOgYXaY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gOyEq5JKC85iONhM4UOxM0Uab+vFOoM/vEa/vCvAOPo=; t=1749289467; x=1749894267; 
	b=KeOgYXaYR3rSwT6lNn12w53Huskl5zWxtx0u79MyoAiCwWgpOQWZDG79XL9mddAwRzAahgrlNyY
	AGS3c3GlF2h89P0GtgO6tLJHtRXv5VQ1qRtrv/IIAuWGUQI50+//W0n191LQKDZMqb5KE7YU6SZYN
	Xocp7L3pIhDaAADRgkdNj3QWJBF1UYSt2aw2Ez8cQAA+bf2m+69tL7RTzKb6dyBTpl55CNxjb9K9A
	tI4Rb4qS7DXwJK85/JJG5J5m1In9BdU7Ug286nEC5Cpu4j7SKWurVFaeKjUkxfR5KTErNcADpmqUI
	KMIf0MxmJPj6dMe4vFis1g+BPShbpEWRBC5A==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uNq65-0000000189d-2mXg; Sat, 07 Jun 2025 11:44:17 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uNq65-00000002zzJ-1gEM; Sat, 07 Jun 2025 11:44:17 +0200
Message-ID: <ce3455392895b27dc52973471124dbfadec2122a.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Martin Husemann
	 <martin@duskware.de>
Cc: Anders Magnusson <ragge@tethuvudet.se>, Jean-Michel Hautbois	
 <jeanmichel.hautbois@yoseli.org>, port-m68k <port-m68k@netbsd.org>,
 debian-68k	 <debian-68k@lists.debian.org>, linux-m68k
 <linux-m68k@vger.kernel.org>
Date: Sat, 07 Jun 2025 11:44:16 +0200
In-Reply-To: <CAMuHMdVtuj6rJ+yAxAQvGwGUqf-iXTFVY28t2EJdqg7+=Atuig@mail.gmail.com>
References: 
	<ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
	 <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>
	 <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>
	 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org>
	 <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
	 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
	 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
	 <30ad91c1-b42f-48f7-81a0-e1efa64a6891@tethuvudet.se>
	 <20250605103343.GC22312@mail.duskware.de>
	 <CAMuHMdVtuj6rJ+yAxAQvGwGUqf-iXTFVY28t2EJdqg7+=Atuig@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

On Fri, 2025-06-06 at 09:01 +0200, Geert Uytterhoeven wrote:
> On Thu, 5 Jun 2025 at 12:33, Martin Husemann <martin@duskware.de> wrote:
> > On Thu, Jun 05, 2025 at 10:49:08AM +0200, Anders Magnusson wrote:
> > > Just curious; does not Linux use the processor-specific flagging in t=
he
> > > binary that can tell whether it's 16- or 32-bit-aligned (and handle i=
t
> > > thereafter)?
> > >=20
> > > NetBSD changed VAX from 1k to 4k pages quite some time ago, and to be=
 able
> > > to use both we added a new id for 4k pages.
> >=20
> > Or add an ELF note to all new binaries - we do that on sparc64 to mark
> > the compiler memory model used and give all binaries w/o the note
> > (or a note that it is using "medlow") a different VA memory layout (to
> > keep shared libs in range of the instructions used there, but defeating
> > most of ASLR).
>=20
> Op MIPS N32 (EF_MIPS_ABI2), which also uses different syscall numbers.
> Then the kernel has to take care of the translation.

Why not just add a kernel option to allow building the m68k kernel with 4 b=
ytes
alignment? Anyone who still wants to keep 2 bytes alignment can continue to=
 do
so.

The same would apply for gcc and glibc. Both can offer a configure option t=
o set
the default alignment to 4 bytes. This way everyone who wants to continue u=
sing
2 bytes alignment can continue to do so without further ado.

And anyone else who wants to switch alignment, can just do so.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
