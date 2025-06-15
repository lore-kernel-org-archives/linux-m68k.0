Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB6326AD0
	for <linux-m68k@vger.kernel.org>; Sun, 15 Jun 2025 08:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749974753; cv=none; b=e+x9E6F9cN6WdmV7u2IsxFNyPWBAFGT7ARsR/j8wYGRtZ0VXvxptjKKPwhZxbwictmBqS79EMbBk1CQMsld5tc98J8/baZr92qj5E/iaqO9I62Z+qzP/EUwcnWZRnwecXH0356iw9tEUR5iZfqDWEGODxGK0hd5t33FLo9NyE9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749974753; c=relaxed/simple;
	bh=EBqcjLNDDuoZ1+LxizqiNZHRmuqy39QhgCnwuW2yCfk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B7soBHAOxYTYB1MrEW6+dh8VWOJ+aOPdPLOSHdnNzsoSGskz5RSFoPfyBFa7ZdbqgY3rpe9Z6bZjAx9TIoXHhex4XbFo8TsVzibhTQPu0KJc/vkwaXgS9FW/KJRsrJuqE+ZgE2GDnGgjLOczulLsQFK4NJn84a+RkqyFCpmsnXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=V04q/i3h; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="V04q/i3h"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tlOAsz+UUuAJjwiO3EDse+SFDbHJ26EWkffU6YoyiSw=; t=1749974749; x=1750579549; 
	b=V04q/i3h1hyTzDZxNWV0ttyrA17je0CAh0le1MDowDfwcN2ReQw6HOyPizAjSBjAU7rPJuUr/d7
	fszmlDWF4D2QX/zsZzSwKacYHjoOeCeNSlT19XyNfjbHCXX8upyOIaa2Zl/PuUSeaavgWmHSq4n60
	Hr7UL5Hi271X0yUg40ElbwZa/WwFDOUTF8G+I5WlldK6jNqSryG0T4y3SszZiaRHhtLw/hfSzWAzC
	SwJsRMsx1Pcqu6HPRhQ8xrK/SdBxCE8IibZyerenq7UhkoxsEYyYqps0DEiEkyD73zTy6PstfKDi8
	feb5b3KyzAsPgaNryZ+EpWZW4EzXZgcC2vsw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uQiN1-00000000XTZ-1fiJ; Sun, 15 Jun 2025 10:05:39 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uQiN1-00000002yDN-0lh7; Sun, 15 Jun 2025 10:05:39 +0200
Message-ID: <e2d9840cbfb8b90ff928a9702629af07c64c3bdc.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: John Klos <john@klos.com>
Cc: port-m68k <port-m68k@netbsd.org>, debian-68k
 <debian-68k@lists.debian.org>,  linux-m68k <linux-m68k@vger.kernel.org>
Date: Sun, 15 Jun 2025 10:05:38 +0200
In-Reply-To: <d4096687-0f2b-2e64-124d-b2a45578ba16@daisy.zia.io>
References: 
	<ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
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
	 <8ccde8667a0d1e005756723af21eebd610868acd.camel@physik.fu-berlin.de>
	 <edea4668-e052-4071-b307-c3d199108f5d@helsinkinet.fi>
	 <d4096687-0f2b-2e64-124d-b2a45578ba16@daisy.zia.io>
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

On Sat, 2025-06-14 at 11:20 +0000, John Klos wrote:
> > I don't see in above dir e.g. LLVM or Qt, which were in the Debian 2-by=
te=20
> > alignment problems list:
> > 	 https://wiki.debian.org/M68k/Alignment
>=20
> Our package lists include as much as could be built in a given quarter.=
=20
> The current quarter has, for example, llvm and clang:
>=20
> https://cdn.netbsd.org/pub/pkgsrc/packages/NetBSD/m68k/10.0_2025Q1/All/

It's great to see that all the effort that went into LLVM on m68k is materi=
alizing
on NetBSD. Thanks for sharing this <3.

> > Are those in some other place, do they have other problems besides the =
2-byte=20
> > alignment, or am I just blind?
> >=20
> > (Many other less relevant packages from that Debian list seem also to b=
e=20
> > missing from that NetBSD dir.)
>=20
> There are reports which include build failures that will be available onc=
e=20
> the quarter is over, but the primary reason packages you might expect to=
=20
> be there aren't is simply the speed of our build machines.

Please post them on the port-m68k mailing list once they become available.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
