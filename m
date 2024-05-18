Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEAF4778E
	for <linux-m68k@lists.linux-m68k.org>; Sat, 18 May 2024 18:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716056275; cv=none; b=mipQLcJc48Vz6LKPJ391bgebFpDm5I/ylFWRQ80nUZhiqfEWzroZHwwX/0QuIgulHxc47KgCrEaYCEGdL3HaYkQ7BmwvyVjveC4lOIV6pslHOygodsXfkB0B6fZ9yTYAMVxW/Uk/H2Y90igCZS5rHPsWOVmo7z3oh2SYueJGgCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716056275; c=relaxed/simple;
	bh=xVLZsWDsPiheqwnJM+rybYdnyFbpgKmC/6S81fBz4mI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MpKRCTdO38Q6olZGH/G46R0YSO4w8GqrTocsX8KLlYq33bXAntJwqErMRtsCwA9yuinBrczX5E4ddXWa697bQgmbiGEbaj1KQrAZe67NDqfPFHwPXEg1HNkeM7i4qV4ZGrn8b/QzcMuSZJB9YtZqpoFA4x7qUr9HKULVtS0ehLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EIxrv2TI; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EIxrv2TI"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5727dc6d3edso6132611a12.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 18 May 2024 11:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716056272; x=1716661072; darn=lists.linux-m68k.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h72XgMfMqUf5l+PqtxQeQCZ1b3fZYKvkMoUBgmPbFGQ=;
        b=EIxrv2TIkziUFuG5jXXYkr+MPFRZpyGn1al8BpBKIuj67fDQUag/5CVuhDF/GqZoDB
         vKpchGwc/ZjH0rbif+gq6RLoR6ZT3ggBBeEdlZ8Ht4VHqwSOkJY4CqyluqKVp9FfYXjs
         0aWhFVFVJVlhScDh22Hm5wY9z0HkGzHe9YRbnvHzi/d5izQUf273ubps7DGrlzkCToYh
         9cAztBfjjt0nD4u0aBT9oN75sRg6UTSorcelrBgEdhsdXqoyMoE6+h3PD+p5rnjPikCP
         Nh3zkNA/1cJzm4HvJKLHwCuBl7uPd5FVWCFDOark7O+2CxE+1JoBRP1HF80oal0MW4fZ
         N38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716056272; x=1716661072;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h72XgMfMqUf5l+PqtxQeQCZ1b3fZYKvkMoUBgmPbFGQ=;
        b=tNdrjuR2eRxWA6565IHbsHNDLs944M7Hu1t4l7ba+l0N2qyzFa5uSJZU+KNBts7k3l
         UBweA2XcQHNidnD4ZvjopN8UlRHCRavLFKVlFFmDFejSSqGAXBBXqP3Wf/eVdhaam+Z3
         HYTXh8UAo68XXb++TmZ6I5XWeBPSaGx3GvMzQswDVw7dzuOAm1WyVLXeITNDvJO8wD+k
         pz4y8eTR7njBQuj0gwnuewIALdLhU1ucriWAwwELHcmlYs56fPf1ksqxtrHNJLflJeT1
         b02Ltz9nIYyOxKV3g4hIg+Hgho66PBVqfYiDRAupgcpt5Spqi2LJCJbnPAduv9uAeS5Z
         NxOg==
X-Gm-Message-State: AOJu0Yx7/4PxIum/xlpHqkgwx8/8GLr3IKFxCT0dgyQvR/dRauWKQ7Vv
	Xnk1KUoPSVGRA6XG0075r/EqdgzZ2/9DYBBpjyIfDkiGIfBl4gsZUBiVtA==
X-Google-Smtp-Source: AGHT+IGScRN6vt6+7aqnZgZuuQc4vpKw3yqnqYWLmE+hKii7NKDPLd0glyCJyt5T4G4N7GIoJ9Xr4g==
X-Received: by 2002:a17:907:9405:b0:a5a:542d:ae0a with SMTP id a640c23a62f3a-a5a542daf06mr1803670466b.63.1716056271440;
        Sat, 18 May 2024 11:17:51 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:5e3:8b5c:a3cb:8299])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7e02sm1242690666b.105.2024.05.18.11.17.50
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 May 2024 11:17:50 -0700 (PDT)
Date: Sat, 18 May 2024 20:17:49 +0200
From: Paolo Pisati <p.pisati@gmail.com>
To: linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Amiga, serial and SYSRQ
Message-ID: <ZkjwzVwYeQtyAPrL@amaterasu.local>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

what's the key sequence to trigger SYSRQ on Amiga? And what's the sequence if
i'm redirecting the console via serial?

Some context: i'm trying to collect a backtrace from my Amiga 1200 + Warp
1260[1] + flicker fixer that refuses to boot and shows a solid grey screen.

By using a serial, i've seen it booting up to:

ABCDGHIJK
Linux version 6.6.30-amiga-00006-g809aa9a54cba (flag@amaterasu.local) (m68k-linux-gcc (GCC) 13.1.0, GNU ld (GNU Binutils) 4
Saving 454 bytes of bootinfo
printk: console [debug0] enabled
printk: Too late to register bootconsole debug-1
Amiga hardware found: [A1200] VIDEO BLITTER AUDIO FLOPPY A1200_IDE KEYBOARD MOUSE SERIAL PARALLEL A2000_CLK CHIP_RAM PAULA 
Zone ranges:
  DMA      [mem 0x0000000040000000-0x000004dfffffffff]
  Normal   empty
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000040000000-0x000000004dffffff]
Initmem setup node 0 [mem 0x0000000040000000-0x000000004dffffff]
pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
pcpu-alloc: [0] 0 
Kernel command line: root=/dev/sda4 debug=ser earlyprintk console=ttyS0,9600n8
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes, linear)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes, linear)
Sorting __ex_table...
Built 1 zonelists, mobility grouping on.  Total pages: 56840
mem auto-init: stack:all(zero), heap alloc:off, heap free:off
Memory: 221284K/229376K available (3753K kernel code, 472K rwdata, 1184K rodata, 172K init, 149K bss, 8092K reserved, 0K c)
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

I've added some printk around init/main.c::start_kernel() and it *appears* to be
hanging in "local_irq_enable();".

I've tried all stable LTS kernels from 4.4.y to 6.6.y, and they all shows the same
exact symptoms.

Hope it rings a bell.

1: https://amigawarp.eu/product/warp-1260-board-for-amiga-1200/
-- 
bye,
p.
