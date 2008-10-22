From: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>
Subject: Re: [PATCH] reinstate mac rtc
Date: Wed, 22 Oct 2008 13:09:37 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.0810221309050.3377@halbrend.uninett.no>
References: <A4BCBF08-9D05-11DD-9A2B-00050249ADE1@kaffe.org> <alpine.LNX.2.00.0810181928560.1848@firda.kolla.no> <Pine.LNX.4.64.0810191352510.27783@loopy.telegraphics.com.au> <alpine.LNX.2.00.0810191813240.1848@firda.kolla.no>
 <alpine.DEB.1.00.0810200140300.14463@zirkon.biophys.uni-duesseldorf.de> <A064497F-167C-4BC4-9565-6530A6914285@lvivier.info> <alpine.DEB.1.00.0810220916590.18164@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ufisa.uninett.no ([158.38.152.126]:51029 "EHLO ufisa.uninett.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751862AbYJVLJj (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Wed, 22 Oct 2008 07:09:39 -0400
In-Reply-To: <alpine.DEB.1.00.0810220916590.18164@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Laurent Vivier <laurent@lvivier.info>, =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>, Finn Thain <fthain@telegraphics.com.au>, Riccardo <riccardo@kaffe.org>, Brad Boyer <flar@allandria.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, 22 Oct 2008, Michael Schmitz wrote:

> Hi,
> 
> > > Valid point. I gues penguin still does pass the date, so the problem boils
> > > down to 'why isn't it used by the kernel?'
> > 
> > EMILE passes the date too.
> 
> Good, so solving the problem should fix it for both. When did the problem get
> introduced - 2.4 or 2.6?

Silly question I guess, but how is the passing done?

-- kolla
