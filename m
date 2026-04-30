Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20F93BED19
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Apr 2026 07:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777534806; cv=none; b=UWNNzxq8BaE9kKrqx614rGbdz3nQqYjqMe0RvTPRst7X4arSUYZhPheMavmBKV8eId+1sP7bEK5zoy/cUzsQ9Ld0Z4GX7oyzlhg993/yHIcxgCtfmUajBZZ4pl2xP+ChOq2ZzDcvVtTEsW7s5XknV7WwdkpZOHlxFtLI+FxbBgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777534806; c=relaxed/simple;
	bh=yCT1vnVYGSijOZMxjTAfWYmJvGze24lqkpQDeabjJ/E=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=CUpC4Rl3NLi+H6hMNB6iGJD3/shcb1+cULzlgIKr+uuuaHicLWGbr4WpStyhTkzQHpD0X15lJdyVT4zkPUskAUHkiQIuKVNfJ/1r1oD34MF/lpVnkGrN1dqTP8Q5OYBV/Vmvt9ru05DoA0kpuxVC+IZcDFI98CR3PduyKvn+NxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tE3rumZL; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tE3rumZL"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E990761145
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Apr 2026 07:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881E4C2BCB4
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Apr 2026 07:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777534795;
	bh=yCT1vnVYGSijOZMxjTAfWYmJvGze24lqkpQDeabjJ/E=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=tE3rumZLIvoSJhY2OlZJPKkSgDLEjTPkDouawaviOo9NXQY7+KymIhPJPUcoJjg00
	 0X3M55hz072Wxlg9C+lh4Xlait3SsJTQNDMHhPgUAgQebZjnYZYuRPC3FH2jx5kEYm
	 yEqYqchfBSaITmykWRtiF4GquiXGSKgJ0QNn7fSqt5bjozUpaYBelG3BX1ikINzaoC
	 +k+HFMjHphyFT/YV7htFjWU03KVNtnipZs0Jtqr6QTPMX7dkz4PfFJh+FPwToDnRUr
	 HjoeDiTPp509g6w3KD/cA68VYJLp8o4JFIDcHxhBq8p5cMGNTCQmLsbPBaWvJ+nFJw
	 oBD2aDw/WqAeQ==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9A4DEF40068;
	Thu, 30 Apr 2026 03:39:54 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 30 Apr 2026 03:39:54 -0400
X-ME-Sender: <xms:SgfzadfH0MOg7Wv8ihZbU7OOQ9IqwJZjPES2zWxZ2rK9rg7wmdmMNw>
    <xme:SgfzaWAUM3sghlZawiSdW3-x_ivqObIhdGokI8_nUZKjxw2piLVPFYFjRXIZ58y0D
    Y9_JIc2Tte7LuaqKBNr4jLKEAFjcUqM18zuqeb0QJyWzMPDZtDl4v0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekieejgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepofggfffhvffkjghfufgtgfesthejredtre
    dttdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhn
    vghlrdhorhhgqeenucggtffrrghtthgvrhhnpeeiueevffehieetgeefkeetkeekvedute
    ejffetudffgeefieeufeejjeejieevudenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpegrrhhnugdomhgvshhmthhprghuthhhphgvrhhsohhnrg
    hlihhthidquddvkeehudejtddvgedqvdekjedttddvieegqdgrrhhnugeppehkvghrnhgv
    lhdrohhrghesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehgvghrgheslhhinhhugidqmheikehkrdhorhhgpdhrtghp
    thhtoheplhhinhhugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:SgfzacLSSIKUBrAx_GB5-6MVAPANLFOEx5aWtwdlqLi7zR04JB-avw>
    <xmx:SgfzaaFRDpW0v4o5GrdEY1T4VElma1vYglbq026lox-iu0yeWvuUzQ>
    <xmx:SgfzaUTloRxT5V0hKB4FFb1-C1zCSTIby_X1HYpF5kBh8TJHFTeRhw>
    <xmx:SgfzaWGhMZUjwNh2Ea-SytWVYThUPQvK3FELJdHvdIqgPrxpeMSVCw>
    <xmx:SgfzaQ-PH9x0_pHYVvPXhoD_oMHtX7K1LohVzNI6RhFpRLmERZLj9o52>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7916E70006B; Thu, 30 Apr 2026 03:39:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ayu6HKOn_iMR
Date: Thu, 30 Apr 2026 09:39:34 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Greg Ungerer" <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Message-Id: <18b7cda0-98b5-46fc-8a6b-926138853b6a@app.fastmail.com>
In-Reply-To: <20260430052047.1827575-1-gerg@linux-m68k.org>
References: <20260430052047.1827575-1-gerg@linux-m68k.org>
Subject: Re: m68k: coldfire: create internal register access defines
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Apr 30, 2026, at 07:19, Greg Ungerer wrote:
> The readx/writex family of IO access functions for ColdFire are
> non-standard. They return native endian data for multi-byte access,
> which on m68k/ColdFire is big-endian byte order. A number of places
> need fixing to change readx/writex to be more standard - a lot of
> the CPU/SoC architecture specific code and a number of drivers.
>
> The existing ColdFire CPU/SoC architecture code is inconsistent in
> how it accesses SoC hardware module registers. Both readx/writex
> and __raw_readx/__raw_writex are used across the code base. To clean
> this up this set of patches moves to an internal set of access
> defines for the CPU/SoC architecture code. The following are defined
> and used for all internal register access:
>
>     8 bit read  -->  mcf_read8
>     8 bit write -->  mcf_write8
>    16 bit read  -->  mcf_read16
>    16 bit write -->  mcf_write16
>    32 bit read  -->  mcf_read32
>    32 bit write -->  mcf_write32
>
> To ease review I have broken the changes up a little, grouping major
> blocks together instead of one huge patch.

These all look good to me,

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

There are still open questions about how to continue from here
to change the existing readl() and ioread32be() style helpers
to have normal endianess and type characteristics without
breaking things, but this is a good step in that direction.

      Arnd
