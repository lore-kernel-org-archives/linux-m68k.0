Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7C43CE49E
	for <linux-m68k@lists.linux-m68k.org>; Tue,  1 Sep 2026 01:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788227628; cv=none; b=WuzdqfT7BFoOarSNTqvgzs7+ykDJbENcIfxzt1zqQzxxi7uNA3Kwmg090eeejAorIB9ZOTJcNRknKQPl2ern3Z30LJSwbDBmUgEUWl5nsLcyXrz8m6jj7FxBwISWN6PPJ81qLvitB8Srb8eQZrdj3I3dr3UVxkyque643pRPoQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788227628; c=relaxed/simple;
	bh=ZOY1dGGU6rO/trtBlZKo5/cnOjR2oE9lW36OUsLSpHo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=UQAv2EWryLV/zJEVOVghxhbm1MB/X8bBvSYop5LmvEg9WQYV1B2zvAyu7D7WaEMoHtp3RtMTNl/kjlTZxrZQOUo/b9v7ECXqsscGAUtebXIOUuCkjFZeJKERVzPFRcy9GKm18VrAugivhRp4E3qGvu0GO0rNF/fn4R7+4NHWytI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linux-foundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Zq8VpLup; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Zq8VpLup"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 22D17409AC;
	Tue,  1 Sep 2026 01:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E38F1F000E9;
	Tue,  1 Sep 2026 01:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788227597;
	bh=nfPoQFWa5XJK2n+gLXq+InLZ1SHvMm2K6VuNoOpddPc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Zq8VpLupvgE2yRJw1KQGeavVibzTXHtpjCONjfoal2aDB/f32LHC+a9EHOOObR2dz
	 XMrE7NHF4NkTlRLOvkXFK75juHDjUVcCkQ7WguvUjYiW12f7gOk81DFIAVNvWoojWS
	 hStPm28T4PEXRZKb5fXVKK4E/erKvPmWGFqjKOw0=
Date: Mon, 31 Aug 2026 18:53:15 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, samuel.holland@sifive.com, David Hildenbrand
 <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Lorenzo Stoakes
 <ljs@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker
 <dalias@libc.org>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] sh/mm: Stop using [p4d|pud|pmd]_ERROR()
Message-Id: <20260831185315.ec745606e7eeae6d1116b7d1@linux-foundation.org>
In-Reply-To: <20260831054331.625505-7-anshuman.khandual@arm.com>
References: <20260831054331.625505-1-anshuman.khandual@arm.com>
	<20260831054331.625505-7-anshuman.khandual@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Aug 2026 11:13:28 +0530 Anshuman Khandual <anshuman.khandual@arm.com> wrote:

> Stop using [p4d|pud|pmd]_ERROR() in __get_pte_phys() as the pgtable entries
> are known to be NULL and hence could not really be accessed.

A note to the sh maintainers: Sashiko might have found a couple of bugs
in __get_pte_phys():

	https://sashiko.dev/#/patchset/20260831054331.625505-1-anshuman.khandual@arm.com
