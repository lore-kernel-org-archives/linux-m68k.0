Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501B2377553
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Apr 2026 07:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533681; cv=none; b=SzcVnbl7NxVP9ci4BLZ/5dSin7qoGtc5KFWqMElvtA43jN7RTne4kMuojVpJG+o6OUnGTLR/jTrID6TrXwmO6JagwlRGC8h0vPV1LptsdBk+oLmULvLJOB0UWIHhMlUjCEWB0oBp3f/m3HdSuXGjX2FOs2w1IGDOfEaB/SxRrDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533681; c=relaxed/simple;
	bh=aYI61VNLItW0T+fqFxejokseBuaVwAtUHG7b3UEI3RA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=BpWs8qp4jxA36cCzjBhY0/UYSzdnrnZo9z+e9roxuu8sw5VLuXSjoibcONfce4mIcYPMiNhaB9J+NfMc7YPn8g0mfC4vWATDWy6V26Uck16s2hHchh8o977z91GJHfhhAOwAur3crofQCJYhU0EiHQlTGwk6SZurnucdlT9PWxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ji2wj/cK; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ji2wj/cK"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 69A5C60582
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Apr 2026 07:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06DDFC2BCB3
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Apr 2026 07:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777533679;
	bh=aYI61VNLItW0T+fqFxejokseBuaVwAtUHG7b3UEI3RA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Ji2wj/cKITT9UgnfCwg4tOOKNlJJPJLEL0hLFbml4mhHa+ikd5SogQSJnSaM3MRB/
	 bEdN8Gy84c48I1djNBqbvVSLeTeSOzluo9rBv44gCqrUnQj71KCibFvHErCdvYI4xN
	 kyyHyYutB/SYfUWpYIyV7riFdavhPcfXr7r0Y3Zzh8tPYxMgjUbTn1l4JcS09QF9q8
	 w1J6sCpLkw+/x1pweNeK97YmxnjJAASYt/NP2BaalGM+ilsBJE9d4Nn4U7fYXfC634
	 bJORNxDyBww1N+O/+jwXEMbCZBT0S597bSxh7++z6JWajWhjytcQ44uFoTyxVDrX/U
	 nB+GT0d1md5Zw==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id F1C4DF40078;
	Thu, 30 Apr 2026 03:21:17 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 30 Apr 2026 03:21:17 -0400
X-ME-Sender: <xms:7QLzaRoKlOdSi6o029JX9I4y6O7hIuCsGIqSZj6DW_l9Jj-6rEv8vw>
    <xme:7QLzaed8olLE-SR3SEz4MBPfsQe6Hd2GJwdjrf8h4lrwmGX5fq2xKZTVwo5t4MhN4
    AcCX0-RT8V5VM7PkEqTiu7ZCDB3bgTPKZglLQXujX0FS0Gf1DGDG18>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekieejudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpeeivddvfffhfeejfefhtdffteejvdegheefvdevtdekkeefjeegkedvheetuefh
    gfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidquddvkeehudejtddvgedqvdekjedttddvieegqdgrrhhnugeppe
    hkvghrnhgvlhdrohhrghesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeegpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehgvghrgheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepghgv
    rhhgsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmieekkh
    eslhhishhtshdrlhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:7QLzaSSXaMRLWtpgsmJK93mEckUBI5C3kuaqVrVSfCv7Kkc2V78hdA>
    <xmx:7QLzaVnAov6cGxEVb1fS6g4uKfBZpQQkyH0WQG8uAsAfUvrF8kckTg>
    <xmx:7QLzaaQRadGZDvp_Z1Yl9vcNDdM7Ef13iCeTMPFjKRWH2TNdiHU5cQ>
    <xmx:7QLzabMoXFmd-KTPXKZYe0o20v529YrIVkdCKnkQXWuwX5GnCVZdLQ>
    <xmx:7QLzabU5vR8Cz2hL3ZQlgP_AC5vn9ov0h2EGXjwAMKmbYIl9_nXXCZRJ>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D2F70700065; Thu, 30 Apr 2026 03:21:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AWNyG37R7Ib-
Date: Thu, 30 Apr 2026 09:20:57 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Greg Ungerer" <gerg@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, "Greg Ungerer" <gerg@kernel.org>
Message-Id: <b7bac366-f9f5-408b-9359-ae6a4c8cab44@app.fastmail.com>
In-Reply-To: 
 <CAMuHMdVDMnxkF+eKwtSoBt7g_5sqY_O4zLT_icD9zTNuS8ou0Q@mail.gmail.com>
References: <20260430052047.1827575-1-gerg@linux-m68k.org>
 <20260430052047.1827575-2-gerg@linux-m68k.org>
 <CAMuHMdVDMnxkF+eKwtSoBt7g_5sqY_O4zLT_icD9zTNuS8ou0Q@mail.gmail.com>
Subject: Re: [PATCH 1/7] m68k: coldfire: create IO access functions for internal
 registers
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Apr 30, 2026, at 09:13, Geert Uytterhoeven wrote:
> On Thu, 30 Apr 2026 at 07:23, Greg Ungerer <gerg@linux-m68k.org> wrote:
>> --- a/arch/m68k/include/asm/io_no.h
>> +++ b/arch/m68k/include/asm/io_no.h
>> @@ -107,6 +107,22 @@ static inline void writel(u32 value, volatile void __iomem *addr)
>>
>>  #endif /* IOMEMBASE */
>>
>> +#if defined(CONFIG_COLDFIRE)
>> +/*
>> + * The ColdFire internal peripheral registers are big-endian, so you
>> + * cannot use the conventional little-endian readb/readw/readl and
>> + * writeb/writew/writel access functions. Define a family of access
>> + * functions to give correct endian access that can be used by all
>> + * architecture code.
>> + */
>> +#define mcf_read8      __raw_readb
>> +#define mcf_read16     __raw_readw
>> +#define mcf_read32     __raw_readl
>> +#define mcf_write8     __raw_writeb
>> +#define mcf_write16    __raw_writew
>> +#define mcf_write32    __raw_writel
>
> Why not call them io{read,write}{8,16be,32be}(), like parisc, powerpc,
> and sparc, do?  Sparc seems to be the closest match:
> https://elixir.bootlin.com/linux/v7.0.1/source/arch/sparc/include/asm/io_64.h#L439

I think that would be the right choice for introducing these from
scratch, but we can't easily change the existing code in small steps,
for two reasons:

- the asm-generic/io.h already provides ioread32be() etc functions,
  and these are used today on some of the coldfire drivers, but by
  accident these have little-endian semantics (since readl() is
  big-endian here), and at least one driver relies on it being that
  way.

- readl32be() really wants an 'void __iomem *' pointer, and we should
  not have architectures that do something different here. The coldfire
  __raw_readl() accepts both pointer and integer (phys_addr_t etc)
  addresses at the moment, and the arch/m68k/coldfire code for nommu
  targets uses that. Changing these to use ioremap() and pass pointers
  would be a much bigger change.

      Arnd
