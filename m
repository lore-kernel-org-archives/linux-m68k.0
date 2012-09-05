From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 3/3] Add support to M54xx DMA FEC Driver
Date: Thu, 6 Sep 2012 08:48:00 +1000
Message-ID: <5047D6A0.7000005@snapgear.com>
References: <1345551531-15348-1-git-send-email-stany.marcel@novasys-ingenierie.com> <1345551531-15348-3-git-send-email-stany.marcel@novasys-ingenierie.com> <503C5C5C.8000901@snapgear.com> <20120905091426.GA16015@frolo.macqel> <504758A4.1050607@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <504758A4.1050607@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Philippe De Muyter <phdm@macqel.be>
Cc: Stany MARCEL <stany.marcel@novasys-ingenierie.com>, linux-m68k@lists.linux-m68k.org, geert@linux-m68k.org

On 09/05/2012 11:50 PM, Greg Ungerer wrote:
[snip]
>> I have checked my patch using a recent version of checkpatch.pl (not the
>> v3.5 version, because v3.5 version of checkpatch.pl fails with :
>> Nested quantifiers in regex; marked by <-- HERE in m/(\((?:[^\(\)]++
>> <-- HERE |(
>> ?-1))*\))/ at scripts/checkpatch.pl line 340.))
>>
>> and I am now at :
>>      464 WARNING: line over 80 characters
>>       90 WARNING: Use of volatile is usually wrong: see
>> Documentation/volatile-considered-harmful.txt
>>
>> Many "volatile" warnings are about such definitions :
>>
>> #define FEC_FECFRST(x)                 (*(volatile unsigned int *)(x +
>> 0x1C4))
>> which are afterwards used with
>>
>> +       FEC_FECFRST(base_addr) |= FEC_SW_RST;
>> +       FEC_FECFRST(base_addr) &= ~FEC_SW_RST;
>> +               FEC_FECFRST(base_addr) |= FEC_SW_RST;
>> +               FEC_FECFRST(base_addr) &= ~FEC_SW_RST;
>> +       FEC_FECFRST(base_addr) |= FEC_SW_RST | FEC_RST_CTL;
>> +       FEC_FECFRST(base_addr) &= ~FEC_SW_RST;
>>
>> Any advice about those ones ?
>
> I am glad you brought this one up :-)
> I really don't like the macro use for register access like this.
> What I much prefer is use of the standard read/write functions for this.
>
> So we have sane definitions for register offsets, eg:
>
>      #define FEC_FECFRST        0x1c4
>
> And then use becomes something like:
>
>      frst = __raw_readl(base_addr + FEC_FECFRST);
>      __raw_writel(frst | FEC_SW_RST, base_addr + FEC_FECFRST);
>      __raw_writel(frst & ~FEC_SW_RST, base_addr + FEC_FECFRST);
>     ...
>
> Obviously you need to be careful of requirement to re-read the
> register, I just assumed it wasn't required for this example.
> And we can possibly optimize the address, but you get the idea.
>
> The keeps all the use of volatile hidden away like we want.

I should have been a little more careful here. The use of the
normal versions of the memory access functions is preferred.
So readl() instead of __raw_readl(), etc. Certainly within drivers
we should be using the standard readl/writel/... varients.

There are some situations on some platforms in m68k arch where you
may need to use one of the other variations.

Regards
Greg




------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
