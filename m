From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: regression for m68k/coldfire
Date: Fri, 3 Feb 2017 10:10:44 +1000
Message-ID: <89754ce3-1f76-9af1-f3b0-252c1eba94d9@uclinux.org>
References: <20170202201500.GU11210@waldemar-brodkorb.de>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <20170202201500.GU11210@waldemar-brodkorb.de>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/options/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Errors-To: uclinux-dev-bounces@uclinux.org
Sender: uclinux-dev-bounces@uclinux.org
To: Waldemar Brodkorb <wbx@openadk.org>, Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, uclinux-dev@uclinux.org
List-Id: linux-m68k@vger.kernel.org

Hi Waldemar,

On 03/02/17 06:15, Waldemar Brodkorb wrote:
> your commit 80cca775cdc4f8555612d2943a2872076b33e0ff breaks Linux
> booting in qemu-system-m68k:
> 
> qemu-system-m68k -nographic -M mcf5208evb -cpu m5208 -kernel qemu-m68k-mcf5208-initramfspiggyback-kernel
[snip]
> [    3.460000] ColdFire internal UART serial driver
> [    3.470000] mcfuart.0: ttyS0 at MMIO 0xfc060000 (irq = 90,
> base_baud = 2083333) is a ColdFire UART
> [    3.500000] console [ttyS0] enabled
> [    3.500000] mcfuart.0: ttyS1 at MMIO 0xfc064000 (irq = 91,
> base_baud = 2083333) is a ColdFire UART
> [    3.510000] mcfuart.0: ttyS2 at MMIO 0xfc068000 (irq = 92,
> base_baud = 2083333) is a ColdFire UART
> qemu: hardware error: mcf_fec_read: Bad address 0x200
> 
> CPU #0:
> D0 = 00000200   A0 = 4780fdec   F0 = 0000000000000000 (           0)
> D1 = 4780ff94   A1 = 401703de   F1 = 0000000000000000 (           0)
> D2 = 46dbb000   A2 = 4780f800   F2 = 0000000000000000 (           0)
> D3 = 4019d612   A3 = fc030200   F3 = 0000000000000000 (           0)
> D4 = 00000000   A4 = 4019d608   F4 = 0000000000000000 (           0)
> D5 = 40043f7a   A5 = 400222a0   F5 = 0000000000000000 (           0)
> D6 = 400df204   A6 = 4783de78   F6 = 0000000000000000 (           0)
> D7 = 401701c0   A7 = 4783de28   F7 = 0000000000000000 (           0)
> PC = 400e5ff2   SR = 2009 -N--C FPRESULT =            0
> Aborted
> wbx@vopenadk:~/m68k/openadk$     
> wbx@vopenadk:~/m68k/openadk$ qemu-system-m68k --version
> QEMU emulator version 2.8.0
> Copyright (c) 2003-2016 Fabrice Bellard and the QEMU Project
> developers
> 
> Any ideas how to fix it?

This is a limitation in the FEC support in QEMU.
This works on real ColdFire hardware (which do support the
FEC MIB stats registers from offset 0x200 - so not 5272).
I sent this patch to the qemu dev list a couple of weeks
back which fixes qemu:

 http://lists.gnu.org/archive/html/qemu-devel/2017-01/msg01781.html

I do not believe it has been picked up by QEMU mainline yet
(I will probably have to resend and push a little to get that done).

Regards
Greg



_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
