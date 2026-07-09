Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA2F3C2B82
	for <linux-m68k@lists.linux-m68k.org>; Thu,  9 Jul 2026 19:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783626593; cv=none; b=X1KOPtCXjeS6PO4ssAEpl4zd5bghSTLWCDx7x+2HT1Hl5YsYxC8ee4B43uYwc8VAlZL34qGSDruT/FNVxhispSt4OafqnhsjDCJVCePpmEteo11Leo5b+Fq1mZiwEbnqGOq/PSmu8cg/4hpFJQk2NXOWOfa4/2SNlv+/ktbJNJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783626593; c=relaxed/simple;
	bh=O3SPqd0FCeHdHAXnIs2zdCH8B3mqG0zpsrqZGFxlKyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G0Z5jF6b5hL5mGa5oQoynixM9n0GkEJhtoiybQNGF8BS3xFu/p+2RQ/ULmdo+6WhwYOK3l3dwTY00wDIk/EA17SoZDyHVKAFXdgKh1P2ITCVSIaS85p00MJxQz5nVKbJbQypNvnUfGBR2NIbQnrEOzn5tIUQKWCNSryUgKCBKWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbyecOQV; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbyecOQV"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc6dd436c6so1626745ad.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Jul 2026 12:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783626588; x=1784231388; darn=lists.linux-m68k.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wZIZ82kjBIDu2ZrVW8MGg3L6TnunPhQvQy9pezlSzDk=;
        b=XbyecOQVaRaX48eKgU5c+mas+ikQosgUGzFiDlHLjtC98LicRdTlvjBFzDReyTPRSH
         UJGNNxtSWo2cCPhBHRSoJ53t1ZGKmtraBm+N9ou9/CbEPaTR3hlOh1XrvUuWoFOoTPZY
         VajB8KjP7f5NmUmOrjqdopkKmib4g93t7F5z+o6iJ++8RHuJARisI1yXOkl9WYOuAO5I
         oReNY+PUBJR4AmpeWYHyLJ5wIkXnt+2ceab6yDLPTKmgRDmIMJvofed9MiHctGA26hrd
         YioUttLIiVDtnP0yUOxu7GTkep20thk9jsd8or4lVoD+xhhQc6SAZ1Ck5DtIR78nz40T
         ffNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783626588; x=1784231388;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wZIZ82kjBIDu2ZrVW8MGg3L6TnunPhQvQy9pezlSzDk=;
        b=paKcxiyuC4VA/e1DeQfnlDPNPVCa5Re/GEvfcuHtclEJ7n9QHpU1nx8vtpeU160C7/
         /ksVckYQSLgS5C0w9oGOn8afloBVvIuX7hPc7QIb55c4GKLtOChL2fwJhjJMNkH2oo7M
         1jb8hNDqcoMo7w6ZzCycy0NHIioNw+Iuhp31lsPZmT+th9ySUKR6XINr+oRH7gqgtnTD
         OTkUQ8ebhNBE0qHm9VSTxnuZZoZTHmI9mXmjd+RZywXyguxpH+EtUIC0IjbQDMI58PLh
         XL8D3pMDEXf37WHrc/mOqqrLjjVU1A0zGTKIlbDvzq1zjXVCdmXYIyrRUp0SFBzs3Ub8
         +4VA==
X-Forwarded-Encrypted: i=1; AHgh+RrpGCJ+DpkKwM676jDISTKFYCVXYVvXI8lTiW7dMG2sDgtI2CL1YhEt3t+E3lxs0yDe7jcCXoGw95p2@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzBvryZiZKWl++7IBOUX+thnn5BU8uffRM6ib0kToLBOg9rpPIf
	uPBMAUfdPEKS6+Fg6wIZGjde8mLazvnk+R05YDvZ8apto0yxzXPVaQSC
X-Gm-Gg: AfdE7clnzfQBQ64tkgNXNL4iJ7WVvYzj6EsHEl40O2nCVRBT5IiaXgNCRDjNeWf5cWm
	8Dg2xkOOKcWuLWuspzw0jMgEJ9ESY04dcnrKFJDjTrD7wVu/hAjKCkD6r4RI2El5LPV/2Y9deiV
	dIpS1GvU34v3y1nNAkziIj6YWTDVx8jC1vvhcTLzWcTCm2F4EtyN+jFTMB9oopQCQdG1IZ0z6pd
	wxoTuhu04dRQIig2QzSGUlxnch/r8rrVG7OHI3yv9qA2s6RlZHk3jSsnkpSGzXHTlHkdh5MpmYK
	EeGCshAYqUdaKdpM3A4Ny90aG27taU9Qbvf8yDo0TSTpcjXJd0Hvbm2nZ95tsHTmebyTfHt22d0
	LC7zxlP7rpium6UVtpeW769l1LlBPiXdoVubBY/sBzojTXrOQyWHrjv6GlMjEkwsSjGVkgcOi1N
	hb6hOc7igwCHqXyor/GZpZ+sqizYP+Sil7Jlznm3MS5uV6ZgybIuyC4bTYEdey
