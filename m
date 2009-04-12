From: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>
Subject: Re: How to get m68k sources?
Date: Sun, 12 Apr 2009 06:35:27 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.0904120619100.22946@halbrend.uninett.no>
References: <alpine.LNX.2.01.0904102301250.22946@halbrend.uninett.no> <10f740e80904110116j6626b564m92b0fbf9fca79106@mail.gmail.com> <m2ab6nts2u.fsf@igel.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ufisa.uninett.no ([158.38.152.126]:50416 "EHLO ufisa.uninett.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751127AbZDLEek (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sun, 12 Apr 2009 00:34:40 -0400
In-Reply-To: <m2ab6nts2u.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Sat, 11 Apr 2009, Andreas Schwab wrote:

> Geert Uytterhoeven <geert@linux-m68k.org> writes:
> 
> > 2.6.29 development is done on branch `m68k-v2.6.29', use
> >
> >     git checkout m68k-v2.6.29

Well, noone says this, but obviously one has to step into the "linux-m68k"
directory one first "cloned" to do this... so "cd linux-m68k", and then...

> After cloning the repository you first have to create the tracking
> m68k-v2.6.29 branch:
> 
> $ git checkout -t origin/m68k-v2.6.29

did you test this?

[kolla@haugum] /home/kolla/linux-m68k $ git checkout -t origin/m68k-v2.6.29
fatal: git checkout: --track and --no-track require -b

So after some fumbling...

[kolla@haugum] /home/kolla/linux-m68k $ git checkout -t -b origin/m68k-v2.6.29
Branch origin/m68k-v2.6.29 set up to track local branch refs/heads/master.
Switched to a new branch "origin/m68k-v2.6.29"

But so what - git tells me I have switched to new branch, but where is it?
I have not received anything, nor do I have any new files, and...

[kolla@haugum] /home/kolla/linux-m68k $ git checkout m68k-v2.6.29
error: pathspec 'm68k-v2.6.29' did not match any file(s) known to git.
 
[kolla@haugum] /home/kolla/linux-m68k $ git checkout origin/m68k-v2.6.29
warning: refname 'origin/m68k-v2.6.29' is ambiguous.
Already on "origin/m68k-v2.6.29"

[kolla@haugum] /home/kolla/linux-m68k $ git status | cat
# On branch origin/m68k-v2.6.29
nothing to commit (working directory clean)

[kolla@haugum] /home/kolla/linux-m68k $ git pull
>From .
 * branch            master     -> FETCH_HEAD
Already up-to-date.

[kolla@haugum] /home/kolla/linux-m68k $ head -n5 Makefile
VERSION = 2
PATCHLEVEL = 6
SUBLEVEL = 30
EXTRAVERSION = -rc1
NAME = Temporary Tasmanian Devil

Obviously not 2.6.29...

So what now?

-- kolla
