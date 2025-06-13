Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F671AF0A7
	for <linux-m68k@vger.kernel.org>; Fri, 13 Jun 2025 14:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826396; cv=none; b=kjdFZe9PxVdIJHtKsLtmoCfwl/fOXBM8vAd8txVWaIWr1mVUpneu44qrf0MTYnu2YVzcr5y83x5TcsIOxjgP4xAYud614yfD23+L6Wx2fMXCddD5c3l3jJnHZNajg2IKPyxNCZewQ492kENI0WmDKY1V/sAaM2qIRL6MunUTQdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826396; c=relaxed/simple;
	bh=02tnDcpinTTPoq5cmAmrMGrbGR0oleFeslBhctwfhEo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dY3rOQP9HZHXglpEqlS3xBges80gUs8MfuamF8xuAQ2WSoY533pgwYae6PPgPE5+6En8rKn4z851KWoT8FFuCcUtpj4BNC/+c081H7db9I6OpmAUwfGB019iqwGCCDvHL2OKs3fQYWrLH1TRpk7VqASsy92/p2W1EtrAwXn56oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=B6WulwVG; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="B6WulwVG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cmmZaBuA9X/kCEWvw/vzLtFNajCK0cY1mRP1ufrJZZs=; t=1749826393; x=1750431193; 
	b=B6WulwVGzLkEVDnP7KXOJdQ12yoto7u2icIhjFP9wGzv2KLY7Jsu6KIyIpGvzNed11Uwu3WWpvA
	nBa7+AL9JLR+8kX5U7ptsNtznfNu4+Ev/h99hHwnhFM8wHwNsor6kgFslWJm9XYOmucIfViCdzi1Z
	aB73y2Km+xMf81MFgcniZ6ugyYs0m2j7ekGKVakmKo44jpTBayMr1L3WBj6fSbq0hyciPD0psaMek
	yAHjSqgPnJnIjTXY7JHkQgh2zZG7Iv0m5v0ZgccBUF27GdLk/cLeCsMROX9pPFCk2agIknM7FFFyP
	agT9fUGwChG68lD8+hqqppXHNhj0yMLL99LQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uQ5mI-00000001oid-2XW9; Fri, 13 Jun 2025 16:53:10 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uQ5mI-00000002dyv-1TrA; Fri, 13 Jun 2025 16:53:10 +0200
Message-ID: <b2f74ffcd4c4a8aef248c21cd6deafcb92d86d37.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Eero Tamminen <oak@helsinkinet.fi>, Geert Uytterhoeven
	 <geert@linux-m68k.org>
Cc: Finn Thain <fthain@linux-m68k.org>, Jean-Michel Hautbois	
 <jeanmichel.hautbois@yoseli.org>, port-m68k <port-m68k@netbsd.org>,
 debian-68k	 <debian-68k@lists.debian.org>, linux-m68k
 <linux-m68k@vger.kernel.org>
Date: Fri, 13 Jun 2025 16:53:09 +0200
In-Reply-To: <569d73fb-8ad5-46f0-bf4c-568919f319e7@helsinkinet.fi>
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
	 <569d73fb-8ad5-46f0-bf4c-568919f319e7@helsinkinet.fi>
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

On Fri, 2025-06-13 at 17:15 +0300, Eero Tamminen wrote:
> Wouldn't next upgrade completely break user's Debian system so it needs=
=20
> complete re-install?

You would need to extract the glibc package manually from my tests. After t=
hat,
upgrading the system should be possible.

> If true, would separate m68k arch for 4-byte alignment be out of=20
> question, similarly how there have been different ARM arch variants?

Creating a separate arch would mean patching various parts of Debian which
again would involve a lot of work which I don't think is worth the effort.

I don't think the userbase is large enough to warrant all that work.

> PS. I was peripherally involved in the ARM VFP thing, in a Debian=20
> derivative that switched to use VFP before Debian did. So I know a bit=
=20
> how big thing such transition is, even with the Debian cross-compiling &=
=20
> boot-strapping support being much better now...

That's why I want to make a hard cut and not invest months of work when the
userbase consists of just a few people.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
