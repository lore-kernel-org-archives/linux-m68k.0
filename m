Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DE261685
	for <linux-m68k@lists.linux-m68k.org>; Mon,  4 Mar 2024 17:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709575101; cv=none; b=r2EnpGusKhhhlBQUB3pNwijCww2GxrsHXkp0K2GT0AVu1do0Iqo3lQfShHF6WB1NWgvKRaGPOQcGdfYdVr1UXUYrM6AZN34/lYYiseN5mo2bluB6ETSPDCd3+caf5TK6dtfpx/g0PqFTs5ir4xukBqeKtOBEJRSFdfRlRIvgsnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709575101; c=relaxed/simple;
	bh=AbLQ4uJiH7qAi7fqglZJOGpaVthPzwm9LZpMz8M3moo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oGAFVoLlG5uNeNZjyi9GUh+FKgximXc6snU6bURd2JVfhYKgIk40PTnZ8XTzW+jfEA+pZGizuwoLBJpy9ovie0LAV8KEmzjoQdfALmQU1ZwXiqYRAdg4wbgCIEnH52qq+RQVzE/mqp1GELKDrj7VayGLI0QsINy6SLJrxIYvVRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aYG/CLC3; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYG/CLC3"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6e56d594b31so2467172b3a.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 Mar 2024 09:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709575099; x=1710179899; darn=lists.linux-m68k.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=eIz5D3TSSNAvrR2Ws5TScV2MNIhuGypio73rqnBYcqg=;
        b=aYG/CLC3UsXz9EtaIzg9Rulzh+JthY+ObkRiLtsK3leu+oWr20TKZ+8WB/hEjGKGn9
         EDk7cEC9brABHOR2bWiJuVSuwxd1J4ty9QZ6jEjh5Hwq+7Rh5xV9+epA5KPfWvpor3GN
         rB+MAL1T1K9RzIqtGSw2RZib1g09Qyk5K+XyO+Osn87P8HLNo+mcd3WkjnlWkHvdmgOj
         PqzdEOxCI4/AhqcGJxBc/PD7OZpxuAPYASjeP2+IjnC/WBtVNbM4j6Gjtkz2mdzy0A0P
         AKEy+Jyv4NbJW+NKd1UPLqB47YK7fHwXh9VJCkLbEXrTDdoj4Pv+3T88GvO8gBnozPK9
         7jhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709575099; x=1710179899;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eIz5D3TSSNAvrR2Ws5TScV2MNIhuGypio73rqnBYcqg=;
        b=gJrFfD7pSEvB36ENXY4O6Zz3Hj6u+xFI1cnoGUPHwqNAAWlMvO52xgdE8w2/PIAQfq
         omY8ypPdSE4yfNJR+6xd0Wdu8qR3Y4dTjfWcsLyA20zRDn3sbNAzLqpaQ5jCUv++njuy
         Iq7W2hwF7cozmhyAUJHgUiYFpm5mzHdR/V6Ttbobvr8VZbMeHUfQM66QL4dIaJFyQqvL
         aMr7QcJGtdec6ZmeYuCQdVHd7EyRPKXPUFGW4kVQGtgqRDMvBd65pMX3MLpbI+RByqOL
         TObzWm6NO17AL+IfmKzXzKaJ0CcE8+Cqxh48zc7YzgqB+NdvJhT8PyHvQx9d5C0SQoEn
         KO1A==
X-Gm-Message-State: AOJu0Yz89+WObBcz1vVukJ5DkU9NZ+2GfzqP2GU+WaRBiB4gkfRHOPnn
	tN5pM6gT+oQVAOGU5RAucDqOXIr5hgbiHc/sHMDuapMvYzTdNXaP
X-Google-Smtp-Source: AGHT+IEFF3X+W6/G/ptPd6W3VWi/rPRmnHZXovsGZThfQc1JHqAoXb04MmKF/Qwxr4oVL8M9RHkdpw==
X-Received: by 2002:a05:6a20:a787:b0:1a1:2f28:a56d with SMTP id bx7-20020a056a20a78700b001a12f28a56dmr1233475pzb.56.1709575099058;
        Mon, 04 Mar 2024 09:58:19 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 23-20020a630d57000000b005dc87f5dfcfsm7579435pgn.78.2024.03.04.09.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 09:58:18 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 4 Mar 2024 09:58:16 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: spinlock recursion when running q800 emulation in qemu
Message-ID: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

when running the q800 qemu emulation, am seeing random "spinlock recursion"
messages every few test runs. Some examples are below. This is not a new
problem, but it keeps popping up.

Is this a potential problem or just noise ?

Thanks,
Guenter

---
BUG: spinlock recursion on CPU#0, swapper/1
 lock: 0x5875c0, .magic: dead4ead, .owner: swapper/1, .owner_cpu: 0
