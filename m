Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D92224AF2
	for <linux-m68k@lists.linux-m68k.org>; Fri, 16 Jan 2026 13:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768568999; cv=none; b=bwBe1a0y4ywN0POtmpSx64M6BhJfV/oKZWrRy7Yh9SYV8+KEnPH4e5OFN9RRtnx05DEQgRpcIaHvL8dSMH0C/kzYNRYQvXrVY78G8VsCckTi0/RXr3noeLtDcBqOeFKPzNnR6BM9ld3XVEVCQ8PcyyZ5M0Q9oAO24Oy20aj3yzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768568999; c=relaxed/simple;
	bh=QakKy+zY0X6eW+qIleRvFV8jqexhK2CsvNWpuBHUlI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oCC+vT+DHg2PndcK+ZhXjsL1LS74lkwtya1FOo0y3luVGv5MbotaX4mJPxdmTlBda+fFALTKaYydcGAc+ogN1FHdr9Hgcdxsg7iZE2GXwrvZB8wKlpnR142WV1mT+QIWj46FdG8E3sF6xpc4MsxhUI7j6qCcIqURiTKBE1bqTjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D8D0C60155;
	Fri, 16 Jan 2026 13:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 114FBC116C6;
	Fri, 16 Jan 2026 13:09:53 +0000 (UTC)
Message-ID: <41f185e0-1721-4f3c-9979-785d4a1ca6db@linux-m68k.org>
Date: Fri, 16 Jan 2026 23:09:51 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] tools/nolibc: HACK!: Add basic self relocation for
 static PIE for m68k nommu FDPIC
To: Daniel Palmer <daniel@thingy.jp>, w@1wt.eu, linux@weissschuh.net,
 dalias@libc.org
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
References: <20260116122812.2421621-1-daniel@thingy.jp>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20260116122812.2421621-1-daniel@thingy.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 16/1/26 22:28, Daniel Palmer wrote:
> This is some very quick hacky code to test if this works and get some ideas..
> 
> - I'm messing with m68k nommu. Currently I use FLAT binaries and this is working with nolibc
>    as-is mostly. Sometimes some relocations that elf2flat doesn't like get generated and the
>    resulting FLAT binary doesn't have any relocation information and crashes which isn't good
>    if you don't have an mmu.
> 
> - Since commit 1bde925d2354 ("fs/binfmt_elf_fdpic.c: provide NOMMU loader for regular ELF binaries")
>    the FDPIC loader has apparently been able to load non-FDPIC binaries as long as they are
>    PIE and can be relocated. I have been messing with this thinking that maybe I can stop using
>    FLAT binaries.
> 
> - By default linking with -pie is trying to set ld.so as the interpreter to do the
>    relocation. I don't think I have anything that can do that in my system. I am using uclibc but
>    statically linked. Aside from my programs written with nolibc there is a busybox FLAT that is
>    statically linked to uclibc and nothing else.

If you are using uClibc-ng as the C library and you select this config:

     UCLIBC_FORMAT_ELF=y

instead of the UCLIBC_FORMAT_FLAT* options then it will generate the usual
libc.a static library, and also a run time linker ld-uClibc.so. That will do
the usual link/load at application run time.

Here is a script I use to test it all, generating for the mcf5208 nommu qemu target:

     https://github.com/gregungerer/simple-linux/blob/master/build-m68knommu-linux-uclibc-elf.sh


>    Eitherway, the plan is not to have any libc and have everything compiled with nolibc. I'm writing
>    a small init, shell etc with nolibc that will replace busybox and not cause constant OOMs.
> 
> - So, I can generate PIE binaries but they can't work because I have no linker to relocate them but
>    apparently static PIE is a thing and with a normal toolchain you'd get a crt that does the relocation
>    before jumping to main().

I messed around a few years back with a really basic stand alone link loader
that might be useful:

     https://github.com/gregungerer/uldso

It probably doesn't work for all possible ELF files, but it worked good enough to load
and run busybox for example. And I only used uClibc-ng as the C library too. I never
tried with nolibc.


> - I thought it shouldn't be too hard to add something like that to crt.h in nolibc and then pass
>    --no-dynamic-linker when linking to not set an interpreter.

Something like the uldso above avoids adding anything extra to the start up code,
since it runs as the interpreter. That feels like a better solution.

Regards
Greg



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
> 
> Questions:
> 
> - My use case is weird/niche but maybe there are uses for static pie nolibc binaries?
>    - If so what would be a cleaner way of implementing this?
> 
> - Right now the base address offset all of the relocations against is hardcoded.
>    Maybe someone knows how I'm meant to get that properly?
> 
> Signed-off-by: Daniel Palmer <daniel@thingy.jp>
> ---
>   tools/include/nolibc/crt.h | 56 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 56 insertions(+)
> 
> diff --git a/tools/include/nolibc/crt.h b/tools/include/nolibc/crt.h
> index d9262998dae9..0931915280d8 100644
> --- a/tools/include/nolibc/crt.h
> +++ b/tools/include/nolibc/crt.h
> @@ -10,6 +10,7 @@
>   #ifndef NOLIBC_NO_RUNTIME
>   
>   #include "compiler.h"
> +#include "elf.h"
>   
>   char **environ __attribute__((weak));
>   const unsigned long *_auxv __attribute__((weak));
> @@ -47,6 +48,61 @@ void _start_c(long *sp)
>   	/* initialize stack protector */
>   	__stack_chk_init();
>   
> +#ifdef NOLIBC_STATIC_PIE
> +#define R_68K_RELATIVE	22
> +{
> +	void *base = (void *) 0x6d8000; // TODO: how to actually get this?
> +	unsigned int rela_count = 0;
> +	unsigned int rela_off = 0;
> +	unsigned long dyn_addr;
> +	Elf32_Rela *rela;
> +	Elf32_Addr *addr;
> +	Elf32_Dyn *dyn;
> +	int i;
> +
> +	/* For m68k with the FDPIC loader d5 contains the offset to the DYNAMIC segment */
> +	__asm__ volatile (
> +		"move.l %%d5, %0\n"
> +		: "=r" (dyn_addr)
> +	);
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
> +
> +	rela = base + rela_off;
> +
> +	/* Do the relocations, only R_68K_RELATIVE for now */
> +	for (i = 0; i < rela_count; i++) {
> +		Elf32_Rela *entry = &rela[i];
> +
> +		switch (ELF32_R_TYPE(entry->r_info)) {
> +		case R_68K_RELATIVE:
> +		{
> +			addr = (Elf32_Addr *)(base + entry->r_offset);
> +			*addr = (Elf32_Addr) (base + entry->r_addend);
> +		}
> +			break;
> +		default:
> +			exit(43); //TODO nonsense error
> +			break;
> +		}
> +	}
> +}
> +#endif
> +
>   	/*
>   	 * sp  :    argc          <-- argument count, required by main()
>   	 * argv:    argv[0]       <-- argument vector, required by main()

