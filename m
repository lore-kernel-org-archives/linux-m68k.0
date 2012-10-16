From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: M54xx FEC and DMA
Date: Tue, 16 Oct 2012 15:44:12 +1000
Message-ID: <507CF42C.2050201@snapgear.com>
References: <1512C13C0C5EA947AE50B9B9AC314F470343F021@ATLAS.pactenovation.fr> <20121015144318.GA12485@frolo.macqel>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:17733 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752611Ab2JPFpi (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 16 Oct 2012 01:45:38 -0400
In-Reply-To: <20121015144318.GA12485@frolo.macqel>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Philippe De Muyter <phdm@macqel.be>
Cc: Stany MARCEL <smarcel@pactenovation.fr>, linux-m68k@vger.kernel.org

Hi Philippe,

On 16/10/12 00:43, Philippe De Muyter wrote:
> Hello Stany,
>
> [CCing linux-m68k@vger.kernel.org]
>
> On Mon, Oct 15, 2012 at 03:37:25PM +0200, Stany MARCEL wrote:
>> Hello,
>>
>>
>>
>> I have sent a patch on linuxm68k mailing list, a few minutes ago, that
>> permits to use your driver correctly with MMU without caching issues.
>>
>>
>>
>> The strategy is to map a memory zone used for dma allocation as non
>> cachable.
>
> Bright idea.
>
>>
>>
>>
>> It is a lot better than a complete flush at each network operation, and
>> correct my issue of lost UDP frames.
>>
>>
>>
>> With this and the read write operation replaced by __raw_* one Your FEC
>> and MCD DMA works very well for me.
>
> Thanks for the positive feedback.
>
> I was not aware of any difference between __raw_writel and writel on m68k.
>
> For the non-MMU case, I see:
> arch/m68k/include/asm/io_no.h:#define __raw_writel writel
>
> but now I have found  for the MMU case:
> arch/m68k/include/asm/io_mm.h:#define writel(val,addr) out_le32((addr),(val))
> arch/m68k/include/asm/raw_io.h:#define __raw_writel(val,addr) out_be32((addr),(val))
>
> and I understand your problem (out_le32 vs out_be32), but I wonder:
> should we not:
>
> - try to understand/fix the difference between __raw_writel and writel in
> CONFIG_MMU case (Greg, Geert ?)

Yes, I figure they should be the same (on ColdFire at least).

Typically you should use writel in a driver. From the kernels documentation,
Documentation/DocBook/deviceiobook.tmpl:

       <para>
         The read and write functions are defined to be ordered. That is the
         compiler is not permitted to reorder the I/O sequence. When the
         ordering can be compiler optimised, you can use <function>
         __readb</function> and friends to indicate the relaxed ordering. Use
         this with care.
       </para>

Whereas __raw_writel is really raw, no ordering, no barriers, no
bye-swapping, no nothing. Just direct write of the register.

Regards
Greg


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
