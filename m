From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [PATCH] [m68k] Atari: support for NetUSBee register access to isp116x.h
Date: Fri, 1 Jun 2012 20:46:38 +0200
Message-ID: <CAOmrzk+2bYgDNtcW6DVy4WYT2i+07n8xR4bbNbwFJ__LWVRfaQ@mail.gmail.com>
References: <CAOmrzkL4BNWr6aLijfpg91m8VKU4A0DRsx1mjOa22qWPrysqtQ@mail.gmail.com>
	<CAMuHMdWpW5aPKasazs2yJX8BZv2F_KXreSAY3+_kXGUqGZVJEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:39323 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932805Ab2FASqi (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 1 Jun 2012 14:46:38 -0400
Received: by dady13 with SMTP id y13so3148755dad.19
        for <linux-m68k@vger.kernel.org>; Fri, 01 Jun 2012 11:46:38 -0700 (PDT)
In-Reply-To: <CAMuHMdWpW5aPKasazs2yJX8BZv2F_KXreSAY3+_kXGUqGZVJEw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>, linux-m68k@vger.kernel.org

Hi Geert,

On Tue, May 29, 2012 at 10:46 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Michael,
>
> On Tue, May 29, 2012 at 12:48 AM, Michael Schmitz
> <schmitzmic@googlemail.com> wrote:
>> the following patch allows selecting the correct register access
>> macros depending on whether the EtherNAT or NetUSBee variant of the
>> ISP1160 chip is used. With this patch applied on top of the previous
>> two, it should be possible to test the NetUSBee USB port.
>
> Thanks!
>
> Just like a few of the previous patches, this one is severely
> white-space damaged :-(

Which ones were affected? (Some were piped straight to sendmail while
others used an e-mail client so I'd like to know what does actually
work)

> In addition, several of the patches showed checkpatch errors.

I need to teach git to run checkpatch for me :-(

> For bedtime reading, I can recommend linux/Documentation/email-clients.txt and
> linux/Documentation/SubmittingPatches.
>
> After some manual fixes, I did manage to apply all of them to my
> private working tree.

Thanks for making the effort!

> Everything builds and boots (on ARAnyM) fine. I will comment on the
> individual patches
> when time permits.

Thanks - this was all tested on the Falcon.

  Michael
