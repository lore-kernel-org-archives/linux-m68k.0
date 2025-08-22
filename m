Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDA62E889F
	for <linux-m68k@lists.linux-m68k.org>; Fri, 22 Aug 2025 07:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755848335; cv=none; b=VBsDItxJCeUdAuW2bXe2M+04zwArhKYNBUOe6IZYaEVm0/wJQ2/hCkquVO0oBw3lOvqbPr2m4Oztx6+fYb18ponCr+KCDFislCDb8ae6FXQCD+HHnrxL1t/iId0zYNkppKZsEkJHy+NmyeqopEBMvIUTQ3535mcz/6gsqd5SLDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755848335; c=relaxed/simple;
	bh=qlw1BewNgTbcxk9+Zfxfd0FREHyppZ5bbOnRW4JLKOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rq525erjp0rL+e8GVdN0qtWnAX9Mjdie5qehRuRCsJy/oCpGf+2I98N81oeSGqF8q+J8xeMlIuX/qrBNeYrf7Z7Tq5XTRn6gPrAQS0RNNGF2aAVE0vp26xqgiPlLFES5RzqV/8en9qqZuIfJhqtKJH3W9a+TSQMo4xk0MkqdZPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-519d3c38bc9so529388137.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 22 Aug 2025 00:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755848331; x=1756453131;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xc+ad6ueJZivvK7qf2yMrtzdxyOSdaq18ItNm0zJyQ4=;
        b=Qgd+Q4fU4AJGrcvKmcYlZkUlov+va4ZiOQ5H1x2I7Hmydrij/zwwygpW2JYfEDs3oX
         KEbSFnfPrW4/n7CKuxd/SGx0iiPy7hoWE9zbe+jopWmYTYS8DnsUJ5v07fUBT5PMO6bE
         UqVDSskR0vU1LMcgvEV6fcQZ/kZh3gO5UKqE+VHyMT4PujlrjbMSAERXuLhl6YOIdpEC
         y4HYFeBV+lV33YPKGlqjgzoi71sq2Zrytwc5xQnOuXOPN9iaR4Z0zD3iiiFoBAWMadvX
         RWvAQSLO+PSpOXkJaXDC+xwFt0HV9u6owUrza3o6Gkff+WBahZUeMTPwGkd7dVgMMDHA
         H8Uw==
X-Forwarded-Encrypted: i=1; AJvYcCXqaO038dgrcSS2+A94ztNYvUPTMKABOqHPR7zSS3rx36rdE1zENRL1W0b6Ub7mF4i4KtG1dcRRM2hq@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxCZzXH2z7A+vjjRHhUi8PZiaG6yL+OTTi/oexGL0dvnzcKmnqv
	Pce0/lKfj1y8gxmkIm4ZTYgxjFkzvF/g73UIQqHvK20ZUPLwsODP0B5RjfaWNSiO
X-Gm-Gg: ASbGncudauFD98E5qI5dJBjt42NM2nMZUrTed1U2eW5nGECxdA6RszsXJT6gEp/RcuG
	aHivNx49GqmFuJ+thkwAukJLZJGDvuTgvyE8ljEEkgVAZOpl5BBqF52xFAb1tL2TVJTfwd4sRYj
	rr8Ty6+8melw89iOP4o6SqtFNHEC5VqXz3u8L/6zq3mqMbISGbSEm1011QYN30VENLyBcRVzLWa
	gVp4IP5jw0FcoIvFLXG8Y/YFmrr0lBSB58hpmAtBZ7Fh4GT3eB/7d0QEMRtW+BGfRo6Bi3G1fw2
	85Uyf0UWtSIM61qYuqDiTkPiaA+peTD7CsWN6EJQ33+ux9damgDvj3Ync5Cb0KgssuMNUk0F/B8
	1nywqwF7bb2ZDSyGUkz1wKmzhxQwPaDCr/jEcdACvJIX+zsuVgjFk/4Rz14JI
