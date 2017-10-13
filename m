From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: Status of the FB drivers on m68k
Date: Sat, 14 Oct 2017 04:45:02 +1300
Message-ID: <f65ab00c-8dad-f7a4-cba8-14c6d9fe3ce8@gmail.com>
References: <2fd42624-7128-81e5-db7b-e7eed3eaa50c@physik.fu-berlin.de>
 <CAMuHMdWuJ=VWnvky0cpqbed2cQbr63MUijnbAcE-mk7PVpVN0A@mail.gmail.com>
 <90f7b321-207c-fd6d-92ae-f415a7fcf384@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pg0-f45.google.com ([74.125.83.45]:44268 "EHLO
        mail-pg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758184AbdJMPpO (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 13 Oct 2017 11:45:14 -0400
Received: by mail-pg0-f45.google.com with SMTP id j3so1485582pga.1
        for <linux-m68k@vger.kernel.org>; Fri, 13 Oct 2017 08:45:14 -0700 (PDT)
In-Reply-To: <90f7b321-207c-fd6d-92ae-f415a7fcf384@physik.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

Hi Adrian,

>> For CyberVision 64, CyberVision 64/3D, and Retina/Z3, the amount of work
>> shouldn't be that big. Just revert commit e019630e78e3482c, and look how
>> other fbdev driver were converted to the new framework.
> 
> Alright. I hope you, Michael Schmitz and Michael Karcher will be around

Take a look at commit a100501212f2e26bb6d70bfb5c55eefd90e22b65 for the
initial conversion please (use -b -w to cut down on whitespace changes
shown). Warning: lots of formatting changes make this quite hard to follow.

I'm sure I looked at changes to amifb.c to figure out how the fbdev
interface had changed. Haven't found that in current git history but it
should be in the full history tree.

> Ok, I guess the next things to be done then are:
> 
> - Michael Schmitz' ESP driver fixes for the Cyberstorm SCSI

Finn's fixes actually, and no guarantee what I have in mind will
actually work.

> - Michael Karcher's xsurf100 driver
> - fixing Cybervision 64, 64/3D, Retina Z3
> 
> Might also be an idea to have another Linux/m68k meeting to
> get these things done :-).

I won't be back in Europe before July next...

Cheers,

	Michael
