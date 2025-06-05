Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452E41F2C44
	for <linux-m68k@vger.kernel.org>; Thu,  5 Jun 2025 07:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749109006; cv=none; b=mt3cTMJks/HXM9KTv/GCCOg0eKtIu3YBP/3SAtfk+KfVoq3arE27hF/uJaO543zRpztMoqwhjxQKgg5PRFGfyh1nxspmyYCf5QVuzYGkGNsQC5rX+6b46L1ju5j7a9Mzdjck1LdT2bhFGUs0QEYyhAHijEid3D3X/PDKDRI5bJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749109006; c=relaxed/simple;
	bh=bJKn3DtmhRk9af5uh5N01zEJdzeFsm0P0Z1VHG9nJRI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YPlJ6/vd6IwJ/uy9QvXk+cK2IYmTS8gLqCV8Fau+q8b87h/ocbpBU+QwbcYDvRfqhg365JXlm3bi2fxK+g1ht/rqxRO6JmMvb8HvdwGVNU8Z2pSy63dHHti9G+sdDkWAD00niLslJ19PzaPTB8fv/3rn32HNSb9gDoxNdlT5Nyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=NpyCDQKd; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="NpyCDQKd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Wm6mU0r7pKhXJ/Hpbhmve7LlMCUPkcfIceMnKw0C0Ls=; t=1749109003; x=1749713803; 
	b=NpyCDQKdfHyOVVvE6BYselLnTgs+Pp1SyoD+HA0riScUMHFF9yTTMJbkBbVpsstwOk1K5Yw2aZo
	Zcys5eNXtgNVuWJ2Gon0VIp6dg2dhlTw90g/qAY1DwsmWaGkOk+DWo3KV8zml4LFBewion9TyXc+Z
	P+64fnRPcFvMBg0VMcwjwMQnwwMf82b3UB5sfYuC/Sgb1lklPlZv2ycu9QbIv0iObURsek0Cs3x1u
	j+KG23/MMcG6AQB4MEKKsP2SX/+7Wi9pliwDk1mKgmN0+E9nadaPlvWu7unh4A7CUGFwA+d2mhUtr
	0HC91VdUKWC0K7Y4mxuMfOK8+F4VKsYrV89w==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uN59U-000000007PY-1BxG; Thu, 05 Jun 2025 09:36:40 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uN59U-00000003RWG-0F22; Thu, 05 Jun 2025 09:36:40 +0200
Message-ID: <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, port-m68k	
 <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>,
 linux-m68k	 <linux-m68k@vger.kernel.org>
Date: Thu, 05 Jun 2025 09:36:39 +0200
In-Reply-To: <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
References: 
	<ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
	 <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>
	 <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>
	 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org>
	 <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
	 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
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

Hello Geert,

On Thu, 2025-06-05 at 09:16 +0200, Geert Uytterhoeven wrote:
> > Yes, please send a patch. I don't expect it to be accepted immediately,=
 but
> > it will help us spur a discussion on the necessary changes in the kerne=
l.
>=20
> It will be NAKed, because it would break the ABI.

No problem. We'll carry the patches downstream then. I'm not going to chang=
e
my mind about this because the alternative would be to just let the port di=
e.

> Thank you for providing solid evidence that changing the default
> alignment in the compiler will break the ABI, and is thus unacceptable.

And who cares about breaking the ABI in a retro-computing platform except
for the few people actively maintaining it? This argument only really makes
sense when talking about something that has commercial relevance or a relev=
ant
user base.

> (I wanted to test-compile all uapi headers to find differences, but
> ran into many headers not being self-contained, or causing conflicts).
>=20
> Feel free to start arch/m68k32/ to work around this ;-)

Nope, we're just going to carry patches downstream and I'll just ignore peo=
ple
that actively want to obstruct fixing a long-time problem on m68k with the =
weak
argument that it would break Linux binaries from 1993 running on a modern k=
ernel.

This isn't a use case I care about.

> BTW, looking into the history of __ADDR_BND_PKEY_PAD() (which is
> overkill on m68k, as __alignof__(void *) =3D 2, but might still be useful
> for anyone wanting to revive CRIS support ;-), I ran into Andreas'
> explanation why the minimal alignment is still 2 bytes:
> https://lore.kernel.org/all/87y3i442w1.fsf@linux-m68k.org/.

This post just proves that it's always a bad idea to keep historical burden
instead of fixing it.

Again, can you please bring up a convincing argument why it would be a hard
problem to break the ABI for Linux on 40-year-old hardware? And who would b=
e
affected by it?

The ABI isn't set in stone and if need to break it to fix fundamental probl=
ems,
then be it. They even broke the ABI on a production architecture (s390) bac=
k
in 2014 [1] and apparently we were all able to move on after this.

Adrian

> [1] https://lwn.net/Articles/605607/

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
