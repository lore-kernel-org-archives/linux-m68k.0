Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8012199E94
	for <linux-m68k@lists.linux-m68k.org>; Sat,  6 Sep 2025 11:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757159463; cv=none; b=hGu/gJvHzpgdN7CBs7v6pDSKMhqcvnbrsx2MrURNyJ4w9447OjOd64n/+lopdj0R+/538YRaSwlVhA44BZfDc8vsjBV62l0oX3mlkDJKYmn996nJKsuVGysxKf8PPbiQhBfiqcYfljIAvlXvjWEc0XF/MVp2hDLnKs4sIyv+PU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757159463; c=relaxed/simple;
	bh=4oHasEn5OXPJ/cQaCoFhbbU2K1czV6PUa4jgYC+S/Wo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tACnQ4kf7/FxH5r57Gwr8+uLI9X9vFsCF07WodzrAw0D5oXJKx5BXzEzgVsrCOVvCS/SNSXTdnq/S2BzTi2ZWoy+5bg4zBMtdQORjL3yjGTvuOLEiSx7cjcVCw555RKuXxxc2XLYRTVoKJqxPN9DjWDJhMSByuRcHbK0xj3Oj7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUV4Oi1k; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUV4Oi1k"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3dae49b1293so1594395f8f.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 06 Sep 2025 04:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757159460; x=1757764260; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUaDtuHpdIHoQ02i3VuBf1I08ziCp5/BpFxGCKCp2lU=;
        b=PUV4Oi1kRfVhE2lvMiZtXoXfnDiQauOxS38N9i2GDDtOAR75+sB6tKIFSERMEJZcHB
         ihFPLy5U6lTU+ZaYWvZFl5UUo42LhdYEuG4mntcyIGOikNW0a2i2GpslGEMwElpII/rK
         pTjKzl5W8Z13jzpfHbTs4NFaJLxCfoufjElF/7UsbOfoYJon898jQk1+96nl05Hznt3b
         vpLwqBAD+iK3bSUB/VgGBZ+RjmHnrtXVBS6+czDRc3rvlkSw4QtI79MQFetilKJVTmyD
         3MYNJORQDRxfhmGSHdC45ElXnDa1/HXJB/PuZSkJnOitT77gs0wi1w263aErk3ajN0F3
         0qew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757159460; x=1757764260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CUaDtuHpdIHoQ02i3VuBf1I08ziCp5/BpFxGCKCp2lU=;
        b=GB2QEWiBUpH1aUWT9/jwuOmBsCtCL2b/XKGUCaAYXvFdfRmpVYb+4+Lmv06l3+DakZ
         mke8i+RyHYGuM3Uu0YKFEgInaghqkALmh8nTG95BBrqV12ghDD0B+I+HJxXctY+HWg3T
         CeoAU2hTl4eD0RdL7nqFj/o2Fll6qtPXOXlMblIxeLU8TW7b1/KYwLFlA34BdftILPY3
         G6roOfhCSOPw1PuHV5J188RzFLLJANmtCb2I2cx9X0sUAPW4WdamyEtFOy4uT+62jlU0
         4R58eku512jidM2y0u2h3yRuVhnscLLyLo5Vpr4QFvNkzdeJDODw2xwFFNo9+w/U5r9u
         8Z9A==
X-Forwarded-Encrypted: i=1; AJvYcCUp+HIYWXBko5ypkFPn2qe0IowNP0YOQ5/7L106xtpjqej5uQUkR78LNIr9Nucn8Q7EdEE+qAVyxOIC@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzmU22zOzVJFKBJNB1ZLhDyxV3zTUKZHY0SlGYJk2GIP8QDsjQF
	RnJktRoUaddO3e+IOtkDytf5YE+Y8SAqfi5g53AnoHf5m9G1E+uGJECF
X-Gm-Gg: ASbGncsXTge3fkbQRb0F0kwlHHuMNVr8lRpdS+gWGVaXGcgwlo9LtZTFBynRTBTCc3i
	BkaPREnl7Wh7HQ6PLll4inIm+PMnhXZfRdYodePUKs95OT83LXeGid9nqbPRkHeVKLK+8h0cSwW
	yV03fAXalUXTusyZXF0WpZeYC2kRi6+2S+J9UCgIQV60a5kn/gGsDXmqJdB7+d4DMflPJ+vb2Vy
	4j+Qh+BwYzgBa7BVChR0XvKOYlkixbg5MWDsGmKOQBHSC2wQQ9PNR7Lnd8TuLNfyfEqlhgXPCg1
	ZILGLuXg8GEQ1CvI8p8fYteBWNxOT6ih+Tv7TQ9rQBcykQNH+JPz3Bt2473AznMehNET88aDPq6
	PrRlQJerQP+Sp9a1LQ7/2G2SjJpAsQQ5P7yUaEn4DeY293fT6iBarK8nVykNnH7TIQ8S5kh5agA
	o=
