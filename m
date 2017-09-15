From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Installing with new Installer-Image
Date: Fri, 15 Sep 2017 10:54:48 +0200
Message-ID: <0b466484-a032-32e7-8abb-1183758b1fa7@physik.fu-berlin.de>
References: <f9c4e93e-342d-9cd2-e7f3-92829c6f5810@abbuc.de>
 <b5f70ff9-2c86-de2c-5ba7-4b78b4816bd0@physik.fu-berlin.de>
 <98ed5d64-d0d6-799e-a13e-63af27df3a4f@abbuc.de>
 <d20ba6f0-08fc-ca49-18bf-3a5801eaa25d@physik.fu-berlin.de>
 <CAMuHMdWyuGetiYi2NB0ZVH=KyHYsr_io71=aa2AcjvrB_VkHaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:40548 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751146AbdIOIyt (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Fri, 15 Sep 2017 04:54:49 -0400
In-Reply-To: <CAMuHMdWyuGetiYi2NB0ZVH=KyHYsr_io71=aa2AcjvrB_VkHaQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stefan Niestegge <beetle@abbuc.de>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Geert!

On 09/15/2017 10:51 AM, Geert Uytterhoeven wrote:
> The falconide isn't a platform driver with proper MODULE_ALIAS()  yet,
> so its module needs to be loaded based on platform heuristics.
> Recent Debian may no longer have those?

That's the hint I was hoping for :-). Thanks a lot!

I will look into this.

>> Yes, this is what I need to debug next. I had hoped for one of the kernel
>> people to chime in and give me a hint what we might be missing here.
> 
> Do you have
> 
> CONFIG_DEVTMPFS=y
> CONFIG_DEVTMPFS_MOUNT=y
We're missing the latter:

root@pacman:/boot# grep CONFIG_DEVTMPFS config-4.12.0-1-m68k
CONFIG_DEVTMPFS=y
# CONFIG_DEVTMPFS_MOUNT is not set
root@pacman:/boot#

Could that be the root of this issue?

Adrian

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
