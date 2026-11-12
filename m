Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794462333;
	b=OKbFYzI+pje+j2o/Fz28mSnxOJzXVgJdRD1QCtoNkLu3UykRJy+9L9MpiEq40jYZQBsC
	 rQqpb6HCxp0uBto7p1U9io3MklmK5o2hXIRc/lwj+EX0JqsJfaCMmvfs6qQUFTe2Qjd2h
	 y5x8wzG9T4we6sOM3vcWQtX1c5x5sP6dDUSAuQ29ve4J/mJj5i8hbPfLYXgp0ZRFQQqeI
	 eJGCkoOUEwEzKfNDFNE0Yn7IUQBUUK/Mwr22YHBK7EvI8k+iRwFuqJCT1fQfK+wnge6ls
	 OlrjwrBbjrwkNpV6BpGnG+i4Sg3alxc55Ti17zK8pisFNHeavGnzpTRinm6abPj7wqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794462333;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=SZNz0UyQ3ihy+PQQPTQhzyeFWffiYmml7CaqnrvLuWo=;
	b=ziHyXbBtkxg+IKh6sbyq9lC6UuwwGTRa2otH20KApKeVTZCdpyJ09DafD1nYfkiOqTh4
	 FBO2lYWp+3H7ftDr8S0XF7Nyr9b1eMLW8n81vj9SZB3kggZ9sokh3RHhDZDexBO/G9EJ5
	 RVGClhn3LWcXGNWSAdLhHZ0TBZCqkuOx9B5T2Obk3FeW4I0yKKdCotqzC9vEZlg8eOn5Y
	 RCSSAzGXZiJmXf2+Q70rwx5+QbGpdBzKnlGkWxs9UaxW6LOXeT7FDp0z7V3eku8VF8+hJ
	 2PLP2otS/ihQjWMOU9Ek6iI6X1DVld0Bv4FEizw0CFGZO8Fx5lDGOTUK0zolI1oXMEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Esf+UV1k;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95010606A331
	for <linux-m68k@lists.linux-m68k.org>; Thu, 12 Nov 2026 05:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95010606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Esf+UV1k
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6806D6123F;
	Thu, 12 Nov 2026 05:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3661F00A05;
	Thu, 12 Nov 2026 05:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794462331;
	bh=SZNz0UyQ3ihy+PQQPTQhzyeFWffiYmml7CaqnrvLuWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Esf+UV1kZR+NqxR4zt2CwZSmWn3WosEozeU3MFw/C1f3n7bpdadj1DDDf0azhcUGU
	 omSH9FzhGQlB0p8CWyCCCZDocD16UItvzrp1Aszr8ewFg/cZ4vIyfpSjvvKALHczp0
	 6YcMGAgtQeF8O6v3eGKqqMXYNRGeLu9Zdm1OKlhoMgFT8GhBHWM5Bg0TdypeFUBTnj
	 2Qv6zomPuamOlm4a7PVKjxcDbCu6/7BSPbqczCHLagPdD4eUGG08206E/xtqdInMlJ
	 YQKPI2cWNE/9QuubQhHZD262PEoOcPKX/5c8hh54D06A8TA2JzOpy7BczE3kVoqium
	 p0xfTg0+IoY+g==
Date: Wed, 11 Nov 2026 21:45:28 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 07/11] objtool: cache relocations, do less work,
 eliminate relocation hash
Message-ID: <avVQy5UBOlu7IeQu@jpoimboe>
References: <20261104-build-speedup-v5-0-0f6018be8dae@kernel.org>
 <20261104-build-speedup-v5-7-0f6018be8dae@kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104-build-speedup-v5-7-0f6018be8dae@kernel.org>

On Wed, Nov 04, 2026 at 06:20:25PM +0000, Lorenzo Stoakes (ARM) wrote:
> Instruction relocations are looked up by destination in objtool via a hash
> which is keyed on a 16-byte (OFFSET_STRIDE) window within the section being
> walked.
> 
> It iterates through each 16-byte window, looking up relocations over
> several passes, before moving on to the next 16-byte window, caching only
> when a relocation is not found saving further lookups in this case.
> 
> Improve upon this by introducing a per-section relocation cache storing the
> first relocation at or after each 64-byte window of data (an empirically
> determined index range), indexed by chunk.
> 
> The lookup is implemented an array lookup and touches no shared state, so
> can be used from multiple threads.
> 
> The index runs over the relocations in offset order. Usually this is how
> they are input, however if not, each section is sorted once, storing
> their offsets in reloc_order[].
> 
> This is done lazily on lookup, so nothing pays the cost that doesn't have
> to, and if everything is sorted nothing does.
> 
> The output of objtool before and after this change was confirmed to be
> byte-for-byte identical both for x86_64 defconfig and allmodconfig with
> gcc and clang.
> 
> objtool on the gcc allmodconfig vmlinux.o goes from 10.5s to 9.0s, clang
> from 9.8s to 8.3s and gcc defconfig from 2.08s to 1.79s, with peak memory
> down ~90 MiB on allmodconfig.
> 
> Similar performance was also noted on a worst case scenario for unsorted
> input (gcc but lld for linking), which confirms that the sorting mechanism
> works correctly with little overhead.
> 
> objtool on vmlinux.o is on the serial tail of every build that links
> vmlinux, no-op builds are unchanged.
> 
> Whole build, 128-thread Threadripper 9980X, best of N runs:
> 
>                                          before   after     delta
>                                          -------------------------------
>   x86 defconfig, touch mm/vma.c, gcc        8.3s     8.2s    -0.14s (-2%)
>   x86 defconfig, touch mm/vma.c, clang      7.6s     7.3s    -0.25s (-3%)
>   x86 defconfig, clean, gcc                28.9s    28.6s    -0.22s (-1%)
>   x86 defconfig, clean, clang              29.4s    29.1s    -0.28s (-1%)
>   x86 allmodconfig, touch mm/vma.c, gcc    29.4s    28.0s     -1.4s (-5%)
>   x86 allmodconfig, touch mm/vma.c, clang  27.9s    26.2s     -1.7s (-6%)
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  tools/objtool/elf.c                 | 280 ++++++++++++++++++++++++++++--------
>  tools/objtool/include/objtool/elf.h |  10 +-
>  2 files changed, 221 insertions(+), 69 deletions(-)

Urgh... so the closer I looked, the more this patch revealed itself to
be an AI slop mess.  So I ended up completely rewriting it.

You can go ahead and drop all the objtool patches from this series, I
will repost them after some more cleanups.

And I'm dropping patch 9 altogether, it's just not worth the pain...

-- 
Josh
