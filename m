From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v3 0/4] Atari kernel-in-FastRAM patches v3
Date: Tue, 27 May 2014 09:58:00 +1200
Message-ID: <CAOmrzkJFqR4FzKaQGwa9vjzCM+OEP2mre=qRWuxbeH-imPhEXQ@mail.gmail.com>
References: <1396253168-25601-1-git-send-email-schmitz@debian.org>
	<CAMuHMdVcn2sRZXvSTWQay879maoUbxB46n2w7E9S8jRuWPfniw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:57208 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752191AbaEZV6B (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 26 May 2014 17:58:01 -0400
Received: by mail-ob0-f174.google.com with SMTP id uz6so8546753obc.33
        for <linux-m68k@vger.kernel.org>; Mon, 26 May 2014 14:58:01 -0700 (PDT)
In-Reply-To: <CAMuHMdVcn2sRZXvSTWQay879maoUbxB46n2w7E9S8jRuWPfniw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

Hi Geert,

On Tue, May 27, 2014 at 8:56 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Michael,
>
> On Mon, Mar 31, 2014 at 10:06 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
>> changes to stram.c and atafb.c patches as requested. The external_addr
>> case is still untested - may have other bugs that I've not seen when
>> changing the external_addr types.
>>
>> CC to the relevant lists for floppy and SCSI patches.
>
> Thanks, applied and queued for 3.16.

Thank you - anyone testing these please note that the Falcon SCSI DMA
dribble buffer handling in the SCSI patch is still faulty. You should
_not_ attempt to use SCSI when running the kernel in FastRAM.

Cheers,

  Michael
