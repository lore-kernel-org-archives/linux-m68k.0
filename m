From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: regression for m68k/coldfire
Date: Fri, 3 Feb 2017 16:22:27 +0100
Message-ID: <284adcd2-e18a-5c3b-8e8f-e97a54e5d67d@vivier.eu>
References: <20170202201500.GU11210@waldemar-brodkorb.de>
 <89754ce3-1f76-9af1-f3b0-252c1eba94d9@uclinux.org>
 <7c9fadfa-eaf5-884b-d5d4-d6a1414fb377@physik.fu-berlin.de>
 <d8ae1bac-90c9-3cb3-b6e0-2b2b09cc3db3@vivier.eu>
 <20170203151744.GY11210@waldemar-brodkorb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:60790 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751203AbdBCPXU (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 3 Feb 2017 10:23:20 -0500
In-Reply-To: <20170203151744.GY11210@waldemar-brodkorb.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Greg Ungerer <gerg@uclinux.org>, Nikita Yushchenko <nikita.yoush@cogentembedded.com>, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, geert@linux-m68k.org

Le 03/02/2017 à 16:17, Waldemar Brodkorb a écrit :
> Hi,
> Laurent Vivier wrote,
> 
>> Le 03/02/2017 à 01:35, John Paul Adrian Glaubitz a écrit :
>>> On 02/03/2017 01:10 AM, Greg Ungerer wrote:
>>>> This is a limitation in the FEC support in QEMU.
>>>> This works on real ColdFire hardware (which do support the
>>>> FEC MIB stats registers from offset 0x200 - so not 5272).
>>>> I sent this patch to the qemu dev list a couple of weeks
>>>> back which fixes qemu:
>>>>
>>>>  http://lists.gnu.org/archive/html/qemu-devel/2017-01/msg01781.html
>>>>
>>>> I do not believe it has been picked up by QEMU mainline yet
>>>> (I will probably have to resend and push a little to get that done).
>>>
>>> QEMU upstream can sometimes take a while before they are merging patches,
>>> but usually it helps containing the maintainer of this part of the
>>> source tree directly.
>>>
>>> Unfortunately, mcf5208 is currently unmaintained [1]:
>>>
>>> mcf5208
>>> S: Orphan
>>> F: hw/m68k/mcf5208.c
>>> F: hw/m68k/mcf_intc.c
>>> F: hw/char/mcf_uart.c
>>> F: hw/net/mcf_fec.c
>>>
>>> But you can try getting into touch with Laurent Vivier who is the
>>> new maintainer of the m68k target. I have CC'ed him.
>>>
>>> Adrian
>>>
>>>> [1] http://git.qemu.org/?p=qemu.git;a=blob;f=MAINTAINERS
>>>
>>
>> Use scripts/get_maintainer.pl on your patch to find the people.
>>
>> This patch is on the network part, so you should cc:
>> Jason Wang <jasowang@redhat.com> (odd fixer:Network devices)
>>
>> If you cc me, you add more chances to have a review ;)
> 
> I tried the patch on top of 2.8.0 qemu release and it works for me
> with Linux Kernel 4.9.

If you can send a "Tested-by:" to the mailing list, it would be great.

> Thanks for the hint and patch!
> I hope Greg's patch get included in the next qemu release.
> 
> Btw: Laurent, are you m68k with mmu support are going to be included
> upstream? I always carry an old binary for any m68k with mmu testing.

I'm working to have the FPU included for now, that will allow to have
the linux-user qemu enabled for 680x0 upstream.

I have a 68040 MMU implementation that I will send after this step.
I didn't have a look to the ColdFire MMU (is there one?), but as 68040
is not the same as the 68030 one, I don't expect it works with coldfire.

Laurent
