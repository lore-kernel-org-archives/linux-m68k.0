Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F2C524C
	for <linux-m68k@vger.kernel.org>; Mon, 28 Oct 2024 07:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730100400; cv=none; b=XHUjUC4hqqSEkOlAB39Y8TBmFVEnWyeEYtPBeZP2pFbZ6WZekmN2LjrBxU7AwhSI3VdVCVTak/cYnwV3JW4ujLqfSnrdKYzbWaWpfK14JJcHADvEwlKtP2oL+vToEuAIqbafY7CAbcCcW+p70TMQaW1rQJrIj5kOYEwN95ebuoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730100400; c=relaxed/simple;
	bh=Z8fWDDpd8Cr79qL8aUkY0jA68WNej6n8fk3MwTrAtCQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b5JlNMJDeLZMBI32I9+U1ldBrm8hGBvxanM3yySs3ZnD0AtMX4nUTlX/loMc08SWjcc9d3CvLfM4SNLcIR3pKK4St/lG/RcGd529LLvfl/SigFmB9kdlBRoNLPeLxefMZEjKXww6N+E+CNyOl2HYpO65KX6fFgpPOtYfoN9uZbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=BCVPsfLa; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="BCVPsfLa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=D3HdmQm/tHucu0CmcShIfpOk5+q7hq/p5pozUzmYHa4=; t=1730100397; x=1730705197; 
	b=BCVPsfLaalJPWoVlT3RB35xBAp5IME2UL7IXR6NcRC1MzfSXhsnm/iQRlAwzGqWyDPU8zRyGC6e
	X8YjLDJdbElV4Dj6Ik903gQ0j2iFAx3oFvCbEpmNyzGvrmVSbZ5XaFFreMlXW7g4NM1pRAw5r37Yq
	Qz0gGJKABuwwhIkTDWuN0iquhheIuI3g6MGpFbyOjJoN+hUniWRIHRYy2c6JM/PZuSI949a/TK3T6
	qSFtqE91J8QI5ToBVaGQohWO19iGexsA7M3Zfsr+yAFsk1OVYtsRIzmFDC0APjX2pjoQ1c5O6/wx5
	+KYDbaWbsMXhhvTQKsJQ+ObKwpStAgEmJQ+w==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1t5K95-00000003peO-2K4t; Mon, 28 Oct 2024 08:26:35 +0100
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1t5K95-000000025YY-1Pag; Mon, 28 Oct 2024 08:26:35 +0100
Message-ID: <b8a1f79a34dbdfbb8577c2f0d8d73aae6da7b7c9.camel@physik.fu-berlin.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Thorsten Glaser <tg@debian.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@vger.kernel.org>, 
 debian-68k <debian-68k@lists.debian.org>, James Le Cuirot
 <chewi@aura-online.co.uk>, Sam James	 <sam@gentoo.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Andreas Schwab	 <schwab@linux-m68k.org>
Date: Mon, 28 Oct 2024 08:26:34 +0100
In-Reply-To: <97b0a5de-885f-ffde-3739-f7f29b16d3bd@mirbsd.de>
References: 
	<3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
	  <383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com>
	 <bfc235822cf8f773689abfefe1a75abfcf860c93.camel@physik.fu-berlin.de>
	 <97b0a5de-885f-ffde-3739-f7f29b16d3bd@mirbsd.de>
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

On Fri, 2024-10-25 at 23:38 +0200, Thorsten Glaser wrote:
> On Fri, 25 Oct 2024, John Paul Adrian Glaubitz wrote:
>=20
> > as m68k has supported 32-bit alignment through the "-malign-int"
> > switch for a long time.
>=20
> That switch constitutes a fundamental ABI change, even if
> the effect is limited.
>=20
> Question is, do we need a kernel change for this at all?
> Is there anything in the kernel/userland interface that
> gets affected by this, or do these APIs use sufficient
> explicit padding? Has anyone looked at this?

James Le Cuirot (chewi) has created a Gentoo/m68k chroot with 4-byte
alignment and most of the stuff just worked from what I remember.

> If we know that the answer is no, the plan could look
> different from a yes answer, so=E2=80=A6
>=20
> Additionally=E2=80=A6 has anyone done the simple =E2=80=9Cenable -malign-=
int
> in GCC, begin rebuilding stuff, first glibc, then others,
> see what breaks=E2=80=9D? Is there sufficient effect that we cannot
> incrementally change over?

Yes, see above.

> (Another question: does -malign-int switch to natural
> alignment for all types, i.e. 64 bit for llong and double,
> etc. or are we going to have to change GCC first as well
> to avoid more surprises?)

I assume so. Chewi, can you answer that question?

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
