Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67C7154444
	for <linux-m68k@vger.kernel.org>; Mon, 28 Oct 2024 07:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730100290; cv=none; b=sBRkje7o2O2rdx23RYPmqlPFcSApwEWI7Dhlg2KekkYduv63JQD0j2SSF7noktP44y96I1gsvC38YBXqese5nsCzQZVI+BI0DvEDf5PmEwajLCQr9AzQFCM7cI+OcK3HdKYdTFDHC/lFmGUBlxvcAFDnDIf+b0xrwfPl5y/hneg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730100290; c=relaxed/simple;
	bh=bBX0OGp2gHE5Epzp8cfSfZcYFnLBlQtanozMnrosPhU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hW8pmW/1uehRYvH+bcYRiqG5zxLr/eq1Bdgzxo41OX7lEWWWpiRfRHbL7xmCqqZjuf+S/1daBlbeQ0C63d+J+8miIgWLeqO8oO2pGqShk28lyvA4cfsRx7IBsM7OSkHV60kdqmHrSr0ckmBjKs+ias12hQvGxlqRm8uWNXtVZyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=CbzX5bTV; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="CbzX5bTV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/daUyFduRGaHVK9lh3yvyD3wJwGuPrZqOJ1CUF2gFbU=; t=1730100286; x=1730705086; 
	b=CbzX5bTV4EvsKF12aj+bEqndy+4cIIF99dUhRISut4HBL6+H+x6bctx81NlS9yebpaETti1EXik
	2GJzbWJ2QPlPzoaGI6bq5WDYoCBY1UwI70eaZdCrdmHyKYFvDDZ8ke1P0UFHTbK836524PounHqjr
	e4azwNZzBPcawQiPSpCLECtkosz0klNqydFXVB8vroWRDDL3Re0rhXaN658ggMUGYk+J4QMmn+e28
	HLNKA1KOAkk1k1BjfzHLd0arJ6ztv8Ih3z4rP3kwoHNKKjp8AamvVUTryk0R8UfYB6Sk8j0OyWPOZ
	xOEPyrTkOGhypc3R1v5MWgqJ6Y4yKa5NzRLQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1t5K79-00000003o28-3jyV; Mon, 28 Oct 2024 08:24:35 +0100
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1t5K79-000000025GZ-2oO6; Mon, 28 Oct 2024 08:24:35 +0100
Message-ID: <0b5d499339cf866451dfae76718ad516f440169b.camel@physik.fu-berlin.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Andreas Schwab <schwab@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-m68k <linux-m68k@vger.kernel.org>, debian-68k	
 <debian-68k@lists.debian.org>, James Le Cuirot <chewi@aura-online.co.uk>, 
 Sam James <sam@gentoo.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thorsten Glaser <tg@mirbsd.de>
Date: Mon, 28 Oct 2024 08:24:35 +0100
In-Reply-To: <87ed441arb.fsf@igel.home>
References: 
	<3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
		<383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com>
		<bfc235822cf8f773689abfefe1a75abfcf860c93.camel@physik.fu-berlin.de>
		<136f0492-fad7-4c75-b3c8-91ac7dc91570@app.fastmail.com>
	 <87ed441arb.fsf@igel.home>
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

On Fri, 2024-10-25 at 17:07 +0200, Andreas Schwab wrote:
> On Okt 25 2024, Arnd Bergmann wrote:
>=20
> > Doing it without a migration path seems worse to me,
> > as this would mean breaking every single existing
> > installation between two kernels, and making it impossible
> > to bisect other issues, and breaking the rule #1.
>=20
> That's why I didn't change the alignment when I implemented ELF.  It
> would have made it impossible to mix an a.out kernel with ELF user
> space, and vice versa.

Thanks for explaining the background. However, it doesn't change the
fact that this is blocking a lot of software now, unfortunately.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
