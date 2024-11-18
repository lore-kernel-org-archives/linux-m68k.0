Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5291E2827
	for <linux-m68k@lists.linux-m68k.org>; Mon, 18 Nov 2024 18:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731955233; cv=none; b=aTfgXGyutqrfiRz7Kqa6wUPRkbxisrcV0ExxJ/CzyiKoRIvs1b0w5B/QvY0QlC5p13AVWkzZ71JGWZ+n3mxEnVgIir/dWITDJW5ERdSwoJAOflSSJZfgChJYFCt1DRSTtD4DtrmWIF6iR8SIbVsw2iXYqGQy2tl3PogDt03gO/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731955233; c=relaxed/simple;
	bh=PgWfk6zhBX25rXxPAwmwUJeghk+GajLkQHlk+OfGUQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kuzKbBNkAftyQo4jWLZJtcbabaRgyhR3dMK79KlLH4HtyK4m6p2zzrF//HR6G9vsDUpEg3N5iHyHenaxIjfeXyUeEMeDP03w8AWIUP/dRQVM1s4Hq6YW4vKK4xtbaa2OkCVyQlkisWnN+RNkq3abtf52a81quMFcBbkQEUaRKJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GeOY29sz; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GeOY29sz"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 11F02A419F2;
	Mon, 18 Nov 2024 18:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A5AEC4CECC;
	Mon, 18 Nov 2024 18:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731955229;
	bh=PgWfk6zhBX25rXxPAwmwUJeghk+GajLkQHlk+OfGUQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GeOY29szPjdxa0xm+vV9DTg2e5TPlxk7huuBMuJbtT+hTn5kPCdRWZ2oKgkC8UpSt
	 VKEpF1/SK1ceIDW9rYbK4e2lrKnmmaewrajrem/5hOE+eL2aJiJwe2Mq1uUh3lhZ50
	 bF8KJonZOhyM89MpbuLHVivYouTUSuZbDmGNuIIUU6Sz4PBRF7AffgUgRIMQ22WWof
	 8/hSFdkboAANibLeqfLmV82IhRXIdNitXrU+lzbag6jN3GbbRMHw4voatyzJmOaEVn
	 LYCc2cjDCBvkB/fCKjeR1Y3G/eBzyCxZ8foJEVKOfJ+JG689X8AaWtSJSKfiAkucWY
	 LfgB8UgFNVmrQ==
Date: Mon, 18 Nov 2024 10:40:26 -0800
From: Mike Rapoport <rppt@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v7 0/8] x86/module: use large ROX pages for text
 allocations
Message-ID: <ZzuKGoj99rIuMaBE@kernel.org>
References: <20241023162711.2579610-1-rppt@kernel.org>
 <20241118132501.4eddb46c@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118132501.4eddb46c@gandalf.local.home>

On Mon, Nov 18, 2024 at 01:25:01PM -0500, Steven Rostedt wrote:
> On Wed, 23 Oct 2024 19:27:03 +0300
> Mike Rapoport <rppt@kernel.org> wrote:
> 
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Hi,
> > 
> > This is an updated version of execmem ROX caches.
> > 
> 
> FYI, I booted a kernel before and after applying these patches with my
> change:
> 
>   https://lore.kernel.org/20241017113105.1edfa943@gandalf.local.home
> 
> Before these patches:
> 
>  # cat /sys/kernel/tracing/dyn_ftrace_total_info
> 57695 pages:231 groups: 9
> ftrace boot update time = 14733459 (ns)
> ftrace module total update time = 449016 (ns)
> 
> After:
> 
>  # cat /sys/kernel/tracing/dyn_ftrace_total_info
> 57708 pages:231 groups: 9
> ftrace boot update time = 47195374 (ns)
> ftrace module total update time = 592080 (ns)
> 
> Which caused boot time to slowdown by over 30ms. That may not seem like
> much, but we are very concerned about boot time and are fighting every ms
> we can get.

Hmm, looks like this change was lost in rebase :/

@Andrew, should I send it as a patch on top of mm-stable?

diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index 8da0e66ca22d..859902dd06fc 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -111,17 +111,22 @@ static int ftrace_verify_code(unsigned long ip, const char *old_code)
  */
 static int __ref
 ftrace_modify_code_direct(unsigned long ip, const char *old_code,
-			  const char *new_code)
+			  const char *new_code, struct module *mod)
 {
 	int ret = ftrace_verify_code(ip, old_code);
 	if (ret)
 		return ret;
 
 	/* replace the text with the new text */
-	if (ftrace_poke_late)
+	if (ftrace_poke_late) {
 		text_poke_queue((void *)ip, new_code, MCOUNT_INSN_SIZE, NULL);
-	else
+	} else if (!mod) {
 		text_poke_early((void *)ip, new_code, MCOUNT_INSN_SIZE);
+	} else {
+		mutex_lock(&text_mutex);
+		text_poke((void *)ip, new_code, MCOUNT_INSN_SIZE);
+		mutex_unlock(&text_mutex);
+	}
 	return 0;
 }
 
@@ -142,7 +147,7 @@ int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec, unsigned long ad
 	 * just modify the code directly.
 	 */
 	if (addr == MCOUNT_ADDR)
-		return ftrace_modify_code_direct(ip, old, new);
+		return ftrace_modify_code_direct(ip, old, new, mod);
 
 	/*
 	 * x86 overrides ftrace_replace_code -- this function will never be used
@@ -161,7 +166,7 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	new = ftrace_call_replace(ip, addr);
 
 	/* Should only be called when module is loaded */
-	return ftrace_modify_code_direct(rec->ip, old, new);
+	return ftrace_modify_code_direct(rec->ip, old, new, NULL);
 }
 
 /*


> -- Steve

-- 
Sincerely yours,
Mike.
