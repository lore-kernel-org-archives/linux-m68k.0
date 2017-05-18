From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: debian-installer progress and input needed
Date: Thu, 18 May 2017 17:37:24 +1200
Message-ID: <fa9f1a35-ba34-0e81-68ba-20fd63a2a7d6@gmail.com>
References: <b9651ade-0079-c8c6-40a3-80549f3601c5@physik.fu-berlin.de>
 <a86ad435-c026-55cb-5a0e-d2797e23736b@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pg0-f42.google.com ([74.125.83.42]:33182 "EHLO
        mail-pg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753607AbdERFhb (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 18 May 2017 01:37:31 -0400
Received: by mail-pg0-f42.google.com with SMTP id u187so17497448pgb.0
        for <linux-m68k@vger.kernel.org>; Wed, 17 May 2017 22:37:31 -0700 (PDT)
In-Reply-To: <a86ad435-c026-55cb-5a0e-d2797e23736b@physik.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Debian m68k <debian-68k@lists.debian.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Adrian,

Am 18.05.2017 um 00:24 schrieb John Paul Adrian Glaubitz:
> Ok, let's get some order into this.
> 
> I have already opened a bug report to include loop-modules [1].
> 
> Then, looking at the module packages on m68k [2] and powerpc [3],
> I suggest to add the following new packages first:
> 
> - affs-modules (to allow d-i to mount Amiga filesystems)
> - hfs-modules (to allow d-i to mount MacOS filesystems)
> - pata-modules
> - scsi-core-modules (for sd_mod and scsi_mod)
> 
> nic-shared-modules should be renamed to nic-modules. Note that most
> NIC modules are already added, see [4]. Also, many generic drivers
> are added by merely including them with "#include <module package>"
> which includes them from [5]. So, please, if you suggest additional
> modules, please make sure not to put modules on the list which
> we already have, either directly or through #include.
> 
> To nic-modules, we should add:
> 
> - macmace

Atari needs:
ne (CONFIG_NE2000=m, CONFIG_ATARI_ETHERNEC=y, CONFIG_ATARI_ROM_ISA=y)
smc91x (CONFIG_SMC91X=m, CONFIG_ATARI_ETHERNAT=y)

smc91x is already included, but the current modules list still contains
atari_ethernec. This one has been superseded by the 'ne' module which is
already built for Amiga anyway. Please remove atari_ethernec.

Note that the config options CONFIG_ATARI_ETHERNEC and
CONFIG_ATARI_ETHERNAT have to be set in addition to the module options
in order to provide the platform device data for these cards.

There may be other config options that are needed to select the above
network drivers - I can send my .config used on my Falcon in case there
are any doubts.

> 
> To pata-modules, we should add:
> 
> - gayle
> - ide-cd_mod
> - macide
> - swim_mod (although this is a floppy module)

Atari needs:
falconide (CONFIG_BLK_DEV_FALCON_IDE=m) unless it's compiled in.

Cheers,

	Michael

> 
> To scsi-modules, we should add:
> 
> - atari_scsi
> - esp_scsi
> - mac_esp
> - mac_scsi
> 
> Did I miss anything?
> 
> Adrian
> 
>> [1] http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=862813
>> [2]
> https://anonscm.debian.org/cgit/kernel/linux.git/tree/debian/installer/m68k/modules/m68k
>> [3]
> https://anonscm.debian.org/cgit/kernel/linux.git/tree/debian/installer/powerpc/modules/powerpc
>> [4]
> https://anonscm.debian.org/cgit/kernel/linux.git/tree/debian/installer/m68k/modules/m68k/nic-shared-modules
>> [5]
> https://anonscm.debian.org/cgit/kernel/linux.git/tree/debian/installer/modules
> 
