Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7419F1D958B
	for <linux-m68k@vger.kernel.org>; Mon, 28 Oct 2024 07:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730102138; cv=none; b=p5egAZoY3pf3FrWF6YQYYAjwc9CGXVgYWFRZEviGiI+m1xA3WOvRdjFyjLwI2ugTEWtI0VFpWH91IaKZx1C4uZW23LfmQrfMgemMxRr7OkbBa5dN7goXf1JnZMoaTpx14O9rE1HZ06L346BgtgDrtn9HBeJJbU4H44zS2j4Khng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730102138; c=relaxed/simple;
	bh=xh88wrBlnq2CmJfzE2SgR57p64A/J1/qa98zBdGjDA8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CWmTgj162Aj6oKTkiNSLRWQVL1gnT4sOYbJztjzy4izCXz4dXLiJcC4Jied8LS/R5NAR3fbvyXigA8azcSie0VzdCRgtrhA5i6RQN/apamkNRrE/k4F6AY1HgymbrDHvRwbsjbmviBi4bUmTvIr62i9q9wdqkOpyN6UZT8GzSKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=qLo+aapn; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="qLo+aapn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=W4BwdqgirLWBe7yoMjxKGd5NHF2mEM+U1kRqMDIDi6Q=; t=1730102135; x=1730706935; 
	b=qLo+aapnfP6zt9HJybW5tp3IvYdFqVfevPvw0fuibV1ACc2UbQkQNNRNS+n1wWxCG2+daUbbma2
	tMngS8Cga4HXXxeg43c54KoCnXX4SlR7IQtqFhBuMQoVXY3Lm/vrf5ELnyFoMpmlD16KVaJLb/vR3
	k+eJShEfRivKiwk7nvPUa7+5XTjDXpi/chXPnnSj4xE6j5L9tx/FlzBarw1asszftByG1LhkV3ykO
	p8kRY2C39JIG3wnL+sneUQVOexQxDk/P0L/5fJKiGuoFBpOV9rDAFz4rpTdY1nfpmBDDJJotTNqcu
	zmfn0iYecxKiTqWWAdZ8FrjqeUYDyqqDs3kQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1t5Kb7-000000048hc-24Wq; Mon, 28 Oct 2024 08:55:33 +0100
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1t5Kb7-00000002BSR-18g6; Mon, 28 Oct 2024 08:55:33 +0100
Message-ID: <a55bdf90d9584260aa5aa40be5a5a5317d2d7bd1.camel@physik.fu-berlin.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Finn Thain <fthain@linux-m68k.org>, Thorsten Glaser <tg@debian.org>
Cc: linux-m68k <linux-m68k@vger.kernel.org>, debian-68k	
 <debian-68k@lists.debian.org>, James Le Cuirot <chewi@aura-online.co.uk>, 
 Sam James <sam@gentoo.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andreas Schwab	 <schwab@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
Date: Mon, 28 Oct 2024 08:55:32 +0100
In-Reply-To: <b9ef3e70-6ee0-3e4f-185c-afaa8f512792@linux-m68k.org>
References: 
	<3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
	  <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org>
	 <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de>
	 <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org>
	 <5e8917a2-b7c4-6c06-e63f-1f05eea32120@mirbsd.de>
	 <a07af4eb-efba-d8f1-ace1-06da7a7067c0@linux-m68k.org>
	 <Pine.BSM.4.64L.2410270301550.3007@herc.mirbsd.org>
	 <a6ef54f6-7a3d-78d5-47d1-d4f7fc1e04e2@linux-m68k.org>
	 <Pine.BSM.4.64L.2410270420080.3007@herc.mirbsd.org>
	 <b9ef3e70-6ee0-3e4f-185c-afaa8f512792@linux-m68k.org>
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

On Sun, 2024-10-27 at 17:16 +1100, Finn Thain wrote:
> Right. And I don't think the problem is going to go away. One solution=
=20
> that is sometimes raised is better tooling. I'm not sure how that would=
=20
> work. Perhaps a better solution would be language changes to allow a=20
> struct definition to be qualified with an explicit data model.

This is a pure academic discussion and not leading anywhere.

Adrian

> > >=20
--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
