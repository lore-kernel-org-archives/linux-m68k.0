Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5CC1DFD9A
	for <linux-m68k@vger.kernel.org>; Wed, 13 Nov 2024 12:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731502058; cv=none; b=Aut1H8vrVXpitVwS4v179hHWvuxbHHe5OVuVRIOW3obP8ByIqRleRvXzWnOJSopDRlXO9sJbLQangrPgbJ+kxf+bNiEI61FWn9eQXjq173mf67VA51Y5oGrl2JR1M72euRZMZgPxZfNBpDeESA5g8rpHg+14IQquOWPdKHajptk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731502058; c=relaxed/simple;
	bh=wNyJYUYKgsRxcX0LqLniw45YKeCCNKfyb/Ww4+yUh3A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XV0Csk0D1zVoX0KcKHcakjZUhmmBR4I/EEu8vc8Nz+s/7BZqTs8GWZvlVxtHbZxuoq8pyZdcf7rr1QlKGWKaDb7E1uL6Su/Y7AXDvlvDZ+/UoVbkLxIcyiYDdF0JgckMPQYCaXG1KqS1vm0aTZSYPw+txUmwdi17N+AMQaSxN60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=lzIwj3B8; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="lzIwj3B8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FyRyMiCPwnLxdd67wOr41F7AZewX6LqEFtvNNvDu+7I=; t=1731502053; x=1732106853; 
	b=lzIwj3B8dNz9ZA0P5Eoy484jkPLcaO3OJ7BYif+3cskAAtAhWBil0zzv5IvfsgW6ngwyP3W5Aq3
	Cee5CCtkf5q27i2SfTR5BdTQuIf9A8nwy1ZKQDchsviq6T6XOUWH8H/Gx+obt0S06tMQwyDwoZH7I
	xiLrm4/p8vye5d0zl1vPYLuTBdmkIkGyGfS5U/palRX/HLwjRKLlQ4EJxXdIkLo+pNHSlWKywCha5
	e8WLk80kTkgVMp2MwJMKq4Pe2XEdI7xs3Ty5xlIf6tEMxy6T10nsYAJB7PEQB+ZeIEoJQ+vBUTPRH
	dHQ35KQNv3oVPplUf8Ch/ZdykjRvrlI1+t/g==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1tBCmP-00000003VoO-2Fym; Wed, 13 Nov 2024 13:47:29 +0100
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1tBCmP-000000009T8-1HFm; Wed, 13 Nov 2024 13:47:29 +0100
Message-ID: <fe38ec560bae0f0a824f86aa9b9db8855498377e.camel@physik.fu-berlin.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Finn Thain <fthain@linux-m68k.org>
Cc: linux-m68k <linux-m68k@vger.kernel.org>, debian-68k	
 <debian-68k@lists.debian.org>, James Le Cuirot <chewi@aura-online.co.uk>, 
 Sam James <sam@gentoo.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andreas Schwab	 <schwab@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>,
 Thorsten Glaser	 <tg@mirbsd.de>
Date: Wed, 13 Nov 2024 13:47:28 +0100
In-Reply-To: <0c23bc71-d0ff-eec8-1251-29b8517e2229@linux-m68k.org>
References: 
	<3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
	   <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org>
	  <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de>
	  <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org>
	 <762f5be0aec0c50b2589ebbd60c6d104f9871526.camel@physik.fu-berlin.de>
	 <0c23bc71-d0ff-eec8-1251-29b8517e2229@linux-m68k.org>
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

On Mon, 2024-10-28 at 19:29 +1100, Finn Thain wrote:
> On Mon, 28 Oct 2024, John Paul Adrian Glaubitz wrote:
>=20
> > >=20
> > > That seems to imply that someone requires that those packages are=20
> > > ported. But without a bug report from such a user, to say the package=
=20
> > > is broken or missing, one must question the real requirement.
> >=20
> > People have tried this in the past and it was an endless effort. It's=
=20
> > not that it hasn't been tried. And there is zero chance that any of=20
> > these projects accept such patches to support unusual alignment.
> >=20
>=20
> Then don't leave it to chance.

What is supposed to mean? Are you implying that I never tried to address th=
is?

Did you have a try at fixing any of these?

> > Why does my word not count here? It's not that this problem is new.
> >=20
>=20
> Your opinion does not count here because the question was about upstream=
=20
> patch refusals. I'm genuinely interested to see the patch reviews. After=
=20
> all, many alignment patches have already been merged.