X-Google-Smtp-Source: AGHT+IGxoOhEYaH0dHcrYZ/ok6TExgsHzb59UQdVzAOZIhNKTfXT6tMptBV2Ewpb8OttN+jwhRNdiA==
X-Received: by 2002:a05:6000:26ce:b0:3d3:8711:d934 with SMTP id ffacd0b85a97d-3e63736edd3mr1455201f8f.14.1757159459866;
        Sat, 06 Sep 2025 04:50:59 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9a6ecfafsm210514535e9.21.2025.09.06.04.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 04:50:59 -0700 (PDT)
Date: Sat, 6 Sep 2025 12:50:58 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Eero Tamminen <oak@helsinkinet.fi>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Finn Thain
 <fthain@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, Lance
 Yang <lance.yang@linux.dev>, Masami Hiramatsu <mhiramat@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH] atomic: Specify natural alignment for atomic_t
Message-ID: <20250906125058.1139346d@pumpkin>
In-Reply-To: <617b6c79-2d66-467f-89a0-79d2d2efb714@helsinkinet.fi>
References: <7d9554bfe2412ed9427bf71ce38a376e06eb9ec4.1756087385.git.fthain@linux-m68k.org>
	<1a5ce56a-d0d0-481e-b663-a7b176682a65@helsinkinet.fi>
	<CAMuHMdUKgMfL+1EnkZbbqNqTv4aMs_XWocXxq5jVGeOMaQXnDQ@mail.gmail.com>
	<617b6c79-2d66-467f-89a0-79d2d2efb714@helsinkinet.fi>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 1 Sep 2025 18:12:53 +0300
Eero Tamminen <oak@helsinkinet.fi> wrote:

> Hi Geert,
> 
> On 1.9.2025 11.51, Geert Uytterhoeven wrote:
> >> On 23.8.2025 10.49, Lance Yang wrote:  
> >>   > Anyway, I've prepared two patches for discussion, either of which should
> >>   > fix the alignment issue :)
> >>   >
> >>   > Patch A[1] adjusts the runtime checks to handle unaligned pointers.
> >>   > Patch B[2] enforces 4-byte alignment on the core lock structures.
> >>   >
> >>   > Both tested on x86-64.
> >>   >
> >>   > [1]  
> >> https://lore.kernel.org/lkml/20250823050036.7748-1-lance.yang@linux.dev  
> >>   > [2] https://lore.kernel.org/lkml/20250823074048.92498-1-
> >>   > lance.yang@linux.dev  
> >>
> >> Same goes for both of these, except that removing warnings makes minimal
> >> kernel boot 1-2% faster than 4-aligning the whole struct.  
> 
> Note that above result was from (emulated) 68030 Falcon, i.e. something 
> that has really small caches (256-byte i-/d-cache), *and* a kernel 
> config using CONFIG_CC_OPTIMIZE_FOR_SIZE=y (with GCC 12.2).

If you are emulating it on x86 the misaligned memory accesses are
likely to be zero cost.
On a real '030 I'd expect them to be implemented as two memory accesses.
I also doubt (but a guess) that the emulator even attempts to emulate
the '030 caches. If they are like the '020 ones the i-cache really
only helps short loops.

It is more likely that the cost of WARN_ON_ONCE() is far more than
you might expect.
Especially since it will affect register allocation in the function(s).

	David

