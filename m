From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: Linux 4.11 FTBFS on m68k
Date: Sun, 14 May 2017 15:11:24 +1200
Message-ID: <284dc1b1-1fef-90c3-f56f-7927f5bf22b0@gmail.com>
References: <b9276262-0f50-02c3-1751-344651d7e377@physik.fu-berlin.de>
 <20170512084740.GE29311@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pg0-f53.google.com ([74.125.83.53]:34777 "EHLO
        mail-pg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757197AbdENDLc (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 13 May 2017 23:11:32 -0400
Received: by mail-pg0-f53.google.com with SMTP id u28so45687289pgn.1
        for <linux-m68k@vger.kernel.org>; Sat, 13 May 2017 20:11:32 -0700 (PDT)
In-Reply-To: <20170512084740.GE29311@physik.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Linux/m68k <linux-m68k@vger.kernel.org>
Cc: Debian m68k <debian-68k@lists.debian.org>

Hi Adrian,

this may be compiler version specific - I recall these functions were
used from the kernel source with gcc 3.3.6 or thereabouts (I had to add
__divdi3 five years ago for some driver that needed it and it wasn't
then provided by gcc for some reason). WIth gcc version 4, the need for
this hack was gone.

What version of gcc does Debian use for building their kernel packages?
What did you use?

Cheers,

	Michael


Am 12.05.2017 um 20:47 schrieb John Paul Adrian Glaubitz:
> On Sun, May 07, 2017 at 03:16:41PM +0200, John Paul Adrian Glaubitz wrote:
>> Just noticed that currently the 4.11 kernel fails to build from source
>> on m68k [1]:
> 
> Ok, this problem is actually Debian-specific. Debian's linux source
> package contains a patch which removes the necessary #include
> directive for <linux/compiler.h> [1].
> 
> I'll open a bug report.
> 
> Adrian
> 
>> [1] https://anonscm.debian.org/cgit/kernel/linux.git/tree/debian/patches/bugfix/m68k/revert-m68k-move-exports-to-definitions.patch#n150
> 
