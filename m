Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44B7269823
	for <linux-m68k@vger.kernel.org>; Mon, 19 May 2025 08:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747644191; cv=none; b=AdkJyms2mjyStsip1DVGQS1FzOSI0AL4sMOFBrxYEOhgjOv5OZo44NKy6KyiTQvDqqlekAC/X4pucRXQUKMSNlBFGXO6BS8PMF8COkdmzODg6kygnANRumszdI2OjIMCRWZpZpp8Adjuyd7HXvXf6Gl9otACg4S7JKQrEgt8ArE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747644191; c=relaxed/simple;
	bh=iP/F/7JpvtiVY66yBuoiIEVbMYJxJvWqTSecgRJ2bPo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nIGMrMvRBrDD8KTAODmSccMaWD1XIRyigDOH1QtQ95LCzOiEf7ToE4hNzGh10tO0gAPD1S38YfLAYQy8Sf5E28JVPd9Zh6iRsCG4AvWMF9gxmkJYKsfWQtNGPSqkpTR6b9sN3+9FmBzfb9npRbL4MZ3JC17k6x04CtkD4s1Nl64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=Pxy3eZKj; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="Pxy3eZKj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ts5jRVIJ4rCUnALmV2hu9+ZrnxpKYC0l2+cZy65l+Os=; t=1747644189; x=1748248989; 
	b=Pxy3eZKjoyAbf+i9ipNH77iSdyYilTrWtZ30LSVnn//LcfgW7H2/M2XZsAHUTXbXm0Hpo6546Do
	ZPB5HmJv4Iz/TqWbcqDsK7ucDZKHkD64+ObR2rM2MSX7p3P/5H5NeofiOH9LD9xocgPlZ9doXW0PT
	T2cnUtjj/QSz5p3CYFxkD6CVITEt9AlkVew7Ui9ZkmlU1U5pFPSBPWNarsiJw6IUZMYtJQ/GROV4k
	IU6b8t6pKsSvmc0QpUgMOpxz4/Didh9+WSkRlga1mb3Ejq1v3LNUgKz2Sk9fMvbiC7DTOkDqQvV0n
	Q+lt5gMbSXt0lPixkTV0AW7zqeyJe+EjM2Uw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uGw5R-00000004Bch-1H5J; Mon, 19 May 2025 10:43:05 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uGw5R-000000031hJ-0GRa; Mon, 19 May 2025 10:43:05 +0200
Message-ID: <ddbed621ab2743ed0fc4262d1b30cfae805f5904.camel@physik.fu-berlin.de>
Subject: Re: Tuple and changes for m68k with -malign-int
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Antonio Vargas Gonzalez	
 <windenntw@gmail.com>, James Le Cuirot <chewi@aura-online.co.uk>, 
	libc-help@sourceware.org, debian-68k <debian-68k@lists.debian.org>,
 linux-m68k	 <linux-m68k@vger.kernel.org>
Date: Mon, 19 May 2025 10:43:04 +0200
In-Reply-To: <CAMuHMdU72u0iMnkivD-SXe3o1QCsKHLwjtHCeqR+XpRsCn444w@mail.gmail.com>
References: 
	<e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
	 <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
	 <CA+OL9jj_s3ek-_4fp5b5uq-Fxmdu3NpenW10RWkiPX8Jtmxq=A@mail.gmail.com>
	 <ab38d00426f3a0be1d312d969ebc747a569ebc74.camel@physik.fu-berlin.de>
	 <CAMuHMdURQAf=iQxwPh57_Xj-TO_cnqH=eNPKvYDv41o8SgJLKQ@mail.gmail.com>
	 <75c912630ade4e05af08eab9584c6f56d7c0ca1f.camel@physik.fu-berlin.de>
	 <mvm4ixhf2nj.fsf@linux-m68k.org>
	 <08f471d5cb51ed0fe5a3eb64fad088f3072d4784.camel@physik.fu-berlin.de>
	 <CAMuHMdU72u0iMnkivD-SXe3o1QCsKHLwjtHCeqR+XpRsCn444w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Geert,

On Mon, 2025-05-19 at 10:25 +0200, Geert Uytterhoeven wrote:
> On Mon, 19 May 2025 at 10:18, John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de> wrote:
> > On Mon, 2025-05-19 at 10:03 +0200, Andreas Schwab wrote:
> > > On Mai 19 2025, John Paul Adrian Glaubitz wrote:
> > >=20
> > > > Good idea. I will do that. My assumption is that on Linux, GCC deve=
lopers
> > > > actually just forgot to switch alignment from 2 to 4 bytes with the=
 switch
> > > > to ELF unlike NetBSD.
> > >=20
> > > The Linux developers care about backward compatilibity.
> >=20
> > That makes no sense though as a.out and ELF binaries are not compatible=
, are they?
>=20
> The syscall ABI is.

Fair enough. But a.out is long gone now and anyone who runs Linux/m68k thes=
e days does
that as a hobbyist. I think that the advantages of fixing several dozens of=
 alignment
bugs once and for all hugely outweighs the disadvantage of breaking compati=
bility with
old binaries.

If I understand correctly, there was an (unintended) ABI break on Linux/s39=
0 as well
and it seems that it was not reverted [1]. Maybe someone involved in this d=
iscussion
from back then can comment.

Adrian

> [1] https://lwn.net/Articles/605607/

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
