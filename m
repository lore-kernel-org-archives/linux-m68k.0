Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F85E2AD20
	for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Oct 2024 03:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729655651; cv=none; b=CJI4tBXnHQQ0aSvdYUSKGkwFFlW4UZMCZ47hKpIf/wPYOWQdJLVy2AFFzTWmjgSz2cyed5xJ1whxdS3SrWQ7ILcShrhyr0ivruaKe27BvxHEPZvaDiuBBB/q3Jl5LKpC5/g511+82Bh+ovMSzvynRqYAONYCv2MIfuJP2jlsUD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729655651; c=relaxed/simple;
	bh=wIYPFd1ECFqYcBpUUBUDNuBZLsQHxVKxItc1oZ/BPq0=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=BQpm64UeWzbJS5jdZw3jEwYDrU4IbGoSMzsHmShrQwZLp9vYtvwoj7YkJzBDrEtLTu5lx0MhBOiN1JiLvuHRH57DCI+4alYiP0Tu7IaUPhG0h86oPjz9KcWJ9lKyx1mwLJ0KsTYhvm9KSLqYJtf7NaxefPIFyuoq5//B1SoMcBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OfxSj3Qu; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfxSj3Qu"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20cf6eea3c0so51994255ad.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 22 Oct 2024 20:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729655650; x=1730260450; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47KfYWZzbJlPbzsig/V/+47dXkCR0XBbErKjie4MZZc=;
        b=OfxSj3QuO7AWUB/7dJbI7i1qXJgB6i4rRUS5fQUzf/8MIV+8d09HS1LgFdQey3pFAt
         PjXwhkIJoWmlrZoxCfA9MuRmO95wAC7OwEoV7DRNUs7UJIqbrtYvsRJKN8GvURjDla2g
         Btk50ryJ02onA+jBVMosSq92BLZfs8vapyJcfLNjMJva3uIvZQCKdXLBSY1chXkMWjuY
         A6mtR9aF2ZwfJvqeAq8BsWBgUAdceRgjSv/1GzWh0xDrhFXZ6VyEjzFaXE193qc7pJEG
         eCMf4iLTqzDFib0pEyr9m4TI2J28OfbAhflhFGWCOxNO+NRwDGFOp17Z/s79sowVEwVk
         KwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729655650; x=1730260450;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=47KfYWZzbJlPbzsig/V/+47dXkCR0XBbErKjie4MZZc=;
        b=m2tPKBH+BldJQLw6XpHqeFjYMoga+9lL3+Wb4hiTDQz7mKvQXw/UHYHblTPiOsFYBy
         QcV/INzxNebzxsmsNs/0AzdU+oTFDM0vtV6kU5ocEfA5I1auKfk/DmJspeODlasC5Qha
         jH0n28AbuhqcGMzQiBkvhCy7AFzYDA/ot/3So/bPPCUb6HZHRmny26mIm8dsfu6C53Rh
         Yzx/vh8J3vnhoT7fWLnPAOi5lsbZpY00otu5vhUfgQEDu4KNsW6mw0m9xRIxs3LkHDDP
         x75lC6buWb5cfOHD4P4noclFmTwGFhX2Oxn//3hhged4XO+zjjm7NWbcFmKbSltQBtbt
         vwBA==
X-Gm-Message-State: AOJu0YyJ7ExwNoTP0ROCbA23oPS0pNyvWEjEvibQmilHxwcDHjRgQncE
	dfL0Jjy+kRWE2duFnAdeG6+8OZ8oV5N2GkRmnAy6v6NkXzpA8lFF
X-Google-Smtp-Source: AGHT+IGUdfCfM3QYCu6suXxsF586R6Gdy9CD3PBp1aBTBnfp+rRc4cVRKvMmcFpQ4p0Hgi9KZL3jFQ==
X-Received: by 2002:a17:902:c951:b0:20c:d04a:a53f with SMTP id d9443c01a7336-20fab2dbbf9mr19307115ad.58.1729655649555;
        Tue, 22 Oct 2024 20:54:09 -0700 (PDT)
Received: from [10.1.1.24] (125-238-248-82-fibre.sparkbb.co.nz. [125.238.248.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7eee6408sm49390995ad.37.2024.10.22.20.54.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Oct 2024 20:54:09 -0700 (PDT)
Subject: Re: [PATCH RFC 1/2] m68k: Add tracirqs
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20241021-add-m68k-tracing-support-v1-0-0883d704525b@yoseli.org>
 <20241021-add-m68k-tracing-support-v1-1-0883d704525b@yoseli.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, rostedt@goodmis.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <4ab85330-5a50-bde1-f014-99a8e7cb28cc@gmail.com>
Date: Wed, 23 Oct 2024 16:53:58 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241021-add-m68k-tracing-support-v1-1-0883d704525b@yoseli.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Jean-Michel,

thanks for your patches!

Am 21.10.2024 um 22:44 schrieb Jean-Michel Hautbois:
> The TRACE_IRQFLAGS_SUPPORT requires the architecture to call
> trace_hardirqs_off() when interrupts are disabled and
> trace_hardirqs_on() when they are enabled.
> Add those calls to do_IRQ function.

You will also have to add these calls to the three sites in 
arch/m68k/coldfire/head.S where interrupts are enabled or disabled.

Here:
> ENTRY(system_call)
>         SAVE_ALL_SYS
>         move    #0x2000,%sr             /* enable intrs again */
>         GET_CURRENT(%d2)

and here:
> ret_from_exception:
>         move    #0x2700,%sr             /* disable intrs */
>         btst    #5,%sp@(PT_OFF_SR)      /* check if returning to kernel */
>         jeq     Luser_return            /* if so, skip resched, signals */

and here:
> Lwork_to_do:
>         movel   %a0@(TINFO_FLAGS),%d1   /* get thread_info->flags */
>         move    #0x2000,%sr             /* enable intrs again */
>         btst    #TIF_NEED_RESCHED,%d1
>         jne     reschedule

There's one similar site in arch/m68k/kernel/head.S (ret_from_exception) 
where interrupts are enabled that would need a similar change, if you 
want to enable this for all m68k.

Registers %d0-%d5 and %a0-%a2 are saved on the stack at this point and 
can be clobbered if need be.

Cheers,

	Michael


>
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> ---
>  arch/m68k/Kconfig      | 1 +
>  arch/m68k/kernel/irq.c | 2 ++
>  2 files changed, 3 insertions(+)
>
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index cc26df907bfe3c8143a931d259eceabb16af7411..ab3375475721fa63418c40d4ba6ac76679ebc77d 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -39,6 +39,7 @@ config M68K
>  	select OLD_SIGSUSPEND3
>  	select UACCESS_MEMCPY if !MMU
>  	select ZONE_DMA
> +	select TRACE_IRQFLAGS_SUPPORT
>
>  config CPU_BIG_ENDIAN
>  	def_bool y
> diff --git a/arch/m68k/kernel/irq.c b/arch/m68k/kernel/irq.c
> index 9ab4f550342e5de11c528f55781432675ffd66bf..74cf60ebbc4bca51f3caa4046dbd2bdb02355711 100644
> --- a/arch/m68k/kernel/irq.c
> +++ b/arch/m68k/kernel/irq.c
> @@ -21,9 +21,11 @@ asmlinkage void do_IRQ(int irq, struct pt_regs *regs)
>  {
>  	struct pt_regs *oldregs = set_irq_regs(regs);
>
> +	trace_hardirqs_off();
>  	irq_enter();
>  	generic_handle_irq(irq);
>  	irq_exit();
> +	trace_hardirqs_on();
>
>  	set_irq_regs(oldregs);
>  }
>
