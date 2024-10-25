Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0564A1F818C
	for <linux-m68k@vger.kernel.org>; Fri, 25 Oct 2024 10:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729853611; cv=none; b=VOnGwsaax/viSk8WI0/iwvqqqVfDR1Rw7OiSoEEAijEENyHAi/MaUL6WK33v75qlksSffyIHKHCL3lhG0qR+7g8L1MRJ9Y3J3uU6IdEvy91dtXBL+F4WDzaqMSRLJEfA4TadnRY9/o0x14O/lrjE2d6RTt2kxp1aiR7CH+Yod8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729853611; c=relaxed/simple;
	bh=tB6OI9pvroGUhGgu4HPWz2TqSuLkLFdmfH/Eylxhi3c=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=FCirYPjAFW8psMEky6M8FFFuHPQbUvEwzvNjGHBmMLnyAcAzMGhxRwo1IS4HcHyDgu8dw4aGBoXYDuyh8Hbf2GDAua0QSoC+S7W5LmUwZz9+ydSfa6/Hn9KLQlJdfi1tFlR6rrGjZE72cWe5PH1ecZXQ4fbcvwG2Tj2SGAiNDgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=O2Ee/W4B; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cgEKN3JG; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="O2Ee/W4B";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cgEKN3JG"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id D936F114005F;
	Fri, 25 Oct 2024 06:53:27 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 25 Oct 2024 06:53:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1729853607;
	 x=1729940007; bh=AkDMpYhqR8XdlQTWY8VMxMmkOQgYFVJ0Z8jjxiMnpG8=; b=
	O2Ee/W4BhTVWdYHOZFfUopBCfGe180qzxQtVubpGfdShgZ104JZpoHQOIEKmMMX5
	97Ih/lMRq6Y0R+4muiDYIvj5tY6eackJ7e633HJubVKrD9IjBroMjnvktx/xzJ/r
	Nfez4XU1lfYf//H4zFjyokWP7AdFTVtlBKUy091lcr+fATOkKC4EwXJUmUuX7FRa
	dVV23nNavFnMkXvsVghcVDpdpfvG4ORj+w5GN5k87R9qJ92CjRws7nmbB7ed9ZFy
	neHA5bRu49uL1PXYfCLwSpXYzxMyCLiQKZPx2lHf4wU8o3ZFN6j53vWVgjKfNW34
	FZrxP4nwRdtQu6iahLKl4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729853607; x=
	1729940007; bh=AkDMpYhqR8XdlQTWY8VMxMmkOQgYFVJ0Z8jjxiMnpG8=; b=c
	gEKN3JGaTKzl0eZQACjMFacWmuzzlbF6dv3MZeHl1QTOg3nkB8NrJ0xIGv6uBDbF
	cRTYrnHWzq4DYEmqPX2zuJpBE6Xyf13fEmpSTr8tqzHVpu6uTNj+dsiQuJIDuEIK
	qr8ZCJhyBlqe+xJWAq8O1Xj4hEO7v0NTnQKEcLcr4M5id5kn2gMXsCDPp++T+j3c
	DBsk141L+nqJrd6a/LP/86yOB/FE3yM5apxgL//iBYMaPj4n1Uug6rJhvkX4QecH
	DNKSaEldnsD8hA3wTuoSEW/tjjJJTi0mgRepuZ/BLQPhxBcsQi/kL+gFq2gjyAzS
	DQ9BwFb6+JIigkm+olCdQ==
