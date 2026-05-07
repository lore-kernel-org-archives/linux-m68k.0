Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647B83F54B1
	for <linux-m68k@lists.linux-m68k.org>; Thu,  7 May 2026 12:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778158793; cv=none; b=bbgxFcklg38lBiN6XlskVZa0EJNaXLUm5L9+Sp7d7HBJ7x9231upDqds5PsESqrp5OK/edSnMq/RhM+ThwFCXmB6qmqp0eg/FrYbqxCY0hr6eMCFwGU+y8LMVkkGoNmzM2aFAfYYg/1f1OVxmT8e9HiFdIzoBQDewlJ7cCOANBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778158793; c=relaxed/simple;
	bh=SPkdp1hAd3kbxPL1+HqVTfSGgCVdV7lIVFIOyf9qB3M=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=AQiQQOzfSS2D2pgj65t86OjmyB1OL9mCjlq0/t4Ca+QtZDq77dy6JKE04gAcQdxqRIY8gxjtiQMjoTgPE69r1ivML0467mGg3HC4pA3rWFhE1MFKpMJuKbQ0qPBzCXnOzEYdFGKp5hWV79AYhC89Bh+E8rRqm/H289MAHZ4Yl68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MuVsmwWr; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MuVsmwWr"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E98BA43F64;
	Thu,  7 May 2026 12:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F19CC2BCC7;
	Thu,  7 May 2026 12:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778158791;
	bh=SPkdp1hAd3kbxPL1+HqVTfSGgCVdV7lIVFIOyf9qB3M=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=MuVsmwWrACEvMVGOT6T62XSIRW5C6lut1XjzJv8VMgV7kv6fBgg/3Cw/GNR+uRfi8
	 CgMkARZjEIRgfY+YzGltkW3xeGf25ZPsuwxHYzSHwBxSaLWH0TM38r2EQ6FE+gsoga
	 wcy9AypcEoOVj4gO4khQ/1uhjFAtzsUPgQTO28Vp9ItrAth58+77aKOLcUElthKBum
	 PpSOq+v5ukaMF0cPIpxGsh+20YSvM2lb3m5u5LFsn1WghiJbuSjJajAUhgnx8G/779
	 uCTPlo28aAn1TUghVoItw+BILS9jlJC1tMPM9P3Qzf0b85avMKVab+xPRXvL6zEnYc
	 q8HiuvRK+k2JQ==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 817D0F40068;
	Thu,  7 May 2026 08:59:50 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-04.internal (MEProxy); Thu, 07 May 2026 08:59:50 -0400
X-ME-Sender: <xms:xoz8aVBolen00sW23GmU_yryCHf-zOEL9iXr-Y4eiKIHwOFLzNgZaA>
    <xme:xoz8aeUdpBXoUJLkQdRh1Vnr7qihBkFSsdFf-iYpGDOMRr8RQWMdGVqRvNdd1JFc3
    Rnft1FigRvBlWWdrh2YYegLzlKmThP3t1BRk6MuHjULEqQyEFNxiDtF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutdejheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnhgvlhdrohhrgheqnecuggftrfgrth
    htvghrnhepjeejffetteefteekieejudeguedvgfeffeeitdduieekgeegfeekhfduhfel
    hfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduvdekhedujedtvdeg
    qddvkeejtddtvdeigedqrghrnhgupeepkhgvrhhnvghlrdhorhhgsegrrhhnuggsrdguvg
    dpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprggu
    uhhrvghghhgvlhhlohessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepohhlthgvrg
    hnvhesghhmrghilhdrtghomhdprhgtphhtthhopehgvghrgheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheplhhinhhugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmieekkh
    drohhrghdprhgtphhtthhopegumhgrvghnghhinhgvsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheplhhinhhugidqtggrnhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehlihhnuhigqdhsphhisehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:xoz8aWS6Dbd7vLZ9DfWLWri47kgjf6hFSspF3rk5dLP6blJ7z0-k3A>
    <xmx:xoz8acPqH-S4hI1w0plNhTt9Z6EQIvDRHoCdx6ANHd_81QGNTqMZ4Q>
    <xmx:xoz8aUgjTR3zU2EW93PQJQq91aeHmyeyWe_7AUm8II-ZW185vezDVA>
    <xmx:xoz8aZmctjWvS7E15xE--4swG_Bmnyoag4GGxu_H708S60ibJUzwOw>
    <xmx:xoz8aQhcJG6RGWfgHmC2ckoc5oLid6ge9IfBiKTBdukoMrH1cTYnvImV>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 600371060066; Thu,  7 May 2026 08:59:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Am-_gogYW4uZ
Date: Thu, 07 May 2026 14:59:30 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Greg Ungerer" <gerg@kernel.org>, linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-can@vger.kernel.org, linux-spi@vger.kernel.org,
 "Vladimir Oltean" <olteanv@gmail.com>,
 "Angelo Dureghello" <adureghello@baylibre.com>
Message-Id: <4a617879-5147-4595-b6ce-ef3391b936d9@app.fastmail.com>
In-Reply-To: <fdd6fc14-f607-4186-8db4-25de973ac322@kernel.org>
References: <20260506142644.3234270-2-gerg@kernel.org>
 <20260506142644.3234270-8-gerg@kernel.org>
 <40aefc39-bd98-460d-8aa7-5dd79f562e0d@app.fastmail.com>
 <fdd6fc14-f607-4186-8db4-25de973ac322@kernel.org>
Subject: Re: [RFC 4/4] m68k: coldfire: fix non-standard readX()/writeX() functions
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, May 7, 2026, at 14:43, Greg Ungerer wrote:
> On 7/5/26 05:12, Arnd Bergmann wrote:
>> On Wed, May 6, 2026, at 16:26, Greg Ungerer wrote:
>> 
>> I would suggest marking these as explicit BIG_ENDIAN rather than
>> NATIVE_ENDIAN. The effect should be the same since coldfire CPUs
>> cannot run little-endian code, but the way that hardware usually
>> works is that the endianess is fixed at the bus level to one way
>> or the other. NATIVE_ENDIAN to me implies that the registers
>> have configurable endianess that is switched along with the CPU
>> mode.
>
> Ok, will change. I chose native endian in this case since the regmap config
> entry used for the m5441x family is also used by the vf610 devce (which looks
> to be an ARM imx SoC). So it will need a duplicate setup with those endian
> flags set to BIG_ENDIAN. But that is no problem.

Sounds good. In this case, splitting it up is technically even required,
because you can run a big-endian ARMv7 kernel on vf610, so the vf610
entry has to use little-endian registers rather than native.

I don't think anyone has run big-endian kernels on vf610, though I have
heard of users testing them successfully on i.MX6.

      Arnd
