Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837F534DCD7
	for <linux-m68k@lists.linux-m68k.org>; Fri, 16 Jan 2026 19:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768591754; cv=none; b=ojZo0eS8drwXdMgESJ2yU2rugXAwXsE7O5bMavXb2fUpmBqb1xXJ6aYi1vnBUhWF8XR6c9OVVHq/DUzRk/Z6no9buBygNGm5sODgyHn9eHUBNif4FkCzYzeH5KSGpQ2kF6u0aDMCGSq5EKTSAKWvTE7ay33rTNB/wt1hsCncsAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768591754; c=relaxed/simple;
	bh=h6YBiRHahMPIdMgwCsvBdbfiap77HBUtPNOyTsdG2+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IOMpyQximrP29du3v1BFeasXv3G4GXEQcqV8fGe8tDBfYspOcShR/3K1N4vT/+tJCqbGTWELN9Ha7Y8P9Esfabh91TXzPHne9eXGcGkymLX82T8Qx+O1dhejKroYDXgHdtATaprnfWyRnugNlhKPwfVX9X8TmW7GQzH+U4wzUjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=TG43CrzE; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="TG43CrzE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1768591744;
	bh=h6YBiRHahMPIdMgwCsvBdbfiap77HBUtPNOyTsdG2+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TG43CrzE6bMx1iG+RalsQhlNDO3UM0mgNozTj/KWkUKqPMoowRhU8x9KKeWWb7D4d
	 QjRebPFdBoQDf1oV9/8HmWSeRddW29tZx5HUE9a99G0sl/hF9ND0fM65KqZw72QKIV
	 Mr87P/4fxCtW2uTPFp7YZfWMwbTGUPmBEsKUMXQc=
Date: Fri, 16 Jan 2026 20:29:03 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Daniel Palmer <daniel@thingy.jp>
Cc: Greg Ungerer <gerg@linux-m68k.org>, w@1wt.eu, dalias@libc.org, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] tools/nolibc: HACK!: Add basic self relocation for
 static PIE for m68k nommu FDPIC
Message-ID: <8daedc8f-efba-4d2e-9e2a-8954eb4acbc0@t-8ch.de>
References: <20260116122812.2421621-1-daniel@thingy.jp>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116122812.2421621-1-daniel@thingy.jp>

Hi Daniel,

On 2026-01-16 21:28:12+0900, Daniel Palmer wrote:
> This is some very quick hacky code to test if this works and get some ideas..
> 
> - I'm messing with m68k nommu. Currently I use FLAT binaries and this is working with nolibc
>   as-is mostly. Sometimes some relocations that elf2flat doesn't like get generated and the
>   resulting FLAT binary doesn't have any relocation information and crashes which isn't good
>   if you don't have an mmu.
> 
> - Since commit 1bde925d2354 ("fs/binfmt_elf_fdpic.c: provide NOMMU loader for regular ELF binaries")
>   the FDPIC loader has apparently been able to load non-FDPIC binaries as long as they are
>   PIE and can be relocated. I have been messing with this thinking that maybe I can stop using
>   FLAT binaries.
> 
> - By default linking with -pie is trying to set ld.so as the interpreter to do the
>   relocation. I don't think I have anything that can do that in my system. I am using uclibc but
>   statically linked. Aside from my programs written with nolibc there is a busybox FLAT that is
>   statically linked to uclibc and nothing else.
> 
>   Eitherway, the plan is not to have any libc and have everything compiled with nolibc. I'm writing
>   a small init, shell etc with nolibc that will replace busybox and not cause constant OOMs.

So far so good.

> - So, I can generate PIE binaries but they can't work because I have no linker to relocate them but
>   apparently static PIE is a thing and with a normal toolchain you'd get a crt that does the relocation
>   before jumping to main().
> 
> - I thought it shouldn't be too hard to add something like that to crt.h in nolibc and then pass
>   --no-dynamic-linker when linking to not set an interpreter.
> 
> - I got it working enough that a static pie "hello, world" loads and runs:
> 
> / # /root/test.elf
> [    9.970000] FDPIC ____ LOAD 23 ____
> [    9.970000] FDPIC Mapped Object [executable]:
> [    9.970000] FDPIC - elfhdr   : 6d8000
> [    9.970000] FDPIC - entry    : 6d83e4
> [    9.970000] FDPIC - PHDR[]   : 6d8034
> [    9.970000] FDPIC - DYNAMIC[]: 6da7b0
> [    9.970000] FDPIC - LOAD[0] : 006d8000-006d87ad [va=0 ms=7ae]
> [    9.970000] FDPIC - LOAD[1] : 006da7b0-006da873 [va=27b0 ms=c4]
> [    9.970000] FDPIC - start_code  6d8000
> [    9.970000] FDPIC - end_code    6d87ae
> [    9.970000] FDPIC - start_data  6da7b0
> [    9.970000] FDPIC - end_data    6da874
> [    9.970000] FDPIC - start_brk   6e0000
> [    9.970000] FDPIC - brk         6e0000
> [    9.970000] FDPIC - start_stack 6fff00
> hello, world!
> [    9.980000] test.elf (23) used greatest stack depth: 5348 bytes left

