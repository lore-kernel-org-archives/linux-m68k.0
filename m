Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA7226AD0
	for <linux-m68k@vger.kernel.org>; Sun, 15 Jun 2025 08:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749975195; cv=none; b=YyMb2++HDnANbP8wF8nK8h+A9OSWGuYaWEj2sIzi0u+s7FPo7iI4wXsXLNB+57hPOMWuh/MNbPcOYbRIhcEdyrnrkVXZBxbMVo+0uaZsqg4vsxpmhM6TSdeOlH/xz5OynPEZuX1+WZJAr1funBP1QSbZAr/4Uu/1ZUmZT+LSVM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749975195; c=relaxed/simple;
	bh=eabwU5RBwOWkwdk7VPeCPN2gymdmoIq4hCGHjhsqK9s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DDY8o8eSE9/sjwELGecwD88WDDeLSguhvzbwka0rqampdGBckJJ/URKypgzD+3sxzfiI1C282qtg4hyLjwPjlpVJJX3T5R1+iqkVubkLu4tys0RCIDK8QKrU3/doAImJtOw9RWYIdE4u65N9S0TbBJ04S1vAQxn/TpMwHyspWoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=PbAubulU; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="PbAubulU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ppdG68mpf5blu5mDYSM8fBBYCCrnL3C4UIDgiojfGX0=; t=1749975192; x=1750579992; 
	b=PbAubulUswof1dlukfgob8wlRgwTkoTuBwUQsewXPLzTGEeqqJ9KAsM5AnT2bviKBbrHuiG6WUf
	dnaPysOjWIi+iisrrqrPz2egr4JzXdqMqC7vzVljdy+XBekFXGaLK4DOXVyfg9jRkiV/HE9QyF/rn
	PQY+90Yj9u+yehbXDThBs2hzolJ9qc81x+0zTg1J/OcRvgrDjMd0HAqbtLCnT8kpkZ780yFVWNAjn
	osBRglLa2aTOMfnxNoddWt9AobnFU70pQYnzE+A+w9gTyhIHbnHHACM174CsEx0761cmT4n1yacz3
	nQyB8fdDO2cumbtSqNxpe69LxgS5EF7rUArA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uQiUH-00000000Z4U-33Lh; Sun, 15 Jun 2025 10:13:09 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uQiUH-00000002zAq-2AwD; Sun, 15 Jun 2025 10:13:09 +0200
Message-ID: <5de0835e46f8c2479668fe5fe98f8e0d230cbfce.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Finn Thain <fthain@linux-m68k.org>
Cc: port-m68k <port-m68k@netbsd.org>, debian-68k
 <debian-68k@lists.debian.org>,  linux-m68k <linux-m68k@vger.kernel.org>
Date: Sun, 15 Jun 2025 10:13:08 +0200
In-Reply-To: <889f54af-2317-ee51-cea5-47d813683944@linux-m68k.org>
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

On Sun, 2025-06-15 at 11:42 +1000, Finn Thain wrote:
> On Sat, 14 Jun 2025, John Paul Adrian Glaubitz wrote:
>=20
> >=20
> > Sure, we can remove Python on m68k. But whether it will still be useful=
=20
> > after that remains a different question. I would argue we should rather=
=20
> > totally drop the port then because Linux without Python doesn't really=
=20
> > work these days.
> >=20
>=20
> https://lists.debian.org/debian-68k/2024/10/msg00042.html
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1105110

Honest question, Finn: Why are you even participating in this discussion wh=
en
you're neither willing to acknowledge the problem nor willing to help addre=
ss
it?

Do you think that you just need to bombard me with repeated statements that=
 I
am going to change my mind over something that I have chewed over for so lo=
ng?

I think everyone in this thread has now understood that you are neither wil=
ling
to help resolve these issues nor are you willing to accept my preferred sol=
ution
that Gentoo and I are already working on.

So, what's the deal with your continued engagement?

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
