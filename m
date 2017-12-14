From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: m68k v3.16 status update
Date: Fri, 15 Dec 2017 10:49:20 +1100 (AEDT)
Message-ID: <alpine.LNX.2.21.1712151039050.3@nippy.intranet>
References: <CAMuHMdXodxq=Z8rQAZ7UUdzUzoPfQLFCSTkJziVeAsq8MMQxmQ@mail.gmail.com> <53E48C84.9090709@gmail.com> <53E4DDF1.9060701@kopteri.net> <53E54E6C.2040806@gmail.com> <53E5C3A7.3040106@kopteri.net> <68e92278-86e7-faef-f5b2-fbc514c27464@gmail.com>
 <4403d779c1664692ae5a7ef5b69ec888@aalto.fi> <CAOmrzkJJXZb153ig=d=Cywr59hid7X3UJvUD-wgtYtZm7KsCuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:37826 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754246AbdLNXtK (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 14 Dec 2017 18:49:10 -0500
In-Reply-To: <CAOmrzkJJXZb153ig=d=Cywr59hid7X3UJvUD-wgtYtZm7KsCuQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Vainikka Tuomas <tuomas.vainikka@aalto.fi>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>

On Fri, 15 Dec 2017, Michael Schmitz wrote:

> Hi Tuomas,
> 
> fair enough - I'll get the PIO code tested by forcing PIO transfers on 
> elgar, and submit the driver for review once that's done.

You might need to instrument the esp_reconnect_with_tag() code path to 
confirm that elgar's scsi disks exercise the new code. I'd probably just 
set esp_scsi.esp_debug=0x200 (that is, ESP_DEBUG_RECONNECT). But watch out 
for /var/log/kern.log, in case it is on a scsi disk...

-- 

> Maybe someone else has a chance to test the fix in the meantime.
> 
> Cheers,
> 
>   Michael
> 
> 