Of course my opinion counts here because I am doing the majority of the wor=
k
on Debian m68k these days.

> Without being able to see the actual response from upstream developers, I=
=20
> can only assume that they have either misunderstood the issue or they hav=
e=20
> simply decided their users would not be served by an m68k port. Do you=
=20
> agree that upstream developers generally know their users requirements=
=20
> better than distros do?

Again, this has been tried in the past and I'm tired of discussing this.

This kind of discussion doesn't really help resolving this problem.

> > You can also ask Andreas who maintained openSUSE on m68k for a while an=
d=20
> > had to carry lots of local patches.
> >=20
> > > If upstream QT or Java developers decide that their software is "not=
=20
> > > for us", they may well have a point. Those packages are not installed=
=20
> > > on my m68k systems, FWIW.
> >=20
> > This is isn't just about runtime dependencies but also build=20
> > dependencies which is why I linked the statistics page in Debian. A lot=
=20
> > of packages in Debian/m68k can currently not be built because they have=
=20
> > a transitive dependency on Rust, OpenJDK, Qt, GNOME and so on.
> >=20
>=20
> That's one reason why source distros are a better fit for small systems=
=20
> than binary distros are. You can't fix this basic problem with an ABI=20
> change.

Gentoo has the same problem with Linux m68k and they want to perform the sw=
itch
as well. So it's not just my personal opinion here.

> > > OTOH, as I've said before, if upstream developers (like Arnd) are=20
> > > looking ahead to 128-bit platforms then they will be paying attention=
=20
> > > to alignment rules. They should be inclined to favour explicit struct=
=20
> > > definitions over implicit alignment, don't you think?
> >=20
> > Debian just transitioned all of their 32-bit architectures to time64_t=
=20
> > except for i386. Do you know why they did that even though 128-bit CPUs=
=20
> > are practically around the corner?
> >=20
>=20
> Perhaps they have explained their actions? Do you have an opinion?

My opinion is that people expect 32-bit targets to not dissolve in thin air
in 2038. The fact that i386 was not touch is simply because of the huge
library of pre-compiled software for the platform which doesn't exist in
that form on m68k. So that's not an argument to switch the natural alignmen=
t.

> > > > I understand that this might be a painful transition, but I don't=
=20
> > > > see any other way to keep the m68k port alive in the foreseeable=
=20
> > > > future unless we fix this problem which keeps blocking the port.
> > > >=20
> > > > You can see how the Debian m68k port has been falling behind becaus=
e=20
> > > > of the alignment issues in these statistics:=20
> > > > https://buildd.debian.org/stats/graph-ports-big.png
> > > >=20
> > >=20
> > > I could imagine a viable transition to a new ABI driven by widespread=
=20
> > > user demand or involvement. But not by distro stats or maintainer=20
> > > preference.
> >=20
> > Well, I'm doing the work, so I get to make the decisions here, no?
> >=20
>=20
> Sure. Please refer to my previous email about the m68k ABI du jour and=
=20
> fragmentation.

What fragmentation? The vast majority of people interested in this architec=
ture
want to progress and not keep the status quo forever. And the switch is sim=
ply
inevitable which is why Chewi has pitched a proposal on this list as well.

> > > Absent the right conditions, perhaps it is best focus limited porter=
=20
> > > and developer effort on patching only those packages that are really=
=20
> > > required.
> >=20
> > Thanks, but I tried that and it doesn't work. I don't want to continue=
=20
> > spending hours on trying to figure out how to fix alignment problems an=
d=20
> > then maybe send an email here and there to just never get an answer.
> >=20
> > You're somehow implying that I'm requesting this change because I'm jus=
t=20
> > lazy.
> >=20
>=20
> You're somehow twisting my words into a slur. You know that I value your=
=20
> alignment patches because I've said so before. Thanks again for your=20
> efforts.

Look, the problem is that this is a) an endless effort and b) in some cases
simply not feasible. Codebases like LLVM are completely built around a natu=
ral
alignment of at least four bytes and it's simply impossible to work around
that.

There are so many other things I would like to work on and I simply conside=
r
it a waste of time and resources to work on the same problem over and over
again just because we cannot agree on finally fixing the underlying issue.

As of now, Debian/m68k will miss the transition to Python 3.13 because the
new version requires 4-byte alignment and absolutely no one is willing to
help me fix this issue.

All I'm getting is "wise" advise on the quality of "Have you tried turning =
it
off and on again?".

Endlessly frustrated,

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
