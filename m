Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E56420127B
	for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 09:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750064411; cv=none; b=l4LMZcjZIKYpQ1RE4+q1kPU+t73i0tf9aNuuwctR3clZ5Hhx75EVvdQE0AbR5HAuPncC81I+5SNNCYidqgv6lROgZkpN0bxTtlIgvlZlUMPlqbBl7avxWzcQY+LclCM23YHcgCWF012+KxSIhcGT3/NuHb9SNUlzd9kOXPWW3cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750064411; c=relaxed/simple;
	bh=dvVgV+rHZXNvK9hKqqRHixh2F+LQQzRyB85pMYSM7zM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pH/rS9KdjC0Ks62OFNh90w4XSG7RlUN8BOdbfNBzWU+3/Ks1Zm1SAJZakBvMJTQ7FeV3YWyeFYG7rURT6pqK6P2ds8WcIuGoAyL4hUmFgYxNzRLsWsyMrN5emoCiLLNCflIvJUBGOydl7b7HKBIQFCIXmxQCM1AHO99gtFkF5y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=hzOJwFHh; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="hzOJwFHh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pQmOXOGSTwkaGrmqSeugju40bvC9Ah+qx93VdI18RBQ=; t=1750064408; x=1750669208; 
	b=hzOJwFHhoY83UaBfRL7uVtMh0QMqToDOSvp11sJ68Rn+mgLrprEGFxL8jnq03k3y2qf65V8ZBRh
	NNGLRqFbuTU5hslKcx3nePceN/ccDIbJwBAR+W2t2jumLs+mC1dPzc6KOwsOkGvIEczkix8OfQ+lR
	i1HLKOcHg6ghEyzb/Fw5Rinw7jM4YmRsT1J97V1Os+OPGay+nCdP4UN5CG0bTy9kYVWMqtPjy951W
	D5tYWhSylrzYTBZJFjWiJQEtm754LE/PR6sYRgdWt/ayW/gK/quIwgmaDdzy4AcRLV01asK5olpTz
	2QkeCcHGO5bhCgAzVvqNmDgOg3JjT5G685Vg==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uR5hG-00000002ekZ-2tWD; Mon, 16 Jun 2025 11:00:06 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uR5hG-00000003xbe-223R; Mon, 16 Jun 2025 11:00:06 +0200
Message-ID: <5d8b1560fb29bec6d56ff6d8aafb4931a7079b63.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Laurent Vivier <laurent@vivier.eu>
Cc: port-m68k <port-m68k@netbsd.org>, debian-68k
 <debian-68k@lists.debian.org>,  linux-m68k <linux-m68k@vger.kernel.org>
Date: Mon, 16 Jun 2025 11:00:05 +0200
In-Reply-To: <1960b583-2100-468e-8e1e-face3f7f10d6@vivier.eu>
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

On Mon, 2025-06-16 at 10:32 +0200, Laurent Vivier wrote:
> Because most of the structures are correctly aligned by default, but=20
> some of them not. You must run glibc test suite and LTP to be sure there=
=20
> is no regression.

Good suggestion, thanks!

> In QEMU, alignment is defined here:
>=20
> include/user/abitypes.h
>=20
> for m68k the values to change are:
>=20
> #ifdef TARGET_M68K
> #define ABI_INT_ALIGNMENT 2
> #define ABI_LONG_ALIGNMENT 2
> #define ABI_LLONG_ALIGNMENT 2
> #endif

Thanks, this is very valuable input!

> And there will be a problem with binfmt_misc because we can't rely on=20
> the ELF signature to know which qemu-user to run, the one with 2byte=20
> alignment or the one with 4byte alignment?

What about the ELF note [1] that David Brownlee suggested? Can these be use=
d?

Adrian

> [1] https://www.netbsd.org/docs/kernel/elf-notes.html

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
