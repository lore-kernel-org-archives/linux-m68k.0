Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3318191473
	for <linux-m68k@vger.kernel.org>; Mon, 28 Oct 2024 07:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730101418; cv=none; b=tJTHY4UhNUfAN6G2cwi352qHsYM7B66V92z7dR5r/it6MIU2g5IdGPa2AReU4fktj0MNJPrhpone0GDBGN0hCtN63KiB2A2jayQMAYRO8L+t1Juf41QjdMFLVCXHIRFdf1HkkZNUS2DOD014I/lcLnI9jXCsYbT6ITaKI3lO9b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730101418; c=relaxed/simple;
	bh=R5LOoPX0qNs79MFb7Q0nQr2TcrvB0LOPh4LnRPMW+bM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SBJVrcGNB6bZLpVGi0gY+p+8YvrYyN7e3JMOmzNpk2BXQkjfbg3lBa4vKFxGRS3McuHT9fjZAoSdtQDIoYebHHfZpUT+NBAYuhpnrDa0IVnUthz3EbAhTNHGZapWxzX941lcsY3cihuMh0LRjdi1HnxV4sDi6MYw7bXba7GDLZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=QBE967yx; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="QBE967yx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iQM5Nfb1IwxRGSOOD7y8z0X23f3ZrNVUIyvPyc30Il0=; t=1730101415; x=1730706215; 
	b=QBE967yx2JUPHwIvcIIzWvVMchQH/PAfpv2qRqfXVSBAEdaxC5WUlUJW/PqBeQkEgVqLDnae5zx
	Di96eo7mAmBcFa/J8eGPpiOcVWEzaTEzK4Ln25xwddhxu0Z//+hq46v3Q8BUZFCVWn+6F6loMJI6A
	vi7b5dQdF/mhcJYJ8Jtx6Qm8DiuuB9Q82vm1PtuuSU8XRtELztYiSKtqzOnGq3YJ8YTBVqrtT2WVi
	qGBuybpMY8IKW3HkULQWGq/5VIDX7IcXGkn79YYUV2Mbge455N4lHd2yiqqJyt5vE2pc7zyUpSnyd
	XoiuWyxc0xcty/QIr5/NknJ4gj6fTlAWPXvQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1t5KPW-000000040SB-0EyW; Mon, 28 Oct 2024 08:43:34 +0100
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1t5KPV-000000028hB-34fP; Mon, 28 Oct 2024 08:43:33 +0100
Message-ID: <742eb1e35b85fd65a675467eac460c137b0eca37.camel@physik.fu-berlin.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Thorsten Glaser <tg@debian.org>, Finn Thain <fthain@linux-m68k.org>
Cc: linux-m68k <linux-m68k@vger.kernel.org>, debian-68k	
 <debian-68k@lists.debian.org>, James Le Cuirot <chewi@aura-online.co.uk>, 
 Sam James <sam@gentoo.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andreas Schwab	 <schwab@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
Date: Mon, 28 Oct 2024 08:43:33 +0100
In-Reply-To: <5e8917a2-b7c4-6c06-e63f-1f05eea32120@mirbsd.de>
References: 
	<3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
	  <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org>
	 <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de>
	 <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org>
	 <5e8917a2-b7c4-6c06-e63f-1f05eea32120@mirbsd.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

On Sun, 2024-10-27 at 00:04 +0200, Thorsten Glaser wrote:
> > That seems to imply that someone requires that those packages are porte=
d.
>=20
> Yes, we do. Rust especially is killing the entire FOSS ecosystem.

Could we leave out politics out of this discussion, please?

> These all are conditio sine qua n=C5=8Dn when it comes to continuing
> Linux/m68k, as a whole.

Exactly.

> > Absent the right conditions, perhaps it is best focus limited porter an=
d
> > developer effort on patching only those packages that are really requir=
ed.
>=20
> I tried my hand at Qt5. About 20 man-hours in I essentially gave up,
> and that was without even getting to something I could put to a
> compile and runtime test.

Yep, that's exactly my experience as well while building with 32-bit alignm=
ent
just made it work.

> =E2=80=9CNatural=E2=80=9D alignment of data types has essentially become =
a requirement
> these days, and m68k is the only true outlyer (i386 could in theory, but
> the Unix psABI designers were sensible enough to not do it).

Agreed.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
