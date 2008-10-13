From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [patch 17/18] net/rfkill/rfkill-input.c needs <linux/sched.h>
Date: Mon, 13 Oct 2008 17:45:59 -0300
Message-ID: <20081013204559.GC28597@khazad-dum.debian.net>
References: <20081013195846.674654386@mail.of.borg> <20081013195922.392078574@mail.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757514AbYJMUqU@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20081013195922.392078574@mail.of.borg>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

On Mon, 13 Oct 2008, Geert Uytterhoeven wrote:
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> For some m68k configs, I get:
> 
> | net/rfkill/rfkill-input.c: In function 'rfkill_start':
> | net/rfkill/rfkill-input.c:208: error: dereferencing pointer to incomplete type
> 
> As the incomplete type is `struct task_struct', including <linux/sched.h> fixes
> it.

Line 208 is this (in latest Linus mainline and also v2.6.27):

spin_unlock_irq(&handle->dev->event_lock);

So we need to include sched.h to everything that uses spin_unlock_irq?  If
only some variants of m68k need that, shouldn't it have been added on the
header that defines spin_unlock_irq() on those arches, instead?

Or am I looking at a different version of rfkill-input.c than what you based
that error message on?

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
