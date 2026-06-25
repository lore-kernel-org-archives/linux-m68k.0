Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37DF35AC32
	for <linux-m68k@lists.linux-m68k.org>; Thu, 25 Jun 2026 14:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782396681; cv=none; b=k97Cg9GJc6Ksb4BHqDKq6wXLOkABUTJo/k3stYeOT4ieJ3WS62xNMpZPGKdnsWikDkXLKg4gYzr4kLE31leL+XkfgrzKrLQK64DpywU9u0WsNy4xvJY480Z3doKxksHtC3ZhudEhH8zKFV3hpqkN0N9IaBrBaJhgPeztjOnUcD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782396681; c=relaxed/simple;
	bh=AexytuRxkcagbsbMXHLedHFlrCLqb+ptD7JmyIUyS3s=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=d/isQRed/DQXA7IsR6+6hdKQHoQblLpSxYNb+kSwP7vSiEQdLvUqeNra0PwuvWa58XAiYumhqiZ/mbE62Hay1qLBB03Wnf3pm7g3XQwnnpa6lS4DOmgusiWQNv1LXdjLS3CHxj0suzjz07ab9+zndEye1cFWkXfc+QlhYxaKQQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=mv7OtS+M; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aP2ieQEP; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="mv7OtS+M";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aP2ieQEP"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 140797A0119;
	Thu, 25 Jun 2026 10:11:19 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 25 Jun 2026 10:11:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782396678;
	 x=1782483078; bh=irN3hpLEXejWK47u9zWCVY1FdJn2peRwQ/2YusrqX1w=; b=
	mv7OtS+MrEqVqqZ5hmp8tjhVGXHh9w8i6jWHnDyFSBlXy3iNjC2zctGTU28sedRH
	P3vstekHqhHGjeiGSV76pL7Lyor7OQStqpQGFlW0x94qHLGesjMckkApAQzeKoIj
	Xa2r05bTjRHsOKi6JYtp9Z8OE7TmjBa+XZxJSNePrODn/vTMsjwVUtiQ2kE7EusD
	bb5FK/JHjP6pkTCYT90kPo37Es5iiy5es9BapojuvvsDUJoIAkBsVdpBNhPQWPsl
	wu6dE3j8GwVPIgt9nbluQdaCyQeOL965Zn6i0kLavdtypOpcf3Efjb2iGT1j5+Jg
	bG/64udVrHkCd/UQ78M1NQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782396678; x=
	1782483078; bh=irN3hpLEXejWK47u9zWCVY1FdJn2peRwQ/2YusrqX1w=; b=a
	P2ieQEPhs29/cYFHxxm7t9JdiWuLnrLsufiS48qpQ6ob+Kqa2F7kCvs14czosiMk
	19Lc/0pmAwtP9H1Y56RYJPDuFzpT8Aqj5PB+jSIdLldjpR+OyvgZT8p2HyDvoYvC
	bwqmFMLG2uRSn5kSM1dbkqY3gWrOhSvQiPQVXC+qRSN47UtHp3xeG4/vWd8QKJ4e
	66AfIXViUySpOotjx3clL/QHIJQLDbP8CaA8FFU4reWx6kfhWBEBESxjQm52ORPf
	YNNV9hAPIIA8qMXz1gq6wStP3bHOtVDW8BTVXLUm+iDtmP4hVjV40fhfn8dDLRES
	NH7HxijcBzg/1mSp3Dr1Q==
X-ME-Sender: <xms:BDc9akJP64MtvgBxIixdgKfJbXsRWeEam5jd8biA2x9Kp0LKE37X1g>
    <xme:BDc9au_ezLweH4jeS409EDCsCd07wkzKIf0TOgDNS49heYL23b4bSv-nlvLqKQ1ya
    rFNqljJ9FhpdbBrqDqgJV03YSqCYs9WsWtQHzBvq27l7F_8SnMapuM>