> 
> 
> > That is an interesting outcome! So the gain of naturally-aligning the
> > lock is more than offset by the increased cache pressure due to wasting
> > (a bit?) more memory.  
> 
> Another reason could be those extra inlined warning checks in:
> -----------------------------------------------------
> $ git grep -e hung_task_set_blocker -e hung_task_clear_blocker kernel/
> kernel/locking/mutex.c: hung_task_set_blocker(lock, BLOCKER_TYPE_MUTEX);
> kernel/locking/mutex.c: hung_task_clear_blocker();
> kernel/locking/rwsem.c:         hung_task_set_blocker(sem, 
> BLOCKER_TYPE_RWSEM_READER);
> kernel/locking/rwsem.c:         hung_task_clear_blocker();
> kernel/locking/rwsem.c:         hung_task_set_blocker(sem, 
> BLOCKER_TYPE_RWSEM_WRITER);
> kernel/locking/rwsem.c:         hung_task_clear_blocker();
> kernel/locking/semaphore.c:     hung_task_set_blocker(sem, 
> BLOCKER_TYPE_SEM);
> kernel/locking/semaphore.c:     hung_task_clear_blocker();
> -----------------------------------------------------
> 
> 
> > Do you know what was the impact on total kernel size?  
> 
> As expected, kernel code size is smaller with the static inlined warn 
> checks removed:
> -----------------------------------------------------
> $ size vmlinux-m68k-6.16-fix1 vmlinux-m68k-6.16-fix2
>     text	   data	    bss	    dec	    hex	filename
> 3088520	 953532	  84224	4126276	 3ef644	vmlinux-m68k-6.16-fix1  [1]
> 3088730	 953564	  84192	4126486	 3ef716	vmlinux-m68k-6.16-fix2  [2]
> -----------------------------------------------------
> 
> But could aligning of structs have caused 32 bytes moving from BSS to 
> DATA section?
> 
> 
> 	- Eero
> 
> PS. I profiled these 3 kernels on emulated Falcon. According to (Hatari) 
> profiler, main difference in the kernel with the warnings removed, is it 
> doing less than half of the calls to  NCR5380_read() / 
> atari_scsi_reg_read(), compared to the other 2 versions.
> 
> These additional 2x calls in the other two versions, seem to mostly come 
> through chain originating from process_scheduled_works(), 
> NCR5380_poll_politely*() functions and bus probing.
> 
> After quick look at the WARN_ON_ONCE()s and SCSI code, I have no idea 
> how having those checks being inlined to locking functions, or not, 
> would cause a difference like that.  I've tried patching & building 
> kernels again, and repeating profiling, but result is same.
> 
> While Hatari call (graph) tracking might have some issue (due to kernel 
> stack return address manipulation), I don't see how there could be a 
> problem with the profiler instruction counts.  Kernel code at given 
> address does not change during boot in monolithic kernel, (emulator) 
> profiler tracks _every_ executed instruction/address, and it's clearly 
> correct function:
> ------------------------------------
> # disassembly with profile data: <instructions percentage>% (<sum of 
> instructions>, <sum of cycles>, <sum of i-cache misses>, <sum of d-cache 
> hits>)  
> ...
> atari_scsi_falcon_reg_read:
> $001dd826  link.w    a6,#$0      0.43% (414942, 1578432, 44701, 0)
> $001dd82a  move.w    sr,d1       0.43% (414942, 224, 8, 0)
> $001dd82c  ori.w     #$700,sr    0.43% (414942, 414368, 44705, 0)
> $001dd830  move.l    $8(a6),d0   0.43% (414942, 357922, 44705, 414911)
> $001dd834  addi.l    #$88,d0     0.43% (414942, 1014804, 133917, 0)
> $001dd83a  move.w    d0,$8606.w  0.43% (414942, 3618352, 89169, 0)
> $001dd83e  move.w    $8604.w,d0  0.43% (414942, 3620646, 89162, 0)
> $001dd842  move.w    d1,sr       0.43% (414942, 2148, 142, 0)
> $001dd844  unlk      a6          0.43% (414942, 436, 0, 414893)
> $001dd846  rts                   0.43% (414942, 1073934, 134123, 414942)
> atari_scsi_falcon_reg_write:
> $001dd848  link.w    a6,#$0      0.00% (81, 484, 29, 0)
> $001dd84c  move.l    $c(a6),d0   0.00% (81, 326, 29, 73)
> ...
> ------------------------------------
> 
> Maybe those WARN_ON_ONCE() checks just happen to slow down something 
> marginally so that things get interrupted & re-started more for the SCSI 
> code?
> 
> PPS. emulated machine has no SCSI drives, only one IDE drive (with 4MB 
> Busybox partition):
> ----------------------------------------------------
> scsi host0: Atari native SCSI, irq 15, io_port 0x0, base 0x0, can_queue 
> 1, cmd_per_lun 2, sg_tablesize 1, this_id 7, flags { }
> atari-falcon-ide atari-falcon-ide: Atari Falcon and Q40/Q60 PATA controller
> scsi host1: pata_falcon
> ata1: PATA max PIO4 cmd fff00000 ctl fff00038 data fff00000 no IRQ, 
> using PIO polling
> ...
> ata1: found unknown device (class 0)
> ata1.00: ATA-7: Hatari  IDE disk 4M, 1.0, max UDMA/100
> ata1.00: 8192 sectors, multi 16: LBA48
> ata1.00: configured for PIO
> ...
> scsi 1:0:0:0: Direct-Access     ATA      Hatari  IDE disk 1.0  PQ: 0 ANSI: 5
> sd 1:0:0:0: [sda] 8192 512-byte logical blocks: (4.19 MB/4.00 MiB)
> sd 1:0:0:0: [sda] Write Protect is off
> sd 1:0:0:0: [sda] Mode Sense: 00 3a 00 00
> sd 1:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't 
> support DPO or FUA
> sd 1:0:0:0: [sda] Preferred minimum I/O size 512 bytes
> sd 1:0:0:0: [sda] Attached SCSI disk
> VFS: Mounted root (ext2 filesystem) readonly on device 8:0.
> ---------------------------------------------------
> 

