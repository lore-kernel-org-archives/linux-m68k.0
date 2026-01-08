Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D84D451DDE
	for <linux-m68k@lists.linux-m68k.org>; Thu,  8 Jan 2026 09:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767866206; cv=none; b=haZO0C77X9sr67YxRFZxDKWwN/RvNaV3XRetvn8uSoqQfMqKag10qEvMhkCnIFVaSQsOFdz+Z+qvgJqsqr8sBUn8XUOiU1m66gXj8gMeLRClWHX8BCKPZtz7kXrVEn6wbu01wqi26HRBlvnz17S3qaKHE/U8dSquGjvVXwWtl8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767866206; c=relaxed/simple;
	bh=JxBfb4Vd9ZhE611xAUirrZMNNrtmcINFqRVRBElembY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rg2jkHfl7/OfANC1Luj5zjp+AsZMkTxWkdd/GI+fKt201zGoDm57FLeI4cgJY/FkLS/urUifqdGFr6u0xO3n5tgpVmluDnWP0oyZZyyg7souyyarHWksgm5eztjgvHDAgf4QfUy4SgCDA/ivrhuZfX8ejnVaHQSTvWzDXolfHtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=y6vMErdk; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="y6vMErdk"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 005181D0009F;
	Thu,  8 Jan 2026 04:56:33 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 08 Jan 2026 04:56:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1767866193; x=1767952593; bh=ou/7nj7/Arzz4cPpvcN+Il6NxAflPPdyRjx
	6ts7vKTU=; b=y6vMErdkcD0SCYeP9rXMkfxvzq3lEkwbgYrcLa9/YQ8jgOR0PAP
	wXFmCCSfAh2x6Wr818jsVJ37cZlf73e+GhqEKwTsvv6hhpTuDCLc9bZ/xlQFMBnP
	KzqH2tNoJpvMKbSHNnJwoSRt3Sy+Jj7HcQJV+v99zQtHysTSMhafccvRfFh5BfSj
	2ztxWLP2zF0Try373/eeFXhGEikneF1PiH/bonsm8/YJCWU8Eel42Yhk8lgm8OAQ
	8X/86gcXOd5aLfOsk3/b8EnUVh1TyMxXdtbxtHZ74HJmd+LiDyZqo1K6NhSBq6o2
	Ov/1laqbUwi5Ly8P7bQMbleuB5CIj3SPdkA==
X-ME-Sender: <xms:UX9faaL40ZlCk2WAQ6oGzrs_jXij7G9Bp08UsqLewjY4J4QRgJekfg>
    <xme:UX9faZlg8oYzThnSzP1bt4_gzCQ2xyqE_LnsyaTGDFBmZ1xyamySxavyzIJoU25A5
    HoO9e_GLLiJJtKjIFIFQy3MAgRJfaQYlnF7N8nYdHb3xzo5q5zDRxg>
X-ME-Received: <xmr:UX9faYGfhidHEKe-rTS43i-vbENU-coQPQpPd6bOaOOWQAuFoCYhT7pgCZDsRP8eXFJ_TOvtEpj36h02YBxLDwY7XkiNNGlPfv8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdehieehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefujgfkfhggtgesthdtredttd
    dtvdenucfhrhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhm
    ieekkhdrohhrgheqnecuggftrfgrthhtvghrnhepleeuheelheekgfeuvedtveetjeekhf
    ffkeeffffftdfgjeevkeegfedvueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
    dpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshht
    vghfrghnrdhrvghinhgruhgvrhestghorhgvsghoohhtrdhorhhgpdhrtghpthhtohepgh
    gvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhei
    kehksehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:UX9faZFTVpml-saYKbB_RKTakB-znIVtguE9AuPkc2Y7YdIua2FNDA>
    <xmx:UX9faVNW4wrZbPOYnLrK-Xld8Z3rQBMHH5GipOgTW3iD3td6XTQKIw>
    <xmx:UX9faYHUb3uj5J701RS69KQUhe2dimSrKUVwllq-T0LbQeKmfzr3qg>
    <xmx:UX9facNqSDqle9uLGl9SqTfYpbou7q38Sz6EB21SfXwsTg0__9Q_ig>
    <xmx:UX9faeJhI6sYsaxw2St9tgLjnrcqPjCpU8MAH_r8wmaCSUXsGeTaAvUa>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jan 2026 04:56:30 -0500 (EST)
Date: Thu, 8 Jan 2026 20:56:31 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Stefan <stefan.reinauer@coreboot.org>
cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH 4/5] m68k: Add vDSO userspace clock_gettime64
 implementation
In-Reply-To: <20260108060533.3891380-5-stefan.reinauer@coreboot.org>
Message-ID: <3252e3e6-5eb4-3cba-9113-09e3febcc953@linux-m68k.org>
References: <20260108060533.3891380-1-stefan.reinauer@coreboot.org> <20260108060533.3891380-5-stefan.reinauer@coreboot.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Wed, 7 Jan 2026, Stefan wrote:

> +
> +/*
> + * Read the VIA Timer 1 counter (both high and low bytes).
> + * The VIA 6522 timer can be read atomically by reading hi, lo, hi again.
> + * If hi changed, re-read lo to get a consistent value.
> + * Returns the full 16-bit counter value.
> + */
> +static inline __u32 via_read_timer(volatile __u8 *timer_page)
> +{
> +	__u8 hi, lo, hi2;
> +
> +	hi  = timer_page[VIA_T1CH_OFFSET];
> +	lo  = timer_page[VIA_T1CL_OFFSET];
> +	hi2 = timer_page[VIA_T1CH_OFFSET];
> +
> +	/* If hi changed during read, lo may be stale - re-read it */
> +	if (hi != hi2) {
> +		lo = timer_page[VIA_T1CL_OFFSET];
> +		hi = hi2;
> +	}
> +
> +	return ((__u32)hi << 8) | lo;
> +}
> +

If you test that algorithm on genuine hardware, you'll find it is slow. 
Each VIA clock cycle takes 1.277 microseconds, and each VIA register 
access requires one VIA phase2 clock cycle. That's why the via.c 
clocksource sacrifices timer precision to gain performance.

In the common case, your algorithm makes 3 accesses where the existing 
code makes only 2. In the wrap-around case, your algorithm makes 4 
accesses where the existing code makes only 2. That's why I didn't use 
that algorithm when I wrote the via.c clocksource driver.

If there really is some advantage to doing this from a VDSO instead of a 
syscall, you can't really measure that in QEMU, because its VIA timer 
emulation is inaccurate (though it is fast). I suggest you try MAME if you 
don't have the necessary hardware.

I expect that writing patches based on QEMU's behavioural simulation will 
lead to churn in kernel drivers, poor results on genuine hardware, or 
both. That's why all of my driver work is done on actual Apple hardware.

Anyway, get_thread_area() is a real problem, and it's great to see that 
you are working on a solution for that. Thanks for your patches.
