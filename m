From: Roger Shimizu <rogershimizu@gmail.com>
Subject: Re: Bug#877735: busybox: m68k build broken due to "-Os" in CFLAGS
Date: Fri, 6 Oct 2017 00:55:51 +0900
Message-ID: <CAEQ9gEmFPeibJUANPFbkTJfjyv6hLOG7Wr=ijyfrVSfRkKPEtw@mail.gmail.com>
References: <150715899716.21351.14956363415364529265.reportbug@stretch64.physik.fu-berlin.de>
 <998e4cf2-07bd-cb2d-1c47-c373372ce3fe@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:38600 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751178AbdJEP4I (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 5 Oct 2017 11:56:08 -0400
Received: by mail-wm0-f65.google.com with SMTP id q124so10120508wmb.5
        for <linux-m68k@vger.kernel.org>; Thu, 05 Oct 2017 08:56:07 -0700 (PDT)
In-Reply-To: <998e4cf2-07bd-cb2d-1c47-c373372ce3fe@physik.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 877735@bugs.debian.org
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Thu, Oct 5, 2017 at 4:25 PM, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> Hi!
>
> On 10/05/2017 01:16 AM, John Paul Adrian Glaubitz wrote:
>>
>> Since busybox is very important to boot the system and get
>> debian-installer working, I would like to ask to have the
>> change from [1] reverted for m68k until we have fixed the
>> potential bug in gcc which most likely mis-compiled busybox.
>
>
> On second thought, I would actually recommended to revert this change
> for all architectures. Size isn't so much a constraint anymore these
> days, you reduce the binary by about 200k. I don't think this is worth
> the risk of breaking something as fundemantal as busybox.

Please exclude armel, which has size limitation on initrd of d-i [0].
Thanks!

[0] https://anonscm.debian.org/cgit/d-i/debian-installer.git/tree/build/boot/arm/qnap-flash-debian#n13

Cheers,
-- 
Roger Shimizu, GMT +9 Tokyo
PGP/GPG: 4096R/6C6ACD6417B3ACB1
