Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A892B15A86B
	for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 07:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750059096; cv=none; b=beEE/FDhauFl67nWuYKBv9tkK8ukvIXURCQdwWehYuzAYR8CNA2PEhGScjqyhzrRlN633jqP/BtRLNkRZJdUQzKUBCEkr+oDTh5AFDp5LULSgb8FDKaZNvWKR+dCTvMhJ0B0sBZ297CV4fejJHxQ10VoiBRwlkLE1dUq13HO1Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750059096; c=relaxed/simple;
	bh=U5HvpeKkhSN0b1W43bbDPQ4CiVjdTqBOtQt2wv5PPRs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UZXfAWvLYJCbtYXz1dttTEz3+VYHx09r2R5gBIekQ3rg5/C3v0aww+J5n1HN9jeZz+Q5mMFiUePbAQtx9LLYy/dF4+3F4g9OCdU8R9yFUrwX7KuW8hFzkNlVmAGDrkcGhtNU1RMMa2/cxTJ7CxYn3tzYlpEktaUxdc/XCQit54U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=Rhmg2ieM; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="Rhmg2ieM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5uYTNKlTaVe/Gh8TSmGWoUvVyTywMvoHfKoaBTIQpaA=; t=1750059093; x=1750663893; 
	b=Rhmg2ieMVQQgU6jKnUkpzKJqV3/xIp3gIp6bfnphp+uWH413mRclhdhElR1Ye8bSCkNW+UHRex/
	A369ZwEagrnVR7OmShDfOKS5+gHmZQU8uL4dAYhTXzFA/gLpBH5t0UxC/voypAt126a0ZHUkznDN5
	h5uR/2zHyHczcGOu4fYExuJZrNA+RsHd2Qi0KpgvP+vqC+QCJq2s8kuuUS6NGGimWjxUhY3DuHdVK
	I8IZ/hy/5BUrX1MPjdPj0PKmgGnvV37bYDFH5jXhmrfAdAtIWMvECyjOMb5RTxODleZH+tY5Lrrya
	H0md2QcxZxQsOb9CkPaa71QB6jY7tDW6Pj2Q==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uR4JX-00000001tBg-2XOl; Mon, 16 Jun 2025 09:31:31 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uR4JX-00000003aGn-1bHT; Mon, 16 Jun 2025 09:31:31 +0200
Message-ID: <0b09dcea10c9bab4a50b2599ef8ac59b89f09b3e.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Finn Thain <fthain@linux-m68k.org>
Cc: port-m68k <port-m68k@netbsd.org>, debian-68k
 <debian-68k@lists.debian.org>,  linux-m68k <linux-m68k@vger.kernel.org>
Date: Mon, 16 Jun 2025 09:31:30 +0200
In-Reply-To: <d3c2060c-f2ea-f80d-2462-d3dba29950c2@linux-m68k.org>
References: 
	<ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
	   <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org>
	   <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
	   <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
	   <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
	   <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org>
	   <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
	   <CAMuHMdUACa7Z-BV077H+G0Hd=mTBqLw7VdshbYCixeVtsuHYeg@mail.gmail.com>
	   <6e6f8e27ff90ce3f8535fc4f5c57049c59a9b227.camel@physik.fu-berlin.de>
	   <CAMuHMdWFb2kBpEBV3PQuwyCoCDBsANZobTSccrEog7j_dcBF2Q@mail.gmail.com>
	   <49a62eda6aea856df248aa223365b5230020d829.camel@physik.fu-berlin.de>
	   <CAMuHMdVFrrtMkn1LSV0t0Yxed1uiyjmovu=P9jfz8jWJViNNHQ@mail.gmail.com>
	   <ddef536e0645c9d7cebfd829837af653da50afaa.camel@physik.fu-berlin.de>
	   <569d73fb-8ad5-46f0-bf4c-568919f319e7@helsinkinet.fi>
	   <b2f74ffcd4c4a8aef248c21cd6deafcb92d86d37.camel@physik.fu-berlin.de>
	   <022ab204-7be9-4f6a-a92f-2601fae1f146@vivier.eu>
	  <5d8619dfe4134319b558684209f2b89c5c1447cf.camel@physik.fu-berlin.de>
	  <889f54af-2317-ee51-cea5-47d813683944@linux-m68k.org>
	 <5de0835e46f8c2479668fe5fe98f8e0d230cbfce.camel@physik.fu-berlin.de>
	 <d3c2060c-f2ea-f80d-2462-d3dba29950c2@linux-m68k.org>
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

