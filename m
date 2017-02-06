From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: regression for m68k/coldfire
Date: Mon, 6 Feb 2017 21:40:53 +1000
Message-ID: <90077125-b947-6370-9155-ed67cc8af194@uclinux.org>
References: <20170202201500.GU11210@waldemar-brodkorb.de>
 <89754ce3-1f76-9af1-f3b0-252c1eba94d9@uclinux.org>
 <7c9fadfa-eaf5-884b-d5d4-d6a1414fb377@physik.fu-berlin.de>
 <d8ae1bac-90c9-3cb3-b6e0-2b2b09cc3db3@vivier.eu>
 <20170203151744.GY11210@waldemar-brodkorb.de>
 <284adcd2-e18a-5c3b-8e8f-e97a54e5d67d@vivier.eu>
 <9e1036e6-5e75-6b7b-4387-9360826e2620@uclinux.org>
 <0ae968cb-9870-0247-fd16-78e113256bfc@vivier.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out4.external.iinet.net.au ([203.59.1.220]:38763
        "EHLO icp-osb-irony-out4.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751496AbdBFLk7 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 6 Feb 2017 06:40:59 -0500
In-Reply-To: <0ae968cb-9870-0247-fd16-78e113256bfc@vivier.eu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Laurent Vivier <laurent@vivier.eu>
Cc: Waldemar Brodkorb <wbx@openadk.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Nikita Yushchenko <nikita.yoush@cogentembedded.com>, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, geert@linux-m68k.org

Hi Laurent,

On 04/02/17 19:49, Laurent Vivier wrote:
> Le 04/02/2017 à 03:03, Greg Ungerer a écrit :
>> Hi Laurent,
>>
>> On 04/02/17 01:22, Laurent Vivier wrote:
>>> Le 03/02/2017 à 16:17, Waldemar Brodkorb a écrit :
>> [snip]
>>>> Btw: Laurent, are you m68k with mmu support are going to be included
>>>> upstream? I always carry an old binary for any m68k with mmu testing.
>>>
>>> I'm working to have the FPU included for now, that will allow to have
>>> the linux-user qemu enabled for 680x0 upstream.
>>>
>>> I have a 68040 MMU implementation that I will send after this step.
>>> I didn't have a look to the ColdFire MMU (is there one?), but as 68040
>>> is not the same as the 68030 one, I don't expect it works with coldfire.
>>
>> There is a ColdFire MMU in some v4 ColdFire parts, for example
>> the 547x, 548x, 5441x and 5445x families. It is not compatible with
>> the older 68020/86030/68040 MMU. It is supported in mainline Linux -
>> at least for the 547x and 548x parts.
>>
>> It would be really nice to have support for ColdFire MMU in QEMU :-)
>
> I can work on this. Do you have a Coldfire distro I can install?

This is the one I use:

   http://www.uclinux.org/pub/uClinux/dist/

(toolchains for it at http://www.uclinux.org/pub/uClinux/m68k-elf-tools/)

Or if you don't want to compile it there is a ready to
run binary for the m5475evb at:

   http://www.uclinux.org/ports/coldfire/binary.html

Regards
Greg
