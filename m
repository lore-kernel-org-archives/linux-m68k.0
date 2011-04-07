From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [uClinux-dev] [PATCH] m68k: Merge mmu and non-mmu versions	of
 sys_call_table
Date: Thu, 7 Apr 2011 12:43:07 +1000
Message-ID: <4D9D24BB.3060804@snapgear.com>
References: <alpine.DEB.2.00.1104062231190.11240@ayla.of.borg>	<20110406220510.GA17350@frolo.macqel>	<4D9D0AF3.9070100@snapgear.com> <000301cbf4c9$40339fc0$c09adf40$@com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <000301cbf4c9$40339fc0$c09adf40$@com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uClinux development list <uclinux-dev@uclinux.org>
Cc: Gavin Lambert <gavinl@compacsort.com>, 'Philippe De Muyter' <phdm@macqel.be>, 'Geert Uytterhoeven' <geert@linux-m68k.org>, 'Linux/m68k' <linux-m68k@lists.linux-m68k.org>

Hi Gavin,

On 07/04/11 12:12, Gavin Lambert wrote:
> Quoth Greg Ungerer:
>>>> Impact for m68knommu:
>>>>     - The table is now stored in .data instead of .text,
>>>
>>> Do you mean .rodata ?
> [...]
>> Yes, I suspect that was the original thinking. It has been that way
>> for a very long time (it is in .text in the 2.4 kernel patches for
>> this too).
>>
>> I will test them on m68knommu today, I am sure moving to .data (really
>> rodata) will be fine.
>
> Doesn't that have XIP consequences?  .text (and presumably .rodata) can be
> stored and executed from ROM, since they can't be changed at runtime.  .data
> has to be in RAM, since it can be.

Yes, but even in the kernel XIP case the very early startup code
moves the kernels data to RAM. Well before the system call table
will be needed.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
