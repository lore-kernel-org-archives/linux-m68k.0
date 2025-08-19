Received: from smtp.dnamail.fi (sender001.dnamail.fi [83.102.40.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8723E26F2A9
	for <linux-m68k@lists.linux-m68k.org>; Tue, 19 Aug 2025 23:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.102.40.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755646870; cv=none; b=Ogm3492yADfbqvvFy3SOPLw2GZg8ai/lcqrY44yBwjmqD42lJpcJdbZju/F0cKBv/hkAaQSN0FnNns5VuYA/G+Dz/C7Wz2mbVEqubNDzhTnhhB0SAvYg9RRmnx1oRtOP6SylIa/yRe2d6znBdbxspJiLTcCGZPEGouKAoaIYezw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755646870; c=relaxed/simple;
	bh=VMll8Dz1flJ/P7DavvDc9/G/PgRn2a8lkxKo2bbc+94=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=SdObZuNUMoc6uI2s6ceg8MQAxKF4zqAwFjFVUxJXEgTHwm78N+OMcCsob42gPPxGrZ7AapYQ2e/dLRZVyE/k/ccV3GHiMeVhyHzT5kZmU7m1Mz4c3NEqHHXAXQNqGLr0l4YQxE3eQ2kbSCmnb8LtvzHZn0gDo0QJUIo53zlCpEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=helsinkinet.fi; spf=pass smtp.mailfrom=helsinkinet.fi; dkim=pass (2048-bit key) header.d=helsinkinet.fi header.i=@helsinkinet.fi header.b=RIYRYZta; arc=none smtp.client-ip=83.102.40.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=helsinkinet.fi header.i=@helsinkinet.fi header.b="RIYRYZta"
Received: from localhost (localhost [127.0.0.1])
	by smtp.dnamail.fi (Postfix) with ESMTP id DA8DD2119C18
	for <linux-m68k@lists.linux-m68k.org>; Wed, 20 Aug 2025 02:32:00 +0300 (EEST)
X-Virus-Scanned: X-Virus-Scanned: amavis at smtp.dnamail.fi
Received: from smtp.dnamail.fi ([83.102.40.178])
 by localhost (dmail-psmtp01.s.dnaip.fi [127.0.0.1]) (amavis, port 10024)
 with ESMTP id xwN0E9cl54i3 for <linux-m68k@lists.linux-m68k.org>;
 Wed, 20 Aug 2025 02:31:59 +0300 (EEST)
Received: from [192.168.101.100] (85-23-113-84.bb.dnainternet.fi [85.23.113.84])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: oak@dnamail.internal)
	by smtp.dnamail.fi (Postfix) with ESMTPSA id C15E52112209
	for <linux-m68k@lists.linux-m68k.org>; Wed, 20 Aug 2025 02:31:59 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.dnamail.fi C15E52112209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=helsinkinet.fi;
	s=2025-03; t=1755646319;
	bh=IcWeSKzTrB2QGmp3ElOEIJOyBPr3x89n0TMvnNQRvFQ=;
	h=Date:To:From:Subject:From;
	b=RIYRYZtaDM3/MZMEVkYwIq0axOVFuSIBHLB7NfZtIry0tXHgt9jREWRC+e+lmyFkJ
	 KAvToFZ81ItAJXWIeGrdXrzoxY1Im8GvT91fKSmCZtw+VDHRabgunW1hBvgejkz5eO
	 V1W148GP796nMp+nkCUSn8QeZCOy3ikYmMJeesKBbDHi5kZS3Ds3CvSAyxaZnYC884
	 qRnWXV9h+OwVs1oCLawqC6DpwOb+n9sbYFSJkpAlQoFlE9GzH3GqfNAqEv+IalrLYi
	 6PbdHDnFXQwgfpzBw0g4k5IFoYLHZzJcft/ewhQvaKFfkuskrt+tfWZuEZSRNFRAhR
	 A3ahmMyhQNKBg==
Message-ID: <92518308-c763-4591-96ef-6b38c5d8f434@helsinkinet.fi>
Date: Wed, 20 Aug 2025 02:31:59 +0300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-m68k <linux-m68k@lists.linux-m68k.org>
From: Eero Tamminen <oak@helsinkinet.fi>
Subject: v6.16 console issues on Atari Falcon
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

With v6.16 kernel I'm getting following when booting kernel on 
(emulated) 32Mhz Atari Falcon (or Atari TT), to "init" script / Busybox 
shell (on a 4MB EXT2 IDE file system):
----------------------------------------------------------------
Run /init as init process
   with arguments:
     /init
   with environment:
     HOME=/
     TERM=linux
     BOOT_IMAGE=vmlinux
------------[ cut here ]------------
WARNING: CPU: 0 PID: 6 at ./include/linux/hung_task.h:48 
__down_common+0xb4/0x1ce
CPU: 0 UID: 0 PID: 6 Comm: kworker/u4:0 Not tainted 
6.16.0hatari-00002-gac565860896d #1 NONE
Workqueue: events_unbound flush_to_ldisc
Stack from 01045d18:
...
Call Trace: [<002d3ba2>] __down_common+0xb4/0x1ce
  [<000034aa>] _printk+0x0/0x16
  [<00008728>] dump_stack+0x10/0x16
  [<0002dd02>] __warn+0x6c/0xc4
  [<00061b3c>] msleep+0x0/0x2c
  [<000028f6>] warn_slowpath_fmt+0x42/0x62
  [<002d3ba2>] __down_common+0xb4/0x1ce
  [<001a30f6>] n_tty_receive_buf_standard+0x0/0x6f6
  [<00058cbc>] handle_irq_event+0x22/0x36
  [<002d3ba2>] __down_common+0xb4/0x1ce
  [<001a30f6>] n_tty_receive_buf_standard+0x0/0x6f6
  [<00054210>] other_cpu_in_panic+0x0/0x2a   <== what "other" CPU?
  [<00061b3c>] msleep+0x0/0x2c
  [<001a30f6>] n_tty_receive_buf_standard+0x0/0x6f6
  [<002d3cd2>] __down+0x16/0x1e
  [<002d3d08>] down+0x2e/0x30
  [<00054260>] console_lock+0x26/0x4c
  [<001ae85c>] con_flush_chars+0x2a/0x40
  [<001a3c22>] n_tty_receive_buf_common+0x436/0x466
  [<0003c494>] list_del_init+0x0/0x20
  [<0003d1d4>] kick_pool+0x0/0x74
  [<001a3c52>] n_tty_receive_buf2+0x0/0x20
  [<00005e01>] io_poll_remove_all+0x7/0x8a
  [<001a3c6e>] n_tty_receive_buf2+0x1c/0x20
  [<001a5422>] tty_ldisc_receive_buf+0x30/0x64
  [<001a5cc6>] tty_port_default_receive_buf+0x44/0x54
  [<001a5846>] flush_to_ldisc+0x72/0x13a
  [<002cb43e>] sized_strscpy+0x0/0x126
  [<0003e53e>] process_scheduled_works+0x1a4/0x232
  [<0003b736>] need_to_create_worker+0x0/0x30
  [<0003b698>] arch_local_irq_enable+0x0/0x22
  [<00060a3c>] mod_timer+0x0/0x16
  [<002d556c>] schedule_timeout_interruptible+0x0/0x16
  [<0003cf0e>] create_worker+0x0/0x18a
  [<0003d8f6>] assign_work+0x0/0x54
  [<0003eaf0>] worker_thread+0x168/0x1cc
  [<0003e988>] worker_thread+0x0/0x1cc
  [<00042c6a>] to_kthread+0x0/0x3a
  [<000430bc>] kthread_exit+0x0/0x72
  [<000440b0>] kthread+0x16a/0x174
  [<00043090>] __list_del_entry+0x0/0x2c
  [<00043f46>] kthread+0x0/0x174
  [<00048a34>] schedule_tail+0x34/0x38
  [<0000934c>] ret_from_kernel_thread+0xc/0x14
---[ end trace 0000000000000000 ]---
------------[ cut here ]------------
WARNING: CPU: 0 PID: 6 at ./include/linux/hung_task.h:56 
__down_common+0x18a/0x1ce
CPU: 0 UID: 0 PID: 6 Comm: kworker/u4:0 Tainted: G        W 
6.16.0hatari-00002-gac565860896d #1 NONE
Tainted: [W]=WARN
Workqueue: events_unbound flush_to_ldisc
Stack from 01045d18:
...
Call Trace: [<002d3c78>] __down_common+0x18a/0x1ce
  [<000034aa>] _printk+0x0/0x16
  [<00008728>] dump_stack+0x10/0x16
  [<0002dd02>] __warn+0x6c/0xc4
  [<000028f6>] warn_slowpath_fmt+0x42/0x62
  [<002d3c78>] __down_common+0x18a/0x1ce
  [<002d3c78>] __down_common+0x18a/0x1ce
  [<001a30f6>] n_tty_receive_buf_standard+0x0/0x6f6
  [<00054210>] other_cpu_in_panic+0x0/0x2a
  [<00061b3c>] msleep+0x0/0x2c
  [<002d3cd2>] __down+0x16/0x1e
  [<002d3d08>] down+0x2e/0x30
  [<00054260>] console_lock+0x26/0x4c
  [<001ae85c>] con_flush_chars+0x2a/0x40
  [<001a3c22>] n_tty_receive_buf_common+0x436/0x466
  [<0003c494>] list_del_init+0x0/0x20
  [<0003d1d4>] kick_pool+0x0/0x74
  [<001a3c52>] n_tty_receive_buf2+0x0/0x20
  [<00005e01>] io_poll_remove_all+0x7/0x8a
  [<001a3c6e>] n_tty_receive_buf2+0x1c/0x20
  [<001a5422>] tty_ldisc_receive_buf+0x30/0x64
  [<001a5cc6>] tty_port_default_receive_buf+0x44/0x54
  [<001a5846>] flush_to_ldisc+0x72/0x13a
  [<002cb43e>] sized_strscpy+0x0/0x126
  [<0003e53e>] process_scheduled_works+0x1a4/0x232
  [<0003b736>] need_to_create_worker+0x0/0x30
  [<0003b698>] arch_local_irq_enable+0x0/0x22
  [<00060a3c>] mod_timer+0x0/0x16
  [<002d556c>] schedule_timeout_interruptible+0x0/0x16
  [<0003cf0e>] create_worker+0x0/0x18a
  [<0003d8f6>] assign_work+0x0/0x54
  [<0003eaf0>] worker_thread+0x168/0x1cc
  [<0003e988>] worker_thread+0x0/0x1cc
  [<00042c6a>] to_kthread+0x0/0x3a
  [<000430bc>] kthread_exit+0x0/0x72
  [<000440b0>] kthread+0x16a/0x174
  [<00043090>] __list_del_entry+0x0/0x2c
  [<00043f46>] kthread+0x0/0x174
  [<00048a34>] schedule_tail+0x34/0x38
  [<0000934c>] ret_from_kernel_thread+0xc/0x14
---[ end trace 0000000000000000 ]---
----------------------------------------------------------------

System seems to still "work" after these, but after running couple of 
commands from the screen console, console input starts behaving badly, 
and I get:

----------------------------------------------------------------
random: crng init done
------------[ cut here ]------------
WARNING: CPU: 0 PID: 43 at ./include/linux/hung_task.h:48 
__mutex_add_waiter+0xb2/0xf8
CPU: 0 UID: 0 PID: 43 Comm: sh Tainted: G        W 
6.16.0hatari-00002-gac565860896d #1 NONE
Tainted: [W]=WARN
Stack from 0120dd10:
...
Call Trace: [<000518fc>] __mutex_add_waiter+0xb2/0xf8
  [<000034aa>] _printk+0x0/0x16
  [<00008728>] dump_stack+0x10/0x16
  [<0002dd02>] __warn+0x6c/0xc4
  [<000028f6>] warn_slowpath_fmt+0x42/0x62
  [<000518fc>] __mutex_add_waiter+0xb2/0xf8
  [<00051746>] __mutex_trylock+0x0/0x1a
  [<000518fc>] __mutex_add_waiter+0xb2/0xf8
  [<00051942>] raw_spin_unlock_irqrestore_wake.constprop.0+0x0/0x2a
  [<002d32d4>] __mutex_lock.constprop.0+0x66/0x112
  [<001719ee>] _copy_to_iter+0x0/0x432
  [<00054d90>] console_flush_all+0x0/0x222
  [<002d33a4>] __mutex_lock_interruptible_slowpath+0x10/0x14
  [<002d3884>] mutex_lock_interruptible+0x1a/0x26
  [<001a2ece>] n_tty_read+0x264/0x418
  [<001719ee>] _copy_to_iter+0x0/0x432
  [<0004ff8a>] woken_wake_function+0x0/0x24
  [<0019f2e4>] tty_read+0xa4/0x156
  [<0019ff94>] file_tty_write.constprop.0+0x1a2/0x1b8
  [<000ba1be>] init_sync_kiocb+0x86/0xa2
  [<000bb386>] vfs_read+0xd6/0x124
  [<00004000>] __show_mem+0x1fe/0x5a8
  [<000bb6f0>] ksys_read+0x54/0x8a
  [<000bb73c>] sys_read+0x16/0x1a
  [<000093da>] syscall+0x8/0xc
---[ end trace 0000000000000000 ]---
------------[ cut here ]------------
WARNING: CPU: 0 PID: 43 at ./include/linux/hung_task.h:56 
__mutex_remove_waiter+0x76/0x8a
CPU: 0 UID: 0 PID: 43 Comm: sh Tainted: G        W 
6.16.0hatari-00002-gac565860896d #1 NONE
Tainted: [W]=WARN
Stack from 0120dd1c:
...
Call Trace: [<00051836>] __mutex_remove_waiter+0x76/0x8a
  [<000034aa>] _printk+0x0/0x16
  [<00008728>] dump_stack+0x10/0x16
  [<0002dd02>] __warn+0x6c/0xc4
  [<000028f6>] warn_slowpath_fmt+0x42/0x62
  [<00051836>] __mutex_remove_waiter+0x76/0x8a
  [<00051746>] __mutex_trylock+0x0/0x1a
  [<00051836>] __mutex_remove_waiter+0x76/0x8a
  [<002d3372>] __mutex_lock.constprop.0+0x104/0x112
  [<001719ee>] _copy_to_iter+0x0/0x432
  [<002d33a4>] __mutex_lock_interruptible_slowpath+0x10/0x14
  [<002d3884>] mutex_lock_interruptible+0x1a/0x26
  [<001a2ece>] n_tty_read+0x264/0x418
  [<001719ee>] _copy_to_iter+0x0/0x432
  [<0004ff8a>] woken_wake_function+0x0/0x24
  [<0019f2e4>] tty_read+0xa4/0x156
  [<0019ff94>] file_tty_write.constprop.0+0x1a2/0x1b8
  [<000ba1be>] init_sync_kiocb+0x86/0xa2
  [<000bb386>] vfs_read+0xd6/0x124
  [<00004000>] __show_mem+0x1fe/0x5a8
  [<000bb6f0>] ksys_read+0x54/0x8a
  [<000bb73c>] sys_read+0x16/0x1a
  [<000093da>] syscall+0x8/0xc
---[ end trace 0000000000000000 ]---
----------------------------------------------------------------

Kernel is built with this (6.15) config:
https://github.com/hatari/hatari/blob/main/tools/linux/kernel.config

Using Debian m68k 12.2 GCC cross-compiler.

(6.16 build added just "CONFIG_PAGE_BLOCK_ORDER=11" option to 6.15 config.)

Earlier kernel releases have worked just fine without kernel warnings.

Any ideas what could be causing the issue with v6.16?


	- Eero

