Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6351AF4E9
	for <linux-m68k@vger.kernel.org>; Thu, 14 Nov 2024 22:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731623883; cv=none; b=BS8HRm5XaSyxb9mHKnmceuWxoxL62+LyWoqSMgGidV535MZgLPBRJjZD+apCXL8tp8qmFtF04jYlzEQrxodbhEDcqg8W3C93Drht2laFyZWMO4REXRvKc8+s4hr/El4YMSU4kEZ5J6EWNazc5x3zPcNgAYjnj70h8R11rwTE1IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731623883; c=relaxed/simple;
	bh=LuyVA2M0eAhTxduBjPhtuYSYMERue9n9FnNFxFhR2u4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=FtOmfWMHQNPQcV90IkjUgZVFqHqlYk+yoXxFDNhooKQ8GPI7/tuNuqFy4yztvEhVRPk+nIehwBBZUjPkk5xC8hhYy3TQHRwOudet7+sr39m7vbzDWiJh3Wbtk8S1u0IK2YHT5pwGJFxuLkrJAYFmovYeusefQtEDJrmxvIiDenc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aura-online.co.uk; spf=pass smtp.mailfrom=aura-online.co.uk; dkim=pass (2048-bit key) header.d=aura-online.co.uk header.i=@aura-online.co.uk header.b=s3nes7BN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YbYIucUZ; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aura-online.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aura-online.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aura-online.co.uk header.i=@aura-online.co.uk header.b="s3nes7BN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YbYIucUZ"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id E48781140089;
	Thu, 14 Nov 2024 17:37:59 -0500 (EST)
Received: from phl-imap-01 ([10.202.2.91])
  by phl-compute-11.internal (MEProxy); Thu, 14 Nov 2024 17:38:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	aura-online.co.uk; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1731623879; x=1731710279; bh=LuyVA2M0eA
	hTxduBjPhtuYSYMERue9n9FnNFxFhR2u4=; b=s3nes7BNCh+XuRw+dSu7B808ro
	w0SMPd7ld0JD7vY3YI09Vq9D9h+Ruj/bxdVUK1dXYjnEYSbomo3tSuRDnIij3YSI
	UsCCHnwqD6NQNWfHq3VTHUTD/5jI4sTfHmjtOHs/2FAFC0yiiXQZ7TVQ2+0aiu0n
	sypW9cmwO2f2ng2qap9q55NVZ3bo72Hjeea52yQyc69clSrGJnmwP0DNeoqk6qtg
	BGPRpkHI8EOfDlqBUzmB92e/iA5Ktf6r0aCYPsesFmQytLAZmvsGCg+kAfs2zEuL
	dx1fsADFv0tK+cROMRNSkNJR1Rd2ykpMBim+vdUEkbfRBWCw9e95/DwNBS/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1731623879; x=
	1731710279; bh=LuyVA2M0eAhTxduBjPhtuYSYMERue9n9FnNFxFhR2u4=; b=Y
	bYIucUZQldZIlmRHgHNvxlO0i6XFHl6OI3yM8kzp6/lZGaDT5b2UEC7IkcD7zJyI
	SwB0wZDWl/x0WmXutP1wt2UCrXJ1aG4+RR/fjDEjZgm6r/n9XjkLsYX7DzGgE+Z7
	DYyKUdKwDndklF1Ipj6cLoNn/SZ6sM5jMS1QDHVM7irv2jT33o/XVxGxBUXTXDF/
	qob8X2+vV2sZTCKCMgCNUdFWYJONXI5WrLOwYvCzml7MfSmHLLbetyz8ENV+tycV
	ismMWqe89mKmPJrJ+bcMZlzh0KsmDnRbGw9fGJcce34PHbeWmh9lL7Y6oUT1eMg2
	L4g4KX5tpcwSpceR5fSGg==
