Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18E280039
	for <linux-m68k@lists.linux-m68k.org>; Mon,  3 Jun 2024 10:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717412087; cv=none; b=m0QxxB02EcH/7fr3xu2yY8rnmBm2mwt1CaZ+JQRcBfTLsqMvdRemEl66ciE0I4ZzRc1QsEBZipror0+CDbXZePcRG7f93YAWkXsiNe1TwAj54HNEnakvJSloX3fnlbIcjuC8Rdegh7GdMDE1iYq35NWrz8RtfZBgmeewoXf6w7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717412087; c=relaxed/simple;
	bh=NxXnokSScbZWVs10SkkwDmpI2FrV3OrHru58UHKw0Ng=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=H+bXaCVVqbJt38oaCzFc88QvDLrNIvPrL9T0VkTZGHaD/m4m1qkwL+TB6xJ15pTvEy3Xx4amRHkymJA8o5CVS6NoPbAeO0xC9AgkHvVAXhUIaV/HR0QsfRTGyz+plQuMXy9TVenogbV+o+U4zWNPy/e1DsCZssI+paYkV4zwU3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=I+4h1msj; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="I+4h1msj"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D0992000F;
	Mon,  3 Jun 2024 10:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1717412076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V1b1LIc/VDVnb0pDLE2qK4eyoiFudmKo9uU3pl3fRBM=;
	b=I+4h1msjRtdjIzhUJY1rj920T4sIwBdv4RAUPmxh7LCBMKmNths4eIbDa/nr/MpNi09byb
	TBm/Squmu/IDw97z/FXmI8RjsGsKWZlOLo5qu5gB1h3Ds8TKcwBhdFrcNbrcqS+M06BqgT
	X/6koA2LpdMIIUoBqlDOJUIi1sVRX38SWZ6b12wVrWvHngTf8fHGH74X3tbJUCRc9MM1D+
	rBv3gWQAnZdyyvkwbQt1vJem4iqBWrUhG4LWZZ6lekySAEPG0paWnhGvMMfjczVsjK32QR
	nyfdLDrCID1RFuLOnHaxQjp85CijM/wKx/x9+aPVKOw/bvqi936ZSYjblMDJug==
Message-ID: <82ba7ea3-d290-494c-b3e3-93d9dc7c6c0d@yoseli.org>
Date: Mon, 3 Jun 2024 12:54:36 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Subject: m54418: ELF execution issues
To: linux-m68k@lists.linux-m68k.org
Cc: geert@linux-m68k.org, Michael Schmitz <schmitzmic@gmail.com>
References: <68ec857f-a559-4f71-87ba-425b4ee7c9c7@yoseli.org>
 <d18dab84-f6d8-4732-88cb-8b95bd4487f3@gmail.com>
 <45745b6a-341c-4f9c-8787-6154393d1223@yoseli.org>
Content-Language: en-US
In-Reply-To: <45745b6a-341c-4f9c-8787-6154393d1223@yoseli.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Hi there !

I managed to get really far in my boot process, as I can now try to 
execute bash. I had to change the elf.h file because if I don't do that, 
it is not working.

Here is the diff (on v6.9.1):
diff --git a/arch/m68k/include/asm/elf.h b/arch/m68k/include/asm/elf.h
index 2def06a99b08..38acb928fa81 100644
--- a/arch/m68k/include/asm/elf.h
+++ b/arch/m68k/include/asm/elf.h
@@ -78,8 +78,10 @@ typedef struct user_m68kfp_struct elf_fpregset_t;
     the loader.  We need to make sure that it is out of the way of the 
program
     that it will "exec", and that there is sufficient room for the brk.  */

-#ifndef CONFIG_SUN3
+#if !defined(CONFIG_SUN3) && !defined(CONFIG_COLDFIRE)
  #define ELF_ET_DYN_BASE         0xD0000000UL
+#elif defined(CONFIG_COLDFIRE)
+#define ELF_ET_DYN_BASE                (TASK_UNMAPPED_BASE + 0x10000000)
  #else
  #define ELF_ET_DYN_BASE         0x0D800000UL
  #endif

