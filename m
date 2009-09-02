From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [uClinux-dev] ltib vs uclinux-dist
Date: Wed, 02 Sep 2009 22:24:04 +1000
Message-ID: <4A9E63E4.9090803@snapgear.com>
References: <20090812194002.GA2309@frolo.macqel>	<4A9D0350.9050402@snapgear.com>	<20090901115206.GA12946@frolo.macqel> <200909011134.13102.sfking@fdwdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <200909011134.13102.sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uClinux development list <uclinux-dev@uclinux.org>
Cc: linux-m68k@lists.linux-m68k.org

Hi Steven,

On 09/02/2009 04:34 AM, Steven King wrote:
> On Tuesday 01 September 2009 04:52:06 Philippe De Muyter wrote:
>
>>> Longer term I think we need to fully merge m68k and m68knommu
>>> before we push any MMU ColdFire patches to mainline.
>>
>> I fully agree with that.
>>
>> Who is currently working on the m68k/m68knommu merge ?
>> Is there a mailing-list, website or other network resource about that ?
>> The arch trees of m68k and m68knommu have different structures.  What will
>> the structure of the merged tree look like ?
>
> I've been looking at this, and while I dont have anything ready yet, it doesnt
> seem too difficult.
>
> m68knommu/configs and platform can be merged directly into m68k; its the files
> in kernel, lib and mm and especially the m68k Kconfig and Makefile that require
> some effort.  The trivial approach would be to do some thing similar to what
> was done for the include files: append a suffix of _no to the m68knommu version
> of the file and _mm to the m68k version and then have a wrapper that uses
> #ifdef __uClinux__ to select between the two.

You want to use CONFIG_MMU as the decider in most situations.
The exception is header files that will be used outside of the kernel.

But otherwise yes, we could do a dumb merge and then clean up.


> Of course that doesn't gain us much, except once we then fixup Kconfig and
> Makefile and have a working build, we can then incrementally merge each of the
> files in kernel, lib and mm while testing with a working build.

It hasn't worked out too bad from my point of view in the header
file merge. Initially there was a lot of separate files, but wihtout
too much effort I have that done to only a dozen or so now.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
