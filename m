Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E37F7263F
	for <linux-m68k@vger.kernel.org>; Fri, 13 Jun 2025 13:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749819610; cv=none; b=j1dnG0myaAn0WyF4LsyGNqx/Zl/kiGZup4eLD+dpy0ea/+9hX5D4w08Mg3dLORD0uDh6pj6BAphhdirQZd4GJOri4NUdke5iPIKRCQlggpZKD4L7yZYTYbzzyvVMVlLMRBI0hVw6NKmJ3Ue97C2jQ/fqoemaZqRVsgLIGyOWL24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749819610; c=relaxed/simple;
	bh=yToYlDE8LlzfPFp52wQiVsEoptopUzncbL3bA1jTOiQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I8SGqDTTSNy+X/JfVy93v8PiQjmbC+CZropdF4rsjzqwhBFeJKE5euD4cFRnT8KcWA4/XD/2/Si/SrlMouKlsHi5mXGcgmOiNY0Koee8OzztxVEIfAOa/sil1XRTNpvUHJYUFGyphradVAVEOf7XnHkDUXUe5OeNOBOGPAropk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=bc0GGlSL; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="bc0GGlSL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JiGDz9Ek5pLIX8LYDfjZAJnMn8DMjkHv+R+T8CdOMwU=; t=1749819607; x=1750424407; 
	b=bc0GGlSLywoC9EokMhbtk9vHERp/icTSYYR4iAE5vsQ1oLiQGny/HnNZH4aZevrnj1Uicg7f8nJ
	XBLX2qY+L7RoDgmmpqw9K6YmFYNEWqirOIX1pTr+We78TcS212H8c1npO2AvdbcR5FUjV/WKlAx/D
	GfXdNH6sitaug58Wbcuqb67ovMUopjRG67Befddzh3w4YG0oat4z/dM0RnZ6iazhKw5jhw9BlIKNe
	4Ug9TmZ4SpjkNiD8E7ME6dvjIjKTku3U304TODOJ1UbQTi0umbgW/oUho5T5ux+s2yM3LoJHTPV4P
	HSEwSMsCCXhyd1yUiYENCNIoPpW+F40agN4g==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uQ40r-00000001BGr-3SyA; Fri, 13 Jun 2025 15:00:05 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uQ40r-000000022Xw-2Y8z; Fri, 13 Jun 2025 15:00:05 +0200
Message-ID: <3e499af848b28c640334f329010d3d45c0b12c95.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@linux-m68k.org>, Jean-Michel Hautbois	
 <jeanmichel.hautbois@yoseli.org>, port-m68k <port-m68k@netbsd.org>,
 debian-68k	 <debian-68k@lists.debian.org>, linux-m68k
 <linux-m68k@vger.kernel.org>
Date: Fri, 13 Jun 2025 15:00:05 +0200
In-Reply-To: <ddef536e0645c9d7cebfd829837af653da50afaa.camel@physik.fu-berlin.de>
References: 
	<ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
		 <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>
		 <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>
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

On Fri, 2025-06-13 at 14:51 +0200, John Paul Adrian Glaubitz wrote:
> On Fri, 2025-06-13 at 14:30 +0200, Geert Uytterhoeven wrote:
> > So you change the default alignment, bump all so-versions in userspace,
> > but keep the kernel-userspace ABI the same by adding explicit alignment
> > tags where needed? Old binaries keep on working, new binaries join
> > the ecosystem of anything that still builds on 32-bit big-endian ;-)
>=20
> I think you're still missing the part that I'm not maintaining my own Lin=
ux
> distribution meaning that I cannot bump SO versions or making any substan=
tial
> changes to the distributions.

To make this perfectly clear: The whole point about making this change is t=
o *not*
having to roll my own Linux distribution for Linux/m68k. I'm building vanil=
la Debian
on m68k which means that I *don't* want to make any changes to the distribu=
tion as
I simply do not have any control over this.

Do you expect that I can go to the glibc project and ask them to bump the A=
BI version
from 6 to 7 because some people think it's extremely important to be able t=
o run a 1993
Linux binary an Amiga running a Debian unstable snapshot from 2025.

I really don't understand why anyone can make such a suggestion and think "=
Yeah, that's
completely reasonable to do. Let's completely change half of the Debian dis=
tribution so
we don't break the ABI on Debian/m68k for binaries from 1993."

Flipping the switch to 4 bytes alignment will allow me to build vanilla Deb=
ian without
having to patch dozens of package to make them build on m68k. I want to hav=
e less work,
not more.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
