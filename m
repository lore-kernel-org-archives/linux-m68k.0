From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 8/13] fbdev: mac_var_to_mode() fix
Date: Wed, 4 Nov 2009 11:48:36 +1100 (EST)
Message-ID: <alpine.OSX.2.00.0911041052180.369@silk.local>
References: <alpine.OSX.2.00.0911031449170.483@silk.local> <282725.7401.qm@web110813.mail.gq1.yahoo.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:49486 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751309AbZKDAsl (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 3 Nov 2009 19:48:41 -0500
In-Reply-To: <282725.7401.qm@web110813.mail.gq1.yahoo.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "David D. Kilzer" <ddkilzer@kilzer.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-fbdev-devel@lists.sourceforge.net, linux-m68k@vger.kernel.org


On Tue, 3 Nov 2009, David D. Kilzer wrote:

> On Tue, November 3, 2009 at 5:43:16 AM, Finn Thain wrote:
> 
> >      /* 800x600 */
> > +    { VMODE_800_600_56, &mac_modedb[2] },
> > +    { VMODE_800_600_60, &mac_modedb[3] },
> >      { VMODE_800_600_75, &mac_modedb[5] },
> >      { VMODE_800_600_72, &mac_modedb[4] },
> > -    { VMODE_800_600_60, &mac_modedb[3] },
> > -    { VMODE_800_600_56, &mac_modedb[2] },
> 
> 
> I believe you want to swap VMODE_800_600_75 and VMODE_800_600_72 here as well.

In this case, the mode with the faster vertical refresh frequency actually 
has the higher pixel clock period. So I think the patch is correct.

Finn

> 
> Dave
> 
