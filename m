Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242748;
	b=jSuWasT/G39W9Fbw2JdnPP9xyn6lwNYraBo820BSMBnyVRgC9C3M/7py3idcsdf+55FQ
	 DeqhdDEI1YyhQdtvMENVeD2nZhGFAWbXQKZ/a7Bh0bR5eDU2dQNr0UE4PFi+dVIfnvN/g
	 9usisfXB8YkhKLwk5OydAcNH1u9wT/b+E7tHnV4SYy2PJkxFif2489K45Rsl/R6TGtbb1
	 GcQrCwzAzT2zDEtn6qfnYBGJEOrrsC32hpC4KwLYN/8+RMc88cexx47b8H0ngLSf6JyRF
	 NZQ2qVJpqrLKB7CK8Mm1L4jk768SMMe9CNVYWSc22mi//QYBPPkoLXkCPEVkQSA4J0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=KaxLEDS88ItrKwFFpF3PUgaqHFKPv05h6XZaeYQUHW0=;
	b=4JRfDStU+OuJQ2+J/moycPznmPp4ziEEDVXDC/QKdycM8IsYJrzh/24xfuK9wNtexi0w
	 AxdRT9dbYqk0XQa2/2ECkhvRFII3JWD4goUQi2vczWO43jjwh1hB1Y08Q5C8EkVcGmHeQ
	 WkaA/60LdPiECFX2FktiyLOmMU2RdTEWIN2nfht1BLJU0irNIw+s4kWj7QNlGD0D+O4SP
	 hM6KzFoNALlSyHrzLIIhdkFf2YTVsrTzw6XrW7ubTulm6/0+1Pe9Zc0t0FzANNkONvJjJ
	 GPBmcUXB60M6+BL52zMDL24teshdy5LYJTPY7SxEKBoQEUoc/WpeC8R4uO+V4gEzxpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EZEtsZBd;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE5B606EEBF
	for <linux-m68k@lists.linux-m68k.org>; Mon,  9 Nov 2026 16:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FE5B606EEBF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EZEtsZBd
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4922523d1afso622207f8f.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 09 Nov 2026 08:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794242746; x=1794847546; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KaxLEDS88ItrKwFFpF3PUgaqHFKPv05h6XZaeYQUHW0=;
        b=EZEtsZBdS16UKHBn+sNS1lO1GRhNWQrcNQIHbkYe7QrmWr6VfkA/VYC/8uSNjodlY3
         aQLm6BNOVr0xc9RHXarjcr0P8SoTArofBkpZnkhKMTCSxHkunlXtS1tgwHXLC1jzO4om
         Gup266/6OSMOgho8hlynIcRQ8TECLLrGyCXkxryOlkUMu7L80b4Cu1nol3Vl+bhnpQYZ
         YQOGRJpzWDyWs3V29WODJHoyHwURF+ulY3a49EvMiNCK1Ly9G6/cVT7zI2xIGXEybUuM
         GELAHSjpopepoDYBKUiAPkoqdQ+btYsTWwm6WtnJPWstrDn7xvnPwRljK1GJVHMFfIaH
         DEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242746; x=1794847546;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KaxLEDS88ItrKwFFpF3PUgaqHFKPv05h6XZaeYQUHW0=;
        b=yD+KxhIAe4tfpoyvUIhDIXMkSw3KArW0z+iu47jEWj2Wsa9I0W8KZs5ismSa+Hkj3z
         NSzYvYfwZ2+EGpLcfEYazDdB61qixwSRi5o9F8Rrj68WjzkvwAdENQ4uo62ggvBhM7Kq
         5n4A7y5RzHoxVLQhZ9bhXBcE4qUFGdb29rM6qYYbftUIQli25iqGmKHGCIhfltZ/xy7P
         xXJT/4EhcMT/4JG+oP3m6oynpF4aBqfMITXW5/rv/OaL+bA1GAoaF3PEIOe0NWqlwNRc
         nY/ItG47ZYNppwo+IStrUA3NJ7G/dqCMlmFkf2IXe+dMWomtvmjreZj9niWDmPmkuWKf
         RtUA==
X-Forwarded-Encrypted: i=1; AL+hErHxay2x8fzBIflk1NqCoOQyr7xMca4n4IRunTgyE47uRZ/uArzcmqMPnOpn96Y7ky0CTOWwFRfW12lp@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z/UXtRUXzMP/V+xz4d6JmJDroArorylpbKDdlE9nnp44vTKt6jj
	GMJ4Dc88BEwX1Wxrg3gTE+bzAaiji4aDLC6Jj77k0t/11rXCJ3rpjHAYFbwC9gfoHNw=
