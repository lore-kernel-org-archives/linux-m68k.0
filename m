Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704D21FE47E
	for <linux-m68k@lists.linux-m68k.org>; Fri, 17 Jan 2025 11:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737113025; cv=none; b=KStnrb+0R1tVVYI0LXrylV6FCu/AIiZguVj8RVgGbUuPdtLeW+Xgdzowj5iOkdqYCwJgpLavoEiP2pv0Dt5mrFuH0/TEl36hzi8Pjeiq0oVvK92UGHmp4aWrSdeQzLSpiTkCWERYzH8wUC8Bjx256MfI2ug5JjpELusuyAp5ZEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737113025; c=relaxed/simple;
	bh=0MfAagGyPmBC90JAAVPekQyRC26SLFPBltnUGhYKIEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FzBM2m50yJj3gYPYM7RB7G11pFsGS8EqALwMBmYQcEx56BQW+lVcHNDJ+10+II55IQj7MrhBpCUCttlowEGegkaHXmpmWNuKwq3P/evNfIYP7weZ9G3iPtorsaPCUWLBfaWnQvj8h9tfWlhFj8awizciALQRZaW92RtzrQfzCwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hs85Qczj; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hs85Qczj"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4678c9310afso165461cf.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 17 Jan 2025 03:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737113021; x=1737717821; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FIGX2U5Y620ytLuHZv9C2YKRXU6LkFVVh5lOzeeXil4=;
        b=hs85QczjMaIQfec9+oGhLXO1uxgpuiOxvaQfTg8/Pn4g1RW1asXcgPWj564mVAl8H7
         XNzo76JugCilLMKNqLE3MfCWDclEc+i8xxxcTyWcPsZh4D+9QRnMfwAOAdOde9izC8po
         8iKj7nVcM/eyNKuLln4hZPKEYzojZc9GLKehzsmnkA1eJSfCCS62UEp29iBrsYtGHx5B
         4ZMc3FSNTQPF+tLJbSd45JoYyE8OgV+BRbyToXOYv1H7gZe5wKCVp1YmfZUlFucwcB/7
         Wi6WuI2Ulz9IsBsxBVxXSRVIoOs7trZ8YogPOR9uyBekuMs3OQxF16bBg/O6ce/HQo+k
         M/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737113021; x=1737717821;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FIGX2U5Y620ytLuHZv9C2YKRXU6LkFVVh5lOzeeXil4=;
        b=naqAeojApMVSws4Q5jBDIYhsUo5YbmAwbCRHX83vGMXWFXbUiIRxZAm0y0y9WUJ2Pp
         8LDdIT+pUIInsWFkT7nS4A6jGyrZGw/A29noHW3dlqqrzdlZKnIW2LnltnpMvSEc6SHQ
         V/f+UwTiw3esxQ7WfRmTiaoK11CF26qrDYN/Fmb5bzTGFvcsShB59fshxWUM7Vv3He2d
         4e/Ryt7Pt9xlnzg8vRWX37TQisx9MH/TszaeSfNuW+k9HwfX+70uneyel32exms8IJ0j
         1XF0iRTOYW/YmRuj6y/NycjFObCHMGRBCirK520ZdpgKjuXAgTY+WAVuRlhWppm/2jia
         AS3w==
X-Forwarded-Encrypted: i=1; AJvYcCVjV38G364r0NXFxOxJAFgMJWLeDCP40hnG0clmsmiI1GvSPG9XZU9kTx8k2FtiQu2BrnF8KDfPwKAN@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwK10SCnXfe47B2Ku8L5bCMz7pcl8aJOUG4g/uaNUP5FvYDmVvU
	0I7Q7BAgYJ3FeDTn+o51kttjzfWpfqBKB93K4shdPPvtnsL2ONXrIH1DAOtQlTYq+7lshSLPjbS
	z7/HT9F7QaClC/H9tumPzVHk1TfNGqNVeLpov
X-Gm-Gg: ASbGncsEP01PJKBIFQhWmnryiO+D2HELQmhiapcXBiCtSnux+B31gQZh2ltxT+9r8Cb
	u7Hv85t0NscQfVKe7o7byHNgErBe5UPgVqfVQW5dvvWiX1FP0V6bcQDGKem71pJw/YZMA
X-Google-Smtp-Source: AGHT+IGncYyjy1GhHnzrsXOo74WzCLmIKZegqTWM730ikUDOlazbTaQH35QB0zgmvzL1yJ283cNPWINqKuKsZStNP0A=
X-Received: by 2002:a05:622a:1997:b0:466:923f:a749 with SMTP id
 d75a77b69052e-46e130af265mr2539121cf.15.1737113021050; Fri, 17 Jan 2025
 03:23:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com> <20250110-asi-rfc-v2-v2-16-8419288bc805@google.com>
In-Reply-To: <20250110-asi-rfc-v2-v2-16-8419288bc805@google.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Fri, 17 Jan 2025 12:23:30 +0100
X-Gm-Features: AbW1kvZ_KaymUoc5jGYX-groCnX_p-Tg9PrSiJ2rBOnB_iSLYbhJZulsHf6-rd0
Message-ID: <CA+i-1C1JKEd43vtyGO6RLCQQA8qVCvALjm+q1oVTGMLtjo64iw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 16/29] mm: asi: Map kernel text and static data as nonsensitive
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mike Rapoport <rppt@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	kvm@vger.kernel.org, linux-efi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Jan 2025 at 19:41, Brendan Jackman <jackmanb@google.com> wrote:
> +       asi_clone_pgd(asi_global_nonsensitive_pgd, init_mm.pgd, VMEMMAP_START);
> +       asi_clone_pgd(asi_global_nonsensitive_pgd, init_mm.pgd,
> +                     VMEMMAP_START + (1UL << PGDIR_SHIFT));

There's a bug here that Yosry has fixed in our internal version, I
neglected to incorporate that here.

Under KASLR, vmemmap is not necessarily exactly 2 PGDs like this is
assuming. In fact it can share a PGD entry with the vmalloc area. So
to be correct this cloning logic needs to actually look at the
alignment and then navigate the page table hierarchy appropriately.

To be fixed for the next version.

As Yosry noted internally we also need to think about vmmemap getting
updated under memory hotplug.
