From: Maxim Kuvyrkov <maxim@codesourcery.com>
Subject: Re: M68k tree updates
Date: Mon, 30 Nov 2009 16:43:28 +0300
Message-ID: <4B13CC00.9080607@codesourcery.com>
References: <alpine.DEB.2.00.0911252213340.31650@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.codesourcery.com ([38.113.113.100]:57054 "EHLO
	mail.codesourcery.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753284AbZK3Nnc (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 30 Nov 2009 08:43:32 -0500
In-Reply-To: <alpine.DEB.2.00.0911252213340.31650@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

Geert Uytterhoeven wrote:
> It took me a while, but finally I managed to update
> http://git.kernel.org/?p=linux/kernel/git/geert/linux-m68k.git again.
...
> If anything is missing, please tell me. Thx!

How about the NPTL patch (0001-Add-NPTL-support-for-m68k.patch,
http://marc.info/?l=linux-m68k&m=125447760017098&w=2)?

Also, this trivial fix (0004-Fix-m68k-s-asm-swab.h-for-ColdFire.patch, 
http://marc.info/?l=linux-m68k&m=125447494213740&w=2) can go in.

Thanks!

-- 
Maxim Kuvyrkov
CodeSourcery
maxim@codesourcery.com
(650) 331-3385 x724
