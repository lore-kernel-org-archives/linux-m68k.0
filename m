From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [000/121] 3.2.51-rc1 review
Date: Sun, 08 Sep 2013 09:52:08 -0700
Message-ID: <522CAB38.2010909@roeck-us.net>
References: <lsq.1378608720.401499712@decadent.org.uk> <522C22DB.9080008@roeck-us.net> <CAMuHMdW6TGdfi+FH=hRWY_hhs5Cb5N9xV1OL0O9Dcs+PfXm2xA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.active-venture.com ([67.228.131.205]:64373 "EHLO
	mail.active-venture.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755374Ab3IHQwK (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 Sep 2013 12:52:10 -0400
In-Reply-To: <CAMuHMdW6TGdfi+FH=hRWY_hhs5Cb5N9xV1OL0O9Dcs+PfXm2xA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@uclinux.org>, Ben Hutchings <ben@decadent.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On 09/08/2013 01:18 AM, Geert Uytterhoeven wrote:
> On Sun, Sep 8, 2013 at 9:10 AM, Guenter Roeck <linux@roeck-us.net> wrote:
>> m68k-linux-ld: error: no memory region specified for loadable section
>> `.note.gnu.build-id'
>
> I can't seem to find an explicit fix for that since v3.2.
> Perhaps the fix is a side effect of f84f52a5c15db7d14a534815f27253b001735183
> ("m68knommu: clean up linker script").
>

Kind of. Turns out it requires the following patches.

40c1b9cf (m68k: consolidate the vmlinux.lds linker scripts)
ed865e31 (m68k: use non-MMU linker script for ColdFire MMU builds)
f84f52a5 (m68knommu: clean up linker script)

With those patches applied, all my m68k builds (mmu and nommu) pass with 3.2.

Guenter
