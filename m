Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605791DE4F6
	for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 06:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750056178; cv=none; b=CoBosoOKiYbnyXbYWKVX3PxP8G4LLgCgO4gYsdl4Ao6H9g0C1IluzvEl0Z/UX2WGRoVukyGphfKkcfuLRz89ReCiSGk/XmKQPFEhVrT1CB3jgeoCVjN8qjnA3vwbBP37yXxkslhwXF1BSbFbFSZsD07ROkF4HOC0LYftlfLlUgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750056178; c=relaxed/simple;
	bh=UQUgJC7Vu8oTflH/7wWeZCnmjVaiQ6FDQNXCKGqOfFc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oXLpJ1xNiD2+aFU+1hWa2a5hoOKKTLm2PPdPl8WC4UWDOfc+cshdSYwRlkJhm1ii1zIPEcAG8noG/iTxYtcAtHzAGHqH6szhqySl8UY8+JoDZ+o6WkkdwmG/BuMxJm736KQU7siExIbp4WR6bVOpkpwU50wluWuwKZmVkm0D6Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=MZnB9NT+; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="MZnB9NT+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Yy74COGESJnh84VsMxOwsS89hxKbG7R9N2b3zCar9xA=; t=1750056175; x=1750660975; 
	b=MZnB9NT+vxtpQ7hPj9iJ3LvZKLfhPGhRyc4S0Q+0mbKhl0a3Ot/Um4O8tUsGyA4Okn6U80vMU14
	jEHZxikTFKN8Hhh7xb7qGpPPuxTkzfGzkZb3viQfXxAi4jKWED/P5kckHT7EiHDq73jc3WrGEDKvM
	rN+B1qu+UxsJJbn+B1w8doQyiAmxzC+1AUvWfFv8B6DU3/JanzuOnlymzX2mm+0mCx7xtUiYb9Q0N
	k7PJHUkrC0vTjVY6ZNJo7/ttN14TR9NNEOhtC/fgZd0b2ySQHPsJ2EJb3OPAY18OCHSKkDANtfLlQ
	M6Sf5yvEch+OJEvrkQ8CwNn0MsEegLIG9ONw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uR3YS-00000001Vmw-00qe; Mon, 16 Jun 2025 08:42:52 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uR3YR-00000003NSE-3TPS; Mon, 16 Jun 2025 08:42:51 +0200
Message-ID: <04c583405de666d61b545a9879d94a209654412d.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Eero Tamminen
	 <oak@helsinkinet.fi>
Cc: Finn Thain <fthain@linux-m68k.org>, Jean-Michel Hautbois	
 <jeanmichel.hautbois@yoseli.org>, port-m68k <port-m68k@netbsd.org>,
 debian-68k	 <debian-68k@lists.debian.org>, linux-m68k
 <linux-m68k@vger.kernel.org>
Date: Mon, 16 Jun 2025 08:42:51 +0200
In-Reply-To: <CAMuHMdVL5mWGstzyik11iHyoBf-mUtwnPiCLM12qurGjHYSbkw@mail.gmail.com>
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
	 <CAMuHMdVL5mWGstzyik11iHyoBf-mUtwnPiCLM12qurGjHYSbkw@mail.gmail.com>
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

On Sun, 2025-06-15 at 11:32 +0200, Geert Uytterhoeven wrote:
> This is one of my worries, too.
> The Debian package archive is much larger than the NetBSD one...

Debian builds currently around 11000 source packages on m68k, NetBSD builds
around 6000 packages. However, keep in mind that Debian as quite more Pytho=
n
Ruby and Perl packages than NetBSD and packages them all individually.

Pythob, Ruby and Perl packages don't play any role in this discussion, exce=
pt
for those which embed C/C++ or Rust code. However, these will actually run
better with 4 bytes alignment.

Adrian
>=20

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
