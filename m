From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: debian-installer progress and input needed
Date: Tue, 16 May 2017 10:25:57 +0200
Message-ID: <8b61f534-998a-2586-6430-feb656fe2c4e@vivier.eu>
References: <b9651ade-0079-c8c6-40a3-80549f3601c5@physik.fu-berlin.de>
 <CAMuHMdXK2NsfZ8oV2XiDZjMzVWtW=5VViDQ5uqDmuONTphyoBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.73]:53650 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750949AbdEPI0G (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 16 May 2017 04:26:06 -0400
In-Reply-To: <CAMuHMdXK2NsfZ8oV2XiDZjMzVWtW=5VViDQ5uqDmuONTphyoBg@mail.gmail.com>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Le 16/05/2017 à 09:40, Geert Uytterhoeven a écrit :
> Hi Adrian,
> 
> On Mon, May 15, 2017 at 11:21 PM, John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de> wrote:
>> Thus, I would to ask around which modules are needed for the various
>> hardware people have, e.g. SCSI driver for 68k Macs, IDE drivers for
>> Amiga and Atari and so on.
>>
>> The drivers need to be added to the corresponding module list in [2]
>> which will add them to module packages. The module packages then
>> have to be included in the pkg-list for d-i on m68k [3]. Of course,
>> the drivers need to be enabled in the kernel configuration as well.
> 
> You can extract a list of SCSI/IDE drivers needed from the defconfigs at:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/m68k/configs
> 
> All needed drivers should be builtin in the defconfigs above.


So for mac, I think we need:

for disk: esp_scsi, mac_esp, macide, ide-cd_mod, sd_mod, cdrom, sr_mod

for network: macmace, mac89x0, macsonic, mac8390

Laurent