X-Gm-Gg: AYBFou1z/ngBqRJv8HBAYG801Q01LA6nGwXuqhSGexG0edwkBGlPGOvZd/xsX/TMf1k
	YRLmWia9l/kQf1Szot1r2cVDROnXdpjqxn1s02Nn8/Ya+CXyl8e4Fm7wwQ+1OPYdg8OvGV7QSjd
	ZQK3C6q3yqqN0ZkixMcywo+PgbseC0i6N8+mc9iRqB051FAIuMIYS+qYj0P05S1rTldmNRDPZb4
	fkpeSB8zLmnJymOPTcsMtpxkmGacVX51ZhW73dMGTWqTOciyKxLGz3ov9aWZgcCgRMN11ifBoJO
	M3PZkcsKmqFADy5KeVHhudE7aOGXxbmnkadLI71rxpuael7nYtUIUvKHZ1/6VhajmUhxFga3fUt
	hLHCM4LsYG6mpX7lbN+DArd/UmbVdEfeyS4coEgA4Q3l9PdsYZT8BMNK0SIpngCCrvj4WAkEwxm
	BWRxSOfTr5OkyG3aAYvrDiZJ+JsCkEIEmAIIEi+V6qbhly2rYSNiUn1gu/wHzdKxPpyalR8HvUz
	fOBktRp0tVpvZekDercoLwaVO7UucLeNrq12c8wMN/EfwAFIGQlpkjAx5MmDthc7+F3Mi8N0vqs
	xjmsVydraTwGyNiSLGWcyucojkRYAp/MrZkwZkg2Npz3KRS0tvJrBGWVAyoqv600
X-Received: by 2002:a05:6000:2389:b0:491:8462:20cc with SMTP id ffacd0b85a97d-49830d8186fmr7425f8f.37.1794242745831;
        Mon, 09 Nov 2026 08:45:45 -0800 (PST)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597187162sm11283249f8f.34.2026.11.09.08.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 08:45:45 -0800 (PST)
Message-ID: <b5abb55f-202d-458b-ba6d-92af16f80137@suse.com>
Date: Mon, 9 Nov 2026 17:45:44 +0100
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/11] modpost: emit module descriptors as assembly
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20261104-build-speedup-v5-0-0f6018be8dae@kernel.org>
 <20261104-build-speedup-v5-4-0f6018be8dae@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20261104-build-speedup-v5-4-0f6018be8dae@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 7:20 PM, Lorenzo Stoakes (ARM) wrote:
