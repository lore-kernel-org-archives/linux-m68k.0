Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE17C2E7BAD
	for <linux-m68k@lists.linux-m68k.org>; Fri, 22 Aug 2025 07:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755848060; cv=none; b=mZRb42FFzLSUHFgOGPJDqvxWLxvShrz/64/U/2zDEkiAZtw550txP4DWyJVxzD7m0od+G/C0plKXXiWdYsSdY19OdZD45ZYMqA8um8ynLIGfIRGVILoth9+WEdi7dw992QEkkljL/5YFq3cToNL85kyIV+++oEIiyg8peLhmLrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755848060; c=relaxed/simple;
	bh=hGyK9NgR/DbXF3924uOzaoGtAFbgB68R5NSsgCWjOdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gbXQa2HFa38UXv8XrndfX9Gfw6xTAU0j9xAxyYYSdNUmfwADHuMyaaPSXTs5sd3l7Tg472VaF07OZ9Ad4I1KX3OXMzbGxHIx6RxdFbMpvBJMicv2oG+zMU+FsMMUPhy9cdHQxs//+ovRnei26m1USPCwflxLsXfwc8JEK9O8NUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-53b174c9c79so767154e0c.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 22 Aug 2025 00:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755848057; x=1756452857;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+zd/fta2fMfQmXWrnRWBKVykAsRKUs5bEyg/PKJKfBU=;
        b=hq/57FpQueEo5nZc5hB2dOI7lvI5fcSRgfWQtxRlsG51CAUkS5k3bww/h0HhLfmdjz
         PoK/0RkmhSehgZoNs+lpdVSxB7IcqYZzACgUZMp1AeXXsnH0ZlaKNhdYtrOpyNT+YGkb
         wZGWfdEd5pdEFanKLaQanv1XDIKVlaYtT/nBBt9xSv1nxT9CW1K0WhpRTabrUXKgeQxJ
         VAJbrXJxJTXsHbgMLODJ1fLOES3CmO4gqGPbDYUN6DzTfTSzMCxwoH4ty9Zgwhfzw4zJ
         TgwN9rH2RItt5ALQezWdyZwb9a7QqgmEnYGBYzI5GgthjYMygCEq1A3LlfqqFiwdFXG8
         eOoA==
X-Forwarded-Encrypted: i=1; AJvYcCU4f/nvaoHq3fAh/FiUAWTAwlXkBlrBe1ICZSr9Iqb9ofhjKdzwiuc6YYvHsf4Fp4gGwnv+sCqpmNEN@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyWIKurH/jZXCxHBQ2eRz8q4k6pAvue2Xgor3IGICMGxV2xqL5V
	UqWPPIWUrB8Hzymd+Owl64x0s2xYVJeCZbtYpJl8va6Joa2rzI1IgK8Um/+AUGGb
X-Gm-Gg: ASbGnctsfBjh+TOFJpspyvP8rAXwFqniAnRJhaCzeXp4z3La5kTqzMbzNSIy5EUTOwA
	ZyFiZM1hy4dmYNiXFYVmG8DNgEAZKAkt6PQ5qABwO2rMhuRV9yAaD0V04rI6dsKPfS9GKVwW3Pc
	ChMxlt1lsQMgKbkbvj1lt0F+HtMwomP+xLKwQPFjqNqr9HAM0mdMc5JM5uoxfYkmFhYwb+COcif
	OJ58dFDCeVS5NDafcQG0/S5t4DQmTg6kvlhhnXQnk1pRSWxco0ZbKJ5uKGt5UtK6zfYXmbIGfkZ
	Q/GFuIdMhhe7FcOJBeEsgn/RqC6UpBE9/2rfquOkhuysHdY0Lq5XLmVy9d2BsTGWmtzND5qAysq
	df5ddfGYdd9hgY28TXsiK/oqPiNlq99dKR/qioz/b37rH0ejtdY3ZE7Pn7eTw5sqUuZFzvbs=
X-Google-Smtp-Source: AGHT+IFyRXnKDodnaUW+h95xZFWX0rrWKp0lds82u9gScPLDKn4aOgs5qR52iLJKQFnKQjyJ+Qw4Ng==
X-Received: by 2002:a05:6122:1690:b0:539:3b3c:617a with SMTP id 71dfb90a1353d-53c8a31ebaamr529910e0c.8.1755848056602;
        Fri, 22 Aug 2025 00:34:16 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53b2beff1c1sm4498069e0c.24.2025.08.22.00.34.15
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 00:34:16 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-50f8b94c6adso437197137.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 22 Aug 2025 00:34:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWOmr6Rj71p9ERX2qScuZxK4ZD5280IO0r1/0nKytFMf7FFoP0lkklaqqqZFXVpGdMNCoISkkXCHopq@lists.linux-m68k.org
X-Received: by 2002:a05:6102:cd0:b0:4fd:bbf2:6fce with SMTP id
 ada2fe7eead31-51d0d12e766mr492445137.9.1755848055510; Fri, 22 Aug 2025
 00:34:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627072924.36567-1-lance.yang@linux.dev> <20250627072924.36567-3-lance.yang@linux.dev>
