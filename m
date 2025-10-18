Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8980284690
	for <linux-m68k@lists.linux-m68k.org>; Sat, 18 Oct 2025 03:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760759950; cv=none; b=hvOxKCWBre9rbwRJc21Gz6DXzH+dPJJhdaQ+GpVGWwdLsud3oLfptiabq54Wq5EeBf1boO8Sj6MyF3HGoW/PnvXz/+4YdaRvfgg4041Mh3u+a7uBwD05vrloQkhb8hwFRLtNV03zvGFYInn3/A2MkvHyFWi49K6eBQn4+GplWOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760759950; c=relaxed/simple;
	bh=EU6U5Z1y6eCiRh+fXNU8O/thPLmzUksR4n4H3faDx18=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=D/VyPWg6y24cWOtBtUYqd1vwBBiRsPvUqJ/OIfNd/arGchGPPDy+pz+EDf6zMxOF+HJ8xEdolHmuK3G31Apyd/qGlof1YQso5po937tgO/jgQBHaa+PtwDG0nWoHhajUxSOrXLrMkf9cFN9w++xQduPnydQ13z+TLj/iYlXoVKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=krIfENMf; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="krIfENMf"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 225F941B3C;
	Sat, 18 Oct 2025 03:59:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E640C4CEF8;
	Sat, 18 Oct 2025 03:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760759947;
	bh=EU6U5Z1y6eCiRh+fXNU8O/thPLmzUksR4n4H3faDx18=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=krIfENMfuFjiHhOD9R6DJZJbEI9qyq58vTH4tVORoQRTS2pGY5lkJEIZDY6cO/JsF
	 7rV4qf/QB3xJavBLHP0t1tOOd2ijiKeeH7r5PBJer2K+56mKaBeK4gxS6ShjW6W321
	 VkvkNEiUhE+GJg+MsRokLA9CNBFgs7U0v7KF5BOur/qWmLZ7DKTce6BLHyqQ3UmI3d
	 h3G0koy5DXW63vce1vAszW8CD0JUM4rwNfwwIrL7aT81malR9QIBv5/P/aZVWwdmzB
	 yRQW1/nRqFaZ64tNvz5lQ6FqKOjnXl5DoM5YdsFKHtq3AqF25dzypI1i46AMW/sKZH
	 62a7C0hJMLpqQ==
Date: Fri, 17 Oct 2025 21:59:03 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Trevor Woerner <twoerner@gmail.com>
cc: linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
    linux-aspeed@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, 
    openbmc@lists.ozlabs.org, linux-hexagon@vger.kernel.org, 
    loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
    linux-stm32@st-md-mailman.stormreply.com, linux-mips@vger.kernel.org, 
    linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
    linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, 
    sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] defconfig: cleanup orphaned CONFIG_SCHED_DEBUG
In-Reply-To: <20250828103828.33255-1-twoerner@gmail.com>
Message-ID: <e88ab2ff-dc16-dab7-0ff3-702f093563ce@kernel.org>
References: <20250828103828.33255-1-twoerner@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 Aug 2025, Trevor Woerner wrote:

> In commit b52173065e0a ("sched/debug: Remove CONFIG_SCHED_DEBUG") this
> Kconfig option was removed since CONFIG_SCHED_DEBUG was made unconditional
> by patches preceding it.
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---

[ ... ]

>  arch/riscv/configs/nommu_k210_defconfig        | 1 -
>  arch/riscv/configs/nommu_k210_sdcard_defconfig | 1 -
>  arch/riscv/configs/nommu_virt_defconfig        | 1 -

[ ... ]

Acked-by: Paul Walmsley <pjw@kernel.org>  # for arch/riscv


- Paul
