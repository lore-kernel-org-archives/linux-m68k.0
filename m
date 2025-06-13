Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF1F2DA756
	for <linux-m68k@vger.kernel.org>; Fri, 13 Jun 2025 12:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749817407; cv=none; b=iYSQ5b6VPhybmMnfsLm4cRzIA01SQXFFcc1rnaShvsNhhNx6DYg1HLCCIPTpmnTI2jcjJEbKDywsdg4teIlEQdaYP/kbsUgoGR6TxYFDXj5H+ItB1eU1B2p0afJA2lUzBDlzUjBdHZVGs2YrsZ5AxkubLavpl/mT2isKRzrazhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749817407; c=relaxed/simple;
	bh=TQayTd6nuFRQk6Wxl8EBeuebmYjI+Zdg7hYmc80h/bg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FuAmVw+WgRYdEBWxVhdE/skMNOYo560lfRYhr3xlfPm6ZlyhSZso7yStN4CzELijFOzy2UwqD0mh9Gto1zm3afkzL0LbB4qIFGpFCfn6ClndAUf083aOsMsKmP1hhJCyBYHtRxXsAPZmGXbIRLSA/hxSfAv5iNNWN1nefxEy674=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=WMsCVgIO; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="WMsCVgIO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sP5wVb/YQox/cQpd7Toh6e/Cuvg15fBxDRHRFUNm71w=; t=1749817405; x=1750422205; 
	b=WMsCVgIOS74e8w+0OD+GiU4mMlfpZVp7V0NinEOks6Ji7ccTAgmuZ8mD1XGQJIaHa/DVckTcvxK
	86VHvZbYBAFhZtduRfHaxXk7GdgGTaT7qq0e7839yLRTEtcBJbjCVCQC1jqf3OflRacIdyGYy2lUO
	BeC9c82efpj4EjCWqg1PJJDIiWejsD8/owK361LR0S2yZACfjTvdh9N+eHnfK2r6ZgC+G7+IclewP
	0hrjfEfJVxCX1rzF0Cr+oFlR5bNSubsKFcFJrT852yQK/z5h/EuMZRjOSmOj1pUBzGtc34VOYqsmI
	GQh1e2mrkau8rTLpfmIVvJaowIDhsLVr4fIw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uQ3RL-00000000xXi-0c6a; Fri, 13 Jun 2025 14:23:23 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uQ3RK-00000001pK5-3rgn; Fri, 13 Jun 2025 14:23:23 +0200
Message-ID: <49a62eda6aea856df248aa223365b5230020d829.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@linux-m68k.org>, Jean-Michel Hautbois	
 <jeanmichel.hautbois@yoseli.org>, port-m68k <port-m68k@netbsd.org>,
 debian-68k	 <debian-68k@lists.debian.org>, linux-m68k
 <linux-m68k@vger.kernel.org>
Date: Fri, 13 Jun 2025 14:23:22 +0200
In-Reply-To: <CAMuHMdWFb2kBpEBV3PQuwyCoCDBsANZobTSccrEog7j_dcBF2Q@mail.gmail.com>
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

On Fri, 2025-06-13 at 14:09 +0200, Geert Uytterhoeven wrote:
> You mean Python is broken, as it makes assumptions that are not
> guaranteed by the C standard (oops, which one? ;-) ? ;-)

Not just Python but a lot of packages which I have listed here:

https://wiki.debian.org/M68k/Alignment

This does not even cover the transitive dependencies.

> Lots of older packages used to build fine on much more obscure systems
> than Linux/m68k.  Unfortunately people stopped caring for anything
> not 64-bit little endian.  Yes, I know saying that doesn't help...

Yes, *used* to work. But that's past tense.

> > What is your suggested alternative? Do you expect me to patch broken pa=
ckages
> > into all eternity? If keeping 2 bytes alignment ABI is so important to =
so many
> > people, I would expect proponents to come up with solutions.
> >=20
> > So far, I haven't seen any. Just arguments why my approach is wrong.
>=20
> You are completely ignoring the last sentence I wrote...

Because I am *extremely* tired of people heckling this discussion without *=
helping* me.

I have had multiple moments where I thought to just throw this all into the=
 bin, turn
off the buildds and deleting the m68k archives because it's really hurting =
my sanity.

I am fully aware that this change breaks the existing ABI. However, as I ex=
plained before,
changing the default alignment to 4 bytes is the *only* way to keep this po=
rt alive in the
long term and anyone who is interested in this port should either agree wit=
h me or present
a suitable alternative to me. The latter still has not happened yet.

Continuing discussion about possible performance hits like Eero or moving g=
oal posts like
Finn is not going to address this problem. Rather, it's just making me feel=
 worse and questioning
my life decisions.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