X-Received: by 2002:a05:6a21:512:b0:3bf:a0e5:999f with SMTP id adf61e73a8af0-3c0bcfab03dmr10300238637.22.1783626587867;
        Thu, 09 Jul 2026 12:49:47 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm34548981eec.16.2026.07.09.12.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:49:47 -0700 (PDT)
Date: Fri, 10 Jul 2026 01:19:28 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>, 
	Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-doc@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, x86@kernel.org, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>, 
	linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-um@lists.infradead.org, Vineet Gupta <vgupta@kernel.org>, 
	Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, Michal Simek <monstr@monstr.eu>, 
	Dinh Nguyen <dinguyen@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, linux-snps-arc@lists.infradead.org, 
	linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-arch@vger.kernel.org
Subject: Re: [patch 18/18] entry, treewide: Make
 syscall_enter_from_user_mode[_work]() indicate syscall execution
Message-ID: <ak_63WGVz28C2dc0@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.603111179@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707190254.603111179@kernel.org>

On Tue, Jul 07, 2026 at 09:07:09PM +0200, Thomas Gleixner wrote:
> From: Michal Suchánek <msuchanek@suse.de>
> 
> The return values of syscall_enter_from_user_mode[_work]() are
> non-intuitive. Both functions return the syscall number which should be
> invoked by the architecture specific syscall entry code. The returned
> number can be:
> 
>   - the unmodified syscall number which was handed in by the caller
> 
>   - a modified syscall number (ptrace, seccomp, trace/probe/bpf)
> 
> That has an additional twist. If the return value is -1L then the caller is
> not allowed to modify the return value as that indicates that the modifying
> entity requests to abort the syscall and set the return value already. That
> can obviously not be differentiated from a syscall which handed in -1 as
> syscall number.
> 
> The established way to deal with that is:
> 
>     set_return_value(regs, -ENOSYS);
>     nr = syscall_enter_from_user_mode(regs, nr);
>     if ((unsigned)nr < SYSCALLNR_MAX)
>     	handle_syscall(regs, nr);
>     else if (nr != -1)
>     	set_return_value(regs, -ENOSYS);
> 
> The latter is obviously redundant, but that's just a leftover of the
> historical evolution of this code. S390 has some special requirements here,
> which can be avoided when the return value is not ambiguous.
> 
> Now that the functions which modify the syscall number and want to abort
> are converted to indicate that with a boolean return value, it's obvious to
> hand this through to the callers.
> 
> Rework syscall_enter_from_user_mode[_work]) so they take a pointer to the
> syscall number and return a boolean, which indicates whether the syscall
> should be handled or not.
> 
> That's not only more intuitive, it also results in slightly denser
> executable code on x86 at least, but perf results are neutral and within
> the noise.
> 
> [ tglx: Adopted it to the changes in the generic entry code, fixed up the
>   	32-bit fallout and rewrote change log ]
> 
> Signed-off-by: Michal Suchánek <msuchanek@suse.de>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
> Cc: Paul Walmsley <pjw@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Sven Schnelle <svens@linux.ibm.com>
> Cc: linux-doc@vger.kernel.org
> Cc: loongarch@lists.linux.dev
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> ---
>  Documentation/core-api/entry.rst |   18 +++++++++++-------
>  arch/loongarch/kernel/syscall.c  |   14 +++++++-------
>  arch/powerpc/kernel/syscall.c    |    3 ++-
>  arch/riscv/kernel/traps.c        |   11 +++++------
>  arch/s390/kernel/syscall.c       |    7 +++++--
>  arch/x86/entry/syscall_32.c      |   25 ++++++++++++-------------
>  arch/x86/entry/syscall_64.c      |   12 ++++++------
>  include/linux/entry-common.h     |   12 +++++-------
>  8 files changed, 53 insertions(+), 49 deletions(-)
> 
>  
[...]
>  	syscall_exit_to_user_mode(regs);
> --- a/arch/powerpc/kernel/syscall.c
> +++ b/arch/powerpc/kernel/syscall.c
> @@ -18,7 +18,8 @@ notrace long system_call_exception(struc
>  	long ret;
>  	syscall_fn f;
>  
> -	r0 = syscall_enter_from_user_mode_randomize_stack(regs, r0);
> +	if (unlikely(!syscall_enter_from_user_mode_randomize_stack(regs, &r0))
Missing one closing ')'.

> +		return syscall_get_error(current, regs);
>  
>  	if (unlikely(r0 >= NR_syscalls)) {
>  		if (unlikely(trap_is_unsupported_scv(regs))) {

Apart from this.


Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