On Sun, 2025-06-15 at 19:30 +1000, Finn Thain wrote:
> > Honest question, Finn: Why are you even participating in this discussio=
n=20
> > when you're neither willing to acknowledge the problem nor willing to=
=20
> > help address it?
> >=20
>=20
> You and I don't discuss much; you ignore most of what I've said, then tel=
l=20
> me that what I said is off-topic. LOL.

That's because you are not even willing to understand my motivation for the
change and immediately dismiss it altogether without bringing up any suitab=
le
alternatives.

John Klos wrote up an excellent reply to one of your many messages where he
refuted any of the arguments you brought up. Please read his reply if you
haven't done so yet.

> > Do you think that you just need to bombard me with repeated statements=
=20
> > that I am going to change my mind over something that I have chewed ove=
r=20
> > for so long?
> >=20
>=20
> You're quite right, I need to stop responding to repeated nonsense -- I=
=20
> will quit it.

OK.

> > I think everyone in this thread has now understood that you are neither=
=20
> > willing to help resolve these issues nor are you willing to accept my=
=20
> > preferred solution that Gentoo and I are already working on.
> >=20
>=20
> I've no idea who "everyone" is... but I'm speaking both to those=20
> participating in this thread and to those who know better.

And it's naturally only those who share your standpoint that know better,
completely ignoring that both NetBSD and Gentoo have already gone the
4 bytes alignment path or are working on it.

> As for "unwilling to help", I help where I see a need.

Then what's the point in engaging in this discussion? Do you just want to m=
ake
people feel bad? Or keep them from being productive? I don't understand you=
r
motivation.

You say that you don't want to support the work to address this problem but
at the same time keep heckling the discussion telling me that I'm all wrong=
.

> As for solutions, well, you have one, but you'd create more problems than=
=20
> you'd solve.
>=20
> > So, what's the deal with your continued engagement?
> >=20
>=20
> I'm not here to stop you exercising whatever power you've garnered over=
=20
> whatever domain you've claimed. (No wonder you're baffled by my presence.=
)

I don't need to claim the domain of Debian/m68k when there is no one else w=
ho
is willing to work on it. I'm not sure what's supposed to be controversial
about the idea that the person who does the work gets to decide how they do
it.

> I'm here to bell the cat. What you're doing is harmful. Forking the=20
> packages that make up your distribution is harmful and so is fragmenting=
=20
> the ABI.

I'm not forking any packages, I am rebuilding the source code with differen=
t
compiler settings. Forking would be changing the source which is the exact
thing that I want to avoid since most Debian and upstream maintainers don't
want to bother with intrusive changes for a hobbyist platform.

And I have no clue why you think it's harmful to make such changes to a pla=
tform
that no one is using anywhere for serious purposes. Anyone who installs Lin=
ux/m68k
these days does that because they want to play around with old computers, n=
ot because
they want to do serious work.

How is messing with a hobbyist project "harmful" in any way? That makes no =
sense.

> You can't improve Debian by refusing to acknowledge it's limitations.

There are no limitations in Debian. The limitations are on the currently us=
ed ABI
on Linux/m68k. And the fact that even Gentoo is making the switch to 4 byte=
s alignment,
something that you seem to have missed in this whole discussion, should tel=
l you that
this isn't a Debian-only problem.

> You can't improve the Debian experience by railroading users.

I have received public and private messages from several Debian/m68k users =
that told
me they trust me in my decision making and thanked me for my countless effo=
rt to keep
these ports alive.

> You can't improve upstream codebases by papering over their mistakes.

You're missing the point. You are still naive enough to think that there is=
 any chance
to fix all of these affected packages upstream. It's simply not feasible an=
d we have
to live with it.

> You can't improve collaboration by ignoring the advice of upstream toolch=
ain and=20
> kernel developers.

What collaboration? Where is the active input from kernel and toolchain dev=
elopers
on Debian/m68k? It's a hobbyist project that I am mostly running on my own.

> You can't have a stable ABI without consensus.

A stable ABI that is broken. On a hobbyist project.

> You can't improve the long term prospects for the Linux/m68k project unti=
l you=20
> understood how it got to where it was when you arrived.

That's sentimental thinking. I'm not here to create a legend. I'm here to w=
ork
on a hobbyist project. You are completely blowing this out of proportion.

> So to answer your fine question, Adrian, I continue to engage out of hope=
=20
> that you will finally realize that there are better ways to serve the=20
> community than the path you're on.

Please just re-read what John Klos wrote to you and realize that it's not m=
e who
is unwilling to actively engage to help improve the situation.

PS: At least the Python issue got fixed [1], so thanks for that.

Adrian

> [1] https://github.com/python/cpython/pull/135209

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
