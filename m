Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EE333F8D9
	for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Jul 2026 09:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783502189; cv=none; b=aBdABqPxPAhxwZMJtyJR73O8dbZ9qX7Dxc3X0cQ2CVEVRtREdEzhEfMy4fLyqn5MrrOZyZiWPgGYcuz7ngd4mDFS9h4e35bf0RU1SHSXhyzDLYLsgoqYc7sBYBfEUFI+7xyTKVDvF4iU+VgKGqvKn0WGeFvO7zPEh4SnABUUilU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783502189; c=relaxed/simple;
	bh=5FZUNb7wJqECLE+SaLxBpZ2BcaTC/7PR9KjrYN84Iks=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eCcDgMhBG43eFW/vN8/1/qDhAJiVS9sgFKyS/Xu0rSOto9Zu+ojyXe5S8sj3bVniYGGlbfK6QoN8JxEtwiLC0uY3Fs5zfAvgwMVSI/kY0oc0VWw4GcBPUZ2RHABWA7TqOKRHK2+WzfyQJ4lHi85c6FOlHA0H8CN76MNXIds/GKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N1o7Cy/2; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N1o7Cy/2"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5308240128;
	Wed,  8 Jul 2026 09:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F891F000E9;
	Wed,  8 Jul 2026 09:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783502188;
	bh=mYG6WaG7m68VASwoH/Qbw0bAKXQeJJcttE2MKggz9kU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=N1o7Cy/2UAb5pvDnsW2W/2IEWfzlvPb5qh6tUiAem8Gf2M7VhGzhZ/Y2Jx40amSta
	 eRYwR2//CYve1u4uzypgFTemTLGPafIx5fVQioLJD5Sn4hdfvpP5u4eZkeOM833ouq
	 3G+3Mlh8e7JmA5rStlaPedSdWHh/t+ELsZVQ0VNJ6mieO79DKlgD0lbLcCskpo8frt
	 Ek2lck3KWosiUBwUhmEc4sxs8Xn8DQLyVRoOsZlF1VniYeV+rnE4EXiJUggm2doJ5h
	 E24L6gP0rJ3vUHlKDAV+stjtsRYHo0Hqfr+yfpngxNIhAv4MFlNEU9teLXpTQ3Gqv7
	 Wt6aASI6cp48A==
From: Thomas Gleixner <tglx@kernel.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>, LKML
 <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Michal =?utf-8?Q?Such=C3=A1nek?=
 <msuchanek@suse.de>, Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann
 <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>, Huacai Chen
 <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven
 Schnelle <svens@linux.ibm.com>, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Kees Cook
 <kees@kernel.org>, x86@kernel.org, Jinjie Ruan <ruanjinjie@huawei.com>,
 Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Guo
 Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger
 <richard@nod.at>, Chris Zankel <chris@zankel.net>,
 linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org, Vineet Gupta
 <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian Cain
 <bcain@kernel.org>, Michal Simek <monstr@monstr.eu>, Dinh Nguyen
 <dinguyen@kernel.org>, "David S. Miller" <davem@davemloft.net>, Andreas
 Larsson <andreas@gaisler.com>, linux-snps-arc@lists.infradead.org,
 linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [patch 18/18] entry, treewide: Make
 syscall_enter_from_user_mode[_work]() indicate syscall execution
In-Reply-To: <5c202ab4-33f1-42e9-bef2-81fbd0a9992e@linux.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.603111179@kernel.org>
 <5c202ab4-33f1-42e9-bef2-81fbd0a9992e@linux.ibm.com>
Date: Wed, 08 Jul 2026 11:16:25 +0200
Message-ID: <87y0flrgd2.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jul 08 2026 at 10:51, Shrikanth Hegde wrote:
> On 7/8/26 12:37 AM, Thomas Gleixner wrote:
>> -	r0 = syscall_enter_from_user_mode_randomize_stack(regs, r0);
>> +	if (unlikely(!syscall_enter_from_user_mode_randomize_stack(regs, &r0))
>> +		return syscall_get_error(current, regs);
>>   
>
> There is one missing )

Bah.