Nice! Is it sufficient for nolibc-test? If so, can you provide
instructions for that?

> Questions:
> 
> - My use case is weird/niche but maybe there are uses for static pie nolibc binaries?

I think it is a valid usecase to support nommu systems.
Also from a security perspective, pie should be better.
While I would like to defer to the 'uldso' tool from Greg, nolibc
positions itself as usable for single-binary systems. Requiring a
different tool would run a bit counter to that.
In my opinion it depends on the implementation complexity. If we can
have a simple implementation shared by all architectures, why not.

>   - If so what would be a cleaner way of implementing this?

Some comments inline.

> - Right now the base address offset all of the relocations against is hardcoded.
>   Maybe someone knows how I'm meant to get that properly?

That should be getauxval(AT_BASE), I think.

> Signed-off-by: Daniel Palmer <daniel@thingy.jp>
> ---
>  tools/include/nolibc/crt.h | 56 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/tools/include/nolibc/crt.h b/tools/include/nolibc/crt.h
> index d9262998dae9..0931915280d8 100644
> --- a/tools/include/nolibc/crt.h
> +++ b/tools/include/nolibc/crt.h
> @@ -10,6 +10,7 @@
>  #ifndef NOLIBC_NO_RUNTIME
>  
>  #include "compiler.h"
> +#include "elf.h"
>  
>  char **environ __attribute__((weak));
>  const unsigned long *_auxv __attribute__((weak));
> @@ -47,6 +48,61 @@ void _start_c(long *sp)
>  	/* initialize stack protector */
>  	__stack_chk_init();
>  
> +#ifdef NOLIBC_STATIC_PIE

It might be possible to detect this automatically based on the
preprocessor symbols __pie__/__PIE__.

> +#define R_68K_RELATIVE	22

These definition should be moved to the UAPI headers.
See my related changes I did for some other architectures:
https://lore.kernel.org/lkml/20250812-vdso-absolute-reloc-v4-1-61a8b615e5ec@linutronix.de/
https://lore.kernel.org/lkml/20250812-vdso-absolute-reloc-v4-2-61a8b615e5ec@linutronix.de/

It means that nolibc would require new UAPI headers for pie support, but
given that pie didn't work before at all, that should be fine.

> +{
> +	void *base = (void *) 0x6d8000; // TODO: how to actually get this?

getauxval(AT_BASE)

> +	unsigned int rela_count = 0;
> +	unsigned int rela_off = 0;
> +	unsigned long dyn_addr;
> +	Elf32_Rela *rela;
> +	Elf32_Addr *addr;
> +	Elf32_Dyn *dyn;
> +	int i;

> +	/* For m68k with the FDPIC loader d5 contains the offset to the DYNAMIC segment */
> +	__asm__ volatile (
> +		"move.l %%d5, %0\n"
> +		: "=r" (dyn_addr)
> +	);

This should go into arch-m68k.h.
Is %d5 guaranteed not to have been clobbered by now?
If not we need to pass it in from the asm __start().

> +	dyn = (Elf32_Dyn *) dyn_addr;
> +
> +	/* Go through the DYNAMIC segment and get the offset to rela and the number of relocations */
> +	for (; dyn->d_tag != DT_NULL; dyn++) {
> +		switch (dyn->d_tag) {
> +		case DT_RELA:
> +			rela_off = dyn->d_un.d_ptr;
> +			break;
> +		case DT_RELACOUNT:
> +			rela_count = dyn->d_un.d_val;
> +			break;
> +		}
> +	}
> +
> +	if (!rela_off || !rela_count)
> +		exit(42); //TODO nonsense error

Maybe __builtin_trap()/__nolibc_trap()?

> +
> +	rela = base + rela_off;
> +
> +	/* Do the relocations, only R_68K_RELATIVE for now */

Are there any more that would need to be supported?
How many are there for other architectures?
(My knowledge here is limited)

> +	for (i = 0; i < rela_count; i++) {
> +		Elf32_Rela *entry = &rela[i];
> +
> +		switch (ELF32_R_TYPE(entry->r_info)) {
> +		case R_68K_RELATIVE:
> +		{
> +			addr = (Elf32_Addr *)(base + entry->r_offset);
> +			*addr = (Elf32_Addr) (base + entry->r_addend);

Can these point into read-only memory?
Do we need to fiddle with mprotect()?

> +		}
> +			break;
> +		default:
> +			exit(43); //TODO nonsense error
> +			break;
> +		}
> +	}
> +}
> +#endif

This whole block should go into a dedicated file/function.

> +
>  	/*
>  	 * sp  :    argc          <-- argument count, required by main()
>  	 * argv:    argv[0]       <-- argument vector, required by main()

All in all, if we can keep the complexity for a shared implementation at
the level of the code above, then I am in favor of implementing this in
nolibc.

Willy, your opinion?


Thomas
