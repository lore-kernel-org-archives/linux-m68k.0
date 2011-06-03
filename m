From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: m68k: Convert to genirq (WIP)
Date: Fri, 3 Jun 2011 21:20:23 +1000 (EST)
Message-ID: <alpine.OSX.2.00.1106011300550.199@ibook.intranet>
References: <alpine.DEB.2.00.1105282010370.16617@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1105282010370.16617@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>, Thomas Gleixner <tglx@linutronix.de>, Linux Kernel Development <linux-kernel@vger.kernel.org>


On Sat, 28 May 2011, Geert Uytterhoeven wrote:

> Of course any help is welcome, especially for Mac

What kind of help are you looking for? I read through your patch series 
but I'm not sure how much work is left. Probably I need to look at a 
genirq reference implementation to get an idea of the goal...

> (with its maze of interrupt controllers)

Perhaps we do not need to model that complexity in generic irq terms?

The mac port could probably make good use of the irq startup and shutdown 
hooks though.

Finn
