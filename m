Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B46223DF8
	for <linux-m68k@vger.kernel.org>; Tue, 10 Jun 2025 11:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749554227; cv=none; b=W+irQxl3mAeR+vvih2K94fqVLcGYbPc3K81274iDTw2o8ontzC39y/WYPpYoVeIZoNLGLcwi15TuAV0ITYyCP1opayT5bEs67XWSueSbGkBs5gqYyELLaDarY9bpdaHPVOydbN2MVStDUSc0GKydgzQ0X/BG3h0Jlj69XregNng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749554227; c=relaxed/simple;
	bh=WESdLOzvG5DHhXZAnSTFwYgbGQ2+N9v3gYVwHafaB+M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VoT4zIEQPvZSoEMsRz/rog31+KiyT9LQvYeiLf7QYfrmGG8Wuw0pncoxJ52PETgVkQ1myS50lpfuU2LdtgZBEJadljuy1hiq1wa9Lhap5cDA0Czu9VZvnyhVEa+f3NQHNrNTfTK/uKkRRCglNox2TkNuS7xFKEVXYHeTZ/bULto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=pLxeiem2; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="pLxeiem2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VchwklmypV7+5u748JlFCuANzJEyca9FP8SGD1dbdWU=; t=1749554224; x=1750159024; 
	b=pLxeiem2lALtKfXPYmb9/rdMUhvHeEPrIKJr7PYIbZXDYBE81PERTbz+sRYU/k+kI0RSJxM937r
	4NnTCAczVDOGDOyziaDfkW5/I4fRuasCdR7uRqQIP1rQj3KZ8kB/rmBAjMDvJJ4TY65K3KQx6ktkW
	aIODuG56ZwPznTB7kNs/8bK2ueuATXf0KsFPVPjeTFcpM36GdnhGy1uVZOCMmwXxr1oN+oT2LaeRP
	DBFxTNL0Xz+IvYc3DWPKj0aSDLj/lHgkNRZK3WnM8OlabuUFlP/n3v1KcwFGIPZxToJN3DK4L/vQC
	yKbydghg4ZXXnIJjDUNvuSS3byv7hdxrCq8w==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uOwyN-00000000xSQ-0Y2z; Tue, 10 Jun 2025 13:16:55 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uOwyM-00000001KNk-3OLc; Tue, 10 Jun 2025 13:16:55 +0200
Message-ID: <55cd663c9c6e0470b3d9d3425d898beaef823738.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Andreas Schwab <schwab@linux-m68k.org>, Jason Thorpe <thorpej@me.com>
Cc: Finn Thain <fthain@linux-m68k.org>, Geert Uytterhoeven	
 <geert@linux-m68k.org>, Jean-Michel Hautbois
 <jeanmichel.hautbois@yoseli.org>,  port-m68k <port-m68k@netbsd.org>,
 debian-68k <debian-68k@lists.debian.org>, linux-m68k	
 <linux-m68k@vger.kernel.org>
Date: Tue, 10 Jun 2025 13:16:54 +0200
In-Reply-To: <87ldq38byn.fsf@igel.home>
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
		<2126C1A0-7737-4228-9B28-B160C672C8AD@me.com> <87ldq38byn.fsf@igel.home>
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

On Sat, 2025-06-07 at 23:43 +0200, Andreas Schwab wrote:
> On Jun 07 2025, Jason Thorpe wrote:
>=20
> > https://m680x0.github.io/ref/sysv-m68k-abi-part1.pdf
>=20
> How is that relevant?

It's relevant because it's the official ABI and GCC suggests in it's
headers that it's SVR4-compliant on Linux.

Anyway, having this discussion isn't really leading anywhere. Let's
just agree that we disagree on what the canonical source for an ABI
specification is. You have explained your point of view and I can
understand your reasoning.

However, that doesn't help with the current situation which is that the
number of packages that fail to build from source on m68k on Linux is
increasing and it's becoming more difficult to maintain the port.

Both Debian and Gentoo want to address this problem by changing the default
alignment and both have already performed initial bootstraps with 32-bit
alignment which showed promising results.

The question now only remains what the preferred way of implementing this
change is. Since there are no other Linux distributions left that maintain
support on m68k, I think it's reasonable to expect that both Debian and Gen=
too
get to have a word in this discussion, don't they?

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