CPU: 0 PID: 1 Comm: swapper Not tainted 6.8.0-rc6-mac-00037-g805d849d7c3c #1
Stack from 00c49e80:
        00c49e80 0051c8da 0051c8da 005875c0 00000000 003ec2de 0051c8da 00038e26
        005875c0 004f094b 00c4c010 0003025a 005875c0 00c49ec4 00030272 005875c0
        00000000 00c49ed4 00031592 00000000 00c15100 0003df46 0004b6b6 00000000
        00006b1e 00000000 0003dfc0 0000000e 00000000 00000000 00042608 0000000f
        00000000 005ba9b0 005baa0c 00000000 00000000 0003e050 005ba9b0 00000000
        005ba9b0 0003e0a6 005ba9b0 005baa0c 00000000 005ba9b0 005baa0c 00040524
Call Trace: [<003ec2de>] dump_stack+0xc/0x10
 [<00038e26>] do_raw_spin_lock+0x34/0x58
 [<0003025a>] raw_spin_rq_lock_nested+0xe/0x14
 [<00030272>] raw_spin_rq_lock.constprop.0+0x12/0x18
 [<00031592>] scheduler_tick+0x18/0x62
 [<0003df46>] __irq_wake_thread+0x0/0x40
 [<0004b6b6>] update_process_times+0x5e/0x68
 [<00006b1e>] via_timer_handler+0x1a/0x20
 [<0003dfc0>] __handle_irq_event_percpu+0x3a/0xba
 [<00042608>] check_all_holdout_tasks_trace+0x114/0x25a
 [<0003e050>] handle_irq_event_percpu+0x10/0x3a
 [<0003e0a6>] handle_irq_event+0x2c/0x4e
 [<00040524>] handle_simple_irq+0x64/0x68
 [<003ec3ba>] kernel_init+0x0/0xec
 [<0003db76>] handle_irq_desc+0x1e/0x28
 [<000069be>] via1_irq+0x42/0x80
 [<00046914>] resolve_symbol+0x192/0x27e
 [<003ec3ba>] kernel_init+0x0/0xec
 [<0003db76>] handle_irq_desc+0x1e/0x28
 [<00002798>] do_IRQ+0x20/0x32
 [<00002698>] auto_irqhandler_fixup+0x4/0xc
 [<00046914>] resolve_symbol+0x192/0x27e
 [<00002530>] ret_from_kernel_thread+0x0/0x14
RCU Tasks Trace: Setting shift to 0 and lim to 1 rcu_task_cb_adjust=1.

---
BUG: spinlock recursion on CPU#0, swapper/2
 lock: 0x5875c0, .magic: dead4ead, .owner: swapper/2, .owner_cpu: 0
CPU: 0 PID: 2 Comm: swapper Not tainted 6.8.0-rc7-mac #1
Stack from 00c81e80:
        00c81e80 0051c8ce 0051c8ce 005875c0 00000000 003ec30a 0051c8ce 00038e26
        005875c0 004f093f 00c4c650 0003025a 005875c0 00c81ec4 00030272 005875c0
        00000000 00c81ed4 00031592 00000000 00c15100 0003df46 0004b6b6 00000000
        00006b1e 00000000 0003dfc0 0000000e 00000000 00000000 00c42608 00000102
        00037462 005ba9b0 005baa0c 00000000 00000000 0003e050 005ba9b0 00000000
        005ba9b0 0003e0a6 005ba9b0 005baa0c 00000000 005ba9b0 005baa0c 00040524
Call Trace: [<003ec30a>] dump_stack+0xc/0x10
 [<00038e26>] do_raw_spin_lock+0x34/0x58
 [<0003025a>] raw_spin_rq_lock_nested+0xe/0x14
 [<00030272>] raw_spin_rq_lock.constprop.0+0x12/0x18
 [<00031592>] scheduler_tick+0x18/0x62
 [<0003df46>] __irq_wake_thread+0x0/0x40
 [<0004b6b6>] update_process_times+0x5e/0x68
 [<00006b1e>] via_timer_handler+0x1a/0x20
 [<0003dfc0>] __handle_irq_event_percpu+0x3a/0xba
 [<00037462>] __prepare_to_swait+0x0/0x26
 [<0003e050>] handle_irq_event_percpu+0x10/0x3a
 [<0003e0a6>] handle_irq_event+0x2c/0x4e
 [<00040524>] handle_simple_irq+0x64/0x68
 [<0002c5c0>] kthreadd+0x0/0xf4
 [<0003db76>] handle_irq_desc+0x1e/0x28
 [<000069be>] via1_irq+0x42/0x80
 [<0002c5c0>] kthreadd+0x0/0xf4
 [<0003db76>] handle_irq_desc+0x1e/0x28
 [<00002798>] do_IRQ+0x20/0x32
 [<00002698>] auto_irqhandler_fixup+0x4/0xc
 [<00037462>] __prepare_to_swait+0x0/0x26
 [<00002530>] ret_from_kernel_thread+0x0/0x14
RCU Tasks Trace: Setting shift to 0 and lim to 1 rcu_task_cb_adjust=1.

---
BUG: spinlock recursion on CPU#0, swapper/2
 lock: 0x573580, .magic: dead4ead, .owner: swapper/2, .owner_cpu: 0
