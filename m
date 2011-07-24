From: Matthias Reis <matthias.reis@physik.tu-berlin.de>
Subject: Re: memcpy on 68000
Date: Sun, 24 Jul 2011 19:43:30 +0200
Message-ID: <20110724174330.GA20146@matze-K8NF4G-SATA2>
References: <caf33f7e8bf8202bde374315ce6c0961.squirrel@www.physik.tu-berlin.de>
 <m2pqkzek5w.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.tu-berlin.de ([130.149.7.33]:35748 "EHLO mail.tu-berlin.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751624Ab1GXRnd (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sun, 24 Jul 2011 13:43:33 -0400
Content-Disposition: inline
In-Reply-To: <m2pqkzek5w.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

I'm using gcc 4.2.4

$ /usr/local/m68k-uclinux/bin/gcc --version
gcc (GCC) 4.2.4

downloaded from http://www.uclinux.org/pub/uClinux/m68k-elf-tools/tools-20080626/m68k-uclinux-tools-20080626.sh .

This is the gcc command line for memcpy:

  /usr/local/m68k-uclinux/bin/gcc -Wp,-MD,arch/m68k/lib/.memcpy.o.d  -nostdinc -isystem /usr/local/lib/gcc/m68k-uclinux/4.2.4/include -I/home/unsortiert/linux-m68k/arch/m68k/include -Iarch/m68k/include/generated -Iinclude  -include include/generated/autoconf.h -D__KERNEL__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -O2 -m68000 -mstrict-align -pipe -DUTS_SYSNAME=\"uClinux\" -D__uClinux__ -fno-stack-protector -fno-omit-frame-pointer -fno-optimize-sibling-calls -g -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow    -D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(memcpy)"  -D"KBUILD_MODNAME=KBUILD_STR(memcpy)" -c -o arch/m68k/lib/memcpy.o arch
 /m68k/lib/memcpy.c

As you can see, I tried  -mstrict-align, but I got the same error as previously.

Matthias


On Sun, Jul 24, 2011 at 06:08:11PM +0200, Andreas Schwab wrote:
> "Matthias Reis" <matthias.reis@physik.tu-berlin.de> writes:
> You need to use a compiler that is targeted to uclinux, not linux (the
> latter assumes 68020+, thus disables strict alignment).
> 
> Andreas.
> 
> -- 
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
> "And now for something completely different."
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
