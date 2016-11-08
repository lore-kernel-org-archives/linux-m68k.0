From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: gcc-4.6.3, was Re: Debian on mac68k
Date: Tue, 8 Nov 2016 10:05:56 +0100
Message-ID: <ea450097-fdfc-800a-a28f-79b086ba7eac@physik.fu-berlin.de>
References: <574C132F.3070404@abbuc.de> <574C15C2.90908@abbuc.de>
 <ec5ded9d-b3c0-0bba-65b7-1e4d2cc063a2@physik.fu-berlin.de>
 <574C1792.4030403@abbuc.de> <57557722.5040808@yahoo.com>
 <alpine.LNX.2.00.1610251358330.443@nippy.intranet>
 <5810FA8D.4060702@yahoo.com> <58114F74.40408@yahoo.com>
 <alpine.LNX.2.00.1610271244020.21780@nippy.intranet>
 <5811F96F.3090602@yahoo.com> <58121D46.8060506@yahoo.com>
 <alpine.LNX.2.00.1611052134280.2870@nippy.intranet>
 <5873dbec-38c0-7f7f-4a6b-68c5deb546be@sysam.it>
 <alpine.LNX.2.00.1611082000250.11408@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:50948 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932489AbcKHJF7 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 8 Nov 2016 04:05:59 -0500
In-Reply-To: <alpine.LNX.2.00.1611082000250.11408@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>, Angelo Dureghello <angelo@sysam.it>
Cc: debian-68k@lists.debian.org, linux-m68k@vger.kernel.org

On 11/08/2016 10:01 AM, Finn Thain wrote:
> The only problem is that my fast Linux host is i686 and your compiler runs 
> on x86_64. But it is a convenient way to get hold of a gcc-5.2 compiler to 
> target m68k/coldfire.

Installing Debian testing and running

	apt install gcc-5-m68k-linux-gnu

is not an option?

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
