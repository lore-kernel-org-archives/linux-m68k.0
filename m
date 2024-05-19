Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC6CD2EE
	for <linux-m68k@lists.linux-m68k.org>; Sun, 19 May 2024 19:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716145962; cv=none; b=LWdWuvmL2LFavR/PIYJpOe/Uxa6H34b4bKSI5PzV+sNKFp5C18yGjZE1eatjcpXXlJrAiQONDfGh5H4ezHLqqTEa24oR9Jb8TohpuZ1tX3/RLAaVJaj883jbfzRmMewjW4O2N/AyMRQUaRR1il2SXxqNj30SFf5Z/1CNCwMuLDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716145962; c=relaxed/simple;
	bh=Rv6olgsO+2Fe7TZ+DflNjg542rBbkPZBPIz/pewn6Vo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AQUniRn8hNh+Qxy1HO/fjtA3fB4Lsm1QC+aibciYD1cpVs72NfeLJ6RflusbWJ4VRLN0tKaQVsjrb0tX5EiS51+0ZIaVCG1eAQx2Dj4gjUeSKOc9QZ/uKV61tTCsyIBZTjg34/TpOcqnpFC4nsyquCr2rSUzJjWrMLfUYPbudW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3AN0bjf; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3AN0bjf"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1ed012c1afbso17025035ad.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 19 May 2024 12:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716145961; x=1716750761; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xEUa69jEg15VlA/y/KO9ySG4EdXs9tsL2o0NN8s+Law=;
        b=U3AN0bjfpU5/H8nzu1IPQ3JTh+mVEkx6q0fUCJrnklFghachXUeXPmSGHkbowZCzNo
         ABEIfVYsqtK2OYcALtr2z8F50BFXhWZ53Lv4i5EewXeYK8PDC/TQfYfZBb8AnI3VLgfq
         RoGdiu3zna1p6Ntgt5iA335Sv1sGMZ9qUPZLg7RNTGHe+KZNG7sT5g0S9Zq4Dgr4IYHs
         V8G+bVKIbIziyW2nB8OTvk6CwlVoAdR/Vz3mSUCtkooJ63d680yi0i9n827bPgbnMpjv
         nc3ck4kz1QdlL1OOnlUAS0F0rUsZHxSRAcPn540kolFwfcr6NZJWJn4URX9O0XCYAFxS
         euhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716145961; x=1716750761;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xEUa69jEg15VlA/y/KO9ySG4EdXs9tsL2o0NN8s+Law=;
        b=PVu7qrqnYtARsvSCl/U0RqWDGo7HNpbIa+wXOdo7oOrw9mnSfSY91cb5WBt369Q/ax
         snRHkoi7W3wGwRl20JkMnPnwsL5CKemWRYUhh1Fop+n+kh17OYgJsp+tVGEoHGi3MciC
         MJpwJ22JLzIcwjuvoVIxOOWQLWiuez0NkbGpEDWXfpuNcWV1fnjkwvXyJoB7zgl3Jo0+
         iBog4D11UrhuVXFbHDX6G9jKhH3Arcx1w5K7uSyCuc2XZJgD50vOiigUYtNLn4j4Zm0h
         2E1OBlToX2tGZQ0+sNMLJJtFUcfo+OFkLWZz70TapgM0DVCO0SDdYNHtVk4sRxCYXEel
         kflw==
X-Gm-Message-State: AOJu0YyFF7LwHiSS5G6+kYldA1xUMjXuBunhWiDwQomJrESmC0oSTz+8
	Bj5nowgtKCP8MMqpTeo0uGpgQRrVjwbtv/j7/Uz+/2YeEtF4viJu
