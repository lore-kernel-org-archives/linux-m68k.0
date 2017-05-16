From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: Linux 4.11 FTBFS on m68k
Date: Tue, 16 May 2017 13:58:07 +1200
Message-ID: <CAOmrzk+atqA2s7-tiVN9uhW57uZgMX8gOy_YjjbEqLeE91uy4g@mail.gmail.com>
References: <b9276262-0f50-02c3-1751-344651d7e377@physik.fu-berlin.de>
 <20170512084740.GE29311@physik.fu-berlin.de> <284dc1b1-1fef-90c3-f56f-7927f5bf22b0@gmail.com>
 <m2bmqwot8x.fsf@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:36398 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751602AbdEPB6I (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 15 May 2017 21:58:08 -0400
Received: by mail-it0-f65.google.com with SMTP id z15so12168458ite.3
        for <linux-m68k@vger.kernel.org>; Mon, 15 May 2017 18:58:08 -0700 (PDT)
In-Reply-To: <m2bmqwot8x.fsf@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

Andreas,

On Sun, May 14, 2017 at 6:19 PM, Andreas Schwab <schwab@linux-m68k.org> wrote:
> On Mai 14 2017, Michael Schmitz <schmitzmic@gmail.com> wrote:
>
>> this may be compiler version specific - I recall these functions were
>> used from the kernel source with gcc 3.3.6 or thereabouts (I had to add
>> __divdi3 five years ago for some driver that needed it and it wasn't
>> then provided by gcc for some reason).
>
> The kernel deliberately does not use libgcc, and it does not want a
> 64-bit devision on 32-bit archs.

At that time, it clearly didn't use libgcc. It's hard to be certain
but as far as I can reconstruct, the 64 bit division might have been
required for the isp116x-hcd USB driver (the ndelay used in there,
specifically). The current implementation clearny doesn't need 64 bit
division anymore.

Anyway, I missed the point about the __mode() macro no longer being
found - nothing to do with the arch/m68k/lib functions, nothing to see
here. Sorry about the noise.

Cheers,

  Michael
