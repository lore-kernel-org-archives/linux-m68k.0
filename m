From: Brad Boyer <flar@allandria.com>
Subject: Re: [PATCH] Add SWIM floppy support for m68k Macs.
Date: Wed, 5 Nov 2008 20:18:44 -0800
Message-ID: <20081106041844.GB17813@cynthia.pants.nu>
References: <20081105022850.GA3243@cynthia.pants.nu> <D804E89A-AB82-11DD-9A74-00050249ADE1@kaffe.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from [76.245.85.235] ([76.245.85.235]:33150 "EHLO cynthia.pants.nu"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1752789AbYKFET2 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Wed, 5 Nov 2008 23:19:28 -0500
Content-Disposition: inline
In-Reply-To: <D804E89A-AB82-11DD-9A74-00050249ADE1@kaffe.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Riccardo <riccardo@kaffe.org>
Cc: Laurent Vivier <Laurent@lvivier.info>, geert@linux-m68k.org, linux-m68k@vger.kernel.org

On Wed, Nov 05, 2008 at 10:43:54PM +0100, Riccardo wrote:
> true. But if the gestalt remains 6 even with a HD drive chip, how can 
> you detect it?
> 
> 
> - original IWM 800k drives
> - SWIM with 800k drives or mixed drives
> - SWIM with only 1.4k drives
> 
> I'm in the second situation, btw.

We can definitely detect the difference between the second and third
options, since the SWIM chip can detect the type of each drive that
is connected. The driver detects the media type, but I don't recall
if it explicitly checked the drive type. The swim_iop driver did
that (and not much else) so the chip has the capability.

Telling which chip is installed may be the hardest part, although
the SWIM chip has a compatibility mode. As mentioned in another
email, there is a procedure to change the mode the chip is in. If
this method does something predictable on the IWM chip that doesn't
put the chip into a bad state, then we can probably detect which
chip is actually installed reliably. It might be interesting to
disassemble the drivers in the updated ROM to see if it can cope
with the IWM chip for people that tried the new ROM with the old
floppy controller.

	Brad Boyer
	flar@allandria.com

