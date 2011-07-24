From: "Matthias Reis" <matthias.reis@physik.tu-berlin.de>
Subject: memcpy on 68000
Date: Sun, 24 Jul 2011 15:50:36 +0200
Message-ID: <caf33f7e8bf8202bde374315ce6c0961.squirrel@www.physik.tu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.tu-berlin.de ([130.149.7.33]:41845 "EHLO mail.tu-berlin.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752748Ab1GXODM (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sun, 24 Jul 2011 10:03:12 -0400
Received: from mail3.physik-pool.tu-berlin.de ([130.149.58.164] helo=mail3.physik.tu-berlin.de)
	by mail.tu-berlin.de (exim-4.75/mailfrontend-4) with esmtp
	for <linux-m68k@vger.kernel.org>
	id 1Qkz5N-0002Ex-CF; Sun, 24 Jul 2011 15:51:13 +0200
Received: from localhost (mail3.physik-pool.tu-berlin.de [130.149.58.164])
	by mail3.physik.tu-berlin.de (Postfix) with ESMTP id 0802A1167B
	for <linux-m68k@vger.kernel.org>; Sun, 24 Jul 2011 15:50:40 +0200 (CEST)
Received: from mail3.physik.tu-berlin.de ([130.149.58.164])
	by localhost (mail3.physik-pool.tu-berlin.de [130.149.58.164]) (amavisd-new, port 10024)
	with ESMTP id PpTXh9eCr+b1 for <linux-m68k@vger.kernel.org>;
	Sun, 24 Jul 2011 15:50:36 +0200 (CEST)
Received: from www.physik.tu-berlin.de (web.physik-pool.tu-berlin.de [130.149.58.160])
	by mail3.physik.tu-berlin.de (Postfix) with ESMTP id 463D111642
	for <linux-m68k@vger.kernel.org>; Sun, 24 Jul 2011 15:50:36 +0200 (CEST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Hi all,

I recently did some work to compile a kernel for MMU less Atari STs.
However, I 'm having a problem with the memcpy code as it is compiled by
gcc. When copying from odd addresses, gcc produces memcpy code that tries
to access odd addresses with move.w, which is not possible on the 68000
and therefore produces address error exceptions. Below you can find the
debug output from the hatari emulator and the memcpy version I'm using (I
hope it's the most recent one). Any help would be appreciated.

Best regards,
Matthias

P.S.: I'm using the -m68000 gcc switch

========

memcpy:

1. CPU breakpoint condition(s) matched 2 times.
        pc = $ae57c

CPU=$ae57c, VBL=1057, FrameCycles=10708, HBL=47, LineCycles=180, DSP=N/A
> c
Returning to emulation...
cpu video_cyc= 10708 180@ 47 : $0ae57c : 4e56 0000                        
   link      a6,#0
cpu video_cyc= 10728 200@ 47 : $0ae580 : 48e7 3030                        
   movem.l   d2-d3/a2-a3,-(sp)
cpu video_cyc= 10768  16@ 48 : $0ae584 : 262e 0008                        
   move.l    8(a6),d3
cpu video_cyc= 10784  32@ 48 : $0ae588 : 266e 000c                        
   movea.l   $c(a6),a3
cpu video_cyc= 10800  48@ 48 : $0ae58c : 242e 0010                        
   move.l    $10(a6),d2
cpu video_cyc= 10816  64@ 48 : $0ae590 : 6752                             
   beq.s     $ae5e4
cpu video_cyc= 10824  72@ 48 : $0ae592 : 0803 0000                        
   btst      #0,d3
cpu video_cyc= 10836  84@ 48 : $0ae596 : 6742                             
   beq.s     $ae5da
cpu video_cyc= 10844  92@ 48 : $0ae5da : 2443                             
   movea.l   d3,a2
cpu video_cyc= 10848  96@ 48 : $0ae5dc : 60c0                             
   bra.s     $ae59e
cpu video_cyc= 10860 108@ 48 : $0ae59e : 7002                             
   moveq     #2,d0
cpu video_cyc= 10864 112@ 48 : $0ae5a0 : b082                             
   cmp.l     d2,d0
cpu video_cyc= 10872 120@ 48 : $0ae5a2 : 6408                             
   bcc.s     $ae5ac
cpu video_cyc= 10880 128@ 48 : $0ae5a4 : 200a                             
   move.l    a2,d0
cpu video_cyc= 10884 132@ 48 : $0ae5a6 : 0800 0001                        
   btst      #1,d0
cpu video_cyc= 10896 144@ 48 : $0ae5aa : 6632                             
   bne.s     $ae5de
cpu video_cyc= 10904 152@ 48 : $0ae5de : 34db                             
   move.w    (a3)+,(a2)+
Address Error at address $12513b, PC=$ae5de

CPU=$ae5de, VBL=1057, FrameCycles=10904, HBL=48, LineCycles=152, DSP=N/A
> cpureg
D0: 0016021a D1: 00000400 D2: 00000016 D3: 0016021a
D4: 001d97c8 D5: 0016021a D6: 00000400 D7: 00132ed8
A0: 00132fac A1: 00000400 A2: 0016021a A3: 0012513b
A4: 0012513b A5: 00125151 A6: 00132e8c A7: 00132e6e
USP=000456f6 ISP=00132e6e MSP=00000000 VBR=00000000
T=00 S=1 M=0 X=0 N=0 Z=0 V=0 C=0 IMASK=7
FP0: 0 FP1: 0 FP2: 0 FP3: 0
FP4: 0 FP5: 0 FP6: 0 FP7: 0
N=0 Z=0 I=0 NAN=0
prefetch 34db5582
000ae5de: 34db 5582 60c8 2003 4cdf MOVE.W (A3)+,(A2)+
next PC: 000ae5e0
> m $12513b
12513B: 41 74 61 72 69 20 68 61 72 64 77 61 72 65 20 66   Atari hardware f
12514B: 6f 75 6e 64 3a 20 00 56 49 44 45 4c 20 00 53 54   ound: .VIDEL .ST
12515B: 44 4d 41 2d 53 43 53 49 20 00 54 54 5f 53 48 49   DMA-SCSI .TT_SHI
12516B: 46 54 45 52 20 00 45 58 54 44 5f 53 48 49 46 54   FTER .EXTD_SHIFT
12517B: 45 52 20 00 53 54 4e 44 5f 53 48 49 46 54 45 52   ER .STND_SHIFTER
12518B: 20 00 53 54 5f 4d 46 50 20 00 54 54 5f 4d 46 50    .ST_MFP .TT_MFP
12519B: 20 00 54 54 5f 53 43 53 49 5f 44 4d 41 20 00 45    .TT_SCSI_DMA .E
1251AB: 58 54 44 5f 44 4d 41 20 00 54 54 5f 53 43 53 49   XTD_DMA .TT_SCSI
>


=========

/*
 * This file is subject to the terms and conditions of the GNU General Public
 * License.  See the file COPYING in the main directory of this archive
 * for more details.
 */

#include <linux/module.h>
#include <linux/string.h>

void *memcpy(void *to, const void *from, size_t n)
{
        void *xto = to;
        size_t temp, temp1;

        if (!n)
                return xto;
        if ((long)to & 1) {
                char *cto = to;
                const char *cfrom = from;
                *cto++ = *cfrom++;
                to = cto;
                from = cfrom;
                n--;
        }
        if (n > 2 && (long)to & 2) {
                short *sto = to;
                const short *sfrom = from;
                *sto++ = *sfrom++;
                to = sto;
                from = sfrom;
                n -= 2;
        }
        temp = n >> 2;
        if (temp) {
                long *lto = to;
                const long *lfrom = from;
#if defined(CONFIG_M68000) || defined(CONFIG_COLDFIRE)
                for (; temp; temp--)
                        *lto++ = *lfrom++;
#else
                asm volatile (
                        "       movel %2,%3\n"
                        "       andw  #7,%3\n"
                        "       lsrl  #3,%2\n"
                        "       negw  %3\n"
                        "       jmp   %%pc@(1f,%3:w:2)\n"
                        "4:     movel %0@+,%1@+\n"
                        "       movel %0@+,%1@+\n"
                        "       movel %0@+,%1@+\n"
                        "       movel %0@+,%1@+\n"
                        "       movel %0@+,%1@+\n"
                        "       movel %0@+,%1@+\n"
                        "       movel %0@+,%1@+\n"
                        "       movel %0@+,%1@+\n"
                        "1:     dbra  %2,4b\n"
                        "       clrw  %2\n"
                        "       subql #1,%2\n"
                        "       jpl   4b"
                        : "=a" (lfrom), "=a" (lto), "=d" (temp), "=&d"
(temp1)
                        : "0" (lfrom), "1" (lto), "2" (temp));
#endif
                to = lto;
                from = lfrom;
        }
        if (n & 2) {
                short *sto = to;
                const short *sfrom = from;
                *sto++ = *sfrom++;
                to = sto;
                from = sfrom;
        }
        if (n & 1) {
                char *cto = to;
                const char *cfrom = from;
                *cto = *cfrom;
        }
        return xto;
}
EXPORT_SYMBOL(memcpy);
