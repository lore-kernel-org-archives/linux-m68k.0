Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EC543156
	for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Sep 2024 08:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727684378; cv=none; b=afUR5EJxTRmfRmj9ZFC+MnMJd4tvKF8FOkpPP5SaGPcJmuEIDX8MlzVgN1DrDfs8iFoWKf4/1Tx4ILWEXC7WuYFY9WWCqeBy3snb4evHQXZMs7KK19iOP79YXToILfrOVhReBtTdC7ftAhIfy9q7T9luEoprYtyjzZAbOTJPyFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727684378; c=relaxed/simple;
	bh=n9pO7t810DVvsnXgMWKTHi1S1ye/U9dtlCPEqkrpVos=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=XDIo1HkwOi2N5krxgNr5PuKOUsuzCdY5miCcBaiTUejdXcSCd1BOaZSCSK/8DtexzUgbvNzIUSNS9vkr5zjnz3t3+10SKxgBL+qCDu4MfF9/ypEZQugy1rO2aoC8APp+slzTiepGhQTejvMvCFj6+Axecj52CSIdAmjo2oZTSnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=DobIo+Jg; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="DobIo+Jg"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C642E0004
	for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Sep 2024 08:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1727684373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=77euBPHrWtFoD2pugXZFwViv4vNk2U/W1zfD3F7WeCg=;
	b=DobIo+JgY6hWj/FKEk5n5tHETMf7RAu8ag+f/Qk2EtJi7lXt39Yv1/Y8hojzWMFZ7Brem/
	Bp7UKkFkrZSyLpzqMJMmU2N4KewE2Amq4Y6WFoLpKu3BsMH+BWOICpJwxQbb7WKo5NRfRD
	w6Wup4gJBi5p4hUqg1ebBDpfB86SPLchGPC4VLhfwByvPh9pZrmTzCZObOKCbLbGwfdRS3
	P76tCq5/ljrYv0L3hMxqoZexBofCyQaIBPqbRo1gqRuFiubY2eL7pk//tWL9lC/TjEohfw
	2AbpowpQYOJrVdcO76LvFNAnQ0VqG5TrH1ddN/kXkdLNlUb9KnfyKn+eHniZvQ==
Message-ID: <a5f3b0f5-ed38-40be-b6bd-69e3b29ee399@yoseli.org>
Date: Mon, 30 Sep 2024 10:19:33 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-m68k@lists.linux-m68k.org
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Subject: PREEMPT_RT support
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Hi all !

I wanted to try PREEMPT_RT. I added the support for it:
diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index c7880f375518..b0360167574d 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -39,6 +39,7 @@ config M68K
         select OLD_SIGSUSPEND3
         select UACCESS_MEMCPY if !MMU
         select ZONE_DMA
+       select ARCH_SUPPORTS_RT

  config CPU_BIG_ENDIAN
         def_bool y