Without the patch:
[    3.020000] Freeing unused kernel image (initmem) memory: 96K
[    3.030000] This architecture does not have kernel memory protection.
[    3.030000] Run /bin/bash as init process
[    3.320000] Kernel panic - not syncing: Requested init /bin/bash 
failed (error -12).
[    3.320000] CPU: 0 PID: 1 Comm: bash Not tainted 
6.9.2stmark2-001-00013-gcf0217bae3ae #285
[    3.320000] Stack from 41845f70:
[    3.320000]         41845f70 413bccd1 413bccd1 00000001 413f2700 
41008a68 413151f2 413bccd1
[    3.320000]         4130e630 41845fb0 413f2700 00000003 00000001 
4130eeda 00000000 00000000
[    3.320000]         41315a2e 413b303d 4febbf1e fffffff4 4131598e 
410033f4 00000000 00000000
[    3.320000]         00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[    3.320000]         00000000 00000000 00002000 00000000
[    3.320000] Call Trace: arch_local_irq_disable 
(./arch/m68k/include/asm/irqflags.h:20)
[    3.320000] dump_stack (lib/dump_stack.c:124)
[    3.320000] panic (kernel/panic.c:267 kernel/panic.c:369)
[    3.320000] _printk (kernel/printk/printk.c:2368)
[    3.320000] kernel_init (init/main.c:1500)
[    3.320000] kernel_init (init/main.c:1436)
[    3.320000] ret_from_kernel_thread (arch/m68k/kernel/entry.S:142)
[    3.320000]
[    3.320000] ---[ end Kernel panic - not syncing: Requested init 
/bin/bash failed (error -12). ]---

With the patch, the /bin/bash file is executed, but then any command 
will fail with a segfault:

[    3.000000] Freeing unused kernel image (initmem) memory: 96K
[    3.010000] This architecture does not have kernel memory protection.
[    3.020000] Run /bin/bash as init process
bash: cannot set terminal process group (-1): Inappropriate ioctl for device
bash: no job control in this shell
bash-5.2# ls
bin      home     linuxrc  opt      run      tmp
dev      lib      media        7.250000] Unable to handle kernel NULL 
pointer dereference at virtual address 00000000
[    7.250000] Oops: 00000000
[    7.250000] PC: 0x0
[    7.250000] SR: 2000  SP: (ptrval)  a2: 41c58000
[    7.250000] d0: 00000028    d1: 00000003    d2: 6017a000    d3: 414d9419
[    7.250000] d4: 41b5c800    d5: 4fed3730    a0: 00000000    a1: 413227a0
[    7.250000] Process ls (pid: 27, task=(ptrval))
[    7.250000] Frame format=4 eff addr=41055826 pc=420516cc
[    7.250000] Stack from 41b85dfc:
[    7.250000]         4fed3730 41b85f1e 4106e3ac 4fed3730 00000000 
ffffffff fffffffe 41b85ea2
[    7.250000]         6017e000 00000001 412fbafc 4106dfe4 412fbafc 
4fed3730 00000001 41b85ea2
[    7.250000]         41b90600 6017e000 41b90600 41b6c340 6017dfff 
41b84000 41b6c36c 00000000
[    7.250000]         00000000 00000000 00000000 41b85f60 4106e5ea 
41b85f1e 41b5c800 6017a000
[    7.250000]         6017e000 41b85ea2 41b6c36c 41b85efa 41b85f1e 
4102a3e8 41b6c344 41b5c4c0
[    7.250000]         41b6c340 41b50000 00000100 00000003 41073130 
41b85f1e 41b85efa 41b5c4c0
[    7.250000] Call Trace: unmap_page_range (mm/memory.c:1482 
mm/memory.c:1563 mm/memory.c:1605 mm/memory.c:1722 mm/memory.c:1751 
mm/memory.c:1772 mm/memory.c:1793)
[    7.250000] mas_find (lib/maple_tree.c:6061)
[    7.250000] unmap_page_range (mm/memory.c:1782)
[    7.250000] mas_find (lib/maple_tree.c:6061)
[    7.250000] unmap_vmas (mm/memory.c:1839 mm/memory.c:1883)
[    7.250000] up_read (kernel/locking/rwsem.c:1620)
[    7.250000] exit_mmap (./include/linux/mmap_lock.h:173 mm/mmap.c:3268)
[    7.250000] arch_local_irq_enable 
(./arch/m68k/include/asm/irqflags.h:35)
[    7.250000] arch_local_irq_disable 
(./arch/m68k/include/asm/irqflags.h:20)
[    7.250000] __mmput (kernel/fork.c:1348)
[    7.250000] do_exit (./arch/m68k/include/asm/thread_info.h:46 
kernel/exit.c:570 kernel/exit.c:865)
[    7.250000] sys_exit_group (kernel/exit.c:1038 kernel/exit.c:1036)
[    7.250000] do_group_exit (kernel/exit.c:1008)
[    7.250000] pid_child_should_wake (kernel/exit.c:1503)
[    7.250000] system_call (arch/m68k/coldfire/entry.S:80)
[    7.250000]
[ 7.250000] Code: ffff ffff ffff ffff ffff ffff ffff ffff Bad PC value.
m68k-buildroot-linux-gnu-objdump: '/tmp/tmp.vO4KvxtnKV.o': No such file

Code starting with the faulting instruction
===========================================
[    7.250000] Disabling lock debugging due to kernel taint
[    7.250000] note: ls[27] exited with irqs disabled

Is there a compiler to use ? I built one with buildroot, but maybe is 
there a gcc version somewhere to use for the Coldfire 54418 ? Could it 
be related ?

Thanks,
JM
