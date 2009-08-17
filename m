From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Add private syscalls to support NPTL
Date: Tue, 18 Aug 2009 00:11:34 +0200
Message-ID: <m27hx2um3t.fsf@igel.home>
References: <4A89D037.7090807@codesourcery.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:51470 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750907AbZHQWLi (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 17 Aug 2009 18:11:38 -0400
In-Reply-To: <4A89D037.7090807@codesourcery.com> (Maxim Kuvyrkov's message of
	"Tue, 18 Aug 2009 01:48:39 +0400")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Maxim Kuvyrkov <maxim@codesourcery.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org

Maxim Kuvyrkov <maxim@codesourcery.com> writes:

> diff --git a/arch/m68k/include/asm/unistd.h b/arch/m68k/include/asm/unistd.h
> index aa29a86..619677c 100644
> --- a/arch/m68k/include/asm/unistd.h
> +++ b/arch/m68k/include/asm/unistd.h
> @@ -335,9 +335,16 @@
>  #define __NR_preadv		329
>  #define __NR_pwritev		330
>  
> +/* Private syscalls.  */
> +#define __M68K_NR_read_tp		0xffffffff
> +#define __M68K_NR_write_tp		0xfffffffe
> +#define __M68K_NR_atomic_cmpxchg_32	0xfffffffd
> +#define __M68K_NR_atomic_barrier	0xfffffffc

I don't see the need for these weird syscall numbers.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
