Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792681359;
	b=r0Qj7B/tWAiqyBdCGNYgQhHO+OxjFeT59L/g7BOtHazhXG8NMU1i9n5LVtk6a9AjrKQ2
	 RhJBAdkKrsJP0CkVlPUYJlu8Ywr1nfqoHLMs2Ncj9aCNswF6kgpCXVBuvH1ypc1f+hSEN
	 bNxPf4cf+RwWWawLrHmolegdcwcTwL3kAlPHiyhHVEYN2umlB2tSME2tVQoIf8Hzzx0MD
	 3HvIrPPH52DFr+ynovspuDL5artjASSTobtc4l3BVmZzkhRu4PRo0CmKyK9PmIFlm0unq
	 dlvWbjQgdKdOJPQ0h4DjXwqDuv1BwprfH+7tLzD41dGoshnb7pcKxiBY7NntFppmdJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792681359;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=UzBCi/OSOXBVd/hf35Hctx/8s00KKyC8gNB54GWWKuw=;
	b=Rnqn+ksqvSKyuu4B5ljAdHc0xF8sz3o1dza5Vc/e4UO9ex5EhhLrWSrbeyZwSgE2JhS5
	 oGbeXkjQyJrjl86iXbsPC9XW9W5u3eDY+6656MXPiS0ca9MhSQPCV8RXjDy0P51PPohYI
	 wz3v8f00f20gR5VwMQIufboXECw5mfnjqE/HirH3VO/+DQMI+k5PoB0fHCzRljEQIqDph
	 IMBCEt1VDzF+DFCOsEIMuN5s0pTONj10p4Sk9EvjOoKdeLDzbRelYUZ4JiU7V7iSULOfh
	 ha9IuuNm7lMMtHUkoc8HuC3sjTx6ScWWa2d8LFSbgf1kGYm/LZy3sFSiClt9YMjrk4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2kUGpeTG;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=rACQg86H;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26F3606A319
	for <linux-m68k@lists.linux-m68k.org>; Thu, 22 Oct 2026 15:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E26F3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2kUGpeTG;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=rACQg86H
Date: Thu, 22 Oct 2026 17:02:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792681357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UzBCi/OSOXBVd/hf35Hctx/8s00KKyC8gNB54GWWKuw=;
	b=2kUGpeTGDVBuYHmtDUk+ioLvFvif4ltj8rhWzocDuPm3HaFe4R4vTlOrnH+/NsK85KtmTp
	BQjRWdChCYWAdK0+eKUDRrdj71IFDIxlOzl/dpE7YHJOp63rkeZsrL+lIMWPOayKDZmWQS
	jZAmsd4OLiERAIm81xpmW1yxnaZhra+XaRdURt8feLSfDQkUZypkuicnE2Chx4WDXJq1W7
	gDW8/bA/PN+qgiQxlc+hLTJKpE5MORxYd7/+QpWeOeTOBVrrUrdM+PZPV0PqyhtRPzLVvf
	zZtCZj7gdLMshXYHbUIElhTwDBoSLh7+UVN4FV0jNASdMsB3S53YU8lnjUcMbw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792681357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UzBCi/OSOXBVd/hf35Hctx/8s00KKyC8gNB54GWWKuw=;
	b=rACQg86HepNQ8r26wtL/lrV9xxe+QpJ6z/mp4SnHXzsO+wI4ld+mzpC3AGpr+fKJ/pFfac
	AwRn+5gmUDC3CcCw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
	x86@kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Guo Ren <guoren@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Helge Deller <deller@gmx.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Richard Weinberger <richard@nod.at>,
	Chris Zankel <chris@zankel.net>,
	linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>,
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org,
	linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-arch@vger.kernel.org,
	Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [patch 16/18] x86/entry: Get rid of the sys_ni_syscall()
 indirection
Message-ID: <20261022150235.V2CSdtmu@linutronix.de>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.493733289@kernel.org>
 <20261022142425.3Wx-RrU5@linutronix.de>
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
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261022142425.3Wx-RrU5@linutronix.de>

On 2026-10-22 16:24:30 [+0200], To Thomas Gleixner wrote:
> The test could be updated via the hunk below in case the new behaviour
> is what is expected. hpa made the extension to the test in commit
> 795e2a023b808 ("selftests/x86/syscall: Add tests under ptrace to
> syscall_numbering_64").
>=20
> diff --git a/tools/testing/selftests/x86/syscall_numbering.c b/tools/test=
ing/selftests/x86/syscall_numbering.c
> index ca0eca7b9dced..1435394fba022 100644
> --- a/tools/testing/selftests/x86/syscall_numbering.c
> +++ b/tools/testing/selftests/x86/syscall_numbering.c

Now I notice the fix depends on CONFIG_X86_X32_ABI=3Dy (fails for =3Dn).
But we want to get rid of it anyway so=E2=80=A6
CONFIG_IA32_EMULATION is not affected (with the fix).

Sebastian