And set PREEMPT_RT then it fails to boot:
[    6.517000] BUG: scheduling while atomic: init/1/0x00010001
[    6.518000] Modules linked in:
[    6.519000] CPU: 0 PID: 1 Comm: init Not tainted 
6.10.0-g82c151ee715b-dirty #161
[    6.519000] Stack from 4186dc60:
[    6.519000]         4186dc60 414ad356 414ad356 00000001 418a0010 
418a0010 413a1e6a 414ad356
[    6.519000]         41025098 41483229 414831fb 418a0306 00000001 
00010001 4186dcc4 413a2ef8
[    6.519000]         418a0010 4186dd1c 418a0010 4186c000 413a500a 
4186c000 413a2ea6 413a6934
[    6.519000]         4102c98e 4186dcd8 413a3616 00000002 4186c000 
415e9180 4186dd5c 413a7312
[    6.519000]         00002700 00000000 00000001 413a500a d0af2266 
41f31552 4186c000 415e9180
[    6.519000]         4102e7b4 415e9180 418a0011 00000001 415e9180 
413a67c6 00000000 4186dd1c
[    6.519000] Call Trace: [<413a1e6a>] dump_stack+0xc/0x10
[    6.519000]  [<41025098>] __schedule_bug+0x50/0x64
[    6.519000]  [<413a2ef8>] __schedule+0x52/0x4ce
[    6.519000]  [<413a500a>] mutex_unlock+0x0/0x6
[    6.519000]  [<413a2ea6>] __schedule+0x0/0x4ce
[    6.519000]  [<413a6934>] try_to_take_rt_mutex+0x0/0x1ee
[    6.519000]  [<4102c98e>] __wake_up_common_lock+0x36/0x46
[    6.519000]  [<413a3616>] schedule_rtlock+0x26/0x46
[    6.519000]  [<413a7312>] rtlock_slowlock_locked+0x5f2/0x8e2
[    6.519000]  [<413a500a>] mutex_unlock+0x0/0x6
[    6.519000]  [<4102e7b4>] arch_local_irq_disable+0x0/0xc
[    6.519000]  [<413a67c6>] rt_spin_unlock+0x1c/0x48
[    6.519000]  [<412207ae>] uart_port_dtr_rts+0x18/0x26
[    6.519000]  [<41208ffc>] tty_driver_kref_put+0x0/0x10
[    6.519000]  [<412103f6>] tty_port_raise_dtr_rts+0x18/0x1c
[    6.519000]  [<413a76ec>] rt_spin_lock+0x42/0x7a
[    6.519000]  [<4122059c>] uart_insert_char+0x0/0x78
[    6.519000]  [<410340dc>] __irq_wake_thread+0x0/0x44
[    6.519000]  [<41223e10>] mcf_interrupt+0x28/0x266
[    6.519000]  [<413a500a>] mutex_unlock+0x0/0x6
[    6.519000]  [<410340dc>] __irq_wake_thread+0x0/0x44
[    6.519000]  [<41034156>] __handle_irq_event_percpu+0x36/0xc6
[    6.519000]  [<41220b76>] uart_port_deref+0x0/0x34
[    6.519000]  [<41036be4>] irqd_irq_disabled.isra.0+0x0/0xc
[    6.519000]  [<410341f6>] handle_irq_event_percpu+0x10/0x40
[    6.519000]  [<4103426e>] handle_irq_event+0x48/0x6e
[    6.519000]  [<41037756>] handle_level_irq+0x9a/0xd2
[    6.519000]  [<41220b76>] uart_port_deref+0x0/0x34
[    6.519000]  [<413a67aa>] rt_spin_unlock+0x0/0x48
[    6.519000]  [<41033b7e>] handle_irq_desc+0x1e/0x28
[    6.519000]  [<410036e2>] do_IRQ+0x22/0x34
[    6.519000]  [<410060ce>] inthandler+0x36/0x40
[    6.519000]  [<413a500a>] mutex_unlock+0x0/0x6
[    6.519000]  [<413a67aa>] rt_spin_unlock+0x0/0x48
[    6.519000]  [<4122140e>] uart_write+0x98/0xae
[    6.519000]  [<4120d1ae>] n_tty_write+0x232/0x362
[    6.519000]  [<4119bef6>] iov_iter_revert+0x0/0xb6
[    6.519000]  [<4102cbf0>] woken_wake_function+0x0/0x2e
[    6.519000]  [<412093c0>] signal_pending+0x0/0x22
[    6.519000]  [<4120a4ec>] file_tty_write.constprop.0+0x156/0x1c0
[    6.519000]  [<410aff7e>] vfs_write+0x104/0x164
[    6.519000]  [<410b00f6>] ksys_write+0x62/0x9e
[    6.519000]  [<410b0132>] sys_write+0x0/0x18
[    6.519000]  [<410b0144>] sys_write+0x12/0x18
[    6.519000]  [<41005fa4>] system_call+0x54/0xa8
[    6.519000]
[    6.520000] ------------[ cut here ]------------
[    6.520000] WARNING: CPU: 0 PID: 0 at kernel/context_tracking.c:128 
ct_kernel_exit.constprop.0+0x34/0x74
[    6.520000] Modules linked in:
[    6.520000] CPU: 0 PID: 0 Comm: swapper Tainted: G        W 
6.10.0-g82c151ee715b-dirty #161
[    6.520000] Stack from 41509ef8:
[    6.520000]         41509ef8 414ad356 414ad356 00000000 00000009 
413997d2 413a1e6a 414ad356
[    6.520000]         4139919c 4147f834 413a2700 41487ce2 41582928 
41028f28 41009894 41487ce2
[    6.520000]         00000080 413a2604 00000009 00000000 00000000 
413a2776 00000000 4101f954
[    6.520000]         00000001 00000002 41508000 418a0010 41508000 
413a27b0 413a2604 41487ce2
[    6.520000]         00000080 00000009 00000000 413a27c8 4102ad8a 
00000002 4102ad24 4101e6f6
[    6.520000]         4103b6ca 41509ff8 4102afda 4103f09c 413a287c 
000000ec 415b524a 418740b0
[    6.520000] Call Trace: [<413997d2>] _printk+0x0/0x18
[    6.520000]  [<413a1e6a>] dump_stack+0xc/0x10
[    6.520000]  [<4139919c>] __warn+0x74/0xc2
[    6.520000]  [<413a2700>] ct_nmi_enter+0x14/0x7e
[    6.520000]  [<41028f28>] arch_local_irq_disable+0x0/0xc
[    6.520000]  [<41009894>] warn_slowpath_fmt+0x6e/0xc6
[    6.520000]  [<413a2604>] ct_kernel_exit.constprop.0+0x34/0x74
[    6.520000]  [<413a2776>] cpu_idle_poll.isra.0+0x0/0x3a
[    6.520000]  [<4101f954>] parse_args+0x0/0x31a
[    6.520000]  [<413a27b0>] default_idle_call+0x0/0x2a
[    6.520000]  [<413a2604>] ct_kernel_exit.constprop.0+0x34/0x74
[    6.520000]  [<413a27c8>] default_idle_call+0x18/0x2a
[    6.520000]  [<4102ad8a>] do_idle+0x66/0x9e
[    6.520000]  [<4102ad24>] do_idle+0x0/0x9e
[    6.520000]  [<4101e6f6>] find_task_by_pid_ns+0x0/0x1e
[    6.520000]  [<4103b6ca>] __rcu_read_lock+0x0/0xc
[    6.520000]  [<4102afda>] cpu_startup_entry+0x14/0x16
[    6.520000]  [<4103f09c>] __rcu_read_unlock+0x0/0x106
[    6.520000]  [<413a287c>] kernel_init+0x0/0xf6
[    6.520000]  [<41392654>] strlen+0x0/0x14
[    6.520000]  [<41398ba0>] arch_local_irq_disable+0x0/0xc
[    6.520000]  [<415a29c8>] console_on_rootfs+0x0/0x58
[    6.520000]  [<41003100>] _exit+0x0/0x4

Any idea, thoughts :-) ?
Thanks a lot !
JM