X-ME-Sender: <xms:p3gbZ2kd0sLjXZP5lSqC02X9_xkiaky77zOG7bY4LqTp4nkGebW7yg>
    <xme:p3gbZ933pCxo5SKV_lZ_4WNYXLNbcunXZp601uXQmSJ9nAFDJo1zsEFBiJcueG7ac
    2dsTXij-pITW0P8kIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejvddgfeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepkedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptghhvgifihesrghurhgrqdhonhhlih
    hnvgdrtghordhukhdprhgtphhtthhopehsrghmsehgvghnthhoohdrohhrghdprhgtphht
    thhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehstghhfi
    grsgeslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepuggvsghirghnqdeikehk
    sehlihhsthhsrdguvggsihgrnhdrohhrghdprhgtphhtthhopehtghesmhhirhgsshgurd
    guvgdprhgtphhtthhopehglhgruhgsihhtiiesphhhhihsihhkrdhfuhdqsggvrhhlihhn
    rdguvgdprhgtphhtthhopehlihhnuhigqdhmieekkhesvhhgvghrrdhkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:p3gbZ0pvClb_h69RGygQiCOFa0tdWRiiJhadHMtNq9aTQ8EBUlSILg>
    <xmx:p3gbZ6lKiQs5Aa7gTOzG2AKLqnwhpsB34bwz8vKCg3idmWkBx_Ocyw>
    <xmx:p3gbZ01kmOCz3rv8ogRtf4gt1t0JdMpGEU5L3stWisTJOCAUzyE88Q>
    <xmx:p3gbZxt_4kiqScB6_1hrqI2Zd8dS49IqW9kSBCWFjuHM2j7Nfb8fTw>
    <xmx:p3gbZ1kzYMKLFPoJ35vNrkeKCxWycdN7pf6ZTqZNkqcvRESKGNuwP4MS>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DA4F32220071; Fri, 25 Oct 2024 06:53:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 25 Oct 2024 10:50:07 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 linux-m68k <linux-m68k@vger.kernel.org>
Cc: debian-68k <debian-68k@lists.debian.org>,
 "James Le Cuirot" <chewi@aura-online.co.uk>, "Sam James" <sam@gentoo.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Andreas Schwab" <schwab@linux-m68k.org>, "Thorsten Glaser" <tg@mirbsd.de>
Message-Id: <136f0492-fad7-4c75-b3c8-91ac7dc91570@app.fastmail.com>
In-Reply-To: 
 <bfc235822cf8f773689abfefe1a75abfcf860c93.camel@physik.fu-berlin.de>
References: 
 <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
 <383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com>
 <bfc235822cf8f773689abfefe1a75abfcf860c93.camel@physik.fu-berlin.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Oct 25, 2024, at 10:10, John Paul Adrian Glaubitz wrote:
> On Fri, 2024-10-25 at 09:55 +0000, Arnd Bergmann wrote:
>> I think the idea of using the generic syscall ABI (in particular
>> the time64-only variant) makes sense if there is going to be a
>> new ABI, and I can help figure out what needs to be done in the
>> kernel for that.
>
> I don't actually know whether this would be a completely new ABI
> as m68k has supported 32-bit alignment through the "-malign-int"
> switch for a long time.

Changing all system call numbers and a lot of the ioctl
structures definitely makes it a new ABI, regardless of
how much it affects general userspace, and does require a
complete bootstrap of the distro.

>> The question is really if it's already too late to do it now,
>> given the scope of the project and the limited developer
>> resources. Maintaining two ABIs in the kernel and toolchain
>> longterm is likely going to make things harder, and phasing
>> out the existing ABI completely will likely take more than
>> a decade. I expect that this is the same timeframe (mid-2030s)
>> by which we will be debating the removal of any 32-bit
>> targets from the kernel, in particular if we also want to
>> add 128-bit targets.
>
> I was not talking about maintaining two separate ABIs and I don't
> think it makes much sense to keep the old ABI around.

Doing it without a migration path seems worse to me,
as this would mean breaking every single existing
installation between two kernels, and making it impossible
to bisect other issues, and breaking the rule #1.

It's probably not necessary to support both user ABIs
in a single kernel image, but a kernel compile-time switch
would seem appropriate.

>> Based on those experiences, I think there is a significant
>> chance that adding a new ABI is going to make things harder
>> to maintain for both distro and kernel maintainers rather
>> than easier, regardless of how much better the new ABI is.
>
> The m68k port is already half broken because of the 16-bit
> alignment and I have to admit I starting to get tired of
> people telling me that switching the default alignment is a
> bad idea.

Understood.

> A current example is Python 3.13 which just crashes with the
> default alignment but builds just fine with "-malign-int".
>
> I really don't understand why there is such a big resistance of
> switching a port over to a different alignment which allegedly
> no one is using or maintaining.
>
> Someone made a bad design decision 40 years ago and we're not
> allowed to fix that because someone might run an old binary
> from the 80ies on a current version of the Linux kernel.

I'm not worried about ancient binaries, and I think a 10 year
transition period like in ARM-EABI or PPC64/ELFv2 would be
fine, but breaking all users from one release to the next
is a clear show-stopper.

      Arnd
