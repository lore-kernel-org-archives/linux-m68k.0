From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Aranym, more than 244MB FastRAM, garbled display
Date: Wed, 6 Oct 2010 09:22:11 +0000
Message-ID: <Pine.BSM.4.64L.1010060910520.21623@herc.mirbsd.org>
References: <alpine.LNX.2.00.1010011728270.4788@halbrend.uninett.no>
 <m2tyl5u9hu.fsf@igel.home> <alpine.LNX.2.00.1010011908550.4788@halbrend.uninett.no>
 <Pine.BSM.4.64L.1010041947160.3776@herc.mirbsd.org>
 <AANLkTinq7CXPpYVfAYhgH9ea1FQs_f+AhYsU1-+ZdUx+@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:46490 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932375Ab0JFJW2 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Wed, 6 Oct 2010 05:22:28 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1P3QCd-0005XT-72
	for linux-m68k@vger.kernel.org; Wed, 06 Oct 2010 11:22:23 +0200
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Wed, 06 Oct 2010 11:22:23 +0200
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Wed, 06 Oct 2010 11:22:23 +0200
In-Reply-To: <AANLkTinq7CXPpYVfAYhgH9ea1FQs_f+AhYsU1-+ZdUx+@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Geert Uytterhoeven dixit:

>On Mon, Oct 4, 2010 at 21:49, Thorsten Glaser <tg@mirbsd.de> wrote:

>> This WFM:

>> Args = root=/dev/hda1 console=tty debug=par video=atafb:vga2

>The problem starts happening as soon as FastRAM >= 512.

I suspect atafb:vga2 reduces the amount of memory needed enough
for it to work.

bye,
//mirabilos
-- 
I believe no one can invent an algorithm. One just happens to hit upon it
when God enlightens him. Or only God invents algorithms, we merely copy them.
If you don't believe in God, just consider God as Nature if you won't deny
existence.		-- Coywolf Qi Hunt
