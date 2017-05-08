From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Linux 4.11 FTBFS on m68k
Date: Mon, 8 May 2017 19:34:53 +0200
Message-ID: <d3e6c705-199f-7b36-d661-a05bba522220@physik.fu-berlin.de>
References: <b9276262-0f50-02c3-1751-344651d7e377@physik.fu-berlin.de>
 <87y3u8ir4n.fsf@linux-m68k.org>
 <CAMuHMdWaHer3uRU-bj0tKCtFs0myb0VKHMK=KE8OjR-=iac76A@mail.gmail.com>
 <87zienuue5.fsf@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:45582 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753819AbdEHRe4 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 8 May 2017 13:34:56 -0400
In-Reply-To: <87zienuue5.fsf@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

On 05/08/2017 07:32 PM, Andreas Schwab wrote:
> "Looks like we need to add __attribute__ here, don't we?" is obviously
> wrong.

I was just briefly glancing over it. After look at the commit you linked
and reading through the patch, I'm actually surprised that it doesn't work
because __mode() is defined as a macro in compiler-gcc.h to yield the
necessary __attribute__(__mode()) when gcc is used.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