In-Reply-To: <20250627072924.36567-3-lance.yang@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 Aug 2025 09:34:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXR72M+oiJ_WmuHC0Xkq2m4=zqhP8DtW40mHyJTCdS+ew@mail.gmail.com>
X-Gm-Features: Ac12FXxVdc_cD0Xb_uzqKoxEosJAtG2Ywzf3DddL5ZR_ainigwq4pwW9T0-VQ6c
Message-ID: <CAMuHMdXR72M+oiJ_WmuHC0Xkq2m4=zqhP8DtW40mHyJTCdS+ew@mail.gmail.com>
Subject: Re: [PATCH 2/3] hung_task: extend hung task blocker tracking to rwsems
To: Lance Yang <ioworker0@gmail.com>
Cc: akpm@linux-foundation.org, zi.li@linux.dev, anna.schumaker@oracle.com, 
	boqun.feng@gmail.com, joel.granados@kernel.org, jstultz@google.com, 
	kent.overstreet@linux.dev, leonylgao@tencent.com, 
	linux-kernel@vger.kernel.org, longman@redhat.com, mhiramat@kernel.org, 
	mingo@redhat.com, mingzhe.yang@ly.com, peterz@infradead.org, 
	rostedt@goodmis.org, senozhatsky@chromium.org, tfiga@chromium.org, 
	will@kernel.org, Lance Yang <lance.yang@linux.dev>, Eero Tamminen <oak@helsinkinet.fi>, 
	linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

Hi Lance,

