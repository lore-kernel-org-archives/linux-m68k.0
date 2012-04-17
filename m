From: Brad Boyer <flar@allandria.com>
Subject: Re: Atari ROM port ISA
Date: Mon, 16 Apr 2012 22:05:00 -0700
Message-ID: <20120417050500.GA14387@cynthia.pants.nu>
References: <alpine.DEB.2.00.1204151113430.31626@ayla.of.borg>
 <4F8BCF49.4060109@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4F8BCF49.4060109@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>

On Mon, Apr 16, 2012 at 07:50:33PM +1200, Michael Schmitz wrote:
> >arch/m68k/include/asm/io_mm.h:
> >
> >| #define enec_isa_read_base  0xfffa0000
> >| #define enec_isa_write_base 0xfffb0000
> >|
> >| #define ENEC_ISA_IO_B(ioaddr)   (enec_isa_read_base+((((unsigned long)(ioaddr))&0x1F)<<9))
> >| #define ENEC_ISA_IO_W(ioaddr)   (enec_isa_read_base+((((unsigned long)(ioaddr))&0x1F)<<9))
> >| #define ENEC_ISA_MEM_B(madr)    (enec_isa_read_base+((((unsigned long)(madr))&0x1F)<<9))
> >| #define ENEC_ISA_MEM_W(madr)    (enec_isa_read_base+((((unsigned long)(madr))&0x1F)<<9))
> >
> >So ISA memory space accesses (isa_readX()) are implemented the same as ISA I/O
> >space accesses? That can't work. Or are they not supported?
> 
> There's no distinct 'IO' or 'memory' space on the ROM port adapter,
> it's all memory mapped on ROM port addresses. How does access to ISA
> card mem regions work on ix86? Different address range, or different
> instructions?

The real x86 instruction set has separate instructions to access any
ports in the IO space (in and out). The instruction also has an access
width field, which most assemblers encode into the instruction (leading
to the inb,inw,outb,outw in assembly listings). This carried forward
into PCI as well, which allows for separate IO and memory access.

Most non-x86 implementations of ISA (and PCI) just map the IO ports
onto some otherwise unused address range in the normal memory space.

	Brad Boyer
	flar@allandria.com
