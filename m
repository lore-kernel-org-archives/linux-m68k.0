Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8531D618C
	for <linux-m68k@vger.kernel.org>; Sat, 14 Jun 2025 07:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749885715; cv=none; b=Ummm3cI2iQjdtL9Khg72ACucsfeXH4eItNMmGMJuFLPp2zgq/o2Z8UCRJp9PQSQPMrKrN034kEWGs/nItExq0ppTkrxcNvLu5A+ixqkhThtrqPNViI+66Y9H+ubY0G3YO8FxquZtp4hcxcJjNNV4FYPjNSM0nj4f+WTIr3A35+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749885715; c=relaxed/simple;
	bh=+ZiFaLke+V93ksqPG0cvtZRujQ7GoKRBtuBVhF9SwRQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i6iJ9GpGsHYUP0eZBOT5kmsojySXystYWKB9461IKS5L9iq/c+DSxDYUDWBJ9Np3VZ2ws6bp9uQDryOxV/9wNkj2RfP3KVReRVgr0b9mUULj1ubMMrbV/DmOAJj0If6au07PJwtgQENX9vyjuoNt537NJ9Y9mRIRlSUV4g5xjhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=odtWS+KQ; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="odtWS+KQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sCKlgC0yi+QT6Ngkq+GYaeQsj/fCg5kql1VJtQRM6Pc=; t=1749885711; x=1750490511; 
	b=odtWS+KQfZtl/8GmwYiDcB5d78/kLgJaoQnsTn+t5gmQNlGUcX1543OUj426XKY/x4IdZZyPD5f
	sVEWIu3slzXtUnMSpZfBeU7GiaauTOcQ+XJDfMzZ6+qZTRv3K5F0corXMosVdg1yczygyhkizU5Ym
	yv33MUagND5uzIft5LPW6jRtnNFiwJAvVBjAdn7ptCK+DkaSC2bWRJU0HloyvS7MOBPn0a400N50B
	CRz9SVEYICAA7cBSRSE8Lk3DbNEtSAzD75uHrbwPgCzUtB5K3Wlm3oJ24QJfS28o3fcnP81emA5Gg
	VquL2x1UEZlvBzZqe7o8jWU4hZLWBKK//iag==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uQLD1-00000000i60-3oXI; Sat, 14 Jun 2025 09:21:47 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uQLD1-00000003dZn-2t1v; Sat, 14 Jun 2025 09:21:47 +0200
Message-ID: <5d8619dfe4134319b558684209f2b89c5c1447cf.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Laurent Vivier <laurent@vivier.eu>, Eero Tamminen <oak@helsinkinet.fi>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@linux-m68k.org>, Jean-Michel Hautbois	
 <jeanmichel.hautbois@yoseli.org>, port-m68k <port-m68k@netbsd.org>,
 debian-68k	 <debian-68k@lists.debian.org>, linux-m68k
 <linux-m68k@vger.kernel.org>
Date: Sat, 14 Jun 2025 09:21:47 +0200
In-Reply-To: <022ab204-7be9-4f6a-a92f-2601fae1f146@vivier.eu>
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

On Fri, 2025-06-13 at 17:24 +0200, Laurent Vivier wrote:
> A stupid question: is this possible to remove from debian the packets=20
> that are broken?
> (I'm sorry if you already answered to this question).

Sure, we can remove Python on m68k. But whether it will still be useful
after that remains a different question. I would argue we should rather
totally drop the port then because Linux without Python doesn't really
work these days.

> Because I'm afraid that changing the ABI could cause more problems than=
=20
> it solves.

For what exact reason? NetBSD/m68k runs with 4 bytes alignment.
Why shouldn't this work for Linux?

And I have bootstrapped Debian/m68k using rebootstrap with 4 bytes alignmen=
t
without any problems. If you think there are problems with 4 bytes alignmen=
t,
I would like to see them reported.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
