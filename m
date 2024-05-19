Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70741374F6
	for <linux-m68k@lists.linux-m68k.org>; Sun, 19 May 2024 13:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716127032; cv=none; b=e8IAo9e9TqX5bWb5zwjxp8u1t7EWmPG97vvlbVpuH9BxS/LDDoGjguRsu+PkonIjgrtE0r2XAiJQJxcc6zQ1R8usoWYHg7vUGB4cxMmkd4jNzJq/x2IFs86pUkFOsCmRUGAuvoeR5Rqj+gNI7H47u2AUkRkumq+ZS04J25oVbG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716127032; c=relaxed/simple;
	bh=GAkIZbvLsy745u2ht/zLRzK8trWkJLSSICUXRCLcTRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kob/MAM4vYjIPlQi9oOiqoNjB1KN1ngoNSzh9XaoWDG0QEUOTjxeea/M2jXmUxXF1Q4UyEugxyDQbph7tV+PI0Qw5vJ/UlsZiF5u+KQXxEaq22cIulUJwOELmbtA98BRoQHOSz5zpaAez29/WDM7f/0UvchItOkkQUsTS+wN28E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=clx4yMyV; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="clx4yMyV"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-51f4d2676d1so2523182e87.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 19 May 2024 06:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716127028; x=1716731828; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cctD+eRzdzpBuZEWDYwKtltrGQ6JgNZmlY7uozXPm3Q=;
        b=clx4yMyVOJH/JbbNUWfi9uiQYVpcvzQgrTBm7aLpCRTWGH1+AYAc3Qkna0YYc/i1AS
         m30bwS49CppX6daTJYLw3Oi1YFk+E268QAA+BZ6s1FgGw6MMMfrr+KmYQaluujPDdBYA
         /12AZJNrnFq/unequrnRgK0JH4COcaq9lLjQo8AuI5M1FRy/ApKCxYPZS4TyG8rw4Oa3
         CEOfFhO8q1pyrV8+YwrGhFvLdU8Z3aR7DmFjuAvc1nAIKy7NmagUDumypfZKHQzgLqZO
         oYLRHgiyDVBiKyFib0O0AuyI5ZeYRhufbBLF9hxk4Gdcoat8hdNNevUIUBIyiCvB/m8R
         KmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716127028; x=1716731828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cctD+eRzdzpBuZEWDYwKtltrGQ6JgNZmlY7uozXPm3Q=;
        b=ZwtSt0MxCCOvLwrx39Hk0xzhurKF26e2C6vQS72u7kDIIQFjSU1WjQ8k8CXapL3Zcl
         JEsXohm706CbG55ZQ363aoBf2CYHcz1AGWjykI9TLLjjOP1qNB8WcWMPIpNjcRO7JTxo
         BKI+295BS1cLIcRcOBfVrCsprvGybVM3O3XvaugOj1eml9PhdmTnawGaAnRRdwA1rsvb
         VcpkW4j1OIIwEkmEk/18cwgrK9mMO5cs5pb+dI5EjsyLz51bae2DNTENBrY71pG9VWv5
         7nCW4pmwVQWZda9UHIecuMW7UxATwiYBw2M7U4KlMPa9S3PozBY/BAwCR8+5awqAmLl5
         kxRg==
X-Forwarded-Encrypted: i=1; AJvYcCUZGhafwtd9CvsQPy8Dkw6/H7nE7iOURbX511+6NQt6zMrJAKIMpPG3eLj7duk3Nwq1AikplHvCYWW4fI7TtHinOvs4zhagxtRu2q9N7g96
X-Gm-Message-State: AOJu0Ywe9Yr3FL6UxMTZyvjDtBjZN5ejJV91R+Lt6dIkEUL99AD62M5+
	e9KAVdstFrgH0yy2R2igVRPq7Ix/7XJr6l7DQmLt5lg3d8jdjKjX
