From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [patch 17/18] net/rfkill/rfkill-input.c needs <linux/sched.h>
Date: Wed, 15 Oct 2008 00:10:18 -0300
Message-ID: <20081015031018.GA25190@khazad-dum.debian.net>
References: <20081013195846.674654386@mail.of.borg> <20081013195922.392078574@mail.of.borg> <20081013204559.GC28597@khazad-dum.debian.net> <Pine.LNX.4.64.0810140920320.6220@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:43015 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751486AbYJODK0 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Tue, 14 Oct 2008 23:10:26 -0400
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0810140920320.6220@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 14 Oct 2008, Geert Uytterhoeven wrote:
> Unfortunately that's not possible, due to Include Hell(tm).
> Therefore, including <linux/sched.h> is the way this has been fixed in
> the past.

I see.  Well, when doing this I'd suggest adding a comment, otherwise the
include could end up getting removed sooner or later without anyone asking
linux-m68k first (I seriously douby anyone will do git blame to find out why
an #include line exists before removing it).

Something like:
#include <sched.h> /* m68k needs task_struct for <whatever> */

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
