Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D76D1CF5C6
	for <linux-m68k@vger.kernel.org>; Sat, 14 Jun 2025 07:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749887473; cv=none; b=VvL/yZvHZQeyir38cHbcdE8jnkZz+t+QDQBAKXWWwoNgoL3N+ZoxWPKFUBLPcwsjqfra1H68qU5q1eJyysE4I6edmRwXoaEjJMkkb/qh0PwJPiwkISaBRyqEiOkrCIJAokvOK9iAx+b2CsJEkpAaoN3Wsq6b2v7Pl4zFonMdxY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749887473; c=relaxed/simple;
	bh=ySGPN+CMw48oRSLDyAmsB0CEbtZRXprtasCfeAOMK+E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CTgLD5li58H89s7yz8cZxKHk/qxU41MFCnWTk0yOgQre38JHrxBtB5lV7mVoNCH+WQRslYIxJ8dR1jZkAcXyUWG7Gk6bWehhxZr8WhTn2ueXav1jA3Aykow+C8YKTP4Ps0CUhq8xg0WrrPNkPqxitarfHXlc7B24yBNVB1ZyaTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=XiofopGQ; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="XiofopGQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=a8G2AZTtr/16Xfao8CNP/miNKjIHp/HAv9174/PhoDY=; t=1749887470; x=1750492270; 
	b=XiofopGQIL3kPeEGqSXngwT0vkM8bITYyQMZdWi7PpfZHB3e09apVfuTkL+/SaoVaAkWrdp9K67
	81jRya5OcX/lj+5NYC145fpxlKDy/iJVjIp6HB2fHldcQru1dfERKqkNcJ8NokxSgpR79le5nQvsy
	YbvIzN8hPEI5qLrUtbFbaOZ9P0PFd71ISEgpZWbIvt5niPyAKiddbROLzyR6HKcFsEqqNidPL98y8
	bYFNyL2rPc3uXJwD+ZWgVZrqjv+qUVrSB3ED6LJP97dRMqTusrocIdXQS4cYS64kBKziBsH06u6rG
	dpjocyUC9ZTcQrjPmpBnzBmOuntMKYg9Re8A==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uQLfO-00000000nvi-48D6; Sat, 14 Jun 2025 09:51:07 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uQLfO-00000003m5C-2x5S; Sat, 14 Jun 2025 09:51:06 +0200
Message-ID: <8ccde8667a0d1e005756723af21eebd610868acd.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Eero Tamminen <oak@helsinkinet.fi>, Geert Uytterhoeven
	 <geert@linux-m68k.org>
Cc: Finn Thain <fthain@linux-m68k.org>, Jean-Michel Hautbois	
 <jeanmichel.hautbois@yoseli.org>, port-m68k <port-m68k@netbsd.org>,
 debian-68k	 <debian-68k@lists.debian.org>, linux-m68k
 <linux-m68k@vger.kernel.org>
Date: Sat, 14 Jun 2025 09:51:06 +0200
In-Reply-To: <86c91d1c-cfc6-44c9-8883-d9ae46c3f4c3@helsinkinet.fi>
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
	 <86c91d1c-cfc6-44c9-8883-d9ae46c3f4c3@helsinkinet.fi>
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

On Fri, 2025-06-13 at 22:29 +0300, Eero Tamminen wrote:
> I think quite a bit more binaries than just Glibc are needed for Debian=
=20
> upgrade tooling to work, but OK.

I have already performed tests with 4 bytes alignment, same applies to
the Gentoo developers.

I assume you have done your tests as well so far? What are your results?

> As to other potential issues...
>=20
> I assume there are no m68k port packages with closed source executable=
=20
> code (FW) [1], like the other architectures (esp. x86) have & need, and=
=20
> that any code intended to work also on non-m68k platform, should be fine=
=20
> with 4-byte alignment.
>=20
> But what about m68k specific C/C++ and assembly code that may hard-code=
=20
> 2-byte alignment assumptions; is there any tooling to detect (potential)=
=20
> alignment issues in those?

Here's a list of almost 6000 software packages that build fine on m68k with
4 bytes alignment:

https://cdn.netbsd.org/pub/pkgsrc/packages/NetBSD/m68k/9.0_2023Q4/All/

> Or is the plan just to rely on packages' self-tests to reveal issues,=20
> and then track them down from there?

I will fix these problems as they occur meaning I will just do what I did
before with the 2 bytes alignment failures.

> [1] Are sources for "bootstra.tos" & "amiboot" anywhere, in case they=20
> need updates:
> https://wiki.debian.org/M68k/Installing
> https://people.debian.org/~wouter/d-i/images/20130502-06:51/tools/atari/
> https://people.debian.org/~wouter/d-i/images/20130502-06:51/tools/amiga/
> ?

I don't think these would need to be updated but this can be tested.

> >=20
> Are there any statistics on how many Debian packages do (still) include=
=20
> m68k assembly?

I don't expect anything outside glibc, the kernel and GCC to use assembly
on m68k. And even if, the fact that the NetBSD people don't have to patch
everything to work with 4 bytes shows that there is nothing to worry about.

I am planning to rebuild and test the whole archive first anyway before
actually making the switch. I'm also monitoring what the Gentoo folks are
doing.

> If that number is limited enough, it could help in getting other people=
=20
> to review the assembly code for potential alignment issues...
>=20
> Glibc is likely on top of that list (but also most likely to be=20
> alignment neutral):
> 	glibc$ find -name '*.S' | grep m68k | wc -l
> 	25
>=20
> As *BSD already uses 4-byte alignment, I assume that for packages=20
> containing m68k assembly that do support / work also on *BSD in addition=
=20
> to Linux, m68k asm code used on both should work fine, and one needs to=
=20
> review only m68k asm that differs on Linux.

Exactly my point. It works on NetBSD, so I'm not worried about Linux.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
