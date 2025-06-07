Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078CB4642D
	for <linux-m68k@vger.kernel.org>; Sat,  7 Jun 2025 13:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749304265; cv=none; b=YAsc8H1pu2vFEZHdPPtPQMBrzJ2rdGSxVWiqNTqsVc7cstDy4Hk8lBrl3sPEOkcMIEcuX72kcAJFqyRPfuKWK0qVPxoit/M6Cz54X29kn5LW7LPZzFCIyAQ/B36+dfNF3iZBbXU5ShdQurWtCb3QsKHZOH/ZXOOO21tVVvdYC34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749304265; c=relaxed/simple;
	bh=Us7mMlbuwdLL/Q4SrsAdi9pMaNTEz3W+wkkVvLTKDtk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IiNICnEAwHgOKUMpv6k/npiIEcQSOKgSGOccv20Mf3XObc8Vk7BBz/ILga6CEiNaMLbz2F4b8B7Vkr+KWTCU6LhimnlPvjSmFuUvNRIku/laV5rr9qTcQvYa3kSN9ip5AlJl15O64y0gRy3zzEXcB7eJGuMlbE6GmIV7By7OLSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=PKfj158m; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="PKfj158m"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gZdVK0HItEUMlgl+mvAosFhAzyW6IOGcBNdVcrk23Sg=; t=1749304261; x=1749909061; 
	b=PKfj158m8lcgIU9sZvZIXPHVXFaqSd/e3LVTDSRh69rHlWrOjF3o9aYTu7k7SF/PTz2HUosgHkK
	bSYeXaMjkAa7tDNqtMRtr5BmXK4FUfeNlOunNrc4fiIBxkgi7H8pvnj4ibkhz9BzfV8BtTTGYk6FI
	by7/c+pa3yiR2et/hYeAbam6UE28s31bYm0fTbv8+I5wZ3/WO2y0WF48hB4aSuIoj9B8n7zjhWTC/
	dELK/H4ktl8VRSGKyxbWPrt0XUFxLx2xGU2Wwe4f8mV+FBChBymgzcd36dSUVnaqct2gKqUWFd63J
	WY+3KM+r0G6XD6SeRrzyKAmRLBQikvSaReoQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uNtwo-00000001vhx-431L; Sat, 07 Jun 2025 15:50:58 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uNtwo-00000003TSa-34kY; Sat, 07 Jun 2025 15:50:58 +0200
Message-ID: <2bd7d3370101b73288f9a1cd1b6eed0ba0da700e.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Finn Thain <fthain@linux-m68k.org>, Geert Uytterhoeven	
 <geert@linux-m68k.org>, Jean-Michel Hautbois
 <jeanmichel.hautbois@yoseli.org>,  port-m68k <port-m68k@netbsd.org>,
 debian-68k <debian-68k@lists.debian.org>, linux-m68k	
 <linux-m68k@vger.kernel.org>
Date: Sat, 07 Jun 2025 15:50:58 +0200
In-Reply-To: <87sekbq3f8.fsf@linux-m68k.org>
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

On Sat, 2025-06-07 at 11:58 +0200, Andreas Schwab wrote:
> On Jun 07 2025, John Paul Adrian Glaubitz wrote:
>=20
> > Who is "we"? The official(!) ABI says that pointers are supposed to be =
aligned
> > with 4 bytes, not 2 bytes.
>=20
> No, that is wrong.  The official ABI uses 2 byte alignment.

The official AT&T SysV ABI states that pointers must be aligned with 4 byte=
s.

See: https://people.debian.org/~glaubitz/m68k-sysv-abi.pdf (page 29)

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