X-Google-Smtp-Source: AGHT+IFQNI+JroFwvWAz6cRF45MeGcuHoacbyKHGZTmJ67YruQ0ilRuU8qIhJDe9ZBEkI3AJVLeJFA==
X-Received: by 2002:a17:902:d486:b0:1ed:3c6d:7392 with SMTP id d9443c01a7336-1f2ed260419mr66728265ad.8.1716145960605;
        Sun, 19 May 2024 12:12:40 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:cce2:5e6b:f484:1b3f? ([2001:df0:0:200c:cce2:5e6b:f484:1b3f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f302ee9a1asm1846855ad.108.2024.05.19.12.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 May 2024 12:12:40 -0700 (PDT)
Message-ID: <33ec1596-11c7-4591-95bf-74009532dd3c@gmail.com>
Date: Mon, 20 May 2024 07:12:41 +1200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Amiga, serial and SYSRQ
To: Paolo Pisati <p.pisati@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <ZkjwzVwYeQtyAPrL@amaterasu.local>
 <e9d97c04-73c2-e6dd-6d51-b9a4e3ef73b2@gmail.com>
 <Zkn9lwawFGzSJFSF@amaterasu.local>
 <CAMuHMdXa4BFYGSAfoPHP7hntFh2rKmFXx0p44vxua1KsfuHR1w@mail.gmail.com>
 <ZkoEq3TK//srW5D+@amaterasu.local>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <ZkoEq3TK//srW5D+@amaterasu.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Paolo,

On 20/05/24 01:54, Paolo Pisati wrote:
> On Sun, May 19, 2024 at 03:31:07PM +0200, Geert Uytterhoeven wrote:
>> Without TRACEPOINTS_ENABLED, you get:
>>
>>      #ifdef TRACEPOINTS_ENABLED
>>      ...
>>      #else
>>      static inline void do_trace_initcall_start(initcall_t fn)
>>      {
>>              if (!initcall_debug)
>>                      return;
>>              trace_initcall_start_cb(&initcall_calltime, fn);
>>      }
>>      static inline void do_trace_initcall_finish(initcall_t fn, int ret)
>>      {
>>              if (!initcall_debug)
>>                      return;
>>              trace_initcall_finish_cb(&initcall_calltime, fn, ret);
>>      }
>>      #endif /* !TRACEPOINTS_ENABLED */
>>
>> That second part should still work fine.
> Ok, i appended initcall_debug, but i got the same exact output, i wonder if i'm
> missing something else:
>
> ABCDGHIJK
> Linux version 6.6.30-amiga-00006-g809aa9a54cba (flag@amaterasu.local) (m68k-linux-gcc (GCC) 13.1.0, GNU ld (GNU Binutils) 2.40) #7 Sat May 18 19:55:35 CEST 2024
> Saving 470 bytes of bootinfo
> printk: console [debug0] enabled
> printk: Too late to register bootconsole debug-1
> Amiga hardware found: [A1200] VIDEO BLITTER AUDIO FLOPPY A1200_IDE KEYBOARD MOUSE SERIAL PARALLEL A2000_CLK CHIP_RAM PAULA LISA ALICE_PAL PCMCIA ZORRO
> Zone ranges:
>    DMA      [mem 0x0000000040000000-0x000004dfffffffff]
>    Normal   empty
> Movable zone start for each node
> Early memory node ranges
>    node   0: [mem 0x0000000040000000-0x000000004dffffff]
> Initmem setup node 0 [mem 0x0000000040000000-0x000000004dffffff]
> pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
> pcpu-alloc: [0] 0
> Kernel command line: root=/dev/sda4 debug=ser earlyprintk console=ttyS0,9600n8 initcall_debug

Odd - maybe ordering matters here? Ordinarily, it doesn't but I've been 
caught out with using wrong option separators before. So, if ',' isn't 
the correct token to split the console option, the kernel will stop 
parsing there and won't see your initcall_debug option.

I use that option all the time, but I have 'console=tty' instead of 
serial console.

Cheers,

     Michael

> Dentry cache hash table entries: 32768 (order: 5, 131072 bytes, linear)
> Inode-cache hash table entries: 16384 (order: 4, 65536 bytes, linear)
> Sorting __ex_table...
> Built 1 zonelists, mobility grouping on.  Total pages: 56840
> mem auto-init: stack:all(zero), heap alloc:off, heap free:off
> Memory: 221284K/229376K available (3753K kernel code, 472K rwdata, 1184K rodata, 172K init, 149K bss, 8092K reserved, 0K cma-reserved)
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
> I'm using amiga_defconfig FWIW.
