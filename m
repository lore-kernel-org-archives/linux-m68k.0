Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579F13D9025
	for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Apr 2026 15:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775834045; cv=none; b=R+RKWZyRjMFyJt41UYWGY5mJwNllDVxp21tI7a23x/XcCNA5o/70+S6BAlF7X1QC4yJVs40QKOmHdcJ7VE+5CX2Z4xlk3srWWOiVa4WJ2RAeexZepxrsK9+AK6a4y1G2/s4FRr2O1YW+aw8c3qjTphN2hNytpeWc84NBtPI4P44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775834045; c=relaxed/simple;
	bh=ZX44VkA/oGGdYrqGVtHG3BQ09eU0s5TAD8UsmKEvOJ4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fJD3ktpqjSy6XjZZ0oZOu2NlksCmCRp/T6jvEswmGuS1cBa85U2RY7I4cAEnrs9ZaCnQJ5S/Q5Qie5XhQlHWKIqVwPR6hLztClZ5incYUq7UadAmdUmyIj97833NIo7/tlksjmBvI1oIAAQI3Tm6OGLzaOALm3k4YVx9KW7VRkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DQRfv3hP; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DQRfv3hP"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B0CF43DD6;
	Fri, 10 Apr 2026 15:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA7DC19421;
	Fri, 10 Apr 2026 15:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775834044;
	bh=ZX44VkA/oGGdYrqGVtHG3BQ09eU0s5TAD8UsmKEvOJ4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DQRfv3hPFw/TKa/ZakF0C/CvhlLPEsVqQv+2r4uwxdObvOGMMWr2s346gixb/wzYP
	 kH3jI1VGrMbPCg8bbeliLsWsv0WorMVV9pr65pzZbqt3ANfLMAZ3WpCzHo7EbPC0aw
	 sFqvG5W5Zh5Zl9hqpd/S10vk3SPDt4AvvXdP7MWFAVnJ1yy95RtrFN5r3P/n0YzraC
	 K1ddeqgVvP6yW3cqrHOPD+5bbhJuKzxhUEtkBkREvZCz2D1PF358eBsZtX1OaLotF8
	 mIrAdKqmlNIgawRmNAF5mT5jG8tytmCXBJPCuscrYjON8tMw7soKn19X1CoLhvhPBR
	 sIA/Sxe0F1CKA==
From: Thomas Gleixner <tglx@kernel.org>
To: Baolu Lu <baolu.lu@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>
Cc: baolu.lu@linux.intel.com, x86@kernel.org, iommu@lists.linux.dev, Arnd
 Bergmann <arnd@arndb.de>, Michael Grzeschik <m.grzeschik@pengutronix.de>,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org, Herbert Xu
 <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, Vlastimil
 Babka <vbabka@kernel.org>, linux-mm@kvack.org, David Woodhouse
 <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>,
 linux-fbdev@vger.kernel.org, Theodore Tso <tytso@mit.edu>,
 linux-ext4@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, Andrey
 Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer
 <t.sailer@alumni.ethz.ch>, linux-hams@vger.kernel.org, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, Richard Henderson
 <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, Russell King
 <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Catalin
 Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, Dinh Nguyen <dinguyen@kernel.org>, Jonas
 Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Michael Ellerman
 <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, Paul Walmsley
 <pjw@kernel.org>, linux-riscv@lists.infradead.org, Heiko Carstens
 <hca@linux.ibm.com>, linux-s390@vger.kernel.org, "David S. Miller"
 <davem@davemloft.net>, sparclinux@vger.kernel.org
Subject: Re: [patch 09/38] iommu/vt-d: Use sched_clock() instead of
 get_cycles()
In-Reply-To: <9db9515b-08e8-47bd-aced-206ac183195a@linux.intel.com>
References: <20260410120044.031381086@kernel.org>
 <20260410120318.187521447@kernel.org>
 <9db9515b-08e8-47bd-aced-206ac183195a@linux.intel.com>
Date: Fri, 10 Apr 2026 17:14:00 +0200
Message-ID: <87y0iuzw3r.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Apr 10 2026 at 21:45, Baolu Lu wrote:
> On 4/10/2026 8:19 PM, Thomas Gleixner wrote:
>> Calculating the timeout from get_cycles() is a historical leftover without
>> any functional requirement.
>> 
>> Use ktime_get() instead.
>
> The subject line says "Use sched_clock() ...", but the implementation
> actually uses ktime_get(). Is it a typo or anything I misunderstood?

Indeed. Leftover from an earlier version.

Thanks,

        tglx
