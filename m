From: Jens Axboe <jaxboe@fusionio.com>
Subject: Re: [GIT PULL] Core block IO bits for 2.6.39
Date: Sat, 26 Mar 2011 17:53:46 +0100
Message-ID: <4D8E1A1A.8010300@fusionio.com>
References: <4D8B4A89.80608@fusionio.com> <AANLkTi=zJbUpcT+vbLARyxhA34F1se8pYq9No799Zqzh@mail.gmail.com> <4D8D87B0.3080107@fusionio.com> <AANLkTi=jcm8pLQCTwYPK_Ey1SbMYSqQhYD4fJmCNz7sS@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx1.fusionio.com ([64.244.102.30]:53379 "EHLO mx1.fusionio.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753104Ab1CZQxw (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sat, 26 Mar 2011 12:53:52 -0400
In-Reply-To: <AANLkTi=jcm8pLQCTwYPK_Ey1SbMYSqQhYD4fJmCNz7sS@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Mason <chris.mason@oracle.com>, Linux/m68k <linux-m68k@vger.kernel.org>

On 2011-03-26 17:48, Linus Torvalds wrote:
> On Fri, Mar 25, 2011 at 11:29 PM, Jens Axboe <jaxboe@fusionio.com> wrote:
>> +
>> +       /* Use 3ms as that was the old plug delay */
>> +       blk_delay_queue(q, msecs_to_jiffies(3));
> 
> That's bogus. blk_delay_queue() already takes msecs, not jiffies.

You are right, braino.

> Also, do we really need to delay every unplug like this? It seems sad.
> A 3ms delay is a long time these days - admittedly most people
> hopefully use ATA these days if they have an SSD or something, but
> still..

Depends on whether you want the 'call me back, I ran into busy this
time' or the 'recall me immediately'.

I'll take a look at the IDE case tonight and submit a real fix.

-- 
Jens Axboe
