Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA435139CE3
	for <linux-m68k@lists.linux-m68k.org>; Sun, 29 Dec 2024 12:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735476539; cv=none; b=Vxd9yBGi1/0sve6Q0a4Zw2x1Qdg9t/xTBicaV88q1Vt3LXunY058urr9JYvxFXq0vBz+OevYW8+v+E9/pdN2mJ6yRcKKxvfoivn2xNAg+MmZW2LGqFPO2sfe47aXC8qUQjX1tOZP6DZ6aQ3xqtr7Rm0vpB9sCwS7W7t9kEMOiC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735476539; c=relaxed/simple;
	bh=ixN+hOaBvIW+elMaTd184kqbR7SSPxC/FpKVOrKf2kQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=duTKvCaSZdtDmz1XAfLY6MU26KxOtwHaZK/zD5x62A+EQnY2zfOjfynVcfq1pRIbVYTqLYr5zXAhHu/EjCb21MEt14XEZCexw1MskqBRYR6jmrOW0YEfqZn0SOc3d0aeRKrm4XwJM7AhAlAnEq3fA+1k7DjUY+5D7ZmahMluvsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cRTssVhg; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cRTssVhg"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 104AD1BF203;
	Sun, 29 Dec 2024 12:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735476529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KorW1186MzLDPPPF2ikeoa3nLOcgLvBZg6wPbUIJ5Q4=;
	b=cRTssVhgHejgAB1HtHoJSSlniA9+IQ3KaJzGziMv8R+U9tcXlqFw90j72RUfp3PjzVfap+
	cM1ZkUy1AD+/iqDo728RiJTwPcFAkSFnTcTVHdXQ+LF3WdpW4+qnFYDcqiHo4gmR1ZwkZM
	WBMqW2WP8bqPmKFDxLQCJgJhy/q7w8PyrRLzfbi3Pr0VJVYd6LBBzyZNAt1iKZZGGawHbw
	7J7QcAla4+0Nek+YBQ6u6mpA2ljdUfj3gAhyckHSI5lr+PVm5E4Mv5WqWTBYz2+ggd2d3k
	D6LThQZ4us1r8/I6x6TWbMxDSus+QdEHTYAQCZwKzbeOXvzRzrObHACfG+yNog==
Date: Sun, 29 Dec 2024 13:48:48 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: Build issue "Error: operands mismatch -- statement `movec
 %d2,%caar' ignored" on m68k
Message-ID: <20241229134848.0a1d9719@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.petazzoni@bootlin.com

Hello,

While trying to build the multi_defconfig, from Linux 6.12.5, for a
68040 system, the build fails with:

{standard input}: Assembler messages:
{standard input}:104: Error: operands mismatch -- statement `movec %d2,%caar' ignored
make[5]: *** [scripts/Makefile.build:229: arch/m68k/kernel/sys_m68k.o] Error 1

It seems like the 68020/68030 code:

        if (CPU_IS_020_OR_030) {
                if (scope == FLUSH_SCOPE_LINE && len < 256) {
                        unsigned long cacr;
                        __asm__ ("movec %%cacr, %0" : "=r" (cacr));
                        if (cache & FLUSH_CACHE_INSN)
                                cacr |= 4;
                        if (cache & FLUSH_CACHE_DATA)
                                cacr |= 0x400;
                        len >>= 2;
                        while (len--) {
                                __asm__ __volatile__ ("movec %1, %%caar\n\t"
                                                      "movec %0, %%cacr"
                                                      : /* no outputs */
                                                      : "r" (cacr), "r" (addr));
                                addr += 4;
                        }
                } else {
                        /* Flush the whole cache, even if page granularity requested. */
                        unsigned long cacr;
                        __asm__ ("movec %%cacr, %0" : "=r" (cacr));
                        if (cache & FLUSH_CACHE_INSN)
                                cacr |= 8;
                        if (cache & FLUSH_CACHE_DATA)
                                cacr |= 0x800;
                        __asm__ __volatile__ ("movec %0, %%cacr" : : "r" (cacr));
                }
                ret = 0;
                goto out_unlock;

gets compiled in, and binutils isn't happy about it.

The issue can trivially be reproduced by building the following
Buildroot configuration:

BR2_m68k=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y

Quick recipe:

$ git clone https://gitlab.com/buildroot.org/buildroot.git
$ cd buildroot/
$ cat >.config <<EOF
BR2_m68k=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
EOF
$ make olddefconfig
$ make

Is this expected?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
