Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BAC1990AF
	for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Aug 2024 17:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724693321; cv=none; b=I2zxXP8UzcRe0nkSzZhENtzhStq31PVWrbKvqk676JR+N9u+xczt5z60seCI90dNLwLdLJ44uCYhLVAPjeEyVv5uNdpToY80iOok/dqws4XXXF3rrSchYqiE/52JqDw2uOkUqpMkkLLQAKX1y38/GrAhxlC4Hd5t+gN90JSLiHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724693321; c=relaxed/simple;
	bh=Ah1MYcJfpVaPDZCj/MgYPfBVJo43ln+VDcKQfM/BWW0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MjJb8CIpZLa4R+C1Fb552ygZLjvyh+2fah1Dx2yeAjzlxR/RGN3sJdcZNeN4oH6n8Xai/YXkwTNslPUkcvt2snmJ2eQHI/d2+uaxa720q7VtVh7JsK6RM62jiZ5aCCfezenpEuTgUnKORsVHPzOkZE7h9YKGVld+5DCdkuEOq8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B3469A40480;
	Mon, 26 Aug 2024 17:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E6AC8B7B5;
	Mon, 26 Aug 2024 17:28:29 +0000 (UTC)
Date: Mon, 26 Aug 2024 13:29:09 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andreas Larsson
 <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, Brian Cain
 <bcain@quicinc.com>, Catalin Marinas <catalin.marinas@arm.com>, Christoph
 Hellwig <hch@infradead.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, Helge Deller
 <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Kent Overstreet
 <kent.overstreet@linux.dev>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Song Liu <song@kernel.org>, Stafford Horne <shorne@gmail.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner
 <tglx@linutronix.de>, Uladzislau Rezki <urezki@gmail.com>, Vineet Gupta
 <vgupta@kernel.org>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-modules@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 5/8] ftrace: Add swap_func to ftrace_process_locs()
Message-ID: <20240826132909.306b08fc@gandalf.local.home>
In-Reply-To: <20240826065532.2618273-6-rppt@kernel.org>
References: <20240826065532.2618273-1-rppt@kernel.org>
	<20240826065532.2618273-6-rppt@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Aug 2024 09:55:29 +0300
Mike Rapoport <rppt@kernel.org> wrote:

> From: Song Liu <song@kernel.org>
> 
> ftrace_process_locs sorts module mcount, which is inside RO memory. Add a
> ftrace_swap_func so that archs can use RO-memory-poke function to do the
> sorting.

Can you add the above as a comment above the ftrace_swap_func() function?

Thanks,

-- Steve

> 
> Signed-off-by: Song Liu <song@kernel.org>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  include/linux/ftrace.h |  2 ++
>  kernel/trace/ftrace.c  | 13 ++++++++++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> index fd5e84d0ec47..b794dcb7cae8 100644
> --- a/include/linux/ftrace.h
> +++ b/include/linux/ftrace.h
> @@ -1188,4 +1188,6 @@ unsigned long arch_syscall_addr(int nr);
>  
>  #endif /* CONFIG_FTRACE_SYSCALLS */
>  
> +void ftrace_swap_func(void *a, void *b, int n);
> +
>  #endif /* _LINUX_FTRACE_H */
> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index 4c28dd177ca6..9829979f3a46 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -6989,6 +6989,17 @@ static void test_is_sorted(unsigned long *start,
> unsigned long count) }
>  #endif
>  
> +void __weak ftrace_swap_func(void *a, void *b, int n)
> +{
> +	unsigned long t;
> +
> +	WARN_ON_ONCE(n != sizeof(t));
> +
> +	t = *((unsigned long *)a);
> +	*(unsigned long *)a = *(unsigned long *)b;
> +	*(unsigned long *)b = t;
> +}
> +
>  static int ftrace_process_locs(struct module *mod,
>  			       unsigned long *start,
>  			       unsigned long *end)
> @@ -7016,7 +7027,7 @@ static int ftrace_process_locs(struct module *mod,
>  	 */
>  	if (!IS_ENABLED(CONFIG_BUILDTIME_MCOUNT_SORT) || mod) {
>  		sort(start, count, sizeof(*start),
> -		     ftrace_cmp_ips, NULL);
> +		     ftrace_cmp_ips, ftrace_swap_func);
>  	} else {
>  		test_is_sorted(start, count);
>  	}