X-Google-Smtp-Source: AGHT+IFK/LQVqJwBcXOV1OPzlf1qCIYY44qrkiY5jw08wUqH2CFs7o6pTI0pVC+9tfRbP/QpaRTh/A==
X-Received: by 2002:a05:6102:2b84:b0:4e9:9281:85aa with SMTP id ada2fe7eead31-51d0cde292cmr648787137.1.1755848331080;
        Fri, 22 Aug 2025 00:38:51 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8921d48531bsm726712241.12.2025.08.22.00.38.50
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 00:38:50 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-8920c579f98so537341241.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 22 Aug 2025 00:38:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXltsCGDzktP0YXsQoTvllQkwBcmjYigVvZaTKk/06VzJHDzVfeBL73PqOBDhTobkaESBd30A59qv6o@lists.linux-m68k.org
X-Received: by 2002:a05:6102:4589:b0:519:534a:6c22 with SMTP id
 ada2fe7eead31-51d0f90c662mr535141137.32.1755848329730; Fri, 22 Aug 2025
 00:38:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414145945.84916-1-ioworker0@gmail.com> <20250414145945.84916-3-ioworker0@gmail.com>
In-Reply-To: <20250414145945.84916-3-ioworker0@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 Aug 2025 09:38:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW7Ab13DdGs2acMQcix5ObJK0O2dG_Fxzr8_g58Rc1_0g@mail.gmail.com>
X-Gm-Features: Ac12FXya42sPjt2fsPaBDM-XMot0XSFHHv5h6MzVpLqabH-uSeTQ2vTLYZCzxTk
Message-ID: <CAMuHMdW7Ab13DdGs2acMQcix5ObJK0O2dG_Fxzr8_g58Rc1_0g@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] hung_task: show the blocker task if the task is
 hung on semaphore
To: Lance Yang <ioworker0@gmail.com>
Cc: akpm@linux-foundation.org, will@kernel.org, peterz@infradead.org, 
	mingo@redhat.com, longman@redhat.com, mhiramat@kernel.org, 
	anna.schumaker@oracle.com, boqun.feng@gmail.com, joel.granados@kernel.org, 
	kent.overstreet@linux.dev, leonylgao@tencent.com, 
	linux-kernel@vger.kernel.org, rostedt@goodmis.org, senozhatsky@chromium.org, 
	tfiga@chromium.org, amaindex@outlook.com, jstultz@google.com, 
	Mingzhe Yang <mingzhe.yang@ly.com>, Eero Tamminen <oak@helsinkinet.fi>, 
	linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

Hi Lance,

(this time the right email thread, I hope ;-)