X-ME-Proxy-Cause: dmFkZTGxqXUJ95yTHOhxnRhvFHQR9BUBrL3WFwu80qqbXrbatc/jWu1+hNaAbrLA/Vt+ag
    wzDsog94ra4FMh51/djXKoyqNNxUvcZTanJsAPJbZQiyRH+0qil65RNMbRvzqRusgtFWA7
    jEuhBr2zi+Tc5br/nACAHSRGxU/x0RC7m0qdPM9xIFXfgg8I0l31GlPX/+D2+J5iNPdiIZ
    cFDv4pXTsQ+7QlHOxrna7r0RXd6OzPGb/dgAd3Xf3vicOW1yUBkyWgfD88h0d1K83A6YpT
    iZ5ANStVsrLWTQD4co1WPP/+2JHHb1w3d1mmtMl4oNut2r74XFJhdy4jKtoT7cHsZNdDpX
    Q3aV7Id4pkmDGgAyjeNBJ5xF1Q8+rOJLAIkwVy16lt3tHbt+gPTkraRYJexb1cg74yBajM
    5cyTxn9Cu+zOyMtvJ9q0tTbeatjzq6a3EfcHOp7zcByvZlCqyYPZYgBOuNDRl6nfYpxt49
    T5WINCKbGCBOc2FJo88YIGKqI2U8M7gWsRJjgCzWCEdyTpBKQa6xBYhHHuPPpY8qJokSBQ
    W/z46MNhzV7z3Cdbhr+HKTOBWnnJrjY5pv2sLeHqVovP13Ik1Wk83dY7UGlTbwyMdhwrhA
    Q3xbRs9GYzYHa9A8HxXBSsNY2QNQTGXinpAJybWlS1PRODpNsTvyN8YFYcAw
X-ME-Proxy: <xmx:BDc9agEn5LnvaM2CVE-wW5qRlog8evd8jL5IF20OtPSJDPm2vwGfCA>
    <xmx:BDc9avv_hUZAC8qXgBQhNAwoZH03NxD3elSBn2fHnFiChUK2hKvN-A>
    <xmx:BDc9amahXY1v53czDkXWqkFUa4S9g0NS-vbrqejPwk5qlIinjdJ9wA>
    <xmx:BDc9av77VPOxH2OVN_ngSUxq64tqjoGjJ763UuN7y18cD55YZ63FAw>
    <xmx:Bjc9ajc2uGjin6OqW-SWB7us2wYgW87X5onElJVzHCMo0nXUplI6k3gv>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F0890182007E; Thu, 25 Jun 2026 10:11:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ASdx1_WPg8_k
Date: Thu, 25 Jun 2026 16:10:54 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Greg Ungerer" <gregungerer@westnet.com.au>,
 "Arnd Bergmann" <arnd@kernel.org>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: "Randy Dunlap" <rdunlap@infradead.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 "Pengpeng Hou" <pengpeng@iscas.ac.cn>
Message-Id: <f3e984cd-0614-48d1-b03f-e0670b87e282@app.fastmail.com>
In-Reply-To: <b55ac37f-4523-46d0-8e77-3a17d7235ffe@westnet.com.au>
References: <20260526103227.3152003-1-arnd@kernel.org>
 <20260526103227.3152003-2-arnd@kernel.org>
 <b55ac37f-4523-46d0-8e77-3a17d7235ffe@westnet.com.au>
Subject: Re: [PATCH 2/3] mtd: maps: remove uclinux map driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jun 25, 2026, at 14:07, Greg Ungerer wrote:
> On 26/5/26 20:32, Arnd Bergmann wrote:
>
> It is used on some ColdFire platforms, and was working all the way up
> to being removed in the current merge window.
>
> The ColdFire platform startup code (arch/m68k/coldfire/head.S) has a
> somewhat unusual setup that can copy an attached filesystem blob to
> _bss_stop, and this is one of the places the uclinux.c map driver can
> use as the filesystem memory address. From uclinux.c
>
>      static int __init uclinux_mtd_init(void)
>      {
>          struct mtd_info *mtd;
>          struct map_info *mapp;
>
>          mapp = &uclinux_ram_map;
>
>          if (physaddr == -1)
>                  mapp->phys = (resource_size_t)__bss_stop;
>          else
>                  mapp->phys = physaddr;
>
> No out of tree code is required. Most of the ColdFire defconfigs have
> CONFIG_MTD_UCLINUX enabled, since it is commonly used.

I see, this is surprising from reading the source and
git history, but I can see exactly how it got there.

So this is not actually a device but rather a replacement
for CONFIG_BLK_DEV_INITRD that does can work with CONFIG_BLOCK=y,
right?

> Can we get this reverted?

Yes, of course. Miquel/Richard/Vignesh, should I send a revert or
can you just apply one with Greg's explanation and my Ack?

     Arnd
