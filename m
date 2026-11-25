Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620964;
	b=pOEQTRc1xvP/KYa/b9eZsuq4+tjYcDw2HoqA6rCaEsGB5FLPJI8Tr6J0/z8kFJoqtloq
	 upYA8z3mvFOLiNzoswUf9fwX06MwJcnGBbqmIj8oO6whtOlSFgglDlYXarxsMj1bdITWz
	 YxqnzCxTpglQlFoPrYY6XDeSVH3bBM6SCfCbbzHh0/LC6Xke/STj2WFuz4a8rvfzohaAI
	 +YopvYsz8g9/1nK/YiEWaeip4t3V7VgEomNC2GyBxhXBgKKmaRQZleuuHsyRdEFiXnCRI
	 uGuavY3TTjWOWwGUwAWFpFXPnmhvqvG6u0jLrXt27VZ8N+s84WRrR8TVZ3N1nknpDsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620964;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=lw37wxVIi9qwoZRiRO8Wa/V6DmkieawQKPLil0pWTFU=;
	b=EuK6Ofz3hi2suHknI96BRpMNFXrBNVSx/tQV7G1tB/IHhOhrvKrNq8/jLSFasmXsrgUE
	 i3JSOvDkm1SVCto7GVq5BZp4Hk/hOGQ8b5D87Q8nZ1R9NN3i9K2sADqABz62LNtkLBZZr
	 U9GW84wyH+zduz6yiJ+PVPuUnoNePm5FfvtOQGnGGTXoqD+KS11dhyHA0BwzumCXkfjE0
	 jIaiB4vWuhgG0gKiKoGJAuFPRNl/L1Gbp7hOmj/Yj2f2gXOCOfoj2cMlPplHGqvryVYl1
	 wW0IY/trWk63yZuB+ySaRkyJzjkl58GmdU5z9akjKcuU+RxHF2bHUpbrT0wn+7iYycA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dEWj4e3V;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDA1607DE4A
	for <linux-m68k@lists.linux-m68k.org>; Wed, 25 Nov 2026 15:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EDA1607DE4A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dEWj4e3V
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BB32043481;
	Wed, 25 Nov 2026 15:36:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 413BB1F00ACF;
	Wed, 25 Nov 2026 15:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795620963;
	bh=lw37wxVIi9qwoZRiRO8Wa/V6DmkieawQKPLil0pWTFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dEWj4e3V7nOLoYqk+MBZQdLSDNuJhrV4z3EiRl5cjvPTK5LbvVl3LY0jwsL6WDCDt
	 pr1FOyAE8FtrbtCcWrWzx+TVTPLr8fuXcTnb4puxjE1B4mXjxbgZWl07c6IXPPa9iy
	 3C7seB8GNiNCfpa5a+RrHqlwsJALMAJ080terbgexeN6GR0emH3xJQIYrzU/oGyUdN
	 5uQfi6zpzjjWvs+4iDHn1yqS4bC9ofsjDfV0dskr4k7zKIe6Mxq9tMObbYDulO+vR5
	 J56eBTfPtzi1AnEqxdLJyPf2cxT2hfgYMUcF57PsTdAG3eW1KJsQQ7MuKvHSLQlLO/
	 voA1wkmrbSEaQ==
Date: Wed, 25 Nov 2026 15:35:52 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Nicolas Schier <n.schier@fritz.com>, Kees Cook <kees@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6 2/7] kbuild: implement and use depcheck to check
 dependency timestamps
Message-ID: <awcAOu7jxyVWqIcw@gremlin>
References: <20261124-build-speedup-v6-0-141a4f861c67@kernel.org>
 <20261124-build-speedup-v6-2-141a4f861c67@kernel.org>
 <CANiq72kdpY_tr0Gg16b24J1J-Duj3YS4rJ0CgNYVWQqmQv=nxg@mail.gmail.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kdpY_tr0Gg16b24J1J-Duj3YS4rJ0CgNYVWQqmQv=nxg@mail.gmail.com>

On Wed, Nov 25, 2026 at 04:33:42PM +0100, Miguel Ojeda wrote:
> On Tue, Nov 24, 2026 at 1:20 PM Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
> >
> > A dependency that is also a target of the same directory (e.g. header
> > generated by an if_changed rule) may get remade later in the same make run,
> > so do not treat a target as fresh.
>
> One more thing I noticed: a header generated with `filechk` does not
> have a `.cmd` file, so it is not covered by this.
>
> It matters for targets that reach such a header through their `.cmd`
> file alone, e.g. single targets like `.s`. For instance, after
> building `arch/x86/kvm/`:
>
>     make arch/x86/kvm/vmx/vmenter.s
>     # Change an offset in `kvm-asm-offsets.c`.
>     make arch/x86/kvm/vmx/vmenter.s
>
> In mainline, the second one regenerates `kvm-asm-offsets.h` and then
> `vmenter.s`. With this patch, nothing is rebuilt.

Ugh damn, let me look into that! Thanks for the report.

>
> Cheers,
> Miguel

--
Cheers, Lorenzo