X-Google-Smtp-Source: AGHT+IGFPK+rwLegannaP9pLqTpywZZno2si7Lke4r6oRJqsuAmzKtkYAJSVnNqpty7eXAAlwo0vXQ==
X-Received: by 2002:ac2:4c31:0:b0:523:8ada:9440 with SMTP id 2adb3069b0e04-5238ada9732mr8141714e87.57.1716127027998;
        Sun, 19 May 2024 06:57:07 -0700 (PDT)
Received: from gmail.com ([81.56.89.175])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-574ebdf46cesm6805171a12.37.2024.05.19.06.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 06:57:07 -0700 (PDT)
Date: Sun, 19 May 2024 15:54:51 +0200
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paolo Pisati <p.pisati@gmail.com>,
	Michael Schmitz <schmitzmic@gmail.com>,
	linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: Amiga, serial and SYSRQ
Message-ID: <ZkoEq3TK//srW5D+@amaterasu.local>
References: <ZkjwzVwYeQtyAPrL@amaterasu.local>
 <e9d97c04-73c2-e6dd-6d51-b9a4e3ef73b2@gmail.com>
 <Zkn9lwawFGzSJFSF@amaterasu.local>
 <CAMuHMdXa4BFYGSAfoPHP7hntFh2rKmFXx0p44vxua1KsfuHR1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXa4BFYGSAfoPHP7hntFh2rKmFXx0p44vxua1KsfuHR1w@mail.gmail.com>

On Sun, May 19, 2024 at 03:31:07PM +0200, Geert Uytterhoeven wrote:
> Without TRACEPOINTS_ENABLED, you get:
> 
>     #ifdef TRACEPOINTS_ENABLED
>     ...
>     #else
>     static inline void do_trace_initcall_start(initcall_t fn)
>     {
>             if (!initcall_debug)
>                     return;
>             trace_initcall_start_cb(&initcall_calltime, fn);
>     }
>     static inline void do_trace_initcall_finish(initcall_t fn, int ret)
>     {
>             if (!initcall_debug)
>                     return;
>             trace_initcall_finish_cb(&initcall_calltime, fn, ret);
>     }
>     #endif /* !TRACEPOINTS_ENABLED */
> 
> That second part should still work fine.

Ok, i appended initcall_debug, but i got the same exact output, i wonder if i'm
missing something else:

ABCDGHIJK
Linux version 6.6.30-amiga-00006-g809aa9a54cba (flag@amaterasu.local) (m68k-linux-gcc (GCC) 13.1.0, GNU ld (GNU Binutils) 2.40) #7 Sat May 18 19:55:35 CEST 2024
Saving 470 bytes of bootinfo
printk: console [debug0] enabled
printk: Too late to register bootconsole debug-1
Amiga hardware found: [A1200] VIDEO BLITTER AUDIO FLOPPY A1200_IDE KEYBOARD MOUSE SERIAL PARALLEL A2000_CLK CHIP_RAM PAULA LISA ALICE_PAL PCMCIA ZORRO 
Zone ranges:
  DMA      [mem 0x0000000040000000-0x000004dfffffffff]
  Normal   empty
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000040000000-0x000000004dffffff]
Initmem setup node 0 [mem 0x0000000040000000-0x000000004dffffff]
pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
pcpu-alloc: [0] 0 
Kernel command line: root=/dev/sda4 debug=ser earlyprintk console=ttyS0,9600n8 initcall_debug
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes, linear)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes, linear)
Sorting __ex_table...
Built 1 zonelists, mobility grouping on.  Total pages: 56840
mem auto-init: stack:all(zero), heap alloc:off, heap free:off
Memory: 221284K/229376K available (3753K kernel code, 472K rwdata, 1184K rodata, 172K init, 149K bss, 8092K reserved, 0K cma-reserved)
SLUB: HWalign=16, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
start_kernel::941
start_kernel::976
NR_IRQS: 32
clocksource: ciab: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 2694272661900 ns
start_kernel::990
start_kernel::994
start_kernel::998
start_kernel::1000
start_kernel::1006
start_kernel::1009

I'm using amiga_defconfig FWIW.
-- 
bye,
p.
