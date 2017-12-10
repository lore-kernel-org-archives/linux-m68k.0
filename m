From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH v3 14/14] nubus: Add support for the driver model
Date: Sun, 10 Dec 2017 21:03:03 +1100 (AEDT)
Message-ID: <alpine.LNX.2.21.1712102042340.3@nippy.intranet>
References: <cover.1512454057.git.fthain@telegraphics.com.au> <5c71aa72f8c6192ca472b103555cad7441974f71.1512454057.git.fthain@telegraphics.com.au> <CAOFm3uGWw0_Dvt0k533g8ovVyz0ehHZi6fSXC4jSpq3JjQCyAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:51086 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751359AbdLJKDD (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 10 Dec 2017 05:03:03 -0500
In-Reply-To: <CAOFm3uGWw0_Dvt0k533g8ovVyz0ehHZi6fSXC4jSpq3JjQCyAg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Philippe Ombredanne <pombredanne@nexb.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Thu, 7 Dec 2017, Philippe Ombredanne wrote:

> > diff --git a/drivers/nubus/bus.c b/drivers/nubus/bus.c
> > new file mode 100644
> > index 000000000000..b5045e639b4d
> > --- /dev/null
> > +++ b/drivers/nubus/bus.c
> > @@ -0,0 +1,119 @@
> > +/*
> > + * Bus implementation for the NuBus subsystem.
> > + *
> > + * Copyright (C) 2017 Finn Thain
> > + *
> > + * SPDX-License-Identifier: GPL-2.0
> > + */
> 
> I think the SPDX id should be on the first line using C++-style // comments.

Sure, why not.

Since Linus has explicitly allowed conversion of the entire block comment 
to C++ style, I think I may prefer that as being less ugly than the 
mixture of styles (though fwiw this will always read like top posting to 
me).

> See tglx's doc patches

I didn't find any mention of SPDX under Documentation...

> and Linus posts explaining why he wants it this way!
> 

I suspect that you are referring to his posts in this thread (?)
https://lkml.org/lkml/2017/11/2/728

-- 
