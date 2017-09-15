From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Installing with new Installer-Image
Date: Fri, 15 Sep 2017 21:32:56 +1000 (AEST)
Message-ID: <alpine.LNX.2.00.1709152126230.3@nippy.intranet>
References: <f9c4e93e-342d-9cd2-e7f3-92829c6f5810@abbuc.de> <b5f70ff9-2c86-de2c-5ba7-4b78b4816bd0@physik.fu-berlin.de> <98ed5d64-d0d6-799e-a13e-63af27df3a4f@abbuc.de> <d20ba6f0-08fc-ca49-18bf-3a5801eaa25d@physik.fu-berlin.de>
 <CAMuHMdWyuGetiYi2NB0ZVH=KyHYsr_io71=aa2AcjvrB_VkHaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:44778 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751198AbdIOLcw (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 15 Sep 2017 07:32:52 -0400
In-Reply-To: <CAMuHMdWyuGetiYi2NB0ZVH=KyHYsr_io71=aa2AcjvrB_VkHaQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Stefan Niestegge <beetle@abbuc.de>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Fri, 15 Sep 2017, Geert Uytterhoeven wrote:

> CONFIG_DEVTMPFS_MOUNT=y
> 

It wasn't needed with QEMU, so I doubt that it is needed with Aranym. 
systemd seems to have mounted /dev regardless. I mentioned this in the 
other thread:

# grep devtmpfs /proc/mounts
devtmpfs /dev devtmpfs rw,relatime,size=500196k,nr_inodes=125049,mode=755 0 0

-- 
