Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1451B977
	for <linux-m68k@lists.linux-m68k.org>; Sun, 19 May 2024 07:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716104212; cv=none; b=YHC4ftKLEREd7okPOmjFuSXl+QZtzGu2Fx8SPVIzmk5Yr3yWPdRFXLQ9SFUvRnAoLHpCnq40WoCOHa+UR+JOJqUlKuijNtRU2rWjTHKiMmWqvrvCD19jn/kIHYYzD8pJ8HkDRKyYY5Ep5CcxD8ihXCCexl8ieoES8q+fDLjAopM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716104212; c=relaxed/simple;
	bh=9igACfr9xv8a9Qh2R7gf/n3+Vi1lKEFIomFK79JBMoE=;
	h=Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=lYbLMe+zund5YzDfufmxdZA/qDytQNoqImDWKhsZwwSRmowh6fNv5XFhQyeTHCeAJeqwCc/u+nFPo6bK4eWw8B2WcwRofGrq+6jlkXvEpgIvYMDfS810aCjEbSb1qDF9NNaCK37L7GmwerFqzcQ+Bi0fV3/rXa8JKIadMg6ATQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YNvZzsIY; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YNvZzsIY"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1ed904c2280so40315635ad.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 19 May 2024 00:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716104210; x=1716709010; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YpAChzVXt9eyQuD87FUTART5qR2BP8gXwHWCWfsqJ48=;
        b=YNvZzsIYoPTxUglJ2LEGeoiHL/Dn91Bpog/sh4o6xVAG3Q67wgERgcn7d2FNFr5/Mc
         zK27//4KGqp1pA5nF48pb4B5ULcAI1mxfqyuG0+W+hQvAk4VZ3DkwovOOKHbD5MSpBRu
         olpMteENaV4g29hFTWBcTCcEjigSY4vrZ9UbUIkO5hvFKabHbDJXup0mJOG8WQV7fq2p
         nljNq0MeoX9Sm5owmYzipIaJpc8AMIT3bnz9dAdaTsE5R2G1hRSKC/oGw8y0nLtvoTBy
         EDAczFTjgojJCju24UF6v+hxcmZ2YwjGEOcHJmkslsGma2IFqplrHxeunpnwjq84Y7P+
         IMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716104210; x=1716709010;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YpAChzVXt9eyQuD87FUTART5qR2BP8gXwHWCWfsqJ48=;
        b=XtkeXDZTMX56Qm6+4rkpcNt69vC5O/xX5vUwOfHFOjvcgPnt4bFSrTdzvs/PIrRA1r
         k2suCtraDXwoqR5GnAZnn0HGM3ghPD2zgP6RZ7e43W92HWAGm21b/3/MszUjEGrucZcp
         I13F9OOOHCcawwj9SnaUbJrXB9oqDDEdzeuZl/w4muqJOy6aCZwxj46KLV4TlJ6LPT0y
         R5E6EVldq4yRtjRAkklMUqlEqHyt+l6KoR74QHmRldGG5LM/OGeFSVdlacXx3mLhiREF
         RVdbakl9Og4CpaPW7azgUheJ6BUqldhhQP4OZGh+HCCC65rXYxtkHSsyAeXYgFx1MvOw
         AQFw==
X-Forwarded-Encrypted: i=1; AJvYcCWwFvou7ueXEZxY4fjcTDMLreTDOb+nFQ6L0F2tYx7hFDbR2zRUu0cq21Elxwwy7COojVXdFNxMfDdyyKixXxfTHgLXryHh4BX2gdGYZQjw
X-Gm-Message-State: AOJu0YyVTTBEUo4P+UvqN7jO/lM7JNqAE17ORn5lhm0nz2F4Afnfts4J
	oXsNyAONpL0XH9YPPqlD/1Mkx2C2rBhfS9Q5Yc6HC6DeLKA7rODZ982JnQ==
