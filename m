From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: falconide not registering device nodes
Date: Mon, 4 Sep 2017 11:49:04 +0200
Message-ID: <77f0e192-6f43-ef7e-dfaf-8872ebc49089@physik.fu-berlin.de>
References: <cbac2923-ea1e-47f2-3ac7-88a697b786d9@physik.fu-berlin.de>
 <alpine.LNX.2.00.1709041125280.4359@nippy.intranet>
 <59ca8e07-4e0a-b470-7db3-09aec537a416@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:47694 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753459AbdIDJtH (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 4 Sep 2017 05:49:07 -0400
In-Reply-To: <59ca8e07-4e0a-b470-7db3-09aec537a416@physik.fu-berlin.de>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

On 09/04/2017 09:13 AM, John Paul Adrian Glaubitz wrote:
> On 09/04/2017 04:08 AM, Finn Thain wrote:
>> Did you confirm that the falconide module was actually loaded?
> 
> Yes, you can see the messages from the Falcon IDE driver in the
> screenshot I posted. It loads and detects the hard drive as
> hda and the CD-ROM drive as hdb.

Could it be that the falconide driver is conflicting with the driver
used for the nfhd hard disk inside Aranym?

Adrian

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
