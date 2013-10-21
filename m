From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: Zero Divide in Kernel 3.12-rc4
Date: Mon, 21 Oct 2013 20:34:33 +1300
Message-ID: <f8389c591d50fe216b546e70d464c1f9@biophys.uni-duesseldorf.de>
References: <dbbdc369c25c9eea7abc4ca331128de3@muaddib.hro.localnet>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:55064 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752408Ab3JUHen (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 21 Oct 2013 03:34:43 -0400
Received: by mail-pd0-f176.google.com with SMTP id g10so6261637pdj.7
        for <linux-m68k@vger.kernel.org>; Mon, 21 Oct 2013 00:34:42 -0700 (PDT)
In-Reply-To: <dbbdc369c25c9eea7abc4ca331128de3@muaddib.hro.localnet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?ISO-8859-1?Q?Ingo_J=FCrgensmann?= <ij@2013.bluespice.org>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org, tuomas.vainikka@kopteri.net

Ingo,

this looks like it might be related to the ESP driver - 
scsi_finish_command called from the swapper process during apt-get 
dist-upgrade does seem plausible.

Some of the Amiga SCSI drivers did fiddle with the chip interrupt 
enable on SCSI interrupt entry, but I'd have thought the ESP core is 
reasonably thread-safe these days.

To pinpoint where in sd_completed_bytes this happens, I'd need the 
sd_mod module and the module symbol map.

Cheers,

	MIchael

> I'm testing the ESP SCSI driver port by Tuomas and Michael to 3.12-rc4 
> and got now this kernel panic during heavy disk activity (apt-get 
> dist-upgrade and parallel a rsync backup by BackupPC):
>
> Debian GNU/Linux jessie/sid spice ttyS0
>
> spice login: [77568.070000] *** ZERO DIVIDE ***   FORMAT=2
> [77568.080000] Current process id is 0
> [77568.090000] BAD KERNEL TRAP: 00000000
> [77568.100000] Modules linked in: xt_multiport iptable_filter 
> ip_tables x_tables ipv6 8390 loop evdev dmasound_paula mac_hid 
> dmasound_core parport_amiga soundcore parport amimouse ext3 mbcache 
> jbd dm_mod nbd sg sd_mod zorro7xx 53c700 hydra amiflop a3000
> [77568.320000] PC: [<0484c33a>] sd_completed_bytes+0x90/0xe8 [sd_mod]
> [77568.330000] SR: 2000  SP: 00277e58  a2: 0027e2e4
> [77568.340000] d0: 00000000    d1: 007735a0    d2: 00000000    d3: 
> 00000001
> [77568.350000] d4: 00000000    d5: 007735a8    a0: 024dd000    a1: 
> 024a0ea0
> [77568.360000] Process swapper (pid: 0, task=0027e2e4)
> [77568.370000] Frame format=2 instr addr=0484c336
> [77568.390000] Stack from 00277e90:
>         00000000 08100002 00000000 00000001 00200028 00000004 0249d120 
> 02be3090
>         0272c9e0 00000000 007735a0 00277f04 0484c5f8 0249d120 00277f30 
> 0000000a
>         00276000 00000100 00200000 00000004 0249d120 00001000 02460614 
> 002b9480
>         00002002 00000bb8 0249d100 70040200 00000000 024dd400 0013f838 
> 0249d120
>         00277f30 002b9480 00276000 001d38e2 000e1cec 0249d120 00000001 
> 00276000
>         00277f30 00277f30 0002c8da 002b9480 00272704 0000000f 00002598 
> 08031470
> [77568.950000] Call Trace: [<0484c5f8>] sd_done+0x1d6/0x2aa [sd_mod]
> [77568.970000]  [<00001000>] kernel_pg_dir+0x0/0x1000
> [77568.980000]  [<00002002>] _start+0x2/0x8
> [77568.990000]  [<0013f838>] scsi_finish_command+0x8e/0xb2
> [77569.000000]  [<001d38e2>] printk+0x0/0x24
> [77569.010000]  [<000e1cec>] blk_done_softirq+0x90/0x9c
> [77569.020000]  [<0002c8da>] __do_softirq+0xa2/0x12a
> [77569.030000]  [<00002598>] badsys+0x6/0xa
> [77569.040000]  [<00012b08>] slognd+0x74/0x8a
> [77569.050000]  [<0000ffff>] res_func+0x101f/0x141a
> [77569.060000]  [<001d6944>] schedule_preempt_disabled+0x0/0xe
> [77569.070000]  [<0002ca04>] do_softirq+0x2c/0x32
> [77569.080000]  [<0000264c>] ret_from_exception+0x0/0xc
> [77569.090000]  [<00002598>] badsys+0x6/0xa
> [77569.100000]  [<000454d6>] cpu_startup_entry+0x74/0xd6
> [77569.110000]  [<0002721c>] kernel_thread+0x0/0x24
> [77569.120000]  [<000f0abc>] strlen+0x0/0x14
> [77569.130000]  [<001d307a>] rest_init+0x5e/0x66
> [77569.140000]  [<002ca6e6>] start_kernel+0x38c/0x398
> [77569.150000]  [<000037ee>] setup_rt_frame+0x400/0x4be
> [77569.160000]  [<000037ee>] setup_rt_frame+0x400/0x4be
> [77569.170000]  [<002c8854>] _sinittext+0x854/0x11ac
> [77569.180000]
> [77569.190000] Code: 4a80 6704 4c42 0001 2c01 2207 4c42 1406 <2c00> 
> 2e01 2004 2204 6704 4c42 0001 2801 2205 4c42 1404 2800 2a01 202e fff8 
> 222e
> [77569.350000] Disabling lock debugging due to kernel taint
> [77569.360000] Kernel panic - not syncing: Aiee, killing interrupt 
> handler!
> [77611.970000] amikbd: Ctrl-Amiga-Amiga reset warning!!
>
>
> I don't know whether this is related to the ESP driver or not, but 
> maybe someone is better at reading this kind of output and can judge 
> on this... :-)
>
> -- 
> Ciao...          //    Fon: 0381-2744150
> .     Ingo     \X/     http://blog.windfluechter.net
>
> gpg pubkey: http://www.juergensmann.de/ij_public_key.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" 
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
