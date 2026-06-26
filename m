Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8FE3F65E6
	for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Jun 2026 14:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782483720; cv=none; b=Ktr2LnnSI+EuiJ1LmzN5C8SG3RMtfu13xh+lIzib6W/1kL4ockWLxdWrbeHiqYnXfdUGnoCyrN8nLTiEMWMLgMaLbtragB4ZhwBvxnmJdd2CtgSO4ZnL5vWxEhhTD97aIRSnIs37aHrruCc7/9ExNxCFJFEfWNjvDRhnXVTCJcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782483720; c=relaxed/simple;
	bh=nuxf2cfS2nCVAFVu7/RkvHjeobxsvhOt+OH98R0cm+o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BUaxO6m1DpdZ+7v8Zgetn/JUJ8MPzVVbRYFd3DugahJUN3eLpkaxBjZsl+7z3l58fhFfYZjqcpWMfjWeSucWRJziIFfWqmuZre+wGhk6ocLPRGXLexF6DLaayfJBtPsDK9Z1K6Ol92jiTNBew8rqBoxr2uQrYX5ADodEIyMOK9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=D5Rv63Oq; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="D5Rv63Oq"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5E7C1C6344B;
	Fri, 26 Jun 2026 14:22:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 75E2F60232;
	Fri, 26 Jun 2026 14:21:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4086C104C9767;
	Fri, 26 Jun 2026 16:21:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782483716; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nuxf2cfS2nCVAFVu7/RkvHjeobxsvhOt+OH98R0cm+o=;
	b=D5Rv63OqSdY6oH5OArGLroKQhy2N5Y99QQnpyrAXeHwTQYFnQbu83iypZbUceI836U7rgI
	KlPZlwbvjFbkHy2Rpk5uEaEFNLnzSr5wMBvmoUjjksPa57I/qzqsl1b+0Jb2qstm7TKlxY
	8KJ7AHC/DfQruOLtW+/XjjknwWYttA5xeaY1GqKWBmx7IAqXK2W5ddt2IklLc7GsU2jgLm
	Hq6T1WRvSITvwSoKmgKnib3gGQxlfFv8HKaj98VDLmWF1DAWmL36xXJakMi/rSS0B7alVm
	luMPRqQMn7W1n6iSaIi2bP0fG1b3VQzTHn+3+gXwC5Vk6xV6y19jtgM4gLfAHA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Greg Ungerer" <gregungerer@westnet.com.au>,  "Arnd Bergmann"
 <arnd@kernel.org>,  "Richard Weinberger" <richard@nod.at>,  "Vignesh
 Raghavendra" <vigneshr@ti.com>,  "Randy Dunlap" <rdunlap@infradead.org>,
  "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org,  linux-m68k
 <linux-m68k@lists.linux-m68k.org>,  "Pengpeng Hou" <pengpeng@iscas.ac.cn>
Subject: Re: [PATCH 2/3] mtd: maps: remove uclinux map driver
In-Reply-To: <f3e984cd-0614-48d1-b03f-e0670b87e282@app.fastmail.com> (Arnd
	Bergmann's message of "Thu, 25 Jun 2026 16:10:54 +0200")
References: <20260526103227.3152003-1-arnd@kernel.org>
	<20260526103227.3152003-2-arnd@kernel.org>
	<b55ac37f-4523-46d0-8e77-3a17d7235ffe@westnet.com.au>
	<f3e984cd-0614-48d1-b03f-e0670b87e282@app.fastmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 26 Jun 2026 16:21:50 +0200
Message-ID: <87ik75l6v5.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Arnd,

>> No out of tree code is required. Most of the ColdFire defconfigs have
>> CONFIG_MTD_UCLINUX enabled, since it is commonly used.
>
> I see, this is surprising from reading the source and
> git history, but I can see exactly how it got there.
>
> So this is not actually a device but rather a replacement
> for CONFIG_BLK_DEV_INITRD that does can work with CONFIG_BLOCK=3Dy,
> right?
>
>> Can we get this reverted?
>
> Yes, of course. Miquel/Richard/Vignesh, should I send a revert or
> can you just apply one with Greg's explanation and my Ack?

I'll try to come up with something next week :-)

Thanks,
Miqu=C3=A8l
