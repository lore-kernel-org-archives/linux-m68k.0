From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Getting stuck during boot on a 68VZ328 (DragonBallVZ).
Date: Wed, 2 Apr 2014 23:02:16 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1404022244160.18569@nippy.intranet>
References: <CAO64nm7D_cfy95rdDasH9jeHhXRzLpMMpniK-BKxCsqZsn7yZw@mail.gmail.com> <CAO64nm6s8SYRFpnd1yMV5UsvM7JetkzkYgWMiRfNQyT93+PuGQ@mail.gmail.com> <CAO64nm6Z0rOhiUYu5nqeZuVvfz0-9wy8D02gj_82nXRdi0NECw@mail.gmail.com> <alpine.LNX.2.00.1404021529450.9604@nippy.intranet>
 <CAO64nm6NJSmVWyo779AKqD_8FyXPKK-_EYEM1SsMz+N7WJWeHg@mail.gmail.com> <CAGj5WxBpHJwH5sgE_kmOGL+xq-kLNBTuab_0mZw7gy-XuEYifQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:56287 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758394AbaDBMCl (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 2 Apr 2014 08:02:41 -0400
In-Reply-To: <CAGj5WxBpHJwH5sgE_kmOGL+xq-kLNBTuab_0mZw7gy-XuEYifQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Luis Alves <ljalvs@gmail.com>
Cc: Daniel Palmer <danieruru@gmail.com>, linux-m68k@vger.kernel.org


On Wed, 2 Apr 2014, Luis Alves wrote:

> Hi Daniel,
> 
> Nice work.
> I remember that I managed to get gcc 4.7.2 working (I had to patch a
> few files in gcc due to abi changes).
> ...
> > Here is the bug: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=53386

Would you mind revisiting the bug report to attach the patch or add a 
comment with a link to the patch submission?

The last thing you wrote in the bug report suggests that strict alignment 
isn't sufficient to fix the problem or else gcc-4.6 contains some sort of 
regression that caused Linux to log "BUG", which is a bit confusing.

Finn
