Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F46380FF5
	for <linux-m68k@lists.linux-m68k.org>; Mon, 25 May 2026 19:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779738884; cv=none; b=YUAQztyvAfAONgYcN+u96WfLOxk9ASqjZPo7flOEpmaj0BE/M8M5+tyIq7vwNJFc9JI1Ym5kdztvsdYZRj3ElMGldp5o9iQfFE5h1GhJIuaiacJCfDiWa2FHmi9UD+ZGrWLnXe3JHkun3VWLgyT69ZoX0ETCDyhcvqkcZqJa7VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779738884; c=relaxed/simple;
	bh=knP8G7gfFyLgz6A8FtJupGIy5RFJuwQgnj/G1gCJehQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=j5hWalBCdnaRgBI/08bWbBQLl3o5gveBXVyi6A2AUZdswhzCLWm/YAuNg23T6wudFCe/LktT4lqmEKCl10Kc9GRHmHQLD++sryIpTPj31lsXA9lKLTJQ6bOAdjvTAkgbqI58jgJRa75/Rxbr+MDXgyfcbMzYMsZtPer6PEwNFUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linux-foundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QWSxT/FW; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QWSxT/FW"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2AD8A60008;
	Mon, 25 May 2026 19:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A40251F000E9;
	Mon, 25 May 2026 19:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1779738881;
	bh=0lg7zHHFsB8vo6n6wuMeU5yVpWBoMOBcwTEFnHSfPlg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=QWSxT/FWecZMQ4RzNVo4lTIrjuxAABWq/rsmesfMXamKkfx8IyDjx0H7ncUph9V1u
	 KmxDG5xQLO16brxmgJg39bznCCP2SIi9OypI/aHIS6t+BOqw7vjhaWGdGNgh1Pl0VP
	 aeiY0hm254vggC41wneLMHlKahoVjmu0NT7kVvto=
Date: Mon, 25 May 2026 12:54:41 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "David Hildenbrand (Red Hat)"
 <david@kernel.org>, Ankur Arora <ankur.a.arora@oracle.com>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Andreas
 Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH v2] m68k: Avoid -Wunused-but-set-parameter in
 clear_user_page()
Message-Id: <20260525125441.6a3a74300d73f1e0d32db4f8@linux-foundation.org>
In-Reply-To: <20260525-m68k-clear_user_page-v2-1-0c8981c6eca1@weissschuh.net>
References: <20260525-m68k-clear_user_page-v2-1-0c8981c6eca1@weissschuh.net>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, 25 May 2026 10:33:52 +0200 Thomas Wei=DFschuh <linux@weissschuh.net=
> wrote:

> The loop in clear_user_pages() iterates over all pages and calls
> clear_user_page() for each of them. During the loop "vaddr" is modified.
> However on m68k clear_user() is a macro which does not use "vaddr".
> The compiler sees a variable which is modified but never used and emits
> a warning for that:
>=20
> include/linux/highmem.h: In function 'clear_user_pages':
> include/linux/highmem.h:234:63: warning: parameter 'vaddr' set but not us=
ed [-Wunused-but-set-parameter=3D]
>     static inline void clear_user_pages(void *addr, unsigned long vaddr,
>=20
> Other architectures use an inline function for clear_user_page() which
> avoids the warning. This is not possible on m68k, as dlush_dcache_page()
> is another macro which is not yet defined where clear_user_page() is
> defined. Including cacheflush_mm.h will trigger recursive and lots of
> other issues.
>=20
> So hide the warning with a cast to (void) instead.
>=20
> While we are here, do the same for copy_user_page().
>=20

As with sparc, can this be addressed by converting these macros into
static inline C functions?

> --- a/arch/m68k/include/asm/page_mm.h
> +++ b/arch/m68k/include/asm/page_mm.h
> @@ -55,10 +55,12 @@ static inline void clear_page(void *page)
>  #define clear_user_page(addr, vaddr, page)	\
>  	do {	clear_page(addr);		\
>  		flush_dcache_page(page);	\
> +		(void)(vaddr);			\
>  	} while (0)
>  #define copy_user_page(to, from, vaddr, page)	\
>  	do {	copy_page(to, from);		\
>  		flush_dcache_page(page);	\
> +		(void)(vaddr);			\
>  	} while (0)
> =20
>  extern unsigned long m68k_memoffset;

