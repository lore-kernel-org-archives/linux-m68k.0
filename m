Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F2B387361
	for <linux-m68k@lists.linux-m68k.org>; Sun, 24 May 2026 14:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.18.0.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779631494; cv=none; b=hm2QGiVx7S+n6GbPub8bZqKd46GiLocU2g8kFbQ2r5h+Pa99aca3Y44id+KjsIF087KmXf/olgP6yNRLN0oSgioHjexT63/Bfh1DaPaYHobtnLoOfjXJvSH1x0OSW33Vbe8Uk5SF71RtfOZbMeMkNlNJnc7r0mqVPW4BfYHXMo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779631494; c=relaxed/simple;
	bh=CdUrzK6XNh98jns30GmUrxicdF8sifn8UgYqmuD35wk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ryKKw9A1bNwmoWxvsD02k7F/BGjD45cViZdVyN0PCnJ4WlsnxEYW8sadPLOOa3Nj2Z38905D/Yb8e9b71QqyVfRYuVDkn4rvZB6rx1q7yyikJ5EAmM0LBJmi6QmAk+gH6001hR8JxFWvQ0mTkLh8RcEHRBZL839JdkiIih7nQ2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=nefkom.net; arc=none smtp.client-ip=212.18.0.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nefkom.net
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gNgkL5qJdz1rBxJ;
	Sun, 24 May 2026 16:04:42 +0200 (CEST)
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gNgkL1WXzz1rBxG;
	Sun, 24 May 2026 16:04:42 +0200 (CEST)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.87])
	by mail.m-online.net (Postfix) with ESMTP id 4gNgkL08XGz1qqlR;
	Sun, 24 May 2026 16:04:42 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.6.182])
 by localhost (dynscan3.mail.m-online.net [192.168.6.87]) (amavis, port 10024)
 with ESMTP id wjTNPq5OW9Bt; Sun, 24 May 2026 16:04:41 +0200 (CEST)
X-Auth-Info: oIj33td4SrjYYY2Enc2PhlY0HhhyPghRdKhSq6g3tOC9UMZwAsOgB4RMj40xM/T4
Received: from igel.home (aftr-82-135-83-15.dynamic.mnet-online.de [82.135.83.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sun, 24 May 2026 16:04:41 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id E080F2C16DF; Sun, 24 May 2026 16:04:40 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,  "David Hildenbrand (Red
 Hat)" <david@kernel.org>,  Andrew Morton <akpm@linux-foundation.org>,
  Ankur Arora <ankur.a.arora@oracle.com>,  linux-m68k@lists.linux-m68k.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] m68k: Avoid -Wunused-but-set-parameter in
 clear_user_page()
In-Reply-To: <20260524-m68k-clear_user_page-v1-1-4c950668842e@weissschuh.net>
	("Thomas =?utf-8?Q?Wei=C3=9Fschuh=22's?= message of "Sun, 24 May 2026
 15:04:59 +0200")
References: <20260524-m68k-clear_user_page-v1-1-4c950668842e@weissschuh.net>
Date: Sun, 24 May 2026 16:04:40 +0200
Message-ID: <87qzn0q4xz.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On Mai 24 2026, Thomas Weißschuh wrote:

> diff --git a/arch/m68k/include/asm/page_mm.h b/arch/m68k/include/asm/page_mm.h
> index ed782609ca41..67c82c746f7a 100644
> --- a/arch/m68k/include/asm/page_mm.h
> +++ b/arch/m68k/include/asm/page_mm.h
> @@ -55,10 +55,12 @@ static inline void clear_page(void *page)
>  #define clear_user_page(addr, vaddr, page)	\
>  	do {	clear_page(addr);		\
>  		flush_dcache_page(page);	\
> +		(void)vaddr;			\
>  	} while (0)
>  #define copy_user_page(to, from, vaddr, page)	\
>  	do {	copy_page(to, from);		\
>  		flush_dcache_page(page);	\
> +		(void)vaddr;			\

Since vaddr is a macro parameter, I think it would be better to put it
in parens.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
