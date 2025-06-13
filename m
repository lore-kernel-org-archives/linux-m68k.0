Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F562D23BA
	for <linux-m68k@vger.kernel.org>; Fri, 13 Jun 2025 11:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749813779; cv=none; b=sGFpj9+MtdvRz78JHOSNIdGZ3cFbVj8UwU/0kWKMgrujJPN9XZOVwbWcMhROCTwtuYIjUt8pIUbt6sNFuubEFpBdW4x3vD0ZE3mnLDw/ittEAA+vbEPxNxC5EcrF3tuECzcXPffnplER7MabOCOYJv6hwGT4XyRuZaGO61ewzTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749813779; c=relaxed/simple;
	bh=GhDpqgllzYG4agbLdJOBcPjfGnF8gNMYRmNDIoiSETQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=esRv/Y/QsloktssG8XCGXMGHVu/2sTfMi7NvxAdvmhzA4wpMGxTouR1op1D6iwTtb3jAzWQRJGDD451Jo5Ilqcyy0XbfCQkXhVc0xMULqCx/YNX7ThEOvgI3OqljMbZ2apfWXq0CC3eS4sAG3VVLy6AMU5mm7Q3fI3cQnLE/vKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=Rd/AV+cD; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="Rd/AV+cD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GBpchiGbBw1kLtrkFGMUOuxsdxvuxXA9u1fa1miPeiE=; t=1749813777; x=1750418577; 
	b=Rd/AV+cD7smTHm4ICCvmStWH+CvJZKyq8sIlHXYxYdjySgjmblvfUiwD4gspPqq8KEYgNlpnS+b
	Jq747Hbbyeq8Pscju4lJSzuQQcK5XQ4w3psQxdU66ODkxsE/iuOjmaiOe489CUeJID+mHUXt3SZeL
	dTtkHa2KXz4hKQM9RLxJrfQrETJhWWGzdp56RjdXio0LhCPkZhoHWjqfFt2vKkUUJ4DAtykCQimfG
	EvLQTg+jD8BdOZo86vAGWlLOJ/Au5TuuCWn6qt/KfwyXuESGqe6mgWp7ryIZn7XBv6FU28W4cSKkQ
	JQvLH5FSSkNrb1C2keuAZewy0LMERWusBB7A==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uQ2Un-00000000b9D-3ePv; Fri, 13 Jun 2025 13:22:53 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uQ2Un-00000001QAl-2aIx; Fri, 13 Jun 2025 13:22:53 +0200
Message-ID: <6c9b49aaab26bd7fda7a95e7e0c5392b26abbcb4.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Eero Tamminen <oak@helsinkinet.fi>, Stan Johnson <userm57@yahoo.com>
Cc: Finn Thain <fthain@linux-m68k.org>, Geert Uytterhoeven	
 <geert@linux-m68k.org>, Jean-Michel Hautbois
 <jeanmichel.hautbois@yoseli.org>,  port-m68k <port-m68k@netbsd.org>,
 debian-68k <debian-68k@lists.debian.org>, linux-m68k	
 <linux-m68k@vger.kernel.org>
Date: Fri, 13 Jun 2025 13:22:52 +0200
In-Reply-To: <243529d0-daac-48b9-b482-04e3ed2f66f0@helsinkinet.fi>
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
	 <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org>
	 <48af5d8ed5b1546cb3db3b2c2314b1e41de38aad.camel@physik.fu-berlin.de>
	 <0d7b5c87-f0f7-70a4-cf75-5147e67904da@yahoo.com>
	 <131b33a26efd2b0e21dfee784821dcaf3aeddad4.camel@physik.fu-berlin.de>
	 <6a50c81a-cb0c-4529-959a-fad5260261fc@helsinkinet.fi>
	 <ea1aecf0f20b5466f63b3c6e671d1d29c81dfd87.camel@physik.fu-berlin.de>
	 <243529d0-daac-48b9-b482-04e3ed2f66f0@helsinkinet.fi>
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

On Thu, 2025-06-12 at 17:54 +0300, Eero Tamminen wrote:
> Unsubstantiated performance claims are no good.  I was offering help in=
=20
> substantiating them.

You're not offering help. You, like Finn as well, are trying to block fixin=
g
a long-standing problem of Linux/m68k without offering any sustainable alte=
rnatives
to fix this problem.

> If perf improves, that's validation for the performance argument. If=20
> performance impact is insignificant, that's proof against claims of=20
> 4-byte alignment decreasing performance.

Performance was never the main argument. The main argument was unbreaking
the port. You are moving goal posts which is an indicator that you're not
interested in leading a fair and unbiased discussion.

> (Linux kernel has general "no ABI changes, as long as ABI has users"=20
> policy, so verified arguments like above might help sway kernel=20
> maintainers to help with potential 4-byte alignment issues.)

NetBSD has been building several thousand packages on m68k with 4 bytes ali=
gnment
without any problems. Why anyone would think that 4 bytes alignment poses a=
 problem
is beyond me.

> Now, if perf actually decreases with 4-byte alignment setups, it's=20
> something to investigate, and hopefully / eventually to fix. Pinpointing=
=20
> causes for such things is something where I can specifically help.

I'm not sure how a package that doesn't build at all runs faster than one
that builds. You are arguing like this is about performance, it isn't.

It's about unbreaking the port since more and more packages assume 4 bytes
alignment. Do you think that something that is not working at all should
be preferred over something that is working with degraded performance?

> (Full m68k Debian is too heavy to boot in reasonable time on machines=20
> that Hatari emulates, due to missing crypto acceleration, but IMHO also=
=20
> unnecessary for kernel ABI change discussions.)

Last time I booted Debian/m68k on my Amiga 68060 it booted fine. It took
a few minutes but that's not surprising given the machine has only 50 MHz.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
