From: Angelo Dureghello <angelo@sysam.it>
Subject: Re: gcc-4.6.3, was Re: Debian on mac68k
Date: Mon, 7 Nov 2016 10:35:06 +0100
Message-ID: <5873dbec-38c0-7f7f-4a6b-68c5deb546be@sysam.it>
References: <574C132F.3070404@abbuc.de> <574C15C2.90908@abbuc.de>
 <ec5ded9d-b3c0-0bba-65b7-1e4d2cc063a2@physik.fu-berlin.de>
 <574C1792.4030403@abbuc.de> <57557722.5040808@yahoo.com>
 <alpine.LNX.2.00.1610251358330.443@nippy.intranet>
 <5810FA8D.4060702@yahoo.com> <58114F74.40408@yahoo.com>
 <alpine.LNX.2.00.1610271244020.21780@nippy.intranet>
 <5811F96F.3090602@yahoo.com> <58121D46.8060506@yahoo.com>
 <alpine.LNX.2.00.1611052134280.2870@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sysam.it ([5.39.81.93]:37740 "EHLO sysam.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751970AbcKGJfK (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 7 Nov 2016 04:35:10 -0500
In-Reply-To: <alpine.LNX.2.00.1611052134280.2870@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>, debian-68k@lists.debian.org, linux-m68k@vger.kernel.org

Hi Finn,

On 06/11/2016 03:03, Finn Thain wrote:
>
> Has anyone else tried the m68k cross-compiler from kernel.org and observed
> strange behaviour from the binaries it produces?
>
> I used that cross-compiler (the i686 one) to build the kernel seen booting
> below. The resulting binary consistently crashes two different systems (LC
> III and LC 475), both during kernel startup. These two machines use
> different drivers and have different failure modes, but the failures are
> completely repeatable. The failures went away when I reverted to my usual
> (patched) gcc-4.4.6.
>
> Perhaps gcc-4.6.3 is more strict than gcc-4.4, in such a way that would
> affect code generation, when presented with incorrect or undefined code?
> Are there any warnings that could be enabled to discover that code?
>
> Is there some way to run the GCC test suite against this cross-compiler?
>

I also observed issues with some kernel.org toolchains, at least for coldfire
the 4.9.x was producing some wrong opcode, due to incorrect gcc libs used
over linking.

Maybe you can try some toolchains i prepared, they are the kernel.org with
some packaging adjustments done by me. Let me know in case if they work
for you.


http://sysam.it/toolchains.html

Regards,
Angelo Durgehello