On Fri, 27 Jun 2025 at 09:30, Lance Yang <ioworker0@gmail.com> wrote:
> From: Lance Yang <lance.yang@linux.dev>
>
> Inspired by mutex blocker tracking[1], and having already extended it to
> semaphores, let's now add support for reader-writer semaphores (rwsems).
>
> The approach is simple: when a task enters TASK_UNINTERRUPTIBLE while
> waiting for an rwsem, we just call hung_task_set_blocker(). The hung task
> detector can then query the rwsem's owner to identify the lock holder.
>
> Tracking works reliably for writers, as there can only be a single writer
> holding the lock, and its task struct is stored in the owner field.
>
> The main challenge lies with readers. The owner field points to only one
> of many concurrent readers, so we might lose track of the blocker if that
> specific reader unlocks, even while others remain. This is not a
> significant issue, however. In practice, long-lasting lock contention is
> almost always caused by a writer. Therefore, reliably tracking the writer
> is the primary goal of this patch series ;)
>
> With this change, the hung task detector can now show blocker task's info
> like below:
>
> [Fri Jun 27 15:21:34 2025] INFO: task cat:28631 blocked for more than 122 seconds.
> [Fri Jun 27 15:21:34 2025]       Tainted: G S                  6.16.0-rc3 #8
> [Fri Jun 27 15:21:34 2025] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [Fri Jun 27 15:21:34 2025] task:cat             state:D stack:0     pid:28631 tgid:28631 ppid:28501  task_flags:0x400000 flags:0x00004000
> [Fri Jun 27 15:21:34 2025] Call Trace:
> [Fri Jun 27 15:21:34 2025]  <TASK>
> [Fri Jun 27 15:21:34 2025]  __schedule+0x7c7/0x1930
> [Fri Jun 27 15:21:34 2025]  ? __pfx___schedule+0x10/0x10
> [Fri Jun 27 15:21:34 2025]  ? policy_nodemask+0x215/0x340
> [Fri Jun 27 15:21:34 2025]  ? _raw_spin_lock_irq+0x8a/0xe0
> [Fri Jun 27 15:21:34 2025]  ? __pfx__raw_spin_lock_irq+0x10/0x10
> [Fri Jun 27 15:21:34 2025]  schedule+0x6a/0x180
> [Fri Jun 27 15:21:34 2025]  schedule_preempt_disabled+0x15/0x30
> [Fri Jun 27 15:21:34 2025]  rwsem_down_read_slowpath+0x55e/0xe10
> [Fri Jun 27 15:21:34 2025]  ? __pfx_rwsem_down_read_slowpath+0x10/0x10
> [Fri Jun 27 15:21:34 2025]  ? __pfx___might_resched+0x10/0x10
> [Fri Jun 27 15:21:34 2025]  down_read+0xc9/0x230
> [Fri Jun 27 15:21:34 2025]  ? __pfx_down_read+0x10/0x10
> [Fri Jun 27 15:21:34 2025]  ? __debugfs_file_get+0x14d/0x700
> [Fri Jun 27 15:21:34 2025]  ? __pfx___debugfs_file_get+0x10/0x10
> [Fri Jun 27 15:21:34 2025]  ? handle_pte_fault+0x52a/0x710
> [Fri Jun 27 15:21:34 2025]  ? selinux_file_permission+0x3a9/0x590
> [Fri Jun 27 15:21:34 2025]  read_dummy_rwsem_read+0x4a/0x90
> [Fri Jun 27 15:21:34 2025]  full_proxy_read+0xff/0x1c0
> [Fri Jun 27 15:21:34 2025]  ? rw_verify_area+0x6d/0x410
> [Fri Jun 27 15:21:34 2025]  vfs_read+0x177/0xa50
> [Fri Jun 27 15:21:34 2025]  ? __pfx_vfs_read+0x10/0x10
> [Fri Jun 27 15:21:34 2025]  ? fdget_pos+0x1cf/0x4c0
> [Fri Jun 27 15:21:34 2025]  ksys_read+0xfc/0x1d0
> [Fri Jun 27 15:21:34 2025]  ? __pfx_ksys_read+0x10/0x10
> [Fri Jun 27 15:21:34 2025]  do_syscall_64+0x66/0x2d0
> [Fri Jun 27 15:21:34 2025]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [Fri Jun 27 15:21:34 2025] RIP: 0033:0x7f3f8faefb40
> [Fri Jun 27 15:21:34 2025] RSP: 002b:00007ffdeda5ab98 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
> [Fri Jun 27 15:21:34 2025] RAX: ffffffffffffffda RBX: 0000000000010000 RCX: 00007f3f8faefb40
> [Fri Jun 27 15:21:34 2025] RDX: 0000000000010000 RSI: 00000000010fa000 RDI: 0000000000000003
> [Fri Jun 27 15:21:34 2025] RBP: 00000000010fa000 R08: 0000000000000000 R09: 0000000000010fff
> [Fri Jun 27 15:21:34 2025] R10: 00007ffdeda59fe0 R11: 0000000000000246 R12: 00000000010fa000
> [Fri Jun 27 15:21:34 2025] R13: 0000000000000003 R14: 0000000000000000 R15: 0000000000000fff
> [Fri Jun 27 15:21:34 2025]  </TASK>
> [Fri Jun 27 15:21:34 2025] INFO: task cat:28631 <reader> blocked on an rw-semaphore likely owned by task cat:28630 <writer>
> [Fri Jun 27 15:21:34 2025] task:cat             state:S stack:0     pid:28630 tgid:28630 ppid:28501  task_flags:0x400000 flags:0x00004000
> [Fri Jun 27 15:21:34 2025] Call Trace:
> [Fri Jun 27 15:21:34 2025]  <TASK>
> [Fri Jun 27 15:21:34 2025]  __schedule+0x7c7/0x1930
> [Fri Jun 27 15:21:34 2025]  ? __pfx___schedule+0x10/0x10
> [Fri Jun 27 15:21:34 2025]  ? __mod_timer+0x304/0xa80
> [Fri Jun 27 15:21:34 2025]  schedule+0x6a/0x180
> [Fri Jun 27 15:21:34 2025]  schedule_timeout+0xfb/0x230
> [Fri Jun 27 15:21:34 2025]  ? __pfx_schedule_timeout+0x10/0x10
> [Fri Jun 27 15:21:34 2025]  ? __pfx_process_timeout+0x10/0x10
> [Fri Jun 27 15:21:34 2025]  ? down_write+0xc4/0x140
> [Fri Jun 27 15:21:34 2025]  msleep_interruptible+0xbe/0x150
> [Fri Jun 27 15:21:34 2025]  read_dummy_rwsem_write+0x54/0x90
> [Fri Jun 27 15:21:34 2025]  full_proxy_read+0xff/0x1c0
> [Fri Jun 27 15:21:34 2025]  ? rw_verify_area+0x6d/0x410
> [Fri Jun 27 15:21:34 2025]  vfs_read+0x177/0xa50
> [Fri Jun 27 15:21:34 2025]  ? __pfx_vfs_read+0x10/0x10
> [Fri Jun 27 15:21:34 2025]  ? fdget_pos+0x1cf/0x4c0
> [Fri Jun 27 15:21:34 2025]  ksys_read+0xfc/0x1d0
> [Fri Jun 27 15:21:34 2025]  ? __pfx_ksys_read+0x10/0x10
> [Fri Jun 27 15:21:34 2025]  do_syscall_64+0x66/0x2d0
> [Fri Jun 27 15:21:34 2025]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [Fri Jun 27 15:21:34 2025] RIP: 0033:0x7f8f288efb40
> [Fri Jun 27 15:21:34 2025] RSP: 002b:00007ffffb631038 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
> [Fri Jun 27 15:21:34 2025] RAX: ffffffffffffffda RBX: 0000000000010000 RCX: 00007f8f288efb40
> [Fri Jun 27 15:21:34 2025] RDX: 0000000000010000 RSI: 000000002a4b5000 RDI: 0000000000000003
> [Fri Jun 27 15:21:34 2025] RBP: 000000002a4b5000 R08: 0000000000000000 R09: 0000000000010fff
> [Fri Jun 27 15:21:34 2025] R10: 00007ffffb630460 R11: 0000000000000246 R12: 000000002a4b5000
> [Fri Jun 27 15:21:34 2025] R13: 0000000000000003 R14: 0000000000000000 R15: 0000000000000fff
> [Fri Jun 27 15:21:34 2025]  </TASK>
>
> [1] https://lore.kernel.org/all/174046694331.2194069.15472952050240807469.stgit@mhiramat.tok.corp.google.com/
>
> Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> Suggested-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> Signed-off-by: Lance Yang <lance.yang@linux.dev>

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
