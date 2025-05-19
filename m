Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F00269CE0
	for <linux-m68k@vger.kernel.org>; Mon, 19 May 2025 08:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747642724; cv=none; b=Z3xY0MJWO6Z9ZPMf6PsJQJ5ym9gb7VQUov9995xfeyOviuUAkK94IScmyIjOOFGz/d3fSvFyf1M82rZK0LdfA59Ohs9XDq6z5Q1IOXVBJVT5vmDL+njTJxvyuIIrhVEweJIbxOELFxqPQJ1KJSr8L/vs0PIr8VRltAjkZBFpInU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747642724; c=relaxed/simple;
	bh=q+aDT7PBT0dHjosMY8IpbVzAJEnMDbjhO+brUXUzeyo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EiWHawIojRscg1582imXX4rLX9V/9PHBk4ZkgDB1J0RkYUgRjXIghKr5jDxhP9XCkZMlSWClskdgQoyZi8vSpr2uWSqVvgTClF8TXGWVhjE1Ftgsi5JAMSYIsHUIZbbkJKZYFrCJSyCpAiFwGFkcAOHPIUuwhmaX7xIGGjKK5A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=G//+s+M6; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="G//+s+M6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kOIwrCifEGdYZ1RSMvMa8u2PMRyyRiakwgjrXGvUlJo=; t=1747642721; x=1748247521; 
	b=G//+s+M6ydrDgC7TbIgIWDOD6x4ZhQpmd3K+LkK7rtQOhb2zzaqbRqbe60S4Ke9YGO5/k5aGejJ
	B1DCnwvkvPOx5HkZCn0bUc34m8rzmjRA1RsBHXEIOp7F+USydYVQKa56MwxFyTlPHbeQRMxgg+VRv
	lc90NFBT/pC7qCqi4g6c8jX6hH5FHdNiCsnJBPgYCvhKwYi9exRngCsRHw98H21vP06kK5nbt2Osa
	2SGigQFe0GBRc0yk3E378vIwZeqVyFv4ocRwJ4Pe11Tg4OuWZ1o7meafe+F8kpPafnrlYqRSxYxwR
	/lDg3TzlWqtymmbibVhqAK6dd4dJ+h96TEAw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uGvhl-00000003zRx-2hYA; Mon, 19 May 2025 10:18:37 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uGvhl-00000002xh9-12um; Mon, 19 May 2025 10:18:37 +0200
Message-ID: <08f471d5cb51ed0fe5a3eb64fad088f3072d4784.camel@physik.fu-berlin.de>
Subject: Re: Tuple and changes for m68k with -malign-int
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Antonio Vargas Gonzalez	
 <windenntw@gmail.com>, James Le Cuirot <chewi@aura-online.co.uk>, 
	libc-help@sourceware.org, debian-68k <debian-68k@lists.debian.org>,
 linux-m68k	 <linux-m68k@vger.kernel.org>
Date: Mon, 19 May 2025 10:18:35 +0200
In-Reply-To: <mvm4ixhf2nj.fsf@linux-m68k.org>
References: 
	<e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
		<08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
		<CA+OL9jj_s3ek-_4fp5b5uq-Fxmdu3NpenW10RWkiPX8Jtmxq=A@mail.gmail.com>
		<ab38d00426f3a0be1d312d969ebc747a569ebc74.camel@physik.fu-berlin.de>
		<CAMuHMdURQAf=iQxwPh57_Xj-TO_cnqH=eNPKvYDv41o8SgJLKQ@mail.gmail.com>
		<75c912630ade4e05af08eab9584c6f56d7c0ca1f.camel@physik.fu-berlin.de>
	 <mvm4ixhf2nj.fsf@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

On Mon, 2025-05-19 at 10:03 +0200, Andreas Schwab wrote:
> On Mai 19 2025, John Paul Adrian Glaubitz wrote:
>=20
> > Good idea. I will do that. My assumption is that on Linux, GCC develope=
rs
> > actually just forgot to switch alignment from 2 to 4 bytes with the swi=
tch
> > to ELF unlike NetBSD.
>=20
> The Linux developers care about backward compatilibity.

That makes no sense though as a.out and ELF binaries are not compatible, ar=
e they?

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
