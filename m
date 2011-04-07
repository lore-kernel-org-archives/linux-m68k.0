From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [uClinux-dev] [PATCH] m68k: Merge mmu and non-mmu versions of
 sys_call_table
Date: Thu, 7 Apr 2011 10:53:07 +1000
Message-ID: <4D9D0AF3.9070100@snapgear.com>
References: <alpine.DEB.2.00.1104062231190.11240@ayla.of.borg> <20110406220510.GA17350@frolo.macqel>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20110406220510.GA17350@frolo.macqel>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Philippe De Muyter <phdm@macqel.be>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: uClinux development list <uclinux-dev@uclinux.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>

On 07/04/11 08:05, Philippe De Muyter wrote:
> On Wed, Apr 06, 2011 at 10:33:07PM +0200, Geert Uytterhoeven wrote:
>> Impact for m68knommu:
>>    - The table is now stored in .data instead of .text,
>
> Do you mean .rodata ?
>
>>    - Removed unused padding at the end of the table.
>>
>> Signed-off-by: Geert Uytterhoeven<geert@linux-m68k.org>
>> ---
>> Not tested on m68knommu
>>
>> Questions:
>>    - Why was it .text?
>
> Probably because it is constanti (read-only).

Yes, I suspect that was the original thinking. It has been that way
for a very long time (it is in .text in the 2.4 kernel patches for
this too).

I will test them on m68knommu today, I am sure moving to .data (really
rodata) will be fine.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
