Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9DA318ED6
	for <linux-m68k@lists.linux-m68k.org>; Mon, 13 Apr 2026 16:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776099168; cv=none; b=r9m+v2qnu+IX/b55tcSq6eAMhwPQPltMxAnbj8KNNdDMq61Q8J/9NDUN3nyoLxYmSCSQhF2XG5M7cR7WoFmExS3ci3v+hm0G9bIEo7PRzzbe7fRVAlTSZqwptu0XHOH0ZirEro/HOasellc9echMDQa+FiCew0uXICmLJYM7els=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776099168; c=relaxed/simple;
	bh=euVo7nnFAzz1AdYnT65yR2VKwBKEniSBlvYEPttVFY8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Z4jNjyllbyJl5XexYbJWqE14s1/k4Ysl6OrG+cbn2H9tc+62yiRU3NnF3ctiuHkAyiy85M8XFfWwxzioS8jZuRNVG8CTLQrX8yJ/eQmkH7+KHrGZv3wqNr91yBmjryKgKG+3tbnqSXeZR+MF89yPOemlbUg19x7rG2u43uTKGT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AwU9OkXE; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AwU9OkXE"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 603A16183C;
	Mon, 13 Apr 2026 16:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C43C2BCB0;
	Mon, 13 Apr 2026 16:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776099166;
	bh=euVo7nnFAzz1AdYnT65yR2VKwBKEniSBlvYEPttVFY8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=AwU9OkXEl1KG1okaBfaCvaLzE/aqn5N7zqBg2PPVWYnM7kfolslDoY5nL5DW4+W/i
	 JWfwxchx3U7vNy7KUcDvi2Gvk60YUx4DZpVzaugJP+uzs1uQi8ASx7Xyomno12nPZ0
	 AwKod9A907DnsEgmqvXFtbivxB/XhYw6B2LzhJ3gjNuOFcLNrJq0WeG03+fodcF2km
	 pLS7P9yM7vVNfcV2BnIK9eS1JbXbvQUGQFsI4slJ0LG7VmiRyCPctjeRcLp6NQ9Lwk
	 FbPzx1TObRKzFmsdOumPS0G968QaC3C4u0plkw1jvVX1AuVxN2KIih3O/mHC3v2Dht
	 F1rLCs1MEWqqQ==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id DA590F4006A;
	Mon, 13 Apr 2026 12:52:44 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 13 Apr 2026 12:52:44 -0400
X-ME-Sender: <xms:XB_daegE4umSP3e6A7-bgWwyo5B3tVmzY61lsseZYGSipiryyBZ83A>
    <xme:XB_daZ1aEzfteqXTYa2VT3lnoaVjRz0rGA1sZcPXI-5LRM3X-vmmuKobe7ZfdLxXe
    KLzlg4lQaVLams7_Oy_CGTXAz2Js0LOlBBX8jJXt7h6TNazMwn2Uw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefkeejiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpeejteeguefhffevgfehueetudevieeuueffhedvvefhjedthfdutdethefgfeek
    leenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhguodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdduvdekhedujedtvdegqddvkeejtddtvdeigedqrghrnhgupeepkh
    gvrhhnvghlrdhorhhgsegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepiedpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepuggrnhhivghlsedtgidtfhdrtghomhdprhgtph
    htthhopegthhhrihhsthhophhhrdhplhgrthhtnhgvrhesghhmgidrrghtpdhrtghpthht
    ohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepghgvrhhgse
    hlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmieekkheslhhi
    shhtshdrlhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrh
    hnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:XB_daYiTPAIlEfEP204Sti1_qDfCOkrEAGtC4YjXcdzyjUNUucSKLw>
    <xmx:XB_dab8f5-CA3cDHe6zEfGjmV-ysOTImaC8OGXrUeo2Qk6pJbpDYVg>
    <xmx:XB_dafGUCl3hmF0Ds8PQy6wsc3BBkpLE_FEZCqMajVP4YXiC46BAZg>
    <xmx:XB_daen0S2qkvSLX2XqC7rgFQn81hkfIpQive4XXa_VujhgZEO3LbQ>
    <xmx:XB_daTZ5cEAJuqFO59gydH65mV5ZEIdKieJyk571_KEn_ksb4ZGQCVp2>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B85C2700065; Mon, 13 Apr 2026 12:52:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AbTBWCF3eo87
Date: Mon, 13 Apr 2026 18:52:23 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Daniel Palmer" <daniel@0x0f.com>, "Greg Ungerer" <gerg@linux-m68k.org>
Cc: "Geert Uytterhoeven" <geert@linux-m68k.org>, christoph.plattner@gmx.at,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Message-Id: <2ee820a1-4169-4345-97cf-d481fa3679bd@app.fastmail.com>
In-Reply-To: <20260404024658.2496519-1-daniel@0x0f.com>
References: <20260404024658.2496519-1-daniel@0x0f.com>
Subject: Re: [RFC PATCH] m68k: nommu: Fix behaviour of io macros on non-CF
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Apr 4, 2026, at 04:46, Daniel Palmer wrote:
> Currently for 68000 readl() and friends are broken in that they
> return the value from the bus as-is but should be reading a little
> endian value and swapping it to big endian.
>
> This was found using virtio-mmio on a 68000 virt machine. virtio-mmio
> is little endian even if the emulated machine is big endian. This works
> for MMU m68k because the io macros do what is expected there, but if
> the kernel was built for nommu it breaks.
>
> Potentially this will break some stuff for nommu non-CF m68k users
> but since there are probably 2 or 3 of us in the world I think we
> can work it out.
>
> Suggested-by: Arnd Bergmann <arnd@kernel.org>
> Link: 
> https://lore.kernel.org/lkml/ada73dc9-edf5-458c-8849-9f9db23ff304@app.fastmail.com/
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

It looks like the non-swapping readl() on nommu-m68k predates
the git history, but apparently the coldfire version was fixed
in 4d5303787627 ("m68k: fix read/write multi-byte IO for PCI
on ColdFire") to behave like everything else, and dragonball
appears does not support ISA or PCI buses, so it never used
them.

      Arnd
