From: Brad Boyer <flar@allandria.com>
Subject: Re: [PATCH] Add SWIM floppy support for m68k Macs.
Date: Sat, 1 Nov 2008 11:10:13 -0700
Message-ID: <20081101181013.GA25819@cynthia.pants.nu>
References: <12255325912043-git-send-email-Laurent@lvivier.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from [76.245.85.235] ([76.245.85.235]:60115 "EHLO cynthia.pants.nu"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1751735AbYKASKn (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sat, 1 Nov 2008 14:10:43 -0400
Content-Disposition: inline
In-Reply-To: <12255325912043-git-send-email-Laurent@lvivier.info>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Laurent@lvivier.info
Cc: geert@linux-m68k.org, linux-m68k@vger.kernel.org

On Sat, Nov 01, 2008 at 10:43:11AM +0100, Laurent@lvivier.info wrote:
> It allows to read data from a floppy, but not to write to, and to eject the
> floppy (useful on our Mac without eject button).
> 
> I have tested it on a Quadra 800, but it is supposed to work on:
> 
> II, IIci, IIsi, IIvx, IIx, IIcx, SE/30,
> PowerBook 100, PowerBook 140, PowerBook 145, PowerBook 160,
> PowerBook 165, PowerBook 165c, PowerBook 170, PowerBook 180,
> PowerBook 180c, PowerBook 190, PowerBook 190cs, PowerBook 500,
> Performa 460, Performa 550, LC II, LC III, LC 520, Color Classic,
> Color Classic II, ClassicII,
> Quadra 700, Quadra 800, Quadra 650, Quadra 605, Quadra 610,
> Centris 610, Quadra 630, Performa 580, LC 475, LC 575,

I just have one comment and one question. The model check looks like
it will end up printing out a warning message on the AV models. You
should add them explicitly to the unsupported list the way you did
for the IIfx and Q900/Q950. Also, I'm not sure this driver would
work on a Mac II. They didn't originally ship with a SWIM chip at
all, but that was available as an upgrade. From the factory they
came with the old IWM chip. It's not clear to me if the driver uses
any of the SWIM features other than the capability to detect and
read high density media which the old drives obviously don't do.

Other than that, it's good to see someone working on this.

	Brad Boyer
	flar@allandria.com

