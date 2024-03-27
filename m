Received: from wfout7-smtp.messagingengine.com (wfout7-smtp.messagingengine.com [64.147.123.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA76722EF4
	for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Mar 2024 23:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711582077; cv=none; b=R5T+PxP1KcwBOdknTnNYHXoi963D9sEtEZO6gF0qFGBTw7C+m1e2Oaw+ucfsI8vjgz+bJCyKIako3KqNy9q95TlQI17P+edvLOtQvvc19Bo85zp3cLo5aibI032l05Jzpu6vbndfrU8XQKnaFtJcX30oOe+bDpDubExbVPfrCvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711582077; c=relaxed/simple;
	bh=qy4N3XryuX0LqlUEtWMbUZM6aUs3eMjfEjQ27D6W4Cg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=su5DaGjQceQKatz2oQXNHItM8LNi62uQhowyLDV8liACjiK53r/ucUelSYS0PnR+cyZdzA1lV+k+1w2HcLVr4eOYKXP9dksOQoiNOgZQCLKJyEF7xIuEaitr7VnFZDdCdXYHe8wSvit5akSjLCWKAYhdIyyvxe6omfwDPR7PZAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DVEYmUQ4; arc=none smtp.client-ip=64.147.123.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DVEYmUQ4"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.west.internal (Postfix) with ESMTP id 2C8E61C000A3;
	Wed, 27 Mar 2024 19:27:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 27 Mar 2024 19:27:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711582072; x=1711668472; bh=PjXC1aOZ0N+DSwhpp+A30TUun8Np
	D4+jxmK7pnnq2TQ=; b=DVEYmUQ4uNfbZZmL8WwVmeu60ssS0ZVRoxjGar3bYGCM
	adJ1jxJ+V0FTGJSUuVuJPfYvdcyijas+m18v/VtxEVEgvGcvKrS8bBT3YM8xlEcF
	Ruotw90rrvn9ZsOn5HYBdd0/0NcmCeKhQ0aGCpeH5MmiVqBwCR676CIFjQLgcUiT
	X6xnCEuA7l3mRp52RgqSjFkG3tDDJRB04voaPOi5YZ1NzZsdM3em07Kby0WAmkq0
	HB4U6U9oNJ/6VMxFmdMF9bX0cUIybDteHXVqLOmd9xaZCKrRtbpaBsAZdGpY07gq
	gq+myHu3Ui8ls0gHucJLybXgquY9tsdAr8zff9naLw==
X-ME-Sender: <xms:eKsEZsTmLghTXOcJ9t8S-UpyoDFkDGP803rbEyzwuf_HFe6W3QRmOA>
    <xme:eKsEZpx18ptRdav-uLwyKUfrWvKFw_eEcXx4WC2CGoNETsy8ywy57SNoiSp2FFwkA
    8htsrTU7fFbTTQ8rw4>
X-ME-Received: <xmr:eKsEZp2TFudHzfv-LiO4k7LNIHtdWhrSiPK784Bs3xWGa7LE0YIP4gKoQkkzasmHh6zAY7mnylMXzrNW526clE14J1e4_ksvGUI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddukedgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:eKsEZgBU2yxeoegl9SCFBx2aIqa7QODlUFZ2LWk_odKMhYEyBPGU5g>
    <xmx:eKsEZliIHtMfmsUJfZ0LKCtuD5FUjMNFg3M16ECklN8FJDFjaPW5eQ>
    <xmx:eKsEZsq5hdR_2GC1nqK4g-MDgrvppap-mbeOnzIivARA4RM1AGW1BQ>
    <xmx:eKsEZogosYZx6R2E_6uwcyVCROyaNVU_W3viaOn6mbAExbtdiTc__Q>
    <xmx:eKsEZqvOe6llHH0Yf5wRI5fZZroiSXR500DqGo-0YVIpuVXma7jXFMpUQ9I>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Mar 2024 19:27:49 -0400 (EDT)
Date: Thu, 28 Mar 2024 10:29:22 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Subject: Spinlock debug, was Re: [PATCH RFC] m68k: skip kernel premption if
 interrupts were disabled
In-Reply-To: <3dee11c5-d0dd-b61e-c7e7-bd12841618ba@gmail.com>
Message-ID: <e926619a-3b6b-8045-8fe1-59bff5e420db@linux-m68k.org>
References: <20240322014805.30606-1-schmitzmic@gmail.com> <fcabda73-4b16-ee2c-e993-2bfcf392a26a@linux-m68k.org> <e89bf618-2fa8-7cbd-16ed-d021a9a7f740@gmail.com> <948c12e4-e85f-a86c-ae95-a1eb03ca026d@gmail.com> <40928e38-0de7-75a6-d5f7-8c913155da03@linux-m68k.org>
 <5e344842-0b19-1f83-dc77-51210a8880c7@gmail.com> <1b9ae156-9dac-b11f-5ddb-fb5878b3c9a9@gmail.com> <acd34add-27af-24a5-9af5-d40cab71c651@linux-m68k.org> <597ab0b3-ac1d-443c-95f7-4f1bbcccae1f@gmail.com> <c8a063a1-c72c-9aed-65fc-b2d87f8c7a9b@linux-m68k.org>
 <546b3960-7a1d-4989-82ee-2d7d56a9d609@gmail.com> <fb93b00e-6cfd-f2a8-7937-1266d7bbfc23@linux-m68k.org> <570d4e69-e73c-4d35-8538-b5530c714c55@gmail.com> <14f7ba29-dc96-1f46-5b5e-aa6c5bb3de3b@linux-m68k.org> <3dee11c5-d0dd-b61e-c7e7-bd12841618ba@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Wed, 27 Mar 2024, Michael Schmitz wrote:

> Now none of this has got us any closer to a solution for the spinlock 
> recursion bug...
> 

It appears that the spinlock recursion check really works: I am able to 
reproduce the following failure every time I paste too much text into the 
qemu console.

This looks like a straight-forward driver bug, whereby the "irq flood" 
printk() results in pmz_console_write() attempting to lock the spinlock 
already locked by pmz_interrupt(). The spinlock at 0x62e140 is the one in 
struct uart_port.

I'll see if I can come up with a driver patch. 

[   14.560000] ttyPZ0: pmz: rx irq flood !
[   14.560000] BUG: spinlock recursion on CPU#0, swapper/0
[   14.560000]  lock: 0x62e140, .magic: dead4ead, .owner: swapper/0, .owner_cpu: 0
[   14.560000] CPU: 0 PID: 0 Comm: swapper Not tainted 6.8.0-mac-dbg-preempt-00004-g4143b7b9144a #1
[   14.560000] Stack from 0059bcc4:
[   14.560000]         0059bcc4 0056316f 0056316f 00002700 004b6444 0059bce4 004ad8c6 0056316f
[   14.560000]         0059bd10 004a6546 00556759 0062e140 dead4ead 0059f892 00000000 00000000
[   14.560000]         0062e140 0059bde8 005c03d0 0059bd24 0004daf6 0062e140 005567bf 0062e140
[   14.560000]         0059bd34 004b64c2 0062e140 00000001 0059bd50 002e15ea 0062e140 00000001
[   14.560000]         0059bde7 0059bde8 005c03d0 0059bdac 0005124e 005c03d0 005cdc00 0000002b
[   14.560000]         005a3caa 005a3caa 00000000 0059bde8 0004ff00 0059be8b 00038200 000529ba
[   14.560000] Call Trace: [<00002700>] ret_from_kernel_thread+0xc/0x14
[   14.560000]  [<004b6444>] _raw_spin_lock+0x0/0x28
[   14.560000]  [<004ad8c6>] dump_stack+0x10/0x16
[   14.560000]  [<004a6546>] spin_dump+0x6e/0x7c
[   14.560000]  [<0004daf6>] do_raw_spin_lock+0x9c/0xa6
[   14.560000]  [<004b64c2>] _raw_spin_lock_irqsave+0x2a/0x34
[   14.560000]  [<002e15ea>] pmz_console_write+0x32/0x9a
[   14.560000]  [<0005124e>] console_flush_all+0x112/0x3a2
[   14.560000]  [<0004ff00>] console_trylock+0x0/0x7a
[   14.560000]  [<00038200>] parameq+0x48/0x6e
[   14.560000]  [<000529ba>] __printk_safe_enter+0x0/0x36
[   14.560000]  [<0005113c>] console_flush_all+0x0/0x3a2
[   14.560000]  [<000542c4>] prb_read_valid+0x0/0x1a
[   14.560000]  [<004b65a4>] _raw_spin_unlock+0x0/0x38
[   14.560000]  [<0005151e>] console_unlock+0x40/0xb8
[   14.560000]  [<00038200>] parameq+0x48/0x6e
[   14.560000]  [<002c778c>] __tty_insert_flip_string_flags+0x0/0x14e
[   14.560000]  [<00051798>] vprintk_emit+0x156/0x238
[   14.560000]  [<00051894>] vprintk_default+0x1a/0x1e
[   14.560000]  [<000529a8>] vprintk+0x74/0x86
[   14.560000]  [<004a6596>] _printk+0x12/0x16
[   14.560000]  [<002e23be>] pmz_receive_chars+0x1cc/0x394
[   14.560000]  [<004b6444>] _raw_spin_lock+0x0/0x28
[   14.560000]  [<00038226>] parse_args+0x0/0x3a6
[   14.560000]  [<004b6466>] _raw_spin_lock+0x22/0x28
[   14.560000]  [<002e26b4>] pmz_interrupt+0x12e/0x1e0
[   14.560000]  [<00048680>] arch_cpu_idle_enter+0x0/0x8
[   14.560000]  [<00054ebc>] __handle_irq_event_percpu+0x24/0x106
[   14.560000]  [<004ae576>] default_idle_call+0x0/0x46
[   14.560000]  [<00055020>] handle_irq_event+0x30/0x90
[   14.560000]  [<00058320>] handle_simple_irq+0x5e/0xc0
[   14.560000]  [<00048688>] arch_cpu_idle_exit+0x0/0x8
[   14.560000]  [<00054800>] generic_handle_irq+0x3c/0x4a
[   14.560000]  [<00002978>] do_IRQ+0x24/0x3a
[   14.560000]  [<004ae508>] cpu_idle_poll.isra.0+0x0/0x6e
[   14.560000]  [<00002874>] auto_irqhandler_fixup+0x4/0xc
[   14.560000]  [<004ae508>] cpu_idle_poll.isra.0+0x0/0x6e
[   14.560000]  [<004ae576>] default_idle_call+0x0/0x46
[   14.560000]  [<004ae598>] default_idle_call+0x22/0x46
[   14.560000]  [<00048710>] do_idle+0x6a/0xf0
[   14.560000]  [<000486a6>] do_idle+0x0/0xf0
[   14.560000]  [<000367d2>] find_task_by_pid_ns+0x0/0x2a
[   14.560000]  [<0005d064>] __rcu_read_lock+0x0/0x12
[   14.560000]  [<00048a5a>] cpu_startup_entry+0x18/0x1c
[   14.560000]  [<00063a06>] __rcu_read_unlock+0x0/0x26
[   14.560000]  [<004ae65a>] kernel_init+0x0/0xfa
[   14.560000]  [<0049c5a8>] strcpy+0x0/0x1e
[   14.560000]  [<004a6584>] _printk+0x0/0x16
[   14.560000]  [<0049c72a>] strlen+0x0/0x22
[   14.560000]  [<006452d4>] memblock_alloc_try_nid+0x0/0x82
[   14.560000]  [<0063939a>] arch_post_acpi_subsys_init+0x0/0x8
[   14.560000]  [<0063991e>] console_on_rootfs+0x0/0x60
[   14.560000]  [<00638410>] _sinittext+0x410/0xadc
[   14.560000] 