X-ME-Sender: <xms:xns2Z4XbjaHbb9KUE-ulI5ybkzM55zAptKt3iJ_BC5jxhtpdmDCfRA>
    <xme:xns2Z8kRMjlStW_NLl_pnjlWxQYfm6OFMt7zRfz6khxcv7-ZY-FECIQpwtWVzyPiQ
    X2CiT7X4M50Ew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrvdefucetufdoteggodetrfdotffvucfrrh
    hofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfurfetoffk
    rfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculd
    dquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhr
    ohhmpedflfgrmhgvshcunfgvucevuhhirhhothdfuceotghhvgifihesrghurhgrqdhonh
    hlihhnvgdrtghordhukheqnecuggftrfgrthhtvghrnhepgffhheeitdeltedvjeetvdef
    veelfeeffeetgfegieffffegheeludduffekheegnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheptghhvgifihesrghurhgrqdhonhhlihhnvgdr
    tghordhukhdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehtghesuggvsghirghnrdho
    rhhgpdhrtghpthhtohepshgrmhesghgvnhhtohhordhorhhgpdhrtghpthhtohepghgvvg
    hrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepshgthhifrggssehlihhn
    uhigqdhmieekkhdrohhrghdprhgtphhtthhopeguvggsihgrnhdqieekkheslhhishhtsh
    druggvsghirghnrdhorhhgpdhrtghpthhtohepghhlrghusghithiisehphhihshhikhdr
    fhhuqdgsvghrlhhinhdruggvpdhrtghpthhtoheplhhinhhugidqmheikehksehvghgvrh
    drkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:xns2Z8aA-ADeNZkLZllu67OeEKvXYLpzejy5f6FU6ERgF0OQpGC_Rg>
    <xmx:xns2Z3Uk7FyExp5YAnGsW_FWt9TzgeKthy8KZnJx-f_7uyyhiirV8w>
    <xmx:xns2ZylobAcM6mXtL6tPxKPt8oilYfZ4tW9RXXJMw2AoeatVHq5s2w>
    <xmx:xns2Z8fLb6NnYSPXQ4hNrc4dvwNBqZlFXTc26vAtd8OfuHUfkg5NNw>
    <xmx:x3s2Z84mgQHhTHNdKqTauyX3WLTBHjJ-AvvTP0qUEW95mevP2Yww-IC0>
Feedback-ID: i51cd41ac:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 63A22336007C; Thu, 14 Nov 2024 17:37:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 14 Nov 2024 22:37:37 +0000
From: "James Le Cuirot" <chewi@aura-online.co.uk>
To: "Thorsten Glaser" <tg@debian.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Arnd Bergmann" <arnd@arndb.de>, linux-m68k <linux-m68k@vger.kernel.org>,
 debian-68k <debian-68k@lists.debian.org>, "Sam James" <sam@gentoo.org>,
 "Andreas Schwab" <schwab@linux-m68k.org>
Message-Id: <caea6955-f222-46ae-aa93-fa534a18940d@app.fastmail.com>
In-Reply-To: <62306047-fd95-8f06-fc71-9547ff9bed0b@debian.org>
References: 
 <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
 <383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com>
 <bfc235822cf8f773689abfefe1a75abfcf860c93.camel@physik.fu-berlin.de>
 <97b0a5de-885f-ffde-3739-f7f29b16d3bd@mirbsd.de>
 <CAMuHMdUSy1zCyUV9NYyy4CT3qTYJkV0G4REtfjROEWsTc53RuA@mail.gmail.com>
 <62306047-fd95-8f06-fc71-9547ff9bed0b@debian.org>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Thu, 14 Nov 2024, at 22:13, Thorsten Glaser wrote:
> On Thu, 14 Nov 2024, Geert Uytterhoeven wrote:
>
>>If we decide to change alignment, I'd rather change all types to
>>natural alignment, to avoid future nasty surprises.
>
> That was my thought; the question is whether toolchain maintainers
> (upstreams) will be amenable and helpful.

It may help that LLVM/Clang does not currently support -malign-int at all.
