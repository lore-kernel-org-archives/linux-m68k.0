From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Issues with vmalloc and ebtables on ColdFire V4e
Date: Sat, 11 Jun 2016 11:23:59 +0200
Message-ID: <fbca48b5-7a46-c583-7457-372d865e6684@physik.fu-berlin.de>
References: <loom.20160611T070345-553@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:34531 "EHLO
	outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750929AbcFKJYE (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sat, 11 Jun 2016 05:24:04 -0400
In-Reply-To: <loom.20160611T070345-553@post.gmane.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Reid Lindsay <reidlindsay@rallycraft.com>
Cc: linux-m68k@vger.kernel.org

On 06/11/2016 07:54 AM, Reid Lindsay wrote:
> The CPU is the 54415 running a 2.6.38 kernel with BSP patches and bug fixes
> provided by Freescale. 64MiB SRAM and 64MiB NAND Flash. The compiler is GCC
> 4.4.1-cs4.4-54.

Should those patches be merged in the kernel if they fix bugs?

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
