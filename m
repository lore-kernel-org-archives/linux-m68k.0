Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32F7125B9
	for <linux-m68k@vger.kernel.org>; Fri, 13 Jun 2025 12:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749819124; cv=none; b=PmwQi8UhGyGZLbMsVRHP5s2zy0y8qu/fHHYXF93td6zdpt7jv3H7cZ6qLbNlwyccSw9uqpYcqY+pbtEEZZSs6IeabDmHHFzjqWpopncQtJXbv1vYF+Pyg3EGsxlGSFdZJ6ygTo83WilAyJh2/RyRUdV+2uS32zT7FbpiFeMyEZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749819124; c=relaxed/simple;
	bh=afrwGG/GH6t6lTWIRLVwgD5exftWXWIP37HeDRsNXyk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iJ4eT96VbkhWwq3Z1NSAQZYbVTBSN9SN5qyIQcYZPlAjmvZ0/rWFNFnwe9pDsVivKzzSW/jSVKVqrBHw+DotUxgbP2bkRYsTh0bGdZwesy0U8Xa/mePYvcxVQnmM/jEyuSyS02XwLc+4ay6mCkQOWHxzg6BncA1JbVoSeH/Q3fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=Nu0G7lCx; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="Nu0G7lCx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=b5N+4G+MmW6R4j+B1UtD9a3gHtngnyb4GXQKcINiDOo=; t=1749819122; x=1750423922; 
	b=Nu0G7lCxhdHl/gBPRkeET2j8c4ib7LC8kt3h3WSdCrJkY722IJJ3YxQG7T92zfMlSi6/oQg5Qeh
	zcILJWqcnmrGRdxRbi48Lu9YoSL/bFtsbWkQMsk2x7oaltjjp/zQpnF+PgNHWlWPnN4r4PbxCks+6
	RIt4cjNpi+hqP7XcOm9XjsSciPcIMGDpOl17BjWz0gynZJV9zvs2xJBtL1EizOA5nlMm/Xzl7cO8l
	9P0qaKGjyQo1LThjovubpxXYwQ2VkEwDS5Ed+p5wrYbpAQ+MdzJbhAr8eR3cPF8XUZGRc9ApyDs5b
	RanButsLU31Ife6e72czpdQLiu4TkVpq5r0Q==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uQ3t2-000000017IY-0VWQ; Fri, 13 Jun 2025 14:52:00 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uQ3t1-00000001zkf-3g2t; Fri, 13 Jun 2025 14:52:00 +0200
Message-ID: <ddef536e0645c9d7cebfd829837af653da50afaa.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@linux-m68k.org>, Jean-Michel Hautbois	
 <jeanmichel.hautbois@yoseli.org>, port-m68k <port-m68k@netbsd.org>,
 debian-68k	 <debian-68k@lists.debian.org>, linux-m68k
 <linux-m68k@vger.kernel.org>
Date: Fri, 13 Jun 2025 14:51:59 +0200
In-Reply-To: <CAMuHMdVFrrtMkn1LSV0t0Yxed1uiyjmovu=P9jfz8jWJViNNHQ@mail.gmail.com>
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

On Fri, 2025-06-13 at 14:30 +0200, Geert Uytterhoeven wrote:
> So you change the default alignment, bump all so-versions in userspace,
> but keep the kernel-userspace ABI the same by adding explicit alignment
> tags where needed? Old binaries keep on working, new binaries join
> the ecosystem of anything that still builds on 32-bit big-endian ;-)

I think you're still missing the part that I'm not maintaining my own Linux
distribution meaning that I cannot bump SO versions or making any substanti=
al
changes to the distributions.

And I'm not sure why being able to run old binaries on a retro-computing ar=
chitecture
is is so important for some people that they think it justifies making my l=
ife
miserable.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
