Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27E72E2EF5
	for <linux-m68k@vger.kernel.org>; Fri, 13 Jun 2025 11:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749813166; cv=none; b=Q8Hme1DPqI9zISw1OBxvwEtfKB7F06gZfweZI6UQ98zZkmAXTUbdSUDHYysKFoQUR53rvpyzvrjHLbDdOGm9/DnMGLyyegAZsEFccFa2JtYO+obUbm0Qgr951RSF0U4xW0AiN0j8XdklwdqzaMu/AeukaFuG0kwm4X6Aus8UND8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749813166; c=relaxed/simple;
	bh=8UKMGKNsJuI09lyRxSmk6LvUwbleOXOoi57a76uHwIk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aJsHwjA+krON+0UiqqUHttywcA6a5o7mtFgrc+kYHWJLrFfg2Em4cEqe/UTMGE8bnEZK9gRsKu4gHDqA3PFjZLOy9p/ZvsVRuugCx7Ps2+rPRyIHZK7L5uXLF0auUVs2ooPnV3IFR9AtP4UArDiFc3yfO22J4o+bCLXpP2Ugpbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=TFPSEgyi; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="TFPSEgyi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YIvRTDTNHftJDQi7ASQf/6iD9A1kqBYT7dEYBniF7j0=; t=1749813161; x=1750417961; 
	b=TFPSEgyi8r13pHT2gDYVtxo8p6IvLI2oms5FBrtePAkFfBsHu462kNna9OevT7Yo/aT69xa73oY
	vXTCv/2gajJGhx7QtJxGdR6nlOz3MVW0BgqaXvknECiZdrmIaB7jrcpcOFmFaLixzenJXj2v9pexz
	svUZWHjUb7x4H7FxcxBYwaChuZ6yj3rekqMjmzp+YhP98oDvXc+PJv94FQXiex0Vc16d8yNb4rKzU
	GeUwRahEv//2bziNoIs47ECQfpDPYY/t+z6EML/pb4vj2M5yMJNJAA99W9QptENSmqNtLKsGw+/HQ
	GnM5ti5tkFaWSVxNYIKn78tfqziyIjsJK2kw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uQ2Km-00000000XRs-1FuR; Fri, 13 Jun 2025 13:12:32 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uQ2Km-00000001B9b-0Kg8; Fri, 13 Jun 2025 13:12:32 +0200
Message-ID: <f80022175fe5dfac2ab03b577c887edda0d87326.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Eero Tamminen <oak@helsinkinet.fi>, Finn Thain <fthain@linux-m68k.org>
Cc: Stan Johnson <userm57@yahoo.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>,  Jean-Michel Hautbois
 <jeanmichel.hautbois@yoseli.org>, port-m68k <port-m68k@netbsd.org>,
 debian-68k	 <debian-68k@lists.debian.org>, linux-m68k
 <linux-m68k@vger.kernel.org>
Date: Fri, 13 Jun 2025 13:12:31 +0200
In-Reply-To: <241380f5-6c75-423e-829b-400161b020bc@helsinkinet.fi>
References: 
	<ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
	 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org>
	 <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
	 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
	 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
	 <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org>
	 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
	 <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org>
	 <48af5d8ed5b1546cb3db3b2c2314b1e41de38aad.camel@physik.fu-berlin.de>
	 <0d7b5c87-f0f7-70a4-cf75-5147e67904da@yahoo.com>
	 <131b33a26efd2b0e21dfee784821dcaf3aeddad4.camel@physik.fu-berlin.de>
	 <6a50c81a-cb0c-4529-959a-fad5260261fc@helsinkinet.fi>
	 <ea1aecf0f20b5466f63b3c6e671d1d29c81dfd87.camel@physik.fu-berlin.de>
	 <243529d0-daac-48b9-b482-04e3ed2f66f0@helsinkinet.fi>
	 <d3a8ab8a-3be5-8f04-8b7c-07ff7e103e35@linux-m68k.org>
	 <241380f5-6c75-423e-829b-400161b020bc@helsinkinet.fi>
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

On Fri, 2025-06-13 at 13:56 +0300, Eero Tamminen wrote:
> On 13.6.2025 4.36, Finn Thain wrote:
> > And therein lies the rub -- to identify those workloads which should be
> > measured and to afford each one a suitable weight in your decision maki=
ng.
>=20
> It's not just workload affecting the results; compiler version,=20
> optimization options [1], workload & kernel config options and sometimes=
=20
> even unrelated code changes [2], can affect how given instruction=20
> sequence settles into cache.
>=20
>=20
>  > That's why this was always political.
>=20
> I'd rather keep things technical and fact-based.
>=20
> Whatever testing is done, the one wider conclusion that *can* be drawn=
=20
> from it, is that if there's a noticeable performance difference, such=20
> differences are possible also in other workloads.
>=20
> (Very large difference could indicate also functional issues, e.g. bug=
=20
> in given compiler build code generation.  That's why it's important to=
=20
> have good tooling for pinpointing what exactly is causing the difference.=
)

Even if that was the case - which it certainly isn't - code that is slower =
and
working is better than code that does not work at all.

Both you and Finn still seem to miss the point that the current 2 bytes ali=
gnment
path is a dead end and neither you nor Finn have made any substantial contr=
ibutions
to keep this path alive.

If you want to keep this path, roll back your sleeves and get to work.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
