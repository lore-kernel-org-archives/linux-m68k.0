Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5B64499AD
	for <linux-m68k@lists.linux-m68k.org>; Thu,  9 Jul 2026 18:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622634; cv=none; b=KXbzZpsra5qM4SJ/ZE5tYX7vFqU1SIeuRZw6VXh7stsqq3Dk/wgpySc8q7hEJWZINqoGYIibXDebVM+cjdgrg12PWRxi3trKEdzsTcVVd1GTJiM7dI5o4SKELQd814y4gUT8ajLRaWVPbH6lzGkW+0NVTkFlrVFlV2kNtTCvoIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622634; c=relaxed/simple;
	bh=5522vd31FFvseMtFKZmNLN0MO3Bnoibk1qUMw3Ml4Kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJ8pLwRuBuIblv418epjwmdVRD70UwNgwqJCp2rftOR3omwB93dvIBxIwimT99snQrqgqszFKWn31ypGTgL6VClt8xvZaVnXHnsz9JWvLfD/01nUYRpvRQzNN0z2IQaEd/dRZW+NUXTs4L8KT3b7lZZtERGR9WLNYDTwmD5ogYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUXsUmHA; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUXsUmHA"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so227085a91.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Jul 2026 11:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783622632; x=1784227432; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0SnVDTLPnMBjkQSM4oCN+URozdUIH28ywJdKUrWn7bI=;
        b=UUXsUmHAscN4XK7E/QMEBDOlSD57B8t8h8kLwomp8PmDbZgEcPDEVTQAskQ3q7uluc
         U3E+0XA/xbUiH01gkGmrU2ccV+fwbP5YNSMEOQK8PW/U2fdw/ntQHwi8mZcHm8TpKsUB
         ac2lmTDoUNMM1zpx6Dav3NVCAYfBHUYyCRXyYErdWIrwey3DLY8Nrow3Ag9ePqo+Mlw7
         w3wt7uJbwJsk2dDw0E6Quda/XjbLW5o1qcKIKVyc0/Zk/bxENCaNAXC+eoHzqJyjDZBC
         cARYqUBVw0Xyh28Q7wE3N5Wes+C0aNFFu04pSyo2EuUIi4Myi6wOL586aX+PtVJZTnMR
         QrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622632; x=1784227432;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0SnVDTLPnMBjkQSM4oCN+URozdUIH28ywJdKUrWn7bI=;
        b=NMFN/DPui9dO0ZapckyTOBTLAo4ut/k0mk/hf53g1cr1ARK/lPYlGItNSj4Ki7CSAn
         y6urgSl7ojKKL5diIuR0f7qsVF0Rt0CGCLIAN7WjPxrHYaM4Pa1aLK0l1MzWtuMxu/co
         qhdzUrcpRWhxHnjqMcUR/QDjhz8ZxhWoDXYO1JlMqZzSbL1l/31xu/1oOrnqWiRVycqm
         pWgqtFeMwME/gs9AnMXAqxt015rIsdOMdwHFbAUFauPVzmQ6LrvP8Vel7sEn4PvBG3N0
         /hSpqSsqzZ0oU/GflJMBHscHz31WY5FiOacBGOyQZtk7P/aLC6PpK5Zbf2xXBw7Wtze5
         /cbw==
X-Forwarded-Encrypted: i=1; AHgh+RqW4RUq3BzMGNASU5kElJltgD03xqQ1vxdnM/4UJSQmE2CujZleSdaB+lZMEj0Q6ved+/Oynsy26sag@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzTNbNXCbJhv8s+ah4p1EVZ2VyGUKOfy0VLUVE7dMh0mwzLu20w
	IjCF2uGOOhCUnVcrRtHkFdD6njCTPGyubYRhU2MiLYLCGYbls2RciJGi
X-Gm-Gg: AfdE7cmSef3Kr9gYnikD8rjGZdx8wD6pxIB9snCOza1dPjMk73nHzYOy/lMt4bzsUN8
	IZEOVzBr275JVINUSHpfL+wytUUDrWympu/e6Lr73Xg7Jn9YbwntWMhDchwruyj/KfDxv7vA1c+
	B9VOcbBNapTGfZpbhBOMKd613x/YteWU8ctwVoFfMIzUw64lmUTyvnh7i4vwwhMNY+PLPQlVLct
	a/jqHXqOo4ennm/ihalS2VMMSG25OwYlIMKbIZdQsQPeGRi6PHIzrCTVkQ3NnAqzXqtAKf7KztP
	u5DYzkMDUrjcDqIu0uh1SilEj+gyqvVm3CEVdBc0PZHZlwDpj2dklWHd24RtEZy10EKsV9Q41LH
	ZjU6esvUdVFNUSr4N1B/6YADT2Uht0k2W3p4i8PcJxAKPn/XBc9jMqxIkJRgL4lrF6l3RCQ62aK
	j7FOLWeE4cx6hQ+mNOEZZB+A79Yn9GV843A9pcHx+qI18rS239u61IjI9QK/j0
X-Received: by 2002:a17:90b:564d:b0:387:e0db:3d90 with SMTP id 98e67ed59e1d1-38943d404dfmr8538131a91.43.1783622632431;
        Thu, 09 Jul 2026 11:43:52 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accb0esm35673867eec.30.2026.07.09.11.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:43:52 -0700 (PDT)
Date: Fri, 10 Jul 2026 00:13:32 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>, 
	linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, 
	Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [patch 07/18] s390/syscall: Use
 enter_from_user_mode_randomize_stack()
Message-ID: <ak_rx2gFCLtG-Qpy@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.030598804@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707190254.030598804@kernel.org>

On Tue, Jul 07, 2026 at 09:06:23PM +0200, Thomas Gleixner wrote:
> enter_from_user_mode_randomize_stack() replaces enter_from_user_mode() and
> the subsequent invocation of add_random_kstack_offset_irqsoff().
> 
> As a bonus this avoids the overhead of get/put_cpu_var() in
> add_random_kstack_offset().
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Sven Schnelle <svens@linux.ibm.com>
> Cc: linux-s390@vger.kernel.org
> ---
>  arch/s390/kernel/syscall.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- a/arch/s390/kernel/syscall.c
> +++ b/arch/s390/kernel/syscall.c
> @@ -97,8 +97,8 @@ void noinstr __do_syscall(struct pt_regs
>  {
>  	unsigned long nr;
>  
> -	enter_from_user_mode(regs);
> -	add_random_kstack_offset();
> +	enter_from_user_mode_randomize_stack(regs);
> +
>  	regs->psw = get_lowcore()->svc_old_psw;
>  	regs->int_code = get_lowcore()->svc_int_code;
>  	update_timer_sys();
> 
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
