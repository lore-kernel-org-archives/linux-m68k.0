From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: regression for m68k/coldfire
Date: Fri, 3 Feb 2017 09:18:31 +0100
Message-ID: <d8ae1bac-90c9-3cb3-b6e0-2b2b09cc3db3@vivier.eu>
References: <20170202201500.GU11210@waldemar-brodkorb.de>
 <89754ce3-1f76-9af1-f3b0-252c1eba94d9@uclinux.org>
 <7c9fadfa-eaf5-884b-d5d4-d6a1414fb377@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.73]:58277 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751866AbdBCISq (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 3 Feb 2017 03:18:46 -0500
In-Reply-To: <7c9fadfa-eaf5-884b-d5d4-d6a1414fb377@physik.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Greg Ungerer <gerg@uclinux.org>, Waldemar Brodkorb <wbx@openadk.org>, Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, geert@linux-m68k.org

Le 03/02/2017 à 01:35, John Paul Adrian Glaubitz a écrit :
> On 02/03/2017 01:10 AM, Greg Ungerer wrote:
>> This is a limitation in the FEC support in QEMU.
>> This works on real ColdFire hardware (which do support the
>> FEC MIB stats registers from offset 0x200 - so not 5272).
>> I sent this patch to the qemu dev list a couple of weeks
>> back which fixes qemu:
>>
>>  http://lists.gnu.org/archive/html/qemu-devel/2017-01/msg01781.html
>>
>> I do not believe it has been picked up by QEMU mainline yet
>> (I will probably have to resend and push a little to get that done).
> 
> QEMU upstream can sometimes take a while before they are merging patches,
> but usually it helps containing the maintainer of this part of the
> source tree directly.
> 
> Unfortunately, mcf5208 is currently unmaintained [1]:
> 
> mcf5208
> S: Orphan
> F: hw/m68k/mcf5208.c
> F: hw/m68k/mcf_intc.c
> F: hw/char/mcf_uart.c
> F: hw/net/mcf_fec.c
> 
> But you can try getting into touch with Laurent Vivier who is the
> new maintainer of the m68k target. I have CC'ed him.
> 
> Adrian
> 
>> [1] http://git.qemu.org/?p=qemu.git;a=blob;f=MAINTAINERS
> 

Use scripts/get_maintainer.pl on your patch to find the people.

This patch is on the network part, so you should cc:
Jason Wang <jasowang@redhat.com> (odd fixer:Network devices)

If you cc me, you add more chances to have a review ;)

Thanks,
Laurent
