From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Installing with new Installer-Image
Date: Fri, 15 Sep 2017 10:42:02 +0200
Message-ID: <d20ba6f0-08fc-ca49-18bf-3a5801eaa25d@physik.fu-berlin.de>
References: <f9c4e93e-342d-9cd2-e7f3-92829c6f5810@abbuc.de>
 <b5f70ff9-2c86-de2c-5ba7-4b78b4816bd0@physik.fu-berlin.de>
 <98ed5d64-d0d6-799e-a13e-63af27df3a4f@abbuc.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:50789 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750838AbdIOImE (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Fri, 15 Sep 2017 04:42:04 -0400
In-Reply-To: <98ed5d64-d0d6-799e-a13e-63af27df3a4f@abbuc.de>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Stefan Niestegge <beetle@abbuc.de>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On 09/15/2017 10:35 AM, Stefan Niestegge wrote:
> - its possible to "modprobe falconide" as well as cdrom, isofs modules
> - dmesg then shows that my Harddrive and my DVD Burner were found as hda, hdb
> - but no device nodes are created for hda, hdb
Yes, this is what I need to debug next. I had hoped for one of the kernel
people to chime in and give me a hint what we might be missing here.

Geert, maybe?

Adrian

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