CPU: 0 PID: 2 Comm: swapper Not tainted 6.6.20-mac #1
Stack from 0085be80:
        0085be80 0050972e 0050972e 00573580 00000000 003dc00e 0050972e 000385ce
        00573580 004dddb2 0084c630 0002fca0 00573580 0085bec4 0002fcb8 00573580
        00000000 0085bed4 00030f36 00000000 00815100 0003d35e 0004a990 00000000
        00006b0a 00000000 0003d3d8 0000000e 00000000 00000000 00842608 00000102
        00036c08 005a69b4 005a6a10 00000000 00000000 0003d468 005a69b4 00000000
        005a69b4 0003d4be 005a69b4 005a6a10 00000000 005a69b4 005a6a10 0003f9a4
Call Trace: [<003dc00e>] dump_stack+0xc/0x10
 [<000385ce>] do_raw_spin_lock+0x34/0x58
 [<0002fca0>] raw_spin_rq_lock_nested+0xe/0x14
 [<0002fcb8>] raw_spin_rq_lock.constprop.0+0x12/0x18
 [<00030f36>] scheduler_tick+0x18/0x62
 [<0003d35e>] __irq_wake_thread+0x0/0x40
 [<0004a990>] update_process_times+0x5e/0x66
 [<00006b0a>] via_timer_handler+0x1a/0x20
 [<0003d3d8>] __handle_irq_event_percpu+0x3a/0xba
 [<00036c08>] __prepare_to_swait+0x0/0x26
 [<0003d468>] handle_irq_event_percpu+0x10/0x3a
 [<0003d4be>] handle_irq_event+0x2c/0x4e
 [<0003f9a4>] handle_simple_irq+0x64/0x68
 [<0002c1c8>] kthreadd+0x0/0xf4
 [<0003cf8e>] handle_irq_desc+0x1e/0x28
 [<000069aa>] via1_irq+0x42/0x80
 [<0002c1c8>] kthreadd+0x0/0xf4
 [<0003cf8e>] handle_irq_desc+0x1e/0x28
 [<0000276c>] do_IRQ+0x20/0x32
 [<0000266c>] auto_irqhandler_fixup+0x4/0xc
 [<00036c08>] __prepare_to_swait+0x0/0x26
 [<00002504>] ret_from_kernel_thread+0x0/0x14
RCU Tasks Trace: Setting shift to 0 and lim to 1 rcu_task_cb_adjust=1.

---
BUG: spinlock recursion on CPU#0, swapper/2
 lock: 0x52b8d0, .magic: dead4ead, .owner: swapper/2, .owner_cpu: 0
CPU: 0 PID: 2 Comm: swapper Not tainted 6.1.76-mac #1
Stack from 0082fe5c:
        0082fe5c 004ca084 004ca084 00000000 00000000 003ac8d6 004ca084 00038ec6
        0052b8d0 004a1af1 00810040 0002f7ca 0052b8d0 0082fea0 0002f7e2 0052b8d0
        00000000 0082fed4 00030abe 0082fecc 00000000 00000000 0000000e 003a44ea
        00000000 00000000 00810040 0055ecdc 0005b98e 00563214 0003d82e 0004a7f6
        00000000 00006e9e 00000000 0003d8a8 0000000e 00000000 00000000 00522608
        0000000f 005272c8 0055ecdc 0055ed38 00000000 00000000 0003d938 0055ecdc
Call Trace: [<003ac8d6>] dump_stack+0xc/0x10
 [<00038ec6>] do_raw_spin_lock+0x34/0x58
 [<0002f7ca>] raw_spin_rq_lock_nested+0xe/0x14
 [<0002f7e2>] rq_lock.constprop.0+0x12/0x28
 [<00030abe>] scheduler_tick+0x1c/0x142
 [<003a44ea>] _printk+0x0/0x18
 [<0005b98e>] irq_work_tick+0x20/0x26
 [<0003d82e>] __irq_wake_thread+0x0/0x40
 [<0004a7f6>] update_process_times+0x5e/0x68
 [<00006e9e>] via_timer_handler+0x1a/0x20
 [<0003d8a8>] __handle_irq_event_percpu+0x3a/0xba
 [<0003d938>] handle_irq_event_percpu+0x10/0x3a
 [<0003d98e>] handle_irq_event+0x2c/0x4e
 [<0003fe64>] handle_simple_irq+0x64/0x68
 [<0002bb10>] kthreadd+0x0/0xec
 [<0003d3f2>] handle_irq_desc+0x1e/0x28
 [<00006d3e>] via1_irq+0x42/0x80
 [<0002bb10>] kthreadd+0x0/0xec
 [<0003d3f2>] handle_irq_desc+0x1e/0x28
 [<00002b58>] do_IRQ+0x20/0x32
 [<00002a58>] auto_irqhandler_fixup+0x4/0xc
 [<000028f8>] ret_from_kernel_thread+0x0/0x14
cblist_init_generic: Setting adjustable number of callback queues.

