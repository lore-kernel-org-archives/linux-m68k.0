From: Reid Lindsay <reidlindsay@rallycraft.com>
Subject: Re: Issues with vmalloc and ebtables on ColdFire V4e
Date: Sun, 12 Jun 2016 12:20:52 +1000
Message-ID: <8b213da6-fbfe-f55e-b5c1-b6a2a0ee87c4@rallycraft.com>
References: <loom.20160611T070345-553@post.gmane.org>
 <fbca48b5-7a46-c583-7457-372d865e6684@physik.fu-berlin.de>
 <9b4733d6-fe6d-a27b-aa59-c3285b1fb917@rallycraft.com>
 <575C0ECB.3050600@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from se6-syd.hostedmail.net.au ([103.252.152.54]:56972 "EHLO
	se6-syd.hostedmail.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753029AbcFLCVK (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 11 Jun 2016 22:21:10 -0400
In-Reply-To: <575C0ECB.3050600@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-m68k@vger.kernel.org

On 11/06/2016 11:14 PM, Greg Ungerer wrote:
> On 11/06/16 21:51, Reid Lindsay wrote:
>> On 11/06/2016 7:23 PM, John Paul Adrian Glaubitz wrote:
>>> On 06/11/2016 07:54 AM, Reid Lindsay wrote:
>>>> The CPU is the 54415 running a 2.6.38 kernel with BSP patches and bug
>>>> fixes
>>>> provided by Freescale. 64MiB SRAM and 64MiB NAND Flash. The compiler
>>>> is GCC
>>>> 4.4.1-cs4.4-54.
>>> Should those patches be merged in the kernel if they fix bugs?
>>>
>>> Adrian
>> Yes, absolutely. We are considering starting a project to upgrade our
>> kernel, and I would be happy to contribute any patches and bug fixes
>> which result from this effort.
>>
>> The Freescale (now NXP) BSP for ColdFire was last updated in Oct 2011,
>> and as far as I can tell, there has been no effort to merge patches into
>> the mainline kernel. The BSP can be found here:
>> http://www.nxp.com/products/software-and-tools/run-time-software/linux-software-and-development-tools/bsps-for-coldfire-architectures:CW_BSP_COLDFIRE. 
>>
>> In response to bugs we discovered in the DMA and Ethernet drivers,
>> Freescale directly provided us with some additional patches on top of
>> this BSP. Judging by the website, these patches have not yet been
>> released publicly. Some effort will be required to port them to mainline
>> (if indeed they are still relevant) given the m68k code has diverged
>> somewhat.
>
> The mainline support for v4e is not directly based on Freescales
> changes - though it does contain some parts of code they developed.
> And mainline doesn't currently support the 54415. (There are some
> patches that are close but not quite there yet).
>
> Have you tried asking Freescale?
> After all you are using code and patches they supplied.
>
> Regards
> Greg

I have examined the code in mainline and it is, as you say, close but 
not quite there yet. I have borrowed some parts of mainline code to 
improve our platform over the years.

Asking Freescale is the next step. Arm twisting may be required as they 
no longer provide ongoing support for this BSP. And it gets us no closer 
to moving towards a more recent kernel.

Incidentally, our board has been stable since 2012, this issue only came 
to light once ebtables was enabled.

Reid
