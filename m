From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] Core block IO bits for 2.6.39
Date: Sat, 26 Mar 2011 09:48:37 -0700
Message-ID: <AANLkTi=jcm8pLQCTwYPK_Ey1SbMYSqQhYD4fJmCNz7sS@mail.gmail.com>
References: <4D8B4A89.80608@fusionio.com> <AANLkTi=zJbUpcT+vbLARyxhA34F1se8pYq9No799Zqzh@mail.gmail.com>
 <4D8D87B0.3080107@fusionio.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:47779 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752575Ab1CZQs7 convert rfc822-to-8bit
	(ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sat, 26 Mar 2011 12:48:59 -0400
In-Reply-To: <4D8D87B0.3080107@fusionio.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Jens Axboe <jaxboe@fusionio.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Mason <chris.mason@oracle.com>, Linux/m68k <linux-m68k@vger.kernel.org>

On Fri, Mar 25, 2011 at 11:29 PM, Jens Axboe <jaxboe@fusionio.com> wrot=
e:
> +
> + =A0 =A0 =A0 /* Use 3ms as that was the old plug delay */
> + =A0 =A0 =A0 blk_delay_queue(q, msecs_to_jiffies(3));

That's bogus. blk_delay_queue() already takes msecs, not jiffies.

Also, do we really need to delay every unplug like this? It seems sad.
A 3ms delay is a long time these days - admittedly most people
hopefully use ATA these days if they have an SSD or something, but
still..

                  Linus
