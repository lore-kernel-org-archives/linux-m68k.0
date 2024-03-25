Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0083315FA81
	for <linux-m68k@lists.linux-m68k.org>; Mon, 25 Mar 2024 06:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711348908; cv=none; b=hYSgoJLjgFKS3JmY7dcybgeQOpAxyeRxHd/CzlOlm80+s2MK5hUgYhq+gECwtnonf1gXeXM6mcM3FKve9QS/TxFQ3Z6JfPzG49i7IPGYtsHruIevzKy7gUmMcle9kTcC0EHmPK1VmYejNSyLjvfbxeMrmLq+7jze3h+0uTVmlPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711348908; c=relaxed/simple;
	bh=eOjM7kNnHrDR+dHXfR5d/xX9OfStlCFFfxou6xETEc4=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=dqcOXsTbgiCAccIdHwcjwQzTL4XqKJdUoBfsj1K8WjyCokyPjADU5gThyljVoKgvV2vB7fDeA8l4FmHYR5gnHI5NqZc0BKqfMxrA3YOl6tLB+r9q/WiuLjvcJ0m4KeH9J72pkEK3q12SOKy91cqUP48mxSSk1W54FexWVAi8bBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EGSQL7we; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGSQL7we"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6e6ce174d45so2720215b3a.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 24 Mar 2024 23:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711348905; x=1711953705; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+HcTVgtMCEqLTDo3XxYiNb30Ti383Y6BgXcyGIkG7z8=;
        b=EGSQL7we4oPUCWXqhCKN2FVNtg148gqmmHxTSIk6/2EuuwiTLA4hnKuDhRLIj5BbW0
         e9ztzeZ7SB9gcu974dRuT7xOrhKOS7oPT7SrQT4FXDkvVYu6KkAe+HzRGxePyDqO4DFS
         pkQzuBfg1I69KiuZSkY99aY2Rmn27N2bMy4+XWrInUvCpW1SceaOFr3oGB8iT8Xbezix
         hLcFWk+ypPuxc0neMatm9gIGaWQpEUVFvUuyCAuWsoRaYFOflRbc/iKpytaYweadMM6O
         IXLGscGTZ59bGvnPlaahpRvv5XhS1KH1P7Jq7BmHF0MVwn1RU/jshzJujGDHyI3B6eXF
         13Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711348905; x=1711953705;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+HcTVgtMCEqLTDo3XxYiNb30Ti383Y6BgXcyGIkG7z8=;
        b=PihnJNP9m3J8i2nOEXxQ/BM+5iI/oxju7Svcpxy62FtxlPZNQn22NXZNpNPcKQFpdS
         YloTLmQhp96yREsy66LllAu0OvgtKwBw/QLb/GDb1dKzxE5A1NqXK/xeD1ImlwH/8g10
         lDDK9IzMrK3BsghYcnoqO1i1rTDwMa0Se91aiJKzcHI3CDDqZUNl5Ixj9wiJpFhd/JzE
         sMZpr0FbVBgqzhPJOiK2ZsV2iiNC8quUWEV3M9sGfdwxuiD2+sgVLzvkV73NG+FPv1B4
         eF0yOC3dHumyEqOe39zq9mbkyCHUyoWGroPBjRO3ERvLIB2/fGOZbWAQqdGEKHVNs2F4
         lshw==
X-Gm-Message-State: AOJu0YxAryWGT85s5JSu8cTJSDkNzKj/d3RiKiewnrsmNfZ0eBHJFg6a
	dvFBaSwWNn/swtiDRieOr7GxxfKym3KXmrBC1I2UL6eQocNbOOZL6YJK/DYb
X-Google-Smtp-Source: AGHT+IE+j2TKajWv6Uky+WihQiZ/QONNLV6kXnSvzNylivUHRBSTdiTdUKdd1rbUgMO5Rd+xxRNWfw==
X-Received: by 2002:a05:6a00:3ccc:b0:6ea:8eed:d369 with SMTP id ln12-20020a056a003ccc00b006ea8eedd369mr7448718pfb.20.1711348905126;
        Sun, 24 Mar 2024 23:41:45 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id m190-20020a6258c7000000b006e729dd12d5sm3719481pfb.48.2024.03.24.23.41.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 24 Mar 2024 23:41:44 -0700 (PDT)
Subject: Re: [PATCH RFC] m68k: skip kernel premption if interrupts were
 disabled
