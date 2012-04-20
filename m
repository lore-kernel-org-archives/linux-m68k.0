From: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH V2 1/4] vgaarb: Add support for setting the default video device
Date: Fri, 20 Apr 2012 11:49:02 +0100
Message-ID: <CAPM=9tzma3o0aeikrqxadGae7MF_QUeQE0_k2ZkgS2tCOcjn9g@mail.gmail.com>
References: <1334607965-9582-1-git-send-email-mjg@redhat.com>
	<CAMuHMdVYSajTYmfXjtVRXhz0u=xW0LbQ5BxjR=n7PP77o0dXhw@mail.gmail.com>
	<CAMuHMdUsMy1i+DSYt+tjGL-JX+DBY=v1JyMEPSyf8RwYCEkvxg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:61976 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752841Ab2DTKtE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 20 Apr 2012 06:49:04 -0400
In-Reply-To: <CAMuHMdUsMy1i+DSYt+tjGL-JX+DBY=v1JyMEPSyf8RwYCEkvxg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Matthew Garrett <mjg@redhat.com>, linux-kernel@vger.kernel.org, benh@kernel.crashing.org, airlied@redhat.com, Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, Apr 18, 2012 at 10:44 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Wed, Apr 18, 2012 at 11:37, Geert Uytterhoeven <geert@linux-m68k.o=
rg> wrote:
>> On Mon, Apr 16, 2012 at 22:26, Matthew Garrett <mjg@redhat.com> wrot=
e:
>>> --- a/include/linux/vgaarb.h
>>> +++ b/include/linux/vgaarb.h
>>> @@ -31,6 +31,7 @@
>>> =A0#ifndef LINUX_VGA_H
>>> =A0#define LINUX_VGA_H
>>>
>>> +#include <video/vga.h>
>>
>> Is this include really needed? x86_64/allmodconfig builds fine witho=
ut it.
>>
>> It causes m68k/allmodconfig to fail with:
>>
>> In file included from include/linux/vgaarb.h:35,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from drivers/gpu/drm/drm_irq.c:43:
>> include/video/vga.h: In function =91vga_mm_r=92:
>> include/video/vga.h:242: error: implicit declaration of function =91=
z_readb=92
>> include/video/vga.h: In function =91vga_mm_w=92:
>> include/video/vga.h:247: error: implicit declaration of function =91=
z_writeb=92
>> include/video/vga.h: In function =91vga_mm_w_fast=92:
>> include/video/vga.h:253: error: implicit declaration of function =91=
z_writew=92
>> make[1]: *** [drivers/gpu/drm/drm_irq.o] Error 1
>>
>> http://kisskb.ellerman.id.au/kisskb/buildresult/6127136/
>>
>> Currently <video/vga.h> has a crude hack to make cirrusfb work on Am=
iga,
>> but that's the only VGA support m68k has.
>> There's also no <asm/vga.h>, so m68k/allmodconfig with CONFIG_AMIGA
>> disabled now fails with:
>>
>> In file included from include/linux/vgaarb.h:34,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from drivers/gpu/drm/drm_irq.c:42:
>> include/video/vga.h:23:21: error: asm/vga.h: No such file or directo=
ry
>> make[1]: *** [drivers/gpu/drm/drm_irq.o] Error 1
>>
>> Removing the #include <video/vga.h> fixes both cases.
>
> Anyway, I'll move the hack for cirrusfb on Amiga to <asm/vga.h> on m6=
8k.
>
> You still may want to remove the include of <video/vga.h> if it's not=
 needed.

I don't think its necessary, I'm dropping it here. should be gone in
-next soon after.

Dave.
