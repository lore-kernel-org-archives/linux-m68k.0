Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3060F8460
	for <linux-m68k@vger.kernel.org>; Wed, 18 Jun 2025 09:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238201; cv=none; b=KUjaO01Y0RUKifZRdpKrWlcmy3aTHRIpesAF5I8DUnKN1Kw/1O1bobEq0CeT1W11Y7oVqhlgiNtEt/OMbu32C5BovwUn1DLqJeaYzQ1twomMM9kLozOhPpGK9Z7DsWU6BY6phUsULjDkR/vsF3ow8Pc5M3DNVTNsE6HahAqd79I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238201; c=relaxed/simple;
	bh=Rdbuis/jJSBBA6iL6bnB7xmlGEIQGTluIIWA6E0ldDw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o9YxAqONeMlkZPGDgJtAPxWII1xA3Hh8cN2JzewplFMSoi21ntxwKX6jj0Jrnm9fCY/0rhQeLMf44xLfiPEoncHcUMDNvREdbDOoauyJXT6pdzsariUQ3ThlmCHotfWMDkYhJgbGMbF6L0xRkO7fNfjQP0AyFYjNr0kVTE3y1iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=YLh1+BZy; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="YLh1+BZy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AeG0FS9eZnOEHvr31SE3VuHabhmaltRe/amt8NnIDxA=; t=1750238198; x=1750842998; 
	b=YLh1+BZyKsENFrGlXFOu3St8kYL5f+xIIhMAKVaZcY0hXxnQSZMYZavFZkJJkTrmLRnnYowlc3y
	RyGRhQz2HnWHHMCiw4WYDOAxxwQsKrNtvJiw2VHiCtbSjQjdJ7jV8E+UQiyPBjzFXf39mydAYdK7x
	aowG6zeH4ELvUPC2YkYnBQ7MoThE7msfwasvzbgLbq0xCLSco242yj30U17jrRHYn0s99NbxcsYc0
	EPvttLc0i6t/OpITCXpSlemexAKPtYqKw4lGlBPNOxJyKUdlqVKuRoCAGTo5Sdc7WEDp0Af5KYwlx
	Ly/UXTroa+sS9kdaEinRkhHNOhKx5SvjunXA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uRouK-00000003esK-1wrv; Wed, 18 Jun 2025 11:16:36 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uRouK-00000003KYp-0z8F; Wed, 18 Jun 2025 11:16:36 +0200
Message-ID: <4c0581c5baccf73e96e53d755e70b57b23ba1da4.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Finn Thain <fthain@linux-m68k.org>
Cc: port-m68k <port-m68k@netbsd.org>, debian-68k
 <debian-68k@lists.debian.org>,  linux-m68k <linux-m68k@vger.kernel.org>
Date: Wed, 18 Jun 2025 11:16:35 +0200
In-Reply-To: <8eb87c55-95c2-0c73-4941-6e8732266220@linux-m68k.org>
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
	 <0b09dcea10c9bab4a50b2599ef8ac59b89f09b3e.camel@physik.fu-berlin.de>
	 <8eb87c55-95c2-0c73-4941-6e8732266220@linux-m68k.org>
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

On Wed, 2025-06-18 at 13:50 +1000, Finn Thain wrote:
> > How is messing with a hobbyist project "harmful" in any way? That makes=
=20
> > no sense.
> >=20
>=20
> If your port was a pure hobbyist project, you would never have brought=
=20
> your complaint to the upstream mailing lists, where developers have to=
=20
> work with ALL interested parties and make the necessary compromises.

Can you list ALL interested parties, please?

I only know about Gentoo and Debian and both want to make the switch.

> But, as usual, you're trying to have it both ways. You pretend that wipin=
g=20
> wiping your slate clean and starting over doesn't impact anyone else. But=
=20
> then you complain when the upstream projects don't care to invest effort=
=20
> into your scheme.

Again, can you list the other downstream projects that would be affected an=
d
that oppose this change? Please come with actual evidence instead of just
remaining vague.

> The way to find a compromise is to build the thing you need, and then, if=
=20
> any of it is found to be useful upstream, send patches! That's how this=
=20
> process has always worked, has it not?

I have never denied that. The problem here is that I started a discussion t=
o
resolve a longstanding problem with the m68k port and you immediately start=
ed
shooting at it instead of trying to work something out together.

> Moreover, to the extent that those patches get merged, we will have the=
=20
> beginnings of a second ABI with a second tuple. To the extend that those=
=20
> patches get rejected, you will have a fork on your hands.

I won't have a problem with maintaining the fork. As I have repeatedly said=
,
the Gentoo people are working on the same change, so it's more like the ups=
tream
developers that would exclude themselves.

> So, some upstream developers will have to support both ABIs (for them,=
=20
> you've just created work). Other developers will have to choose between=
=20
> either one (for them, you've just make collaboration more difficult).

You're again being vague. You talk about Linux/m68k as if there were dozens
of downstream distributions and projects when there is in fact just Debian
and Gentoo which both, as I have said countless times now, want to make the
switch.

So, I have no idea what these other mystical downstream projects should be.

> This is a lose/lose proposition. And if you think I'm wrong about that,=
=20
> please just send patches and demonstrate why.

I have received multiple messages now, off- and on-list, from users that ar=
e
supporting my efforts as they see the value in making software more useful
to users instead of just insisting on adhering to a broken ABI that no one
really cares about anymore in the year 2025.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