On Mon, 14 Apr 2025 at 17:23, Lance Yang <ioworker0@gmail.com> wrote:
> Inspired by mutex blocker tracking[1], this patch makes a trade-off to
> balance the overhead and utility of the hung task detector.
>
> Unlike mutexes, semaphores lack explicit ownership tracking, making it
> challenging to identify the root cause of hangs. To address this, we
> introduce a last_holder field to the semaphore structure, which is
> updated when a task successfully calls down() and cleared during up().
>
> The assumption is that if a task is blocked on a semaphore, the holders
> must not have released it. While this does not guarantee that the last
> holder is one of the current blockers, it likely provides a practical hint
> for diagnosing semaphore-related stalls.
>
> With this change, the hung task detector can now show blocker task's info
> like below:
>
> [Tue Apr  8 12:19:07 2025] INFO: task cat:945 blocked for more than 120 seconds.
> [Tue Apr  8 12:19:07 2025]       Tainted: G            E      6.14.0-rc6+ #1
> [Tue Apr  8 12:19:07 2025] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [Tue Apr  8 12:19:07 2025] task:cat             state:D stack:0     pid:945   tgid:945   ppid:828    task_flags:0x400000 flags:0x00000000
> [Tue Apr  8 12:19:07 2025] Call Trace:
> [Tue Apr  8 12:19:07 2025]  <TASK>
> [Tue Apr  8 12:19:07 2025]  __schedule+0x491/0xbd0
> [Tue Apr  8 12:19:07 2025]  schedule+0x27/0xf0
> [Tue Apr  8 12:19:07 2025]  schedule_timeout+0xe3/0xf0
> [Tue Apr  8 12:19:07 2025]  ? __folio_mod_stat+0x2a/0x80
> [Tue Apr  8 12:19:07 2025]  ? set_ptes.constprop.0+0x27/0x90
> [Tue Apr  8 12:19:07 2025]  __down_common+0x155/0x280
> [Tue Apr  8 12:19:07 2025]  down+0x53/0x70
> [Tue Apr  8 12:19:07 2025]  read_dummy_semaphore+0x23/0x60
> [Tue Apr  8 12:19:07 2025]  full_proxy_read+0x5f/0xa0
> [Tue Apr  8 12:19:07 2025]  vfs_read+0xbc/0x350
> [Tue Apr  8 12:19:07 2025]  ? __count_memcg_events+0xa5/0x140
> [Tue Apr  8 12:19:07 2025]  ? count_memcg_events.constprop.0+0x1a/0x30
> [Tue Apr  8 12:19:07 2025]  ? handle_mm_fault+0x180/0x260
> [Tue Apr  8 12:19:07 2025]  ksys_read+0x66/0xe0
> [Tue Apr  8 12:19:07 2025]  do_syscall_64+0x51/0x120
> [Tue Apr  8 12:19:07 2025]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [Tue Apr  8 12:19:07 2025] RIP: 0033:0x7f419478f46e
> [Tue Apr  8 12:19:07 2025] RSP: 002b:00007fff1c4d2668 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
> [Tue Apr  8 12:19:07 2025] RAX: ffffffffffffffda RBX: 0000000000020000 RCX: 00007f419478f46e
> [Tue Apr  8 12:19:07 2025] RDX: 0000000000020000 RSI: 00007f4194683000 RDI: 0000000000000003
> [Tue Apr  8 12:19:07 2025] RBP: 00007f4194683000 R08: 00007f4194682010 R09: 0000000000000000
> [Tue Apr  8 12:19:07 2025] R10: fffffffffffffbc5 R11: 0000000000000246 R12: 0000000000000000
> [Tue Apr  8 12:19:07 2025] R13: 0000000000000003 R14: 0000000000020000 R15: 0000000000020000
> [Tue Apr  8 12:19:07 2025]  </TASK>
> [Tue Apr  8 12:19:07 2025] INFO: task cat:945 blocked on a semaphore likely last held by task cat:938
> [Tue Apr  8 12:19:07 2025] task:cat             state:S stack:0     pid:938   tgid:938   ppid:584    task_flags:0x400000 flags:0x00000000
> [Tue Apr  8 12:19:07 2025] Call Trace:
> [Tue Apr  8 12:19:07 2025]  <TASK>
> [Tue Apr  8 12:19:07 2025]  __schedule+0x491/0xbd0
> [Tue Apr  8 12:19:07 2025]  ? _raw_spin_unlock_irqrestore+0xe/0x40
> [Tue Apr  8 12:19:07 2025]  schedule+0x27/0xf0
> [Tue Apr  8 12:19:07 2025]  schedule_timeout+0x77/0xf0
> [Tue Apr  8 12:19:07 2025]  ? __pfx_process_timeout+0x10/0x10
> [Tue Apr  8 12:19:07 2025]  msleep_interruptible+0x49/0x60
> [Tue Apr  8 12:19:07 2025]  read_dummy_semaphore+0x2d/0x60
> [Tue Apr  8 12:19:07 2025]  full_proxy_read+0x5f/0xa0
> [Tue Apr  8 12:19:07 2025]  vfs_read+0xbc/0x350
> [Tue Apr  8 12:19:07 2025]  ? __count_memcg_events+0xa5/0x140
> [Tue Apr  8 12:19:07 2025]  ? count_memcg_events.constprop.0+0x1a/0x30
> [Tue Apr  8 12:19:07 2025]  ? handle_mm_fault+0x180/0x260
> [Tue Apr  8 12:19:07 2025]  ksys_read+0x66/0xe0
> [Tue Apr  8 12:19:07 2025]  do_syscall_64+0x51/0x120
> [Tue Apr  8 12:19:07 2025]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [Tue Apr  8 12:19:07 2025] RIP: 0033:0x7f7c584a646e
> [Tue Apr  8 12:19:07 2025] RSP: 002b:00007ffdba8ce158 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
> [Tue Apr  8 12:19:07 2025] RAX: ffffffffffffffda RBX: 0000000000020000 RCX: 00007f7c584a646e
> [Tue Apr  8 12:19:07 2025] RDX: 0000000000020000 RSI: 00007f7c5839a000 RDI: 0000000000000003
> [Tue Apr  8 12:19:07 2025] RBP: 00007f7c5839a000 R08: 00007f7c58399010 R09: 0000000000000000
> [Tue Apr  8 12:19:07 2025] R10: fffffffffffffbc5 R11: 0000000000000246 R12: 0000000000000000
> [Tue Apr  8 12:19:07 2025] R13: 0000000000000003 R14: 0000000000020000 R15: 0000000000020000
> [Tue Apr  8 12:19:07 2025]  </TASK>
>
> [1] https://lore.kernel.org/all/174046694331.2194069.15472952050240807469.stgit@mhiramat.tok.corp.google.com
>
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> Suggested-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> Signed-off-by: Mingzhe Yang <mingzhe.yang@ly.com>
> Signed-off-by: Lance Yang <ioworker0@gmail.com>
> Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thanks for your patch, which is now commit 194a9b9e843b4077
("hung_task: show the blocker task if the task is hung on
semaphore") in v6.16-rc1.

Eero reported [1] two WARNINGS seen with v6.16 on emulated Atari.
I managed to reproduce it on ARAnyM using the provided config (it does
not happen with atari_defconfig), and bisected it to this commit:

------------[ cut here ]------------
WARNING: CPU: 0 PID: 39 at include/linux/hung_task.h:48
__down_common+0x13a/0x1be
CPU: 0 UID: 0 PID: 39 Comm: getty Not tainted
6.15.0-rc6hatari-00018-g194a9b9e843b #1986 NONE
Stack from 01633d00:
        01633d00 00366e9e 00366e9e 00000000 002c9762 00360cb5 01633d24 0000873e
        00366e9e 01633d40 0002e0d4 00360cb5 00000030 00000009 0039c79a 00061408
        01633d78 000028e0 00360cb5 00000030 002c9762 00000009 00000000 00000000
        7fffffff 00000002 1185d266 01633eb0 01326c58 00000080 01633dc0 002c9762
        00360cb5 00000030 00000009 00000000 00002014 01326c00 1185d266 01633eb0
        002c93ea 00053d60 00061408 01326c58 0038db90 0038db90 01633e32 01633fb8
Call Trace: [<002c9762>] __down_common+0x13a/0x1be
 [<0000873e>] dump_stack+0x10/0x16
 [<0002e0d4>] __warn+0x7a/0xbc
 [<00061408>] msleep+0x0/0x2c
 [<000028e0>] warn_slowpath_fmt+0x42/0x62
 [<002c9762>] __down_common+0x13a/0x1be
 [<002c9762>] __down_common+0x13a/0x1be
 [<00002014>] arch_local_irq_enable+0xe/0x22
 [<002c93ea>] mutex_lock+0x0/0x28
 [<00053d60>] other_cpu_in_panic+0x0/0x26
 [<00061408>] msleep+0x0/0x2c
 [<002c97fc>] __down+0x16/0x1e
 [<002c9832>] down+0x2e/0x30
 [<00053dac>] console_lock+0x26/0x4c
 [<001aae4e>] do_con_write+0x3a/0x16d4
 [<002c93ea>] mutex_lock+0x0/0x28
 [<0004fa70>] __add_wait_queue+0x3a/0x6a
 [<001ac520>] con_write+0x1a/0x30
 [<0019cafa>] n_tty_write+0x2c6/0x35e
 [<00199456>] signal_pending+0x0/0x26
 [<000aba2a>] __kvmalloc_node_noprof+0x3a/0x114
 [<00004cc0>] io_uring_try_cancel_requests+0x98/0x318
 [<0004fb2e>] woken_wake_function+0x0/0x24
 [<0019a180>] file_tty_write.isra.0+0x144/0x1b8
 [<0019a206>] tty_write+0x12/0x16
 [<000b97c2>] vfs_write+0xec/0x148
 [<00028000>] fp_getdest+0x1b8/0x224
 [<00010000>] g_trace+0x16/0x28
 [<000b9916>] ksys_write+0x54/0x8a
 [<000b9962>] sys_write+0x16/0x1a
 [<000093da>] syscall+0x8/0xc
 [<0000c001>] arch_dma_prep_coherent+0x51/0x58

---[ end trace 0000000000000000 ]---
------------[ cut here ]------------
WARNING: CPU: 0 PID: 39 at include/linux/hung_task.h:56
__down_common+0x17a/0x1be
CPU: 0 UID: 0 PID: 39 Comm: getty Tainted: G        W
6.15.0-rc6hatari-00018-g194a9b9e843b #1986 NONE
Tainted: [W]=WARN
Stack from 01633d00:
        01633d00 00366e9e 00366e9e 00000000 002c97a2 00360cb5 01633d24 0000873e
        00366e9e 01633d40 0002e0d4 00360cb5 00000038 00000009 0039c79a 01633db2
        01633d78 000028e0 00360cb5 00000038 002c97a2 00000009 00000000 00000000
        00000000 00000002 00000000 00000000 01326c58 0039c79a 01633dc0 002c97a2
        00360cb5 00000038 00000009 00000000 00002014 01326c00 1185d266 01633eb0
        002c93ea 00053d60 00061408 01326c58 00380000 01000000 01220162 b64001b8
Call Trace: [<002c97a2>] __down_common+0x17a/0x1be
 [<0000873e>] dump_stack+0x10/0x16
 [<0002e0d4>] __warn+0x7a/0xbc
 [<000028e0>] warn_slowpath_fmt+0x42/0x62
 [<002c97a2>] __down_common+0x17a/0x1be
 [<002c97a2>] __down_common+0x17a/0x1be
 [<00002014>] arch_local_irq_enable+0xe/0x22
 [<002c93ea>] mutex_lock+0x0/0x28
 [<00053d60>] other_cpu_in_panic+0x0/0x26
 [<00061408>] msleep+0x0/0x2c
 [<002c97fc>] __down+0x16/0x1e
 [<002c9832>] down+0x2e/0x30
 [<00053dac>] console_lock+0x26/0x4c
 [<001aae4e>] do_con_write+0x3a/0x16d4
 [<002c93ea>] mutex_lock+0x0/0x28
 [<0004fa70>] __add_wait_queue+0x3a/0x6a
 [<001ac520>] con_write+0x1a/0x30
 [<0019cafa>] n_tty_write+0x2c6/0x35e
 [<00199456>] signal_pending+0x0/0x26
 [<000aba2a>] __kvmalloc_node_noprof+0x3a/0x114
 [<00004cc0>] io_uring_try_cancel_requests+0x98/0x318
 [<0004fb2e>] woken_wake_function+0x0/0x24
 [<0019a180>] file_tty_write.isra.0+0x144/0x1b8
 [<0019a206>] tty_write+0x12/0x16
 [<000b97c2>] vfs_write+0xec/0x148
 [<00028000>] fp_getdest+0x1b8/0x224
 [<00010000>] g_trace+0x16/0x28
 [<000b9916>] ksys_write+0x54/0x8a
 [<000b9962>] sys_write+0x16/0x1a
 [<000093da>] syscall+0x8/0xc
 [<0000c001>] arch_dma_prep_coherent+0x51/0x58

---[ end trace 0000000000000000 ]---

It still happens on v6.17-rc2.  Reverting commits 77da18de55ac6417
("hung_task: extend hung task blocker tracking to rwsems") and
194a9b9e843b4077 ("hung_task: show the blocker task if the task is
hung on semaphore") fixes the issue for me.

Thanks!

[1] "v6.16 console issues on Atari Falcon"
    https://lore.kernel.org/all/92518308-c763-4591-96ef-6b38c5d8f434@helsinkinet.fi

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