X-Google-Smtp-Source: AGHT+IEp7jytmRUTn2xl/x8BbTsx8JTL5QYEp1RWQhLGoEjbMr+0cXWQJ7u/q+VuvSnsX0TxyiRDUQ==
X-Received: by 2002:a17:903:283:b0:1f2:faff:b2f3 with SMTP id d9443c01a7336-1f2faffb436mr7523925ad.28.1716104209521;
        Sun, 19 May 2024 00:36:49 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f0999c686dsm64476475ad.273.2024.05.19.00.36.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 May 2024 00:36:48 -0700 (PDT)
Subject: Re: Amiga, serial and SYSRQ
To: Paolo Pisati <p.pisati@gmail.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <ZkjwzVwYeQtyAPrL@amaterasu.local>
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <e9d97c04-73c2-e6dd-6d51-b9a4e3ef73b2@gmail.com>
Date: Sun, 19 May 2024 19:36:43 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZkjwzVwYeQtyAPrL@amaterasu.local>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Paolo,

please try adding 'initcall_debug' to the kernel command line.

On a serial console, SysRq is BREAK:

On the serial console (PC style standard serial ports only)
         You send a ``BREAK``, then within 5 seconds a command key. Sending
         ``BREAK`` twice is interpreted as a normal BREAK.

(see Documentation/admin-guide/sysrq.rst)

Cheers,

	Michael

Am 19.05.2024 um 06:17 schrieb Paolo Pisati:
> Hi,
>
> what's the key sequence to trigger SYSRQ on Amiga? And what's the sequence if
> i'm redirecting the console via serial?
>
> Some context: i'm trying to collect a backtrace from my Amiga 1200 + Warp
> 1260[1] + flicker fixer that refuses to boot and shows a solid grey screen.
>
> By using a serial, i've seen it booting up to:
>
> ABCDGHIJK
> Linux version 6.6.30-amiga-00006-g809aa9a54cba (flag@amaterasu.local) (m68k-linux-gcc (GCC) 13.1.0, GNU ld (GNU Binutils) 4
> Saving 454 bytes of bootinfo
> printk: console [debug0] enabled
> printk: Too late to register bootconsole debug-1
> Amiga hardware found: [A1200] VIDEO BLITTER AUDIO FLOPPY A1200_IDE KEYBOARD MOUSE SERIAL PARALLEL A2000_CLK CHIP_RAM PAULA
> Zone ranges:
>   DMA      [mem 0x0000000040000000-0x000004dfffffffff]
>   Normal   empty
> Movable zone start for each node
> Early memory node ranges
>   node   0: [mem 0x0000000040000000-0x000000004dffffff]
> Initmem setup node 0 [mem 0x0000000040000000-0x000000004dffffff]
> pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
> pcpu-alloc: [0] 0
> Kernel command line: root=/dev/sda4 debug=ser earlyprintk console=ttyS0,9600n8
> Dentry cache hash table entries: 32768 (order: 5, 131072 bytes, linear)
> Inode-cache hash table entries: 16384 (order: 4, 65536 bytes, linear)
> Sorting __ex_table...
> Built 1 zonelists, mobility grouping on.  Total pages: 56840
> mem auto-init: stack:all(zero), heap alloc:off, heap free:off
> Memory: 221284K/229376K available (3753K kernel code, 472K rwdata, 1184K rodata, 172K init, 149K bss, 8092K reserved, 0K c)
> SLUB: HWalign=16, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
> start_kernel::941
> start_kernel::976
> NR_IRQS: 32
> clocksource: ciab: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 2694272661900 ns
> start_kernel::990
> start_kernel::994
> start_kernel::998
> start_kernel::1000
> start_kernel::1006
> start_kernel::1009
>
> I've added some printk around init/main.c::start_kernel() and it *appears* to be
> hanging in "local_irq_enable();".
>
> I've tried all stable LTS kernels from 4.4.y to 6.6.y, and they all shows the same
> exact symptoms.
>
> Hope it rings a bell.
>
> 1: https://amigawarp.eu/product/warp-1260-board-for-amiga-1200/
>
