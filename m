Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF9E19D06A
	for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 09:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750064855; cv=none; b=EKFcFBByyJZpY03/7zTZphBxFdOAd+5PvtzZo4Ri50xafqg2JFsTfhKOdJn3wLNMsq05bC+sMdLbwK+EkUS53SBYa+qoWI8GDwZNTWY7Wy9D/w8MHAOiKHuw8IbfLpHNdp6obNQX9A6Zt87XLrsZXLrxtmF89P46iP9lgMww+Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750064855; c=relaxed/simple;
	bh=phpwcR+sWs6GmEPImkk/0eqdzyjw+2Uvr3X0ezXCYzY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ELsntr4xSnI/oLxDZVIJrMC2qkZgSu9wIYqw+S0CUlcP4WDauLWsKnVgJIsFg3GbQCHmYCymIIduFVEv2t7jZDxp5Buh4CrAq3LrZU4m23+S48xsc33r6uLSC8kuNZ7GcG4Rg50kLZTJlTqAzHIdEk6HKjqHEubFy1zpbHBHd4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=HDNi3Bpz; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="HDNi3Bpz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eUjFNEGhHeroaqgoM5qRlPk+2+bj+221ICTnveQfNQs=; t=1750064852; x=1750669652; 
	b=HDNi3BpzeqQBElxEni3DdYdMRYqA/v+7b6KoPlnN9rKBoGaDw/o8fw3LXQfIUHQlRLc/PuKv4yJ
	SQL6EnLU5SRY5CgiPPh+y2yz/Ypode0WCR5e2Gzt6ChaM7Qs6seVS/+/fi/Q3XC6qxJdadXaexy/q
	gsxQSTX+SxcQBcQUJJt7YLlaB/IEmKjcIwSFfhD5wQI0YGHfxzD0FnqaufQURlxLG46PBIku+BQPC
	LwqMpLdjNV+XdKAE+PpV2LjmseLcbYZM8F07Pxe5TfBuEPkLv1lE6YYAgNZFZUaSwphig5o5tTXnT
	33A1oiQdVxSArWY85plFAn2d9l+ax4g1POww==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uR5oQ-00000002iVm-2tTG; Mon, 16 Jun 2025 11:07:30 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uR5oQ-00000003ywO-1rRz; Mon, 16 Jun 2025 11:07:30 +0200
Message-ID: <9ec81ad83f919dc617b4f9b5811c700418b3c0fc.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Laurent Vivier
	 <laurent@vivier.eu>
Cc: port-m68k <port-m68k@netbsd.org>, debian-68k
 <debian-68k@lists.debian.org>,  linux-m68k <linux-m68k@vger.kernel.org>
Date: Mon, 16 Jun 2025 11:07:29 +0200
In-Reply-To: <CAMuHMdUA9e4iLBdna3YPo8ng80q3F1KT7GH298_wgULPTdyE9A@mail.gmail.com>
References: 
	<ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
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
	 <479479a8-a315-4687-af2b-4fc0efed7a6b@vivier.eu>
	 <d7c6cb263b3ac949c842ca7cf483fbc7a0e032a5.camel@physik.fu-berlin.de>
	 <708ea8ed-c1b3-4f9a-83fe-af979bc194b1@vivier.eu>
	 <0cf54bd607a7926414d6c9a0350fe93898a235ce.camel@physik.fu-berlin.de>
	 <1960b583-2100-468e-8e1e-face3f7f10d6@vivier.eu>
	 <CAMuHMdUA9e4iLBdna3YPo8ng80q3F1KT7GH298_wgULPTdyE9A@mail.gmail.com>
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

On Mon, 2025-06-16 at 10:45 +0200, Geert Uytterhoeven wrote:
> The Linux kernel also knows m68k has an alignment of 2 bytes.

Yes, we have identified (some of) these parts yet. I suggested to add a
kernel option for m68k to allow 4 bytes alignment there.

> > > And yet it works without any problems so far. Please try the Gentoo c=
hroot yourself.
> >=20
> > Because most of the structures are correctly aligned by default, but
> > some of them not. You must run glibc test suite and LTP to be sure ther=
e
> > is no regression.
>=20
> Indeed.
>=20
> > In QEMU, alignment is defined here:
> >=20
> > include/user/abitypes.h
> >=20
> > for m68k the values to change are:
> >=20
> > #ifdef TARGET_M68K
> > #define ABI_INT_ALIGNMENT 2
> > #define ABI_LONG_ALIGNMENT 2
> > #define ABI_LLONG_ALIGNMENT 2
> > #endif
>=20
> Note that it also used to have:
>=20
>     #ifdef TARGET_CRIS
>     #define ABI_SHORT_ALIGNMENT 1
>     #define ABI_INT_ALIGNMENT 1
>     #define ABI_LONG_ALIGNMENT 1
>     #define ABI_LLONG_ALIGNMENT 1
>     #endif
>=20
> and still has:
>=20
>     #if (defined(TARGET_I386) && !defined(TARGET_X86_64)) \
>         || defined(TARGET_SH4) \
>         || defined(TARGET_OPENRISC) \
>         || defined(TARGET_MICROBLAZE) \
>         || defined(TARGET_NIOS2)
>     #define ABI_LLONG_ALIGNMENT 4
>     #endif
>=20
> which will probably become the next victim of the 64-bit little-endian
> natural-alignment monoculture...

Geert, I think this sentiment is not fair. As I we have previously discusse=
d, the
2 bytes alignment on Linux/m68k was never intended by the SysV ELF ABI desi=
gners
and it's based on a historical mistake.

I don't understand why it's considered to be such an unorthodox change to m=
ake
when even Commodore's own Amiga Unix uses 4 bytes alignment on the Amiga.

You know that I am the last person on the planet to lobby for deprecating o=
ld
and exotic architectures and ABIs. The motivation for this ABI change is th=
e
result of a decade-long frustration with alignment issues on Debian/m68k wh=
ich
I simply want to solve once and for all.

> > And there will be a problem with binfmt_misc because we can't rely on
> > the ELF signature to know which qemu-user to run, the one with 2byte
> > alignment or the one with 4byte alignment?
>=20
> Exactly.

We could use PT_NOTE [1] for this purpose.

Adrian

> [1] https://github.com/search?q=3Drepo%3Aqemu%2Fqemu%20PT_NOTE&type=3Dcod=
e

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