To: Finn Thain <fthain@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20240322014805.30606-1-schmitzmic@gmail.com>
 <fcabda73-4b16-ee2c-e993-2bfcf392a26a@linux-m68k.org>
 <e89bf618-2fa8-7cbd-16ed-d021a9a7f740@gmail.com>
 <948c12e4-e85f-a86c-ae95-a1eb03ca026d@gmail.com>
 <40928e38-0de7-75a6-d5f7-8c913155da03@linux-m68k.org>
 <5e344842-0b19-1f83-dc77-51210a8880c7@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <1b9ae156-9dac-b11f-5ddb-fb5878b3c9a9@gmail.com>
Date: Mon, 25 Mar 2024 19:41:39 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <5e344842-0b19-1f83-dc77-51210a8880c7@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Finn,

> What's more, I suspect schedule() may cause another process to exit that
> would otherwise first take a signal, and signal delivery then repeats
> the vma teardown on process exit. At least that is how I read those
> 'table already freed' stack traces.

In the backtrace below, I do actually see free_pointer_table() reentered 
after preemption. (Ignore the 2200, 2200, 6480 in the call trace - 
that's just the arguments to a pr_err() that prints the first line in 
the excerpt below.)

To get this snapshot of what exception context preempt_schedule_irq() 
was last called from, I save the stack pointer, the status register in 
the exception stack frame, and the vector number before calling 
preempt_schedule_irq(). The saved values are printed before calling 
panic() in free_pointer_table().

Unfortunately, when I add preempt_disable()/ 
sched_preempt_enable_noresched() in free_pointer_table(), I don't get 
that particular panic() anymore, but the bad kernel buserror with the 
warning from set_fc() that you reported. So no real improvement ...

Cheers,

	Michael

saved from last preempt: nr 2d sr 2200 2200 pc 6480 sp dcddc4
Kernel panic - not syncing: table already free!
CPU: 0 PID: 1629 Comm: udevd Not tainted 
6.8.0-rc7-atari-fpuemu-spinlocktest+ #1759
Stack from 00f7fd9c:
         00f7fd9c 003e75ee 003e75ee 00000000 00000001 003354cc 003e75ee 
0032f208
         00000001 00000001 00e14000 004f0000 00f8b40c 0000643c 00f7ff0e 
000064d4
         003d9128 003d90ee 0000002d 00002200 00002200 00006480 00dcddc4 
c0000000
         c017c000 efd00000 c00c0000 01e14800 ee000000 00f8b184 000cdee8 
00e14800
         00000001 ffffffff c0000000 000d367c 0031d67e 000d9916 000d367c 
00dc00cc
         000cdd12 0031d67e 000d9916 c0080000 00f8b180 c017bfff c017bfff 
edffffff
Call Trace: [<003354cc>] dump_stack+0xc/0x10
  [<0032f208>] panic+0xd8/0x258
  [<0000643c>] free_pointer_table+0x0/0x160
  [<000064d4>] free_pointer_table+0x98/0x160
  [<00002200>] do_one_initcall+0xa4/0x188
  [<00002200>] do_one_initcall+0xa4/0x188
  [<00006480>] free_pointer_table+0x44/0x160
  [<000cdee8>] free_pgd_range+0x1d6/0x1f2
  [<000d367c>] unlink_file_vma+0x0/0x40
  [<0031d67e>] mas_find+0x0/0x102
  [<000d9916>] unlink_anon_vmas+0x0/0x106
  [<000d367c>] unlink_file_vma+0x0/0x40
  [<000cdd12>] free_pgd_range+0x0/0x1f2
  [<0031d67e>] mas_find+0x0/0x102
  [<000d9916>] unlink_anon_vmas+0x0/0x106
  [<000cdfbe>] free_pgtables+0xba/0xcc
  [<0031d67e>] mas_find+0x0/0x102
  [<000d2950>] mas_set+0x0/0x22
  [<00039f02>] up_read+0x0/0x64
  [<000d41d0>] exit_mmap+0x13c/0x1de
  [<0000efd3>] NODD+0xab/0x104
  [<001900f9>] ext2_get_folio.constprop.11+0x1a7/0x274
  [<0000ffff>] EXPTBL+0x3bf/0x400
  [<00016782>] __mmput+0x16/0x94
  [<0001a158>] do_exit+0x250/0x714
  [<00339f12>] _raw_spin_unlock_irq+0x10/0x38
  [<0001a79a>] sys_exit_group+0x0/0x14
  [<0001a7ae>] pid_child_should_wake+0x0/0x52
  [<0000269a>] syscall+0x8/0xc
  [<0008c00b>] do_check_common+0x325/0x2946


