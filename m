Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D51B644
	for <linux-m68k@vger.kernel.org>; Sat,  7 Jun 2025 15:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749309562; cv=none; b=GxXEHHvSdqIJ6/hp9KHAvD5dSdR06INb0/zlo/v5JPf6kFqTvHO96qQUzvSN1i0nG0IbPRdTXSkivf89WR6eZln+xTx+60wHsb4X9gAsIWoeIbbb5Do5VJygbj8xXqAvBctdHreDt23+BsfpG4FfkDHWyi9ayPl/N/CHmxfKdJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749309562; c=relaxed/simple;
	bh=mp38mzGVognm3jxqmcJY4rn+ukOwPAHDFd+o8H5txAo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FDJ+tfkgbfpbjSqfS57zkspfYvvWZ5RthAx8NQDjxExI6dYn53h/KQvlwNMOy0gGeM+J+XtgaWmWU2CBwavCEpuGWFGFLi/n6+MjcTo9qEKrhhCb3Co9c30jg4XfhzY01/3sogVj1W5AjmYU275bDhqS7YIJxG56XSgTrF6wanM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=kKm0gkf8; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="kKm0gkf8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=n5+50VHcnYBHGYq0AArZf3JwBqt9pvyF7Du105ASny0=; t=1749309560; x=1749914360; 
	b=kKm0gkf8oecLAw/5FKATYH1NnkwFCkJhmb0Rk7sjGc3W95HGc7qVLtDLb+2H82pbRBippZszo24
	raYUfE34ARocbQ+aJmuKkmV8tsXqavYIonZ9fudFi2bcweAlrj0f0zg++e48H8jOi4b3eggKAH9Fk
	gdIy/UExIVZQ2Y/5+f4HRAG8vLJ+v9QpUbdB4WNKN9BTaBIbqbZVMWtRfkWus9qmq5S8XHLygpT29
	GddovUPHL9zpDZvnjPDjfliXV9m925F6PMPJ7VvjLBgh3WjqxPWMGpZvaZB7nkHVV5r2lQzP3wbyW
	KelqWBXX3uSbA8Zp6SHGQLH72rsnHGeiMjtw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uNvKI-00000002DWp-3AKR; Sat, 07 Jun 2025 17:19:18 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uNvKI-00000003dzo-2FkJ; Sat, 07 Jun 2025 17:19:18 +0200
Message-ID: <1483007ddfcb164a5b1a5ccfcc053965af1a56bd.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Finn Thain <fthain@linux-m68k.org>, Geert Uytterhoeven	
 <geert@linux-m68k.org>, Jean-Michel Hautbois
 <jeanmichel.hautbois@yoseli.org>,  port-m68k <port-m68k@netbsd.org>,
 debian-68k <debian-68k@lists.debian.org>, linux-m68k	
 <linux-m68k@vger.kernel.org>
Date: Sat, 07 Jun 2025 17:19:17 +0200
In-Reply-To: <875xh7a91r.fsf@igel.home>
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
		<87sekbq3f8.fsf@linux-m68k.org>
		<2bd7d3370101b73288f9a1cd1b6eed0ba0da700e.camel@physik.fu-berlin.de>
		<87cybfaa74.fsf@igel.home>
		<cca30c2641b40815e58add6bebee3178896666a4.camel@physik.fu-berlin.de>
	 <875xh7a91r.fsf@igel.home>
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

On Sat, 2025-06-07 at 17:03 +0200, Andreas Schwab wrote:
> On Jun 07 2025, John Paul Adrian Glaubitz wrote:
>=20
> > you cannot change the ABI because that would change the ABI.
>=20
> That's the fundamental property of an ABI.

Not if the ABI was made-up by yourself ;-).

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