> modpost generates a descriptor for every module in the form of a
> <module>.mod.c file with .modinfo strings, the __this_module descriptor,
> exported symbol tables and (with CONFIG_MODVERSIONS set), the CRC of
> imported symbols.
> 
> These files are compiled like any other kernel C file with all of the
> -include preamble, as well as including linux/module.h, header dependencies
> generated by fixdep of a few hundred headers, an objtool run and if LTO is
> being performed, a link is performed to generate native code.
> 
> On an x86-64 allmodconfig build 11,189 *.mod.c files are built, each
> taking ~0.24s of CPU time to compile, and module finalisation as a whole
> 6,300 CPU seconds, or 64 seconds of wall time when run over 128 threads.
> 
> It also generates ~1.3 GiB of *.mod.o.cmd files that every subsequent build
> has to read back.
> 
> Avoid all this by emitting the descriptors as assembly instead.
> 
> The layout required (size and alignment of struct module, struct
> modversion_info, the module's name offsets, init, and exit fields and
> whether the architecture uses PREL32 ksymtab references) can all be derived
> from scripts/mod/module-offsets.h.
> 
> The fields of __this_module are emitted in offset order rather than
> declaration order, as CONFIG_RANDSTRUCT shuffles struct module so the name,
> init and exit fields can land anywhere.
> 
> An assembly file avoids all of the issues previously mentioned so this
> conversion results in a very significant performance win on kernel build.
> 
> As a consequence of this change, since module-offsets.c includes
> linux/module.h, scripts/mod is now built after the generated headers in
> prepare0, rather than before.
> 
> Also update .gitignore and make clean to handle .mod.S files, but keep
> .mod.c files there to ensure that users do not end up with untracked
> changes/dirty trees after the change takes effect.
> 
> The sections were confirmed to be byte-for-byte identical to the C version
> produced - each of .modinfo, .gnu.linkonce.this_module, __ksymtab*,
> __ksymtab_strings, __kcrctab*, __kflagstab*, __versions,
> __version_ext_crcs, __version_ext_names and their relocations - for all
> 8,135 modules of a clang allmodconfig build with CONFIG_COMPILE_TEST off
> and CONFIG_MODVERSIONS, CONFIG_EXTENDED_MODVERSIONS and
> CONFIG_MODULE_SRCVERSION_ALL on, and for a sample built with gcc.
> 
> What differs is what the compiler added around them: the __UNIQUE_ID_*
> locals, the KASAN constructor for the .mod.c globals, and on x86 a
> .note.gnu.property that the linker already drops from any module containing
> an assembly file and the loader never reads.
> 
> None of these have any impact on the build, however.
> 
> The assembly carries no debug information, so in order to keep describing
> __this_module in each module's debug information, define it weakly in
> module-common.c too, in a section which the module link discards.
> 
> Nothing initialises struct module::arch from C any more, so
> MODULE_ARCH_INIT is removed from include/linux/module.h and from m68k, the
> only architecture that defined it.
> 
> x86_64 kernels built with gcc and clang, with CONFIG_MODVERSIONS,
> CONFIG_EXTENDED_MODVERSIONS and CONFIG_MODULE_SRCVERSION_ALL, were booted,
> every module and an external one loaded and unloaded, and the srcversions
> checked against modinfo, i386 and arm64 defconfigs (gcc and clang) and a
> ThinLTO build were also built as part of testing.
> 
> An x86_64 CONFIG_RANDSTRUCT_FULL build with clang, which places the name
> field after init and exit, was checked the same way and produces the same
> .gnu.linkonce.this_module sections and relocations as the C version.
> 
> On the x86_64 allmodconfig with clang 22, "make modules" with every
> *.mod.o and *.ko deleted goes from 64.5s (6,306 CPU-s) to 28.5s (518
> CPU-s).
> 
> A consequence of this change is that the make jobs are now so small that
> make cannot dispatch them quick enough, however the next commit in the
> series addresses this issue.
> 
> This impacts clean and no-op builds with a large number of modules most
> noticeably.
> 
> Whole build, 128-thread Threadripper 9980X, best of N runs:
> 
>                                          before   after     delta
>                                          -------------------------------
>   x86 allmodconfig, no-op make, gcc        12.7s     2.3s    -10.4s (-82%)
>   x86 allmodconfig, no-op make, clang      13.9s     2.8s    -11.2s (-80%)
>   x86 allmodconfig, clean, gcc            342.6s   306.6s    -36.0s (-11%)
>   x86 allmodconfig, clean, clang          340.1s   290.2s    -49.8s (-15%)
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Looks ok to me from a modules perspective.

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

> +/* The equivalent of KSYMTAB_FUNC()/KSYMTAB_DATA() and SYMBOL_FLAGS(). */
> +static void add_asm_ksymtab(struct buffer *buf, const struct symbol *sym)
> +{
> +	const char *name = sym->name;
> +
> +	/* The name and namespace strings the entry refers to. */
> +	buf_printf(buf, "\t.section \"__ksymtab_strings\",\"aMS\",%%progbits,1\n");
> +	buf_printf(buf, "__kstrtab_%s:\n", name);
> +	buf_asciz(buf, name);
> +	buf_printf(buf, "__kstrtabns_%s:\n", name);
> +	buf_asciz(buf, sym->namespace);
> +	buf_printf(buf, "\t.previous\n");
> +
> +	buf_printf(buf, "\t.section \"___ksymtab+%s\", \"a\"\n", name);
> +	buf_printf(buf, "\t.balign %d\n", KSYM_ALIGN);
> +	buf_printf(buf, "__ksymtab_%s:\n", name);
> +	add_asm_ksym_ref(buf, sym->is_func ? MOD_FUNC_PREFIX : "", name);
> +	add_asm_ksym_ref(buf, "__kstrtab_", name);
> +	add_asm_ksym_ref(buf, "__kstrtabns_", name);
> +	buf_printf(buf, "\t.previous\n");
> +
> +	buf_printf(buf, "\t.section \"___kflagstab+%s\", \"a\"\n", name);
> +	buf_printf(buf, "__flags_%s:\n", name);
> +	buf_printf(buf, "\t.byte 0x%02x\n", get_symbol_flags(sym));
> +	buf_printf(buf, "\t.previous\n");
> +}
> +
> +/* The equivalent of SYMBOL_CRC(). */
> +static void add_asm_crc(struct buffer *buf, const struct symbol *sym)
> +{
> +	buf_printf(buf, "\t.section \"___kcrctab+%s\",\"a\"\n", sym->name);
> +	buf_printf(buf, "\t.balign 4\n");
> +	buf_printf(buf, "__crc_%s:\n", sym->name);
> +	buf_printf(buf, "\t.long 0x%08x\n", sym->crc);
> +	buf_printf(buf, "\t.previous\n");

Nit: add_asm_ksymtab() and add_asm_crc() emit unnecessarily .previous
directives.

-- 
Thanks,
Petr
