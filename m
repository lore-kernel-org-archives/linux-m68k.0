From: Adrian Bunk <bunk@kernel.org>
Subject: Re: [patch 17/18] net/rfkill/rfkill-input.c needs <linux/sched.h>
Date: Wed, 15 Oct 2008 16:12:05 +0300
Message-ID: <20081015131205.GD10917@cs181140183.pp.htv.fi>
References: <20081013195846.674654386@mail.of.borg> <20081013195922.392078574@mail.of.borg> <20081013204559.GC28597@khazad-dum.debian.net> <Pine.LNX.4.64.0810140920320.6220@anakin> <20081015031018.GA25190@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp5.pp.htv.fi ([213.243.153.39]:59433 "EHLO smtp5.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752855AbYJONMI (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Wed, 15 Oct 2008 09:12:08 -0400
Content-Disposition: inline
In-Reply-To: <20081015031018.GA25190@khazad-dum.debian.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linus Torvalds <torvalds@linux-foundation.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Oct 15, 2008 at 12:10:18AM -0300, Henrique de Moraes Holschuh wrote:
> On Tue, 14 Oct 2008, Geert Uytterhoeven wrote:
> > Unfortunately that's not possible, due to Include Hell(tm).
> > Therefore, including <linux/sched.h> is the way this has been fixed in
> > the past.
> 
> I see.  Well, when doing this I'd suggest adding a comment, otherwise the
> include could end up getting removed sooner or later without anyone asking
> linux-m68k first (I seriously douby anyone will do git blame to find out why
> an #include line exists before removing it).
> 
> Something like:
> #include <sched.h> /* m68k needs task_struct for <whatever> */

Such comments in the kernel tend to be old ones you cannot trust.

And #include removals are not really a common case - sometimes someone 
cleans up something specific, but I don't think anyone will remove 
#include's of sched.h from random .c files (considering how much 
sched.h pulls in the fallout of such #include removals would be many
build breakages) unless someone seriously reorganizes sched.h itself.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

